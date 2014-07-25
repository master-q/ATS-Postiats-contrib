(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
SBF =
"libats/SATS/stringbuf.sats"
//
stadef stringbuf = $SBF.stringbuf
//
(* ****** ****** *)
//
staload
DA =
"libats/SATS/dynarray.sats"
//
stadef dynarray = $DA.dynarray
//
(* ****** ****** *)
//
staload
CS = "{$LIBATSHWXI}/cstream/SATS/cstream.sats"
stadef cstream = $CS.cstream
//
(* ****** ****** *)
//
typedef
fprint_type
  (a: t@ype) = (FILEref, a) -> void
//
(* ****** ****** *)
//
abstype
filename_type = ptr
typedef fil_t = filename_type
//
(* ****** ****** *)

val filename_dummy : fil_t
val filename_stdin : fil_t

(* ****** ****** *)
//
fun
print_filename : (fil_t) -> void
fun
prerr_filename : (fil_t) -> void
overload print with print_filename
overload prerr with prerr_filename
//
fun
fprint_filename : fprint_type (fil_t)
overload fprint with fprint_filename
//
(* ****** ****** *)
//
fun the_filename_pop ((*void*)): fil_t
fun the_filename_push (fil: fil_t): void
//
fun the_filename_get ((*void*)): fil_t
//
(* ****** ****** *)
(*
//
abstype
position_type = ptr
typedef pos_t = position_type  
//
(* ****** ****** *)
//
fun
print_position : (pos_t) -> void
fun
prerr_position : (pos_t) -> void
overload print with print_position
overload prerr with prerr_position
//
fun
fprint_position : fprint_type (pos_t)
overload fprint with fprint_position
//
*)
(* ****** ****** *)

typedef
position =
@{
, pos_ntot= int
, pos_nrow= int
, pos_ncol= int
} (* end of [position] *)

(* ****** ****** *)
//
fun
position_incby1 (pos: &position >> _): void
//
fun
position_decby (pos: &position >> _, n: intGte(0)): void
fun
position_incby (pos: &position >> _, n: intGte(0)): void
//
fun position_incby_char (pos: &position >> _, c: char): void
//
(* ****** ****** *)
//
abstype
location_type = ptr
typedef loc_t = location_type  
//
(* ****** ****** *)

val location_dummy : loc_t

(* ****** ****** *)
//
fun
print_location : (loc_t) -> void
fun
prerr_location : (loc_t) -> void
overload print with print_location
overload prerr with prerr_location
//
fun
fprint_location : fprint_type (loc_t)
overload fprint with fprint_location
//
fun
fprint_locrange : fprint_type (loc_t)
//
(* ****** ****** *)
//
fun
location_make_pos_pos
  (pos1: &position, pos2: &position): loc_t
fun
location_make_fil_pos_pos
  (fil: fil_t, pos1: &position, pos2: &position): loc_t
//
(* ****** ****** *)

datatype
keyword =
//
  | ATStmpdec of ()
//
  | ATSif of ()
  | ATSthen of ()
  | ATSelse of ()
//
  | ATSgoto of ()
//
  | ATSreturn of ()
  | ATSreturn_void of ()
//
  | ATStailcalbeg of ()
  | ATStailcalend of ()
//
  | ATSINSmove of ()
//
  | ATSINSmove_boxrec of ()
  | ATSINSmove_boxrec_ofs of ()
//
  | ATSSELboxrec of ()
//
  | ATSINSstore_boxrec_ofs of ()
//
  | ATSINSmove_tlcal of ()
  | ATSINSargmove_tlcal of ()
//
  | ATSPMVi0nt of ()
  | ATSPMVf0loat of ()
//
  | ATSinline of () // inline
  | ATSglobaldec of () // extern
  | ATSstaticdec of () // static
//
  | ATSdyncst_mac of ()
  | ATSdyncst_extfun of ()
//
  | KWnone of ()
//
// end of [keyword]

(* ****** ****** *)
//
fun
fprint_keyword
  (out: FILEref, x: keyword): void
//
overload fprint with fprint_keyword
//
(* ****** ****** *)

fun keyword_search (name: string): keyword

(* ****** ****** *)

datatype
token_node =
//
| T_KWORD of keyword
//
| T_IDENT_alp of string
| T_IDENT_sym of string
| T_IDENT_srp of string
//
| T_CHAR of (string)
//
| T_FLOAT of (string)
| T_INTEGER of (int(*base*), string)
//
| T_STRING of (string)
//
| T_LPAREN of () // (
| T_RPAREN of () // )
| T_LBRACKET of () // [
| T_RBRACKET of () // ]
| T_LBRACE of () // {
| T_RBRACE of () // }
//
| T_COMMA of () // ,
| T_COLON of () // :
| T_SEMICOLON of () // ;
//
| T_SLASH of () // /
//
| T_COMMENT_line of () // line comment
| T_COMMENT_block of () // block comment
//
| T_EOF of () // end-of-file
//
// end of [token_node]

(* ****** ****** *)

typedef tnode = token_node

(* ****** ****** *)

typedef token = '{
  token_loc= loc_t, token_node= tnode
} (* end of [token] *)

(* ****** ****** *)

