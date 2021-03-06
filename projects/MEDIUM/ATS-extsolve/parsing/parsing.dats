(*
** Parsing constraints in JSON format
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
staload "constraint/constraint.sats"
//
(* ****** ****** *)

staload "{$JSONC}/SATS/json.sats"
staload "{$JSONC}/SATS/json_ML.sats"

(* ****** ****** *)

staload "./parsing.sats"

(* ****** ****** *)

extern
fun jsonval_get_field
  (jsv: jsonval, name: string): Option_vt (jsonval)

(* ****** ****** *)

implement
jsonval_get_field
  (jsv0, name) = let
in
//
case+ jsv0 of
| JSONobject
    (lxs) => let
  in
    list_assoc_opt<string,jsonval> (lxs, name)
  end // end of [JSONobject]
| _ (*nonobj*) => None_vt ()
//
end // end of [jsonval_get_field]

(* ****** ****** *)
//
implement
parse_int
  (jsv0) = let
  val-JSONint (lli) = jsv0 in $UN.cast{int}(lli)
end // end of [parse_int]
//
implement
parse_string
  (jsv0) = let val-JSONstring (str) = jsv0 in str end
//
(* ****** ****** *)

implement
parse_stamp (jsv0) = let
  val-JSONint(lli) = jsv0 in stamp_make ($UN.cast{int}(lli))
end // end of [parse_stamp]

(* ****** ****** *)

implement
parse_symbol (jsv0) = let
  val-JSONstring(name) = jsv0 in symbol_make (name)
end // end of [parse_symbol]

(* ****** ****** *)

implement
parse_location (jsv0) = let
  val-JSONstring(strloc) = jsv0 in location_make (strloc)
end // end of [parse_location]

(* ****** ****** *)

implement
{a}(*tmp*)
parse_list
  (jsv0, f) = let
//
val-JSONarray(jsvs) = jsv0
//
fun auxlst
(
  jsvs: jsonvalist, f: jsonval -> a
) : List0 (a) =
  case+ jsvs of
  | list_cons
      (jsv, jsvs) =>
      list_cons{a}(f(jsv), auxlst (jsvs, f))
  | list_nil () => list_nil ()
//
in
  auxlst (jsvs, f)
end // end of [parse_list]

(* ****** ****** *)

implement
{a}(*tmp*)
parse_option
  (jsv0, f) = let
(*
val () = fprintln!
  (stdout_ref, "parse_option: jsv0 = ", jsv0)
*)
//
val-JSONarray (jsvs) = jsv0
//
in
  case+ jsvs of
  | list_nil () => None(*void*)
  | list_cons (jsv, _) => Some{a}(f(jsv))
end // end of [parse_option]

(* ****** ****** *)

implement parse_c3nstr_from_stdin () = let
  val inp = stdin_ref
  val out = stdout_ref
  //
  val D = 1024
  val tkr = json_tokener_new_ex (D)
  val () = assertloc (json_tokener2ptr (tkr) > 0)
  //
  val cs = 
    fileref_get_file_string (inp)
  val jso = let
    val cs2 = $UN.strptr2string (cs)
    val len = g1u2i (string_length (cs2))
  in
    json_tokener_parse_ex (tkr, cs2, len)
  end
  //
  val jsv = json_object2val0 (jso)
  val () = strptr_free (cs)
  val () = json_tokener_free (tkr)
in
  parse_c3nstr (jsv)
end // end of [parse_c3nstr_from_stdin]

(* ****** ****** *)

(* end of [parsing.dats] *)
