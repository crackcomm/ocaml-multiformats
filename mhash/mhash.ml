(* Copyright © 2020-2022 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

(** Multihash – self-describing hashes. *)

open Core
module Kind = Kind

(** Multihash structure *)
type t =
  { kind : Kind.t
  ; hash : Bigstring.t (** Shared part of multihash. *)
  ; mhash : Bigstring.t
  }
[@@deriving sexp, compare, equal]

type error =
  [ Varint.error
  | `Codec_not_hash of Mcodec.t
  ]
[@@deriving sexp]

(** [parse mhash] Parse multihash. *)
let parse mhash : (t, [> error ]) result =
  let open Result in
  Mcodec.parse mhash
  >>= fun (codec, hash) ->
  Kind.of_codec codec
  |> Result.of_option ~error:(`Codec_not_hash codec)
  >>| fun kind -> { kind; hash; mhash }
;;
