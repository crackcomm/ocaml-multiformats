(* Copyright © 2020-2022 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core

(** Implemented multibase encodings. *)
type t =
  [ `Base32
  | `Base58btc
  | `Base58btc_cid_v0
  ]
[@@deriving bin_io, sexp, compare, equal]

(** Returns encoding by multibase prefix. *)
let of_prefix = function
  | 'b' -> Some `Base32
  | 'z' -> Some `Base58btc
  | 'Q' -> Some `Base58btc_cid_v0
  | _ -> None
;;

(** Returns multibase prefix by encoding. *)
let prefix_of = function
  | `Base32 -> 'b'
  | `Base58btc -> 'z'
  | `Base58btc_cid_v0 -> 'z'
;;

let append_prefix ~base value =
  match base with
  | `Base58btc_cid_v0 -> value
  | _ ->
    let len = Bigstring.length value in
    let output = Bigbuffer.create (len + 1) in
    Bigbuffer.add_char output (prefix_of base);
    Bigbuffer.add_bigstring output value;
    Bigbuffer.big_contents output
;;

let sub_prefix ?code ~base value =
  match code, base with
  | Some 'Q', `Base58btc_cid_v0 -> value
  | _ -> Bigstring.sub_shared ~pos:1 value
;;

let%test "sub_prefix" =
  Exn.does_raise (fun () ->
      sub_prefix ~base:`Base32 (Bigstring.init 0 ~f:(fun _ -> 'x')))
;;

let decoder = function
  | `Base32 -> B32.decode
  | `Base58btc -> B58.decode B58.btc_alphabet
  | `Base58btc_cid_v0 -> B58.decode B58.btc_alphabet
;;

let encoder = function
  | `Base32 -> B32.encode_lower
  | `Base58btc -> B58.encode B58.btc_alphabet
  | `Base58btc_cid_v0 -> B58.encode B58.btc_alphabet
;;

(** [encode ~base value] Encodes bytes with multibase prefix. *)
let encode ~base value = value |> encoder base |> append_prefix ~base

let decode value base = value |> decoder base

type error =
  [ `Empty_string
  | `Multibase_not_found of Base.char
  ]
[@@deriving sexp]

(** [decode value] Decodes multibase prefixed value. *)
let decode value =
  match Bigstring.length value with
  | 0 -> Error `Empty_string
  | _ ->
    let code = Bigstring.get value 0 in
    (match of_prefix code with
    | Some base -> Ok (decode (sub_prefix ~code ~base value) base)
    | None -> Error (`Multibase_not_found code))
;;

let decode_exn ?(here = [%here]) value =
  match decode value with
  | Ok v -> v
  | Error e -> failwiths ~here "Mbase.decode_exn" e sexp_of_error
;;

(** [decode_info value] Decodes multibase prefixed value. Returns
    base-encoding type used to decode. *)
let decode_info value =
  let code = Bigstring.get value 0 in
  match of_prefix code with
  | Some base ->
    let rest = sub_prefix ~code ~base value in
    Ok (base, rest |> decoder base)
  | None -> Error (`Multibase_not_found code)
;;
