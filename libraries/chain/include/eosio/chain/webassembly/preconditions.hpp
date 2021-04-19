#pragma once

#include <eosio/chain/types.hpp>
#include <eosio/chain/webassembly/common.hpp>
#include <eosio/chain/webassembly/eos-vm.hpp>

#include <eosio/vm/backend.hpp>
#include <eosio/vm/host_function.hpp>

namespace eosio { namespace chain { namespace webassembly {
   namespace detail {
      template <typename T, std::size_t A>
      constexpr std::integral_constant<bool, A != 0> is_legacy_ptr(legacy_ptr<T, A>);
      template <typename T>
      constexpr std::false_type is_legacy_ptr(T);
      template <typename T, std::size_t A>
      constexpr std::integral_constant<bool, A != 0> is_legacy_span(legacy_span<T, A>);
      template <typename T>
      constexpr std::false_type is_legacy_span(T);
      template <typename T>
      constexpr std::true_type is_unvalidated_ptr(unvalidated_ptr<T>);
      template <typename T>
      constexpr std::false_type is_unvalidated_ptr(T);

      template<typename T>
      inline constexpr bool is_softfloat_type_v =
         std::is_same_v<T, float32_t> || std::is_same_v<T, float64_t> || std::is_same_v<T, float128_t>;

      template<typename T>
      inline constexpr bool is_wasm_arithmetic_type_v =
         is_softfloat_type_v<T> || std::is_integral_v<T>;

      template <typename T>
      struct is_whitelisted_legacy_type {
         static constexpr bool value = std::is_same_v<float128_t, T> ||
                                       std::is_same_v<null_terminated_ptr, T> ||
                                       std::is_same_v<decltype(is_legacy_ptr(std::declval<T>())), std::true_type> ||
                                       std::is_same_v<decltype(is_legacy_span(std::declval<T>())), std::true_type> ||
                                       std::is_same_v<decltype(is_unvalidated_ptr(std::declval<T>())), std::true_type> ||
                                       std::is_same_v<name, T> ||
                                       std::is_arithmetic_v<T>;
      };

      template <typename T>
      struct is_whitelisted_type {
         static constexpr bool value = is_wasm_arithmetic_type_v<T> ||
                                       std::is_same_v<name, T>;
      };
      template <typename T>
      struct is_whitelisted_type<vm::span<T>> {
         // If expanding this beyond char, add a static_assert of the alignment of every
         // additional type allowed.
         static constexpr bool value = std::is_same_v<std::remove_const_t<T>, char>;
      };
      template <typename T>
      struct is_whitelisted_type<vm::argument_proxy<T*, 0>> {
         static constexpr bool value = is_wasm_arithmetic_type_v<std::remove_const_t<T>>;
      };
   }

   template <typename T>
   inline static constexpr bool is_whitelisted_type_v = detail::is_whitelisted_type<T>::value;

   template <typename T>
   inline static constexpr bool is_whitelisted_legacy_type_v = detail::is_whitelisted_legacy_type<T>::value;

   template <typename... Ts>
   inline static constexpr bool are_whitelisted_legacy_types_v = (... && detail::is_whitelisted_legacy_type<Ts>::value);

   template <typename T, typename U>
   inline static bool is_aliasing(const T& a, const U& b) {
      std::uintptr_t a_ui = reinterpret_cast<std::uintptr_t>(a.data());
      std::uintptr_t b_ui = reinterpret_cast<std::uintptr_t>(b.data());
      return a_ui < b_ui ? a_ui + a.size_bytes() > b_ui : b_ui + b.size_bytes() > a_ui;
   }
   inline static bool is_nan( const float32_t f ) {
      return f32_is_nan( f );
   }
   inline static bool is_nan( const float64_t f ) {
      return f64_is_nan( f );
   }
   inline static bool is_nan( const float128_t& f ) {
      return f128_is_nan( f );
   }

