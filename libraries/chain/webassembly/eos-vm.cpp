#include <eosio/chain/webassembly/eos-vm.hpp>
#include <eosio/chain/apply_context.hpp>
#include <eosio/chain/wasm_eosio_constraints.hpp>
#include <fstream>
//eos-vm includes
#include <eosio/vm/backend.hpp>

namespace eosio { namespace chain { namespace webassembly { namespace eos_vm_runtime {

using namespace eosio::vm;

namespace wasm_constraints = eosio::chain::wasm_constraints;

using backend_t = backend<apply_context>;

class eos_vm_instantiated_module : public wasm_instantiated_module_interface {
   public:
      
      eos_vm_instantiated_module(eos_vm_runtime* runtime, std::unique_ptr<backend_t> mod) :
         _runtime(runtime),
         _instantiated_module(std::move(mod)) {}

      void apply(apply_context& context) override {
         auto* alloc = wasm_interface::get_wasm_allocator();
         alloc->reset();
         _instantiated_module->set_wasm_allocator( alloc );
         //if (!(const auto& res = _instantiated_module->run_start()))
         //   EOS_ASSERT(false, wasm_execution_error, "eos-vm start function failure (${s})", ("s", res.to_string()));

         _runtime->_bkend = _instantiated_module.get();

         Platform::HardwareTrapType trapType;
         Platform::CallStack trapCallStack;
         Uptr trapOperand;
         trapType = Platform::catchHardwareTraps(trapCallStack,trapOperand, [&]{
            const auto& res = _instantiated_module->call(&context, "env", "apply",
                                             context.get_receiver().to_uint64_t(),
                                             context.get_action().account.to_uint64_t(),
                                             context.get_action().name.to_uint64_t());
            //EOS_ASSERT(res, wasm_execution_error, "eos-vm execution failure (${s})", ("s", res.to_string()));
         });
         _runtime->_bkend = nullptr;
	 /* TODO clean this up
         switch(trapType)
         {
         case Platform::HardwareTrapType::none: break;
         case Platform::HardwareTrapType::accessViolation:
         {
            if (alloc->is_in_region(reinterpret_cast<char*>(trapOperand))) { 
               throw wasm_execution_error();
            } else {
               elog("Access violation outside of memory reserved addresses");
               abort();
            }
         }
         case Platform::HardwareTrapType::stackOverflow: throw wasm_execution_error();
         case Platform::HardwareTrapType::intDivideByZeroOrOverflow: throw wasm_execution_error();
         default: Errors::unreachable();
         };
	 */
      }

   private:
      eos_vm_runtime*            _runtime;
      std::unique_ptr<backend_t> _instantiated_module;
};

eos_vm_runtime::eos_vm_runtime() {}

std::unique_ptr<wasm_instantiated_module_interface> eos_vm_runtime::instantiate_module(const char* code_bytes, size_t code_size, std::vector<uint8_t>) {
   std::ofstream mf("temp.wasm");
   mf.write((char*)code_bytes, code_size);
   mf.close();
   wasm_code_ptr code((uint8_t*)code_bytes, 0);
   std::unique_ptr<backend_t> bkend = std::make_unique<backend_t>(code, code_size);
   registered_host_functions<apply_context>::resolve(bkend->get_module());
   return std::make_unique<eos_vm_instantiated_module>(this, std::move(bkend));
}

}}}}
