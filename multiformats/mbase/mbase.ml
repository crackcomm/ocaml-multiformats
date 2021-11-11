(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core_kernel
open Core_kernel.Result

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
    | 'z' -> Some Base58btc
    | 'Q' -> Some Base58btc
    | _ -> None
  ;;

  (** Returns multibase prefix by encoding. *)
  let prefix_of = function
    | Base32 -> 'b'
    | Base58btc -> 'z'
  ;;

  let append_prefix ?(v0 = false) ~base value =
    match base, v0 with
    | Base58btc, true -> value
    | _ ->
      let len = Bigstring.length value in
      let output = Bigbuffer.create (len + 1) in
      Bigbuffer.add_char output (prefix_of base);
      Bigbuffer.add_bigstring output value;
      Bigbuffer.big_contents output
  ;;

  let sub_prefix ?code ~base value =
    match code, base with
    | Some 'Q', Base58btc -> value
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

(** [encode ~base value] Encodes bytes with multibase prefix. If [v0] is true
    and [base] is [Base58btc] it doesn't append any prefix. *)
let encode ?(v0 = false) ~base value =
  value |> encoder base |> B.append_prefix ~v0 ~base
;;

let decode value base = value |> decoder base

(** [decode value] Decodes multibase prefixed value. *)
let decode value =
  match Bigstring.length value with
  | 0 -> Error `Empty_string
  | _ ->
    let code = Bigstring.get value 0 in
    B.of_prefix code
    |> Result.of_option ~error:(`Multibase_not_found code)
    >>| fun base -> decode (B.sub_prefix ~code ~base value) base
;;

(** [decode_info value] Decodes multibase prefixed value. Returns
    base-encoding type used to decode. *)
let decode_info value =
  let code = Bigstring.get value 0 in
  match B.of_prefix code with
  | Some base ->
    let rest = B.sub_prefix ~code ~base value in
    Ok (base, rest |> decoder base)
  | None -> Error (`Multibase_not_found code)
;;
