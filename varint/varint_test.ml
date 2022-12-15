(* Copyright © 2020-2022 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core
open Varint
open Stdint

let go_ref =
  [ 0L, "aa"
  ; 64L, "ia"
  ; 128L, "qaaq"
  ; 192L, "yaaq"
  ; 256L, "qaba"
  ; 320L, "yaba"
  ; 384L, "qabq"
  ; 448L, "yabq"
  ; 512L, "qaca"
  ; 576L, "yaca"
  ; 640L, "qacq"
  ; 704L, "yacq"
  ; 768L, "qada"
  ; 832L, "yada"
  ; 896L, "qadq"
  ; 960L, "yadq"
  ; 1844674407370955161L, "tgz6ntezwptmygi"
  ; 2049638230412172401L, "6g4jzdwh4py3qha"
  ; 2305843009213693951L, "7777777777776hy"
  ; 2635249153387078802L, "sle2jewjusjmsja"
  ; 3074457345618258602L, "vlk2vvnk2wvnkkq"
  ; 3689348814741910323L, "wptmzgnt43gjsmy"
  ; 4611686018427387903L, "7777777777776py"
  ; 6148914691236517205L, "2wvnlkwvvlk2uvi"
  ; 9223372036854775807L, "77777777777767y"
  ]
;;

let%test_unit "test data" =
  let encode_pair (num, enc) =
    let encoded =
      num
      |> Uint64.of_int64
      |> VarUint64.encode
      |> B32.encode_lower
      |> Bigstring.to_string
    in
    [%test_result: String.t] ~expect:enc encoded
  in
  List.iter ~f:encode_pair go_ref
;;
