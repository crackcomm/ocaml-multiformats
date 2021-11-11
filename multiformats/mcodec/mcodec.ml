(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

(** Multicodec – self-describing serialization. *)

include Table

(** [parse body] Parse multicodec prefix and return with rest of the [body]. *)
let parse body =
  let open Base.Result in
  Varint.VarUint64.decode_int body
  >>| fun (code, rest) ->
  let codec = of_code code in
  codec, rest
;;
