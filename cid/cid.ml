(* Copyright © 2020-2022 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

(** Content-ID – self-describing content address. *)

(* MISSING: Identity, not everything is multihash in CID. *)

open Core
open Core.Result

(** Content ID version. *)
type version =
  [ `V0
  | `V1
  ]
[@@deriving sexp, compare, equal]

type error =
  [ Mbase.error
  | Mhash.error
  ]
[@@deriving sexp]

(** Content ID record type. *)
type t =
  { ver : version
  ; codec : Mcodec.t
  ; identity : Bigstring.t (** Binary representation of CID. *)
  ; mhash : Mhash.t (** Multihash part of CID shared with [bin]. *)
  }
[@@deriving sexp, compare, equal]

(** [to_raw_bigstring cid] Returns underlying [Bigstring.t] of a CID without
    multibase encoding prefix. This representation is used usually encoded
    with a multibase encoding which inserts the prefix. In CID V0 the prefix
    is part of the identity. *)
let to_raw_bigstring { identity; _ } = identity

let to_raw_string t = Bigstring.to_string (to_raw_bigstring t)

(** [is_v0_string cid] Quickly checks if string is prefixed with `Qm`. *)
let is_v0_string cid = String.is_prefix cid ~prefix:"Qm"

(** Parse binary representation of CID V0. *)
let parse_v0 identity =
  Mhash.parse identity
  >>| fun mhash -> { ver = `V0; codec = `DAG'Pb; identity; mhash }
;;

(** Parse binary representation of CID V1. *)
let parse_v1 identity =
  Varint.VarUint64.decode_int identity
  >>= fun (_ver, rest) ->
  (* Ignoring version, as of now there is only V0 and V1. *)
  Mcodec.parse rest
  >>= fun (codec, hash) ->
  Mhash.parse hash >>| fun mhash -> { ver = `V1; codec; identity; mhash }
;;

(** Returns a parser of [cid] based on it's prefix. Returns parser V0 for
    prefix `Q` and V1 for all other prefixes. *)
let parser_of cid =
  match Bigstring.get cid 0 with
  | 'Q' -> parse_v0
  | _ -> parse_v1
;;

(** [of_bigstring cid] Parse [cid] from multibase-encoded [Bigstring.t]. *)
let of_bigstring cid =
  match Bigstring.length cid with
  | 0 -> Error `Empty_string
  | _ -> Mbase.decode cid >>= parser_of cid
;;

(** [of_bigstring_exn cid] Parse [cid] from multibase-encoded [Bigstring.t]. *)
let of_bigstring_exn ?(here = [%here]) cid =
  match of_bigstring cid with
  | Ok v -> v
  | Error e -> failwiths ~here "Cid.of_bigstring_exn" e sexp_of_error
;;

let of_bytes buf = of_bigstring (Bigstring.of_bytes buf)
let of_bytes_exn ?here buf = of_bigstring_exn ?here (Bigstring.of_bytes buf)

(** [of_raw_bigstring cid] Parse [cid] from raw [Bigstring.t]. *)
let of_raw_bigstring cid =
  match Bigstring.length cid with
  | 0 -> Error `Empty_string
  | _ -> parser_of cid cid
;;

let of_raw_string s = of_raw_bigstring (Bigstring.of_string s)

(** [of_raw_bigstring_exn cid] Parse [cid] from raw [Bigstring.t]. *)
let of_raw_bigstring_exn ?(here = [%here]) cid =
  match of_raw_bigstring cid with
  | Ok v -> v
  | Error e -> failwiths ~here "Cid.of_raw_bigstring_exn" e sexp_of_error
;;

let of_raw_string_exn ?here s =
  of_raw_bigstring_exn ?here (Bigstring.of_string s)
;;

(** [of_string cid] Parse [cid] from multibase-encoded [string]. *)
let of_string cid = Bigstring.of_string cid |> of_bigstring

(** [of_string_exn cid] Parse [cid] from multibase-encoded [Bigstring.t]. *)
let of_string_exn ?(here = [%here]) cid =
  match of_string cid with
  | Ok v -> v
  | Error e -> failwiths ~here "Cid.of_string_exn" e sexp_of_error
;;

(** [encode cid] Encodes [cid] as multibase-encoded [Bigstring.t]. *)
let encode ?base cid =
  match base, cid.ver with
  (* Using [encoder] instead of [encode] doesn't append prefix. *)
  | None, `V0 -> Mbase.encoder `Base58btc cid.identity
  | None, `V1 -> Mbase.encode ~base:`Base32 cid.identity
  | Some base, _ -> Mbase.encode ~base cid.identity
;;

(** [to_string cid] Encodes [cid] as multibase-encoded [string]. *)
let to_string ?base cid = Bigstring.to_string (encode ?base cid)

(** [is_v0 cid] Returns [true] if [cid] is version 0. *)
let is_v0 cid =
  match cid.ver with
  | `V0 -> true
  | _ -> false
;;

(** [is_v1 cid] Returns [true] if [cid] is version 1. *)
let is_v1 cid =
  match cid.ver with
  | `V1 -> true
  | _ -> false
;;
