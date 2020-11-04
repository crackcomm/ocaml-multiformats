(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core_kernel
open Core_kernel.Option

(** Multibase prefix codes. *)
module B = struct
  (** Implemented multibase encodings. *)
  type t =
    | Base32
    | Base58btc
  [@@deriving show, eq]

  (** Returns encoding by multibase prefix. *)
  let of_prefix = function
    | 'b' -> Some Base32
    | 'Q' -> Some Base58btc
    | _ -> None
  ;;

  (** Returns multibase prefix by encoding. *)
  let prefix_of = function
    | Base32 -> 'b'
    | Base58btc -> 'Q'
  ;;

  let append_prefix ~base value =
    match base with
    | Base58btc -> value
    | _ ->
      let len = Bigstring.length value in
      let output = Bigbuffer.create (len + 1) in
      Bigbuffer.add_char output (prefix_of base);
      Bigbuffer.add_bigstring output value;
      Bigbuffer.big_contents output
  ;;

  let sub_prefix ~base value =
    match base with
    | Base58btc -> value
    | _ -> Bigstring.sub_shared ~pos:1 value
  ;;
end

let decoder = function
  | B.Base32 -> B32.decode
  | Base58btc -> B58.decode B58.btc_alphabet
;;

let encoder = function
  | B.Base32 -> B32.encode_lower
  | Base58btc -> B58.encode B58.btc_alphabet
;;

(** [encode ~base value] Encodes bytes with multibase prefix. *)
let encode ~base value = value |> encoder base |> B.append_prefix ~base

let decode value base = value |> decoder base

(** [decode value] Decodes multibase prefixed value. *)
let decode value =
  Bigstring.get value 0
  |> B.of_prefix
  >>| fun base -> decode (B.sub_prefix ~base value) base
;;

(** [decode_info value] Decodes multibase prefixed value. Returns
    base-encoding type used to decode. *)
let decode_info value =
  Bigstring.get value 0
  |> B.of_prefix
  >>| fun base ->
  let rest = B.sub_prefix ~base value in
  base, rest |> decoder base
;;
