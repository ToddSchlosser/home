;; i32 operations

(module
  (func $add (param $x i32) (param $y i32) (result i32) (i32.add (get_local $x) (get_local $y)))
  (func $sub (param $x i32) (param $y i32) (result i32) (i32.sub (get_local $x) (get_local $y)))
  (func $mul (param $x i32) (param $y i32) (result i32) (i32.mul (get_local $x) (get_local $y)))
  (func $div_s (param $x i32) (param $y i32) (result i32) (i32.div_s (get_local $x) (get_local $y)))
  (func $div_u (param $x i32) (param $y i32) (result i32) (i32.div_u (get_local $x) (get_local $y)))
  (func $rem_s (param $x i32) (param $y i32) (result i32) (i32.rem_s (get_local $x) (get_local $y)))
  (func $rem_u (param $x i32) (param $y i32) (result i32) (i32.rem_u (get_local $x) (get_local $y)))
  (func $and (param $x i32) (param $y i32) (result i32) (i32.and (get_local $x) (get_local $y)))
  (func $or (param $x i32) (param $y i32) (result i32) (i32.or (get_local $x) (get_local $y)))
  (func $xor (param $x i32) (param $y i32) (result i32) (i32.xor (get_local $x) (get_local $y)))
  (func $shl (param $x i32) (param $y i32) (result i32) (i32.shl (get_local $x) (get_local $y)))
  (func $shr_s (param $x i32) (param $y i32) (result i32) (i32.shr_s (get_local $x) (get_local $y)))
  (func $shr_u (param $x i32) (param $y i32) (result i32) (i32.shr_u (get_local $x) (get_local $y)))
  (func $rotl (param $x i32) (param $y i32) (result i32) (i32.rotl (get_local $x) (get_local $y)))
  (func $rotr (param $x i32) (param $y i32) (result i32) (i32.rotr (get_local $x) (get_local $y)))
  (func $clz (param $x i32) (result i32) (i32.clz (get_local $x)))
  (func $ctz (param $x i32) (result i32) (i32.ctz (get_local $x)))
  (func $popcnt (param $x i32) (result i32) (i32.popcnt (get_local $x)))
  (func $eqz (param $x i32) (result i32) (i32.eqz (get_local $x)))
  (func $eq (param $x i32) (param $y i32) (result i32) (i32.eq (get_local $x) (get_local $y)))
  (func $ne (param $x i32) (param $y i32) (result i32) (i32.ne (get_local $x) (get_local $y)))
  (func $lt_s (param $x i32) (param $y i32) (result i32) (i32.lt_s (get_local $x) (get_local $y)))
  (func $lt_u (param $x i32) (param $y i32) (result i32) (i32.lt_u (get_local $x) (get_local $y)))
  (func $le_s (param $x i32) (param $y i32) (result i32) (i32.le_s (get_local $x) (get_local $y)))
  (func $le_u (param $x i32) (param $y i32) (result i32) (i32.le_u (get_local $x) (get_local $y)))
  (func $gt_s (param $x i32) (param $y i32) (result i32) (i32.gt_s (get_local $x) (get_local $y)))
  (func $gt_u (param $x i32) (param $y i32) (result i32) (i32.gt_u (get_local $x) (get_local $y)))
  (func $ge_s (param $x i32) (param $y i32) (result i32) (i32.ge_s (get_local $x) (get_local $y)))
  (func $ge_u (param $x i32) (param $y i32) (result i32) (i32.ge_u (get_local $x) (get_local $y)))

  (func (export "main")
    (drop (call $add (i32.const 1) (i32.const 1)))
    (drop (call $add (i32.const 1) (i32.const 0)))
    (drop (call $add (i32.const -1) (i32.const -1)) )
    (drop (call $add (i32.const -1) (i32.const 1)))
    (drop (call $add (i32.const 0x7fffffff) (i32.const 1)))
    (drop (call $add (i32.const 0x80000000) (i32.const -1)))
    (drop (call $add (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $add (i32.const 0x3fffffff) (i32.const 1)))
    (drop (call $sub (i32.const 1) (i32.const 1)))
    (drop (call $sub (i32.const 1) (i32.const 0)))
    (drop (call $sub (i32.const -1) (i32.const -1)))
    (drop (call $sub (i32.const 0x7fffffff) (i32.const -1)))
    (drop (call $sub (i32.const 0x80000000) (i32.const 1)))
    (drop (call $sub (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $sub (i32.const 0x3fffffff) (i32.const -1)))
    (drop (call $mul (i32.const 1) (i32.const 1)))
    (drop (call $mul (i32.const 1) (i32.const 0)))
    (drop (call $mul (i32.const -1) (i32.const -1)))
    (drop (call $mul (i32.const 0x10000000) (i32.const 4096)))
    (drop (call $mul (i32.const 0x80000000) (i32.const 0)))
    (drop (call $mul (i32.const 0x80000000) (i32.const -1)))
    (drop (call $mul (i32.const 0x7fffffff) (i32.const -1)))
    (drop (call $mul (i32.const 0x01234567) (i32.const 0x76543210)))
    (drop (call $div_s (i32.const 1) (i32.const 1)))
    (drop (call $div_s (i32.const 0) (i32.const 1)))
    (drop (call $div_s (i32.const -1) (i32.const -1)))
    (drop (call $div_s (i32.const 0x80000000) (i32.const 2)))
    (drop (call $div_s (i32.const 0x80000001) (i32.const 1000)))
    (drop (call $div_s (i32.const 5) (i32.const 2)))
    (drop (call $div_s (i32.const -5) (i32.const 2)) )
    (drop (call $div_s (i32.const 5) (i32.const -2)) )
    (drop (call $div_s (i32.const -5) (i32.const -2)))
    (drop (call $div_s (i32.const 7) (i32.const 3)))
    (drop (call $div_s (i32.const -7) (i32.const 3)) )
    (drop (call $div_s (i32.const 7) (i32.const -3)) )
    (drop (call $div_s (i32.const -7) (i32.const -3)))
    (drop (call $div_s (i32.const 11) (i32.const 5)))
    (drop (call $div_s (i32.const 17) (i32.const 7)))
    (drop (call $div_u (i32.const 1) (i32.const 1)))
    (drop (call $div_u (i32.const 0) (i32.const 1)))
    (drop (call $div_u (i32.const -1) (i32.const -1)))
    (drop (call $div_u (i32.const 0x80000000) (i32.const -1)))
    (drop (call $div_u (i32.const 0x80000000) (i32.const 2)))
    (drop (call $div_u (i32.const 0x8ff00ff0) (i32.const 0x10001)))
    (drop (call $div_u (i32.const 0x80000001) (i32.const 1000)))
    (drop (call $div_u (i32.const 5) (i32.const 2)))
    (drop (call $div_u (i32.const -5) (i32.const 2)))
    (drop (call $div_u (i32.const 5) (i32.const -2)))
    (drop (call $div_u (i32.const -5) (i32.const -2)))
    (drop (call $div_u (i32.const 7) (i32.const 3)))
    (drop (call $div_u (i32.const 11) (i32.const 5)))
    (drop (call $div_u (i32.const 17) (i32.const 7)))
    (drop (call $rem_s (i32.const 0x7fffffff) (i32.const -1)))
    (drop (call $rem_s (i32.const 1) (i32.const 1)))
    (drop (call $rem_s (i32.const 0) (i32.const 1)))
    (drop (call $rem_s (i32.const -1) (i32.const -1)))
    (drop (call $rem_s (i32.const 0x80000000) (i32.const -1)))
    (drop (call $rem_s (i32.const 0x80000000) (i32.const 2)))
    (drop (call $rem_s (i32.const 0x80000001) (i32.const 1000)) )
    (drop (call $rem_s (i32.const 5) (i32.const 2)))
    (drop (call $rem_s (i32.const -5) (i32.const 2)) )
    (drop (call $rem_s (i32.const 5) (i32.const -2)))
    (drop (call $rem_s (i32.const -5) (i32.const -2)) )
    (drop (call $rem_s (i32.const 7) (i32.const 3)))
    (drop (call $rem_s (i32.const -7) (i32.const 3)) )
    (drop (call $rem_s (i32.const 7) (i32.const -3)))
    (drop (call $rem_s (i32.const -7) (i32.const -3)) )
    (drop (call $rem_s (i32.const 11) (i32.const 5)))
    (drop (call $rem_s (i32.const 17) (i32.const 7)))
    (drop (call $rem_u (i32.const 1) (i32.const 1)))
    (drop (call $rem_u (i32.const 0) (i32.const 1)))
    (drop (call $rem_u (i32.const -1) (i32.const -1)))
    (drop (call $rem_u (i32.const 0x80000000) (i32.const -1)))
    (drop (call $rem_u (i32.const 0x80000000) (i32.const 2)))
    (drop (call $rem_u (i32.const 0x8ff00ff0) (i32.const 0x10001)))
    (drop (call $rem_u (i32.const 0x80000001) (i32.const 1000)))
    (drop (call $rem_u (i32.const 5) (i32.const 2)))
    (drop (call $rem_u (i32.const -5) (i32.const 2)))
    (drop (call $rem_u (i32.const 5) (i32.const -2)))
    (drop (call $rem_u (i32.const -5) (i32.const -2)) )
    (drop (call $rem_u (i32.const 7) (i32.const 3)))
    (drop (call $rem_u (i32.const 11) (i32.const 5)))
    (drop (call $rem_u (i32.const 17) (i32.const 7)))
    (drop (call $and (i32.const 1) (i32.const 0)))
    (drop (call $and (i32.const 0) (i32.const 1)))
    (drop (call $and (i32.const 1) (i32.const 1)))
    (drop (call $and (i32.const 0) (i32.const 0)))
    (drop (call $and (i32.const 0x7fffffff) (i32.const 0x80000000)))
    (drop (call $and (i32.const 0x7fffffff) (i32.const -1)))
    (drop (call $and (i32.const 0xf0f0ffff) (i32.const 0xfffff0f0)))
    (drop (call $and (i32.const 0xffffffff) (i32.const 0xffffffff)))
    (drop (call $or (i32.const 1) (i32.const 0)))
    (drop (call $or (i32.const 0) (i32.const 1)))
    (drop (call $or (i32.const 1) (i32.const 1)))
    (drop (call $or (i32.const 0) (i32.const 0)))
    (drop (call $or (i32.const 0x7fffffff) (i32.const 0x80000000)) )
    (drop (call $or (i32.const 0x80000000) (i32.const 0)))
    (drop (call $or (i32.const 0xf0f0ffff) (i32.const 0xfffff0f0)))
    (drop (call $or (i32.const 0xffffffff) (i32.const 0xffffffff)))
    (drop (call $xor (i32.const 1) (i32.const 0)))
    (drop (call $xor (i32.const 0) (i32.const 1)))
    (drop (call $xor (i32.const 1) (i32.const 1)))
    (drop (call $xor (i32.const 0) (i32.const 0)))
    (drop (call $xor (i32.const 0x7fffffff) (i32.const 0x80000000)) )
    (drop (call $xor (i32.const 0x80000000) (i32.const 0)))
    (drop (call $xor (i32.const -1) (i32.const 0x80000000)))
    (drop (call $xor (i32.const -1) (i32.const 0x7fffffff)))
    (drop (call $xor (i32.const 0xf0f0ffff) (i32.const 0xfffff0f0)))
    (drop (call $xor (i32.const 0xffffffff) (i32.const 0xffffffff)))
    (drop (call $shl (i32.const 1) (i32.const 1)))
    (drop (call $shl (i32.const 1) (i32.const 0)))
    (drop (call $shl (i32.const 0x7fffffff) (i32.const 1)))
    (drop (call $shl (i32.const 0xffffffff) (i32.const 1)))
    (drop (call $shl (i32.const 0x80000000) (i32.const 1)))
    (drop (call $shl (i32.const 0x40000000) (i32.const 1)))
    (drop (call $shl (i32.const 1) (i32.const 31)))
    (drop (call $shl (i32.const 1) (i32.const 32)))
    (drop (call $shl (i32.const 1) (i32.const 33)))
    (drop (call $shl (i32.const 1) (i32.const -1)))
    (drop (call $shl (i32.const 1) (i32.const 0x7fffffff)))
    (drop (call $shr_s (i32.const 1) (i32.const 1)))
    (drop (call $shr_s (i32.const 1) (i32.const 0)))
    (drop (call $shr_s (i32.const -1) (i32.const 1)) )
    (drop (call $shr_s (i32.const 0x7fffffff) (i32.const 1)))
    (drop (call $shr_s (i32.const 0x80000000) (i32.const 1)))
    (drop (call $shr_s (i32.const 0x40000000) (i32.const 1)))
    (drop (call $shr_s (i32.const 1) (i32.const 32)))
    (drop (call $shr_s (i32.const 1) (i32.const 33)))
    (drop (call $shr_s (i32.const 1) (i32.const -1)))
    (drop (call $shr_s (i32.const 1) (i32.const 0x7fffffff)))
    (drop (call $shr_s (i32.const 1) (i32.const 0x80000000)))
    (drop (call $shr_s (i32.const 0x80000000) (i32.const 31)) )
    (drop (call $shr_s (i32.const -1) (i32.const 32)) )
    (drop (call $shr_s (i32.const -1) (i32.const 33)) )
    (drop (call $shr_s (i32.const -1) (i32.const -1)) )
    (drop (call $shr_s (i32.const -1) (i32.const 0x7fffffff)) )
    (drop (call $shr_s (i32.const -1) (i32.const 0x80000000)) )
    (drop (call $shr_u (i32.const 1) (i32.const 1)))
    (drop (call $shr_u (i32.const 1) (i32.const 0)))
    (drop (call $shr_u (i32.const -1) (i32.const 1)))
    (drop (call $shr_u (i32.const 0x7fffffff) (i32.const 1)))
    (drop (call $shr_u (i32.const 0x80000000) (i32.const 1)))
    (drop (call $shr_u (i32.const 0x40000000) (i32.const 1)))
    (drop (call $shr_u (i32.const 1) (i32.const 32)))
    (drop (call $shr_u (i32.const 1) (i32.const 33)))
    (drop (call $shr_u (i32.const 1) (i32.const -1)))
    (drop (call $shr_u (i32.const 1) (i32.const 0x7fffffff)))
    (drop (call $shr_u (i32.const 1) (i32.const 0x80000000)))
    (drop (call $shr_u (i32.const 0x80000000) (i32.const 31)))
    (drop (call $shr_u (i32.const -1) (i32.const 32)) )
    (drop (call $shr_u (i32.const -1) (i32.const 33)))
    (drop (call $shr_u (i32.const -1) (i32.const -1)))
    (drop (call $shr_u (i32.const -1) (i32.const 0x7fffffff)))
    (drop (call $shr_u (i32.const -1) (i32.const 0x80000000)) )
    (drop (call $rotl (i32.const 0xfe00dc00) (i32.const 4)))
    (drop (call $rotl (i32.const 0xabcd9876) (i32.const 1)))
    (drop (call $rotl (i32.const 0x00008000) (i32.const 37)))
    (drop (call $rotl (i32.const 0x769abcdf) (i32.const 0x8000000d)))
    (drop (call $rotl (i32.const 1) (i32.const 31)))
    (drop (call $rotl (i32.const 0x80000000) (i32.const 1)))
    (drop (call $rotr (i32.const 0xb0c1d2e3) (i32.const 0x0005)))
    (drop (call $rotr (i32.const 0xb0c1d2e3) (i32.const 0xff05)))
    (drop (call $rotr (i32.const 0xff00cc00) (i32.const 1)))
    (drop (call $rotr (i32.const 0x00080000) (i32.const 4)))
    (drop (call $rotr (i32.const 0x769abcdf) (i32.const 0xffffffed)))
    (drop (call $rotr (i32.const 1) (i32.const 1)))
    (drop (call $rotr (i32.const 0x80000000) (i32.const 31)))
    (drop (call $clz (i32.const 0xffffffff)))
    (drop (call $clz (i32.const 0)))
    (drop (call $clz (i32.const 0x00008000)))
    (drop (call $clz (i32.const 0xff)))
    (drop (call $clz (i32.const 0x80000000)))
    (drop (call $clz (i32.const 1)))
    (drop (call $clz (i32.const 2)))
    (drop (call $clz (i32.const 0x7fffffff)))
    (drop (call $ctz (i32.const -1)))
    (drop (call $ctz (i32.const 0)))
    (drop (call $ctz (i32.const 0x00008000)))
    (drop (call $ctz (i32.const 0x00010000)))
    (drop (call $ctz (i32.const 0x80000000)))
    (drop (call $ctz (i32.const 0x7fffffff)))
    (drop (call $popcnt (i32.const -1)))
    (drop (call $popcnt (i32.const 0)))
    (drop (call $popcnt (i32.const 0x00008000)))
    (drop (call $popcnt (i32.const 0x80008000)))
    (drop (call $popcnt (i32.const 0x7fffffff)))
    (drop (call $popcnt (i32.const 0xAAAAAAAA)))
    (drop (call $popcnt (i32.const 0x55555555)))
    (drop (call $popcnt (i32.const 0xDEADBEEF)))
    (drop (call $eqz (i32.const 0)))
    (drop (call $eqz (i32.const 1)))
    (drop (call $eqz (i32.const 0x80000000)))
    (drop (call $eqz (i32.const 0x7fffffff)))
    (drop (call $eq (i32.const 0) (i32.const 0)))
    (drop (call $eq (i32.const 1) (i32.const 1)))
    (drop (call $eq (i32.const -1) (i32.const 1)))
    (drop (call $eq (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $eq (i32.const 0x7fffffff) (i32.const 0x7fffffff)))
    (drop (call $eq (i32.const -1) (i32.const -1)))
    (drop (call $eq (i32.const 1) (i32.const 0)))
    (drop (call $eq (i32.const 0) (i32.const 1)))
    (drop (call $eq (i32.const 0x80000000) (i32.const 0)))
    (drop (call $eq (i32.const 0) (i32.const 0x80000000)))
    (drop (call $eq (i32.const 0x80000000) (i32.const -1)))
    (drop (call $eq (i32.const -1) (i32.const 0x80000000)))
    (drop (call $eq (i32.const 0x80000000) (i32.const 0x7fffffff)))
    (drop (call $eq (i32.const 0x7fffffff) (i32.const 0x80000000)))
    (drop (call $ne (i32.const 0) (i32.const 0)))
    (drop (call $ne (i32.const 1) (i32.const 1)))
    (drop (call $ne (i32.const -1) (i32.const 1)))
    (drop (call $ne (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $ne (i32.const 0x7fffffff) (i32.const 0x7fffffff)))
    (drop (call $ne (i32.const -1) (i32.const -1)))
    (drop (call $ne (i32.const 1) (i32.const 0)))
    (drop (call $ne (i32.const 0) (i32.const 1)))
    (drop (call $ne (i32.const 0x80000000) (i32.const 0)))
    (drop (call $ne (i32.const 0) (i32.const 0x80000000)))
    (drop (call $ne (i32.const 0x80000000) (i32.const -1)))
    (drop (call $ne (i32.const -1) (i32.const 0x80000000)))
    (drop (call $ne (i32.const 0x80000000) (i32.const 0x7fffffff)))
    (drop (call $ne (i32.const 0x7fffffff) (i32.const 0x80000000)))
    (drop (call $lt_s (i32.const 0) (i32.const 0)))
    (drop (call $lt_s (i32.const 1) (i32.const 1)))
    (drop (call $lt_s (i32.const -1) (i32.const 1)))
    (drop (call $lt_s (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $lt_s (i32.const 0x7fffffff) (i32.const 0x7fffffff)))
    (drop (call $lt_s (i32.const -1) (i32.const -1)))
    (drop (call $lt_s (i32.const 1) (i32.const 0)))
    (drop (call $lt_s (i32.const 0) (i32.const 1)))
    (drop (call $lt_s (i32.const 0x80000000) (i32.const 0)))
    (drop (call $lt_s (i32.const 0) (i32.const 0x80000000)))
    (drop (call $lt_s (i32.const 0x80000000) (i32.const -1)))
    (drop (call $lt_s (i32.const -1) (i32.const 0x80000000)))
    (drop (call $lt_s (i32.const 0x80000000) (i32.const 0x7fffffff)))
    (drop (call $lt_s (i32.const 0x7fffffff) (i32.const 0x80000000)))
    (drop (call $lt_u (i32.const 0) (i32.const 0)))
    (drop (call $lt_u (i32.const 1) (i32.const 1)))
    (drop (call $lt_u (i32.const -1) (i32.const 1)))
    (drop (call $lt_u (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $lt_u (i32.const 0x7fffffff) (i32.const 0x7fffffff)))
    (drop (call $lt_u (i32.const -1) (i32.const -1)))
    (drop (call $lt_u (i32.const 1) (i32.const 0)))
    (drop (call $lt_u (i32.const 0) (i32.const 1)))
    (drop (call $lt_u (i32.const 0x80000000) (i32.const 0)))
    (drop (call $lt_u (i32.const 0) (i32.const 0x80000000)))
    (drop (call $lt_u (i32.const 0x80000000) (i32.const -1)))
    (drop (call $lt_u (i32.const -1) (i32.const 0x80000000)))
    (drop (call $lt_u (i32.const 0x80000000) (i32.const 0x7fffffff)))
    (drop (call $lt_u (i32.const 0x7fffffff) (i32.const 0x80000000)))
    (drop (call $le_s (i32.const 0) (i32.const 0)))
    (drop (call $le_s (i32.const 1) (i32.const 1)))
    (drop (call $le_s (i32.const -1) (i32.const 1)))
    (drop (call $le_s (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $le_s (i32.const 0x7fffffff) (i32.const 0x7fffffff)))
    (drop (call $le_s (i32.const -1) (i32.const -1)))
    (drop (call $le_s (i32.const 1) (i32.const 0)))
    (drop (call $le_s (i32.const 0) (i32.const 1)))
    (drop (call $le_s (i32.const 0x80000000) (i32.const 0)))
    (drop (call $le_s (i32.const 0) (i32.const 0x80000000)))
    (drop (call $le_s (i32.const 0x80000000) (i32.const -1)))
    (drop (call $le_s (i32.const -1) (i32.const 0x80000000)))
    (drop (call $le_s (i32.const 0x80000000) (i32.const 0x7fffffff)))
    (drop (call $le_s (i32.const 0x7fffffff) (i32.const 0x80000000)))
    (drop (call $le_u (i32.const 0) (i32.const 0)))
    (drop (call $le_u (i32.const 1) (i32.const 1)))
    (drop (call $le_u (i32.const -1) (i32.const 1)))
    (drop (call $le_u (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $le_u (i32.const 0x7fffffff) (i32.const 0x7fffffff)))
    (drop (call $le_u (i32.const -1) (i32.const -1)))
    (drop (call $le_u (i32.const 1) (i32.const 0)))
    (drop (call $le_u (i32.const 0) (i32.const 1)))
    (drop (call $le_u (i32.const 0x80000000) (i32.const 0)))
    (drop (call $le_u (i32.const 0) (i32.const 0x80000000)))
    (drop (call $le_u (i32.const 0x80000000) (i32.const -1)))
    (drop (call $le_u (i32.const -1) (i32.const 0x80000000)))
    (drop (call $le_u (i32.const 0x80000000) (i32.const 0x7fffffff)))
    (drop (call $le_u (i32.const 0x7fffffff) (i32.const 0x80000000)))
    (drop (call $gt_s (i32.const 0) (i32.const 0)))
    (drop (call $gt_s (i32.const 1) (i32.const 1)))
    (drop (call $gt_s (i32.const -1) (i32.const 1)))
    (drop (call $gt_s (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $gt_s (i32.const 0x7fffffff) (i32.const 0x7fffffff)))
    (drop (call $gt_s (i32.const -1) (i32.const -1)))
    (drop (call $gt_s (i32.const 1) (i32.const 0)))
    (drop (call $gt_s (i32.const 0) (i32.const 1)))
    (drop (call $gt_s (i32.const 0x80000000) (i32.const 0)))
    (drop (call $gt_s (i32.const 0) (i32.const 0x80000000)))
    (drop (call $gt_s (i32.const 0x80000000) (i32.const -1)))
    (drop (call $gt_s (i32.const -1) (i32.const 0x80000000)))
    (drop (call $gt_s (i32.const 0x80000000) (i32.const 0x7fffffff)))
    (drop (call $gt_s (i32.const 0x7fffffff) (i32.const 0x80000000)))
    (drop (call $gt_u (i32.const 0) (i32.const 0)))
    (drop (call $gt_u (i32.const 1) (i32.const 1)))
    (drop (call $gt_u (i32.const -1) (i32.const 1)))
    (drop (call $gt_u (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $gt_u (i32.const 0x7fffffff) (i32.const 0x7fffffff)))
    (drop (call $gt_u (i32.const -1) (i32.const -1)))
    (drop (call $gt_u (i32.const 1) (i32.const 0)))
    (drop (call $gt_u (i32.const 0) (i32.const 1)))
    (drop (call $gt_u (i32.const 0x80000000) (i32.const 0)))
    (drop (call $gt_u (i32.const 0) (i32.const 0x80000000)))
    (drop (call $gt_u (i32.const 0x80000000) (i32.const -1)))
    (drop (call $gt_u (i32.const -1) (i32.const 0x80000000)))
    (drop (call $gt_u (i32.const 0x80000000) (i32.const 0x7fffffff)))
    (drop (call $gt_u (i32.const 0x7fffffff) (i32.const 0x80000000)))
    (drop (call $ge_s (i32.const 0) (i32.const 0)))
    (drop (call $ge_s (i32.const 1) (i32.const 1)))
    (drop (call $ge_s (i32.const -1) (i32.const 1)))
    (drop (call $ge_s (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $ge_s (i32.const 0x7fffffff) (i32.const 0x7fffffff)))
    (drop (call $ge_s (i32.const -1) (i32.const -1)))
    (drop (call $ge_s (i32.const 1) (i32.const 0)))
    (drop (call $ge_s (i32.const 0) (i32.const 1)))
    (drop (call $ge_s (i32.const 0x80000000) (i32.const 0)))
    (drop (call $ge_s (i32.const 0) (i32.const 0x80000000)))
    (drop (call $ge_s (i32.const 0x80000000) (i32.const -1)))
    (drop (call $ge_s (i32.const -1) (i32.const 0x80000000)))
    (drop (call $ge_s (i32.const 0x80000000) (i32.const 0x7fffffff)))
    (drop (call $ge_s (i32.const 0x7fffffff) (i32.const 0x80000000)))
    (drop (call $ge_u (i32.const 0) (i32.const 0)))
    (drop (call $ge_u (i32.const 1) (i32.const 1)))
    (drop (call $ge_u (i32.const -1) (i32.const 1)))
    (drop (call $ge_u (i32.const 0x80000000) (i32.const 0x80000000)))
    (drop (call $ge_u (i32.const 0x7fffffff) (i32.const 0x7fffffff)))
    (drop (call $ge_u (i32.const -1) (i32.const -1)))
    (drop (call $ge_u (i32.const 1) (i32.const 0)))
    (drop (call $ge_u (i32.const 0) (i32.const 1)))
    (drop (call $ge_u (i32.const 0x80000000) (i32.const 0)))
    (drop (call $ge_u (i32.const 0) (i32.const 0x80000000)))
    (drop (call $ge_u (i32.const 0x80000000) (i32.const -1)))
    (drop (call $ge_u (i32.const -1) (i32.const 0x80000000)))
    (drop (call $ge_u (i32.const 0x80000000) (i32.const 0x7fffffff)))
    (drop (call $ge_u (i32.const 0x7fffffff) (i32.const 0x80000000)))
    )
)
