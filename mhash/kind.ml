(* Copyright © 2020-2022 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

(** Subset of multicodec hashes. *)
type t = [
  | `MD5
  | `SHA1
  | `SHA2'256
  | `SHA2'512
  | `SHA3'224
  | `SHA3'256
  | `SHA3'384
  | `SHA3'512
  | `Blake2b'512
  | `Blake2s'256
  | `Ripemd'160 (** RMD160 *)
  | `Keccak'256 ]
[@@deriving bin_io, sexp, compare, equal]

(** [of_codec kind] Returns hash kind of multicodec. *)
let of_codec : Mcodec.t -> t option = function
  | `MD5 -> Some `MD5
  | `SHA1 -> Some `SHA1
  | `SHA2'256 -> Some `SHA2'256
  | `SHA2'512 -> Some `SHA2'512
  | `SHA3'224 -> Some `SHA3'224
  | `SHA3'256 -> Some `SHA3'256
  | `SHA3'384 -> Some `SHA3'384
  | `SHA3'512 -> Some `SHA3'512
  | `Blake2b'512 -> Some `Blake2b'512
  | `Blake2s'256 -> Some `Blake2s'256
  | `Ripemd'160 -> Some `Ripemd'160
  | `Keccak'256 -> Some `Keccak'256
  | _ -> None
;;

(** [to_codec kind] Returns multicodec of hash kind. *)
let to_codec : t -> Mcodec.t = function
  | `MD5 -> `MD5
  | `SHA1 -> `SHA1
  | `SHA2'256 -> `SHA2'256
  | `SHA2'512 -> `SHA2'512
  | `SHA3'224 -> `SHA3'224
  | `SHA3'256 -> `SHA3'256
  | `SHA3'384 -> `SHA3'384
  | `SHA3'512 -> `SHA3'512
  | `Blake2b'512 -> `Blake2b'512
  | `Blake2s'256 -> `Blake2s'256
  | `Ripemd'160 -> `Ripemd'160
  | `Keccak'256 -> `Keccak'256
;;
