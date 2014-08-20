(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX: prefix for external names
//
#define ATS_EXTERN_PREFIX "ats2pypre_"
//
(* ****** ****** *)

staload "./../basics_py.sats"

(* ****** ****** *)
//
fun
list_append
  {a:t0p}{i,j:int}
  (xs: list(a, i), ys: list(a, j)): list(a, i+j)= "mac#%"
//
(* ****** ****** *)
//
fun
list_reverse
  {a:t0p}{n:int}(xs: list(a, n)): list(a, n) = "mac#%"
fun
list_reverse_append
  {a:t0p}{i,j:int}
  (xs: list(a, i), ys: list(a, j)): list(a, i+j) = "mac#%"
//
(* ****** ****** *)
//
fun
list_map
  {a:t0p}{b:t0p}{n:int}
  (xs: list(a, n), f: cfun(a, b)): list (b, n) = "mac#%"
//
(* ****** ****** *)

(* end of [list.sats] *)
