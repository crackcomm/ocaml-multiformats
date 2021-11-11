(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

(** Content-ID – self-describing content address. *)

(* MISSING: Identity, not everything is multihash in CID. *)

open Core_kernel
open Core_kernel.Result

(** Content ID version. *)
type version =
  | V0
  | V1

(** Content ID record type. *)
type t =
  { ver : version
  ; codec : Mcodec.t
  ; bin : Bigstring.t (** Binary representation of CID. *)
  ; mhash : Mhash.t (** Multihash part of CID shared with [bin]. *)
  }

(** [is_v0_string cid] Quickly checks if string is prefixed with `Qm`. *)
let is_v0_string cid = String.is_prefix cid ~prefix:"Qm"

(** Parse binary representation of CID V0. *)
let parse_cidv0 hash =
  Mhash.parse hash
  >>| fun mhash -> { ver = V0; codec = Mcodec.DAG'Pb; bin = hash; mhash }
;;

(** Parse binary representation of CID V1. *)
let parse_cidv1 body =
  Varint.VarUint64.decode_int body
  >>= fun (_ver, rest) ->
  (* Ignoring version, as of now there is only V0 and V1. *)
  Mcodec.parse rest
  >>= fun (codec, hash) ->
  Mhash.parse hash >>| fun mhash -> { ver = V1; codec; bin = body; mhash }
;;

(** [of_bigstring cid] Parse [cid] from multibase-encoded [Bigstring.t]. *)
let of_bigstring cid =
  match Bigstring.length cid with
  | 0 -> Error `Empty_string
  | _ ->
    Mbase.decode cid
    >>=
    (match Bigstring.get cid 0 with
    | 'Q' -> parse_cidv0
    | _ -> parse_cidv1)
;;

(** [of_string cid] Parse [cid] from multibase-encoded [string]. *)
let of_string cid = Bigstring.of_string cid |> of_bigstring

(** [encode cid] Encodes [cid] as multibase-encoded [Bigstring.t]. *)
let encode ?base cid =
  match base, cid.ver with
  | None, V0 -> Mbase.encoder Mbase.B.Base58btc cid.bin
  | None, V1 -> Mbase.encode ~base:Mbase.B.Base32 cid.bin
  | Some base, _ -> Mbase.encode ~base cid.bin
;;

(** [to_string cid] Encodes [cid] as multibase-encoded [string]. *)
let to_string ?base cid = Bigstring.to_string (encode ?base cid)

(** [is_v0 cid] Returns [true] if [cid] is version 0. *)
let is_v0 cid =
  match cid.ver with
  | V0 -> true
  | _ -> false
;;

(** [is_v1 cid] Returns [true] if [cid] is version 1. *)
let is_v1 cid =
  match cid.ver with
  | V1 -> true
  | _ -> false
;;