fun fprint_tnode : fprint_type (tnode)

(* ****** ****** *)
//
fun
print_token : (token) -> void
fun
prerr_token : (token) -> void
overload print with print_token
overload prerr with prerr_token
//
fun fprint_token : fprint_type (token)
overload fprint with fprint_token
//
(* ****** ****** *)
//
fun
token_make (loc: loc_t, node: tnode): token
//
(* ****** ****** *)
//
datatype
lexerr_node =
  | LEXERR_UNSUPPORTED_char of (char)
//
typedef lexerr = '{
  lexerr_loc= loc_t, lexerr_node= lexerr_node
} (* end of [lexerr] *)
//
typedef lexerrlst = List0 (lexerr)
//
(* ****** ****** *)

fun fprint_lexerr : fprint_type (lexerr)
fun fprint_lexerrlst : fprint_type (lexerrlst)

(* ****** ****** *)
//
fun
lexerr_make
  (loc: loc_t, node: lexerr_node): lexerr
//
(* ****** ****** *)
//
fun the_lexerrlst_clear (): void
//
fun the_lexerrlst_insert (err: lexerr): void
//
fun the_lexerrlst_pop_all ((*void*)): List0_vt(lexerr)
//
fun the_lexerrlst_print_free ((*void*)): int(*nerr*)
//
(* ****** ****** *)
//
vtypedef
_lexbuf_vt0ype =
@{
//
lexbuf_ntot= int
,
lexbuf_nrow= int
,
lexbuf_ncol= int
,
//
lexbuf_nspace= int
//
,
//
lexbuf_cstream= cstream
//
,
lexbuf_nback= int
,
lexbuf_stringbuf= stringbuf
//
} // end of [_lexbuf_vt0ype]

(* ****** ****** *)
//
absvt@ype
lexbuf_vt0ype = _lexbuf_vt0ype
//
vtypedef lexbuf = lexbuf_vt0ype
//
(* ****** ****** *)
//
fun
lexbuf_initize_fileref
  (buf: &lexbuf? >> _, inp: FILEref): void
//
(* ****** ****** *)

fun lexbuf_uninitize (buf: &lexbuf >> _?): void

(* ****** ****** *)
//
fun
lexbuf_set_position
  (buf: &lexbuf >> _, pos: &position): void
fun
lexbuf_get_position
  (buf: &lexbuf, pos: &position? >> _): void
//
(* ****** ****** *)

fun lexbuf_set_nback (buf: &lexbuf, nb: int): void
fun lexbuf_incby_nback (buf: &lexbuf, nb: int): void

(* ****** ****** *)

fun lexbuf_get_nspace (buf: &lexbuf): int
fun lexbuf_set_nspace (buf: &lexbuf, n: int): void

(* ****** ****** *)

fun lexbuf_remove
  (buf: &lexbuf >> _, nchr: intGte(0)): void

fun lexbuf_remove_all (buf: &lexbuf >> _): void

(* ****** ****** *)

fun lexbuf_takeout (buf: &lexbuf >> _, nchr: intGte(0)): Strptr1

(* ****** ****** *)

fun lexbuf_get_char (buf: &lexbuf >> _): int

(* ****** ****** *)

fun lexbuf_get_token (buf: &lexbuf >> _): token
fun lexbuf_get_token_ncmnt (buf: &lexbuf >> _): token

(* ****** ****** *)
//
fun lexbufpos_get_location (buf: &lexbuf, pos: &position) : loc_t
fun lexbuf_getincby_location (buf: &lexbuf, nchr: intGte(0)): loc_t
//
(* ****** ****** *)

vtypedef
_tokbuf_vt0ype =
@{
//
  tokbuf_tkbf = dynarray (token)
, tokbuf_ntok= size_t, tokbuf_lxbf= lexbuf
//
} (* end of [_tokbuf_vt0ype] *)

(* ****** ****** *)
//
absvt@ype
tokbuf_vt0ype = _tokbuf_vt0ype
//
vtypedef tokbuf = tokbuf_vt0ype
//
(* ****** ****** *)
//
fun
tokbuf_initize_fileref
  (buf: &tokbuf? >> _, inp: FILEref): void
//
(* ****** ****** *)

fun tokbuf_uninitize (buf: &tokbuf >> _?): void

(* ****** ****** *)

fun
tokbuf_get_ntok (buf: &tokbuf >> _): size_t
fun
tokbuf_set_ntok (buf: &tokbuf >> _, ntok: size_t): void

(* ****** ****** *)

fun
tokbuf_incby1 (buf: &tokbuf >> _): void
fun
tokbuf_incby_count (buf: &tokbuf >> _, n: size_t): void

(* ****** ****** *)

fun
tokbuf_get_token (buf: &tokbuf >> _): token
fun
tokbuf_getinc_token (buf: &tokbuf >> _): token

(* ****** ****** *)

fun
parse_from_lexbuf (buf: &lexbuf >> _): void

(* ****** ****** *)

fun
parse_from_tokbuf (buf: &tokbuf >> _): void

(* ****** ****** *)

fun parse_from_fileref (inp: FILEref): void

(* ****** ****** *)

(* end of [atsparemit.sats] *)