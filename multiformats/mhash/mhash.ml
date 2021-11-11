(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

(** Multihash – self-describing hashes. *)

open Core_kernel
open Core_kernel.Result
module Kind = Kind

(** Multihash structure *)
type t =
  { kind : Kind.t
  ; hash : Bigstring.t (** Shared part of multihash. *)
  ; mhash : Bigstring.t
  }

(** [parse mhash] Parse multihash. *)
let parse mhash =
  Mcodec.parse mhash
  >>= fun (codec, hash) ->
  Kind.of_codec codec
  |> Result.of_option ~error:(`Codec_not_hash codec)
  >>| fun kind -> { kind; hash; mhash }
;;
