(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX: prefix for external names
//
#define ATS_EXTERN_PREFIX "ats2jspre_"
//
(* ****** ****** *)
//
// HX: for signed integers
//
(* ****** ****** *)
//
fun
abs_int0 : int -> int = "mac#%"
//
overload abs with abs_int0 of 100
//
(* ****** ****** *)
//
fun
neg_int0 : int -> int = "mac#%"
//
overload ~ with neg_int0 of 100
overload neg with neg_int0 of 100
//
(* ****** ****** *)
//
fun succ_int0 : int -> int = "mac#%"
fun pred_int0 : int -> int = "mac#%"
//
fun succ_int1
  : {i:int} int(i) -> int(i+1) = "mac#%"
fun pred_int1
  : {i:int} int(i) -> int(i-1) = "mac#%"
//
overload succ with succ_int0 of 100
overload pred with pred_int0 of 100
//
overload succ with succ_int1 of 110
overload pred with pred_int1 of 110
//
(* ****** ****** *)
//
fun half_int0 : int -> int = "mac#%"
fun half_int1 : {i:int} int(i) -> int(i/2) = "mac#%"
//
overload half with half_int0 of 100
overload half with half_int1 of 110
//
(* ****** ****** *)
//
fun add_int0_int0: (int, int) -> int = "mac#%"
fun sub_int0_int0 : (int, int) -> int = "mac#%"
fun mul_int0_int0 : (int, int) -> int = "mac#%"
fun div_int0_int0 : (int, int) -> int = "mac#%"
fun mod_int0_int0 : (int, int) -> int = "mac#%"
//
fun add_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i+j) = "mac#%"
fun sub_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i-j) = "mac#%"
fun mul_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i*j) = "mac#%"
fun div_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i/j) = "mac#%"
//
(* ****** ****** *)
//
overload + with add_int0_int0 of 100
overload - with sub_int0_int0 of 100
overload * with mul_int0_int0 of 100
overload / with div_int0_int0 of 100
overload % with mod_int0_int0 of 100
overload mod with mod_int0_int0 of 100
//
overload + with add_int1_int1 of 120
overload - with sub_int1_int1 of 120
overload * with mul_int1_int1 of 120
overload / with div_int1_int1 of 120
//
(* ****** ****** *)
//
fun
asl_int0_int1
  : (int, intGte(0)) -> int = "mac#%"
fun
asr_int0_int1
  : (int, intGte(0)) -> int = "mac#%"
//
(* ****** ****** *)
//
overload << with asl_int0_int1 of 110
overload >> with asr_int0_int1 of 110
//
(* ****** ****** *)
//
fun lt_int0_int0: (int, int) -> bool = "mac#%"
fun lte_int0_int0: (int, int) -> bool = "mac#%"
fun gt_int0_int0: (int, int) -> bool = "mac#%"
fun gte_int0_int0: (int, int) -> bool = "mac#%"
//
fun eq_int0_int0: (int, int) -> bool = "mac#%"
fun neq_int0_int0: (int, int) -> bool = "mac#%"
//
fun lt_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i < j) = "mac#%"
fun lte_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i <= j) = "mac#%"
fun gt_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i > j) = "mac#%"
fun gte_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i >= j) = "mac#%"
//
fun eq_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i == j) = "mac#%"
fun neq_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i != j) = "mac#%"
//
(* ****** ****** *)
//
overload < with lt_int0_int0 of 100
overload <= with lte_int0_int0 of 100
overload > with gt_int0_int0 of 100
overload >= with gte_int0_int0 of 100
overload = with eq_int0_int0 of 100
overload != with neq_int0_int0 of 100
overload <> with neq_int0_int0 of 100
//
overload < with lt_int1_int1 of 120
overload <= with lte_int1_int1 of 120
overload > with gt_int1_int1 of 120
overload >= with gte_int1_int1 of 120
overload = with eq_int1_int1 of 120
overload != with neq_int1_int1 of 120
overload <> with neq_int1_int1 of 120
//
(* ****** ****** *)
//
// HX: for unsigned integers
//
(* ****** ****** *)
//
fun add_uint0_uint0: (uint, uint) -> uint = "mac#%"
fun sub_uint0_uint0 : (uint, uint) -> uint = "mac#%"
fun mul_uint0_uint0 : (uint, uint) -> uint = "mac#%"
fun div_uint0_uint0 : (uint, uint) -> uint = "mac#%"
fun mod_uint0_uint0 : (uint, uint) -> uint = "mac#%"
//
(* ****** ****** *)
//
overload + with add_uint0_uint0 of 100
overload - with sub_uint0_uint0 of 100
overload * with mul_uint0_uint0 of 100
overload / with div_uint0_uint0 of 100
overload % with mod_uint0_uint0 of 100
overload mod with mod_uint0_uint0 of 100
//
(* ****** ****** *)
//
fun lt_uint0_uint0: (uint, uint) -> bool = "mac#%"
fun lte_uint0_uint0: (uint, uint) -> bool = "mac#%"
fun gt_uint0_uint0: (uint, uint) -> bool = "mac#%"
fun gte_uint0_uint0: (uint, uint) -> bool = "mac#%"
//
fun eq_uint0_uint0: (uint, uint) -> bool = "mac#%"
fun neq_uint0_uint0: (uint, uint) -> bool = "mac#%"
//
(* ****** ****** *)
//
overload < with lt_uint0_uint0 of 100
overload <= with lte_uint0_uint0 of 100
overload > with gt_uint0_uint0 of 100
overload >= with gte_uint0_uint0 of 100
overload = with eq_uint0_uint0 of 100
overload != with neq_uint0_uint0 of 100
overload <> with neq_uint0_uint0 of 100
//
(* ****** ****** *)

(* end of [integer.sats] *)
