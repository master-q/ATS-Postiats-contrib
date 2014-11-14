(*
#
# WebServer
#
*)
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"{$ARDUINO}/staloadall.hats"

(* ****** ****** *)

extern fun setup (): void = "mac#"

implement
setup () = {
  val () = pinMode(13, OUTPUT)
}

extern fun loop (): void = "mac#"

implement loop () = {
  val () = (
    digitalWrite (13, HIGH) ; delay (1000)
  )
  val () = (
    digitalWrite (13, LOW ) ; delay (1000)
  )
}
