(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

(** Multicodec – self-describing serialization. *)

include Table

(** [parse body] Parse multicodec prefix and return with rest of the [body]. *)
let parse body =
  let open Base.Result in
  Varint.VarUint64.decode_int body
  >>= fun (codec, rest) ->
  of_code codec
  |> Option.to_result ~none:`Codec_not_found
  >>| fun codec -> codec, rest
;;