   EOS_VM_PRECONDITION(null_pointer_check,
         EOS_VM_INVOKE_ON_ALL([&](auto&& arg, auto&&... rest) {
            using namespace eosio::vm;
            using arg_t = std::decay_t<decltype(arg)>;
            if constexpr (decltype(detail::is_legacy_ptr(std::declval<arg_t>()))::value) {
               EOS_ASSERT(arg.get_original_pointer() != ctx.get_interface().get_memory(), wasm_execution_error, "references cannot be created for null pointers");
            }
         }));

   EOS_VM_PRECONDITION(context_free_check,
         EOS_VM_INVOKE_ONCE([&](auto&&...) {
            EOS_ASSERT(ctx.get_host().get_context().is_context_free(), unaccessible_api, "this API may only be called from context_free apply");
         }));

   EOS_VM_PRECONDITION(context_aware_check,
         EOS_VM_INVOKE_ONCE([&](auto&&...) {
            EOS_ASSERT(!ctx.get_host().get_context().is_context_free(), unaccessible_api, "only context free api's can be used in this context");
         }));

   EOS_VM_PRECONDITION(privileged_check,
         EOS_VM_INVOKE_ONCE([&](auto&&...) {
            EOS_ASSERT(ctx.get_host().get_context().is_privileged(), unaccessible_api,
                       "${code} does not have permission to call this API", ("code", ctx.get_host().get_context().get_receiver()));
         }));

   namespace detail {
      template<typename T>
      vm::span<const T> to_span(const vm::argument_proxy<T*>& val) { return {val.get(), 1}; }
      template<typename T>
      vm::span<T> to_span(const vm::span<T>& val) { return val; }
   }

   EOS_VM_PRECONDITION(core_precondition,
         EOS_VM_INVOKE_ON_ALL(([&](auto&& arg, auto&&... rest) {
            using namespace eosio::vm;
            using arg_t = std::decay_t<decltype(arg)>;
            static_assert( is_whitelisted_type_v<arg_t>, "whitelisted type violation");
            if constexpr (is_span_type_v<arg_t>) {
               // check alignment while we are here
               EOS_ASSERT( reinterpret_cast<std::uintptr_t>(arg.data()) % alignof(typename arg_t::value_type) == 0,
                     wasm_exception, "memory not aligned" );
            }
            if constexpr (is_span_type_v<arg_t> || vm::is_argument_proxy_type_v<arg_t>) {
               eosio::vm::invoke_on<false, eosio::vm::invoke_on_all_t>([&](auto&& narg, auto&&... nrest) {
                  using nested_arg_t = std::decay_t<decltype(narg)>;
                  if constexpr (eosio::vm::is_span_type_v<nested_arg_t> || vm::is_argument_proxy_type_v<arg_t>)
                      EOS_ASSERT(!is_aliasing(detail::to_span(arg), detail::to_span(narg)), wasm_exception, "pointers not allowed to alias");
               }, rest...);
            }
         })));

   template<typename T>
   inline constexpr bool should_check_nan_v =
      std::is_same_v<T, float32_t> || std::is_same_v<T, float64_t> || std::is_same_v<T, float128_t>;

   template<typename T>
   struct remove_argument_proxy {
      using type = T;
   };
   template<typename T, std::size_t A>
   struct remove_argument_proxy<vm::argument_proxy<T*, A>> {
      using type = T;
   };

   EOS_VM_PRECONDITION(is_nan_check,
         EOS_VM_INVOKE_ON_ALL([&](auto&& arg, auto&&... rest) {
            if constexpr (should_check_nan_v<std::remove_cv_t<typename remove_argument_proxy<std::decay_t<decltype(arg)>>::type>>) {
               EOS_ASSERT(!webassembly::is_nan(*arg), transaction_exception, "NaN is not an allowed value for a secondary key");
            }
         }));

   EOS_VM_PRECONDITION(legacy_static_check_wl_args,
         EOS_VM_INVOKE_ONCE([&](auto&&... args) {
            static_assert( are_whitelisted_legacy_types_v<std::decay_t<decltype(args)>...>, "legacy whitelisted type violation");
         }));

}}} // ns eosio::chain::webassembly
