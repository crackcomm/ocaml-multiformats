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
val of_prefix : char -> t option

(** Returns multibase prefix by encoding. *)
val prefix_of : t -> char

(** [append_prefix ~base value] Appends multibase prefix to the value.
    Requires: [base] is the multibase encoding used for the value. Returns:
    value with multibase prefix added. *)
val append_prefix : base:t -> Bigstring.t -> Bigstring.t

(** [sub_prefix ?code ~base value] Removes multibase prefix from the value.
    Requires: [base] is the multibase encoding used for the value. Optional:
    [code] is the multibase prefix of the value. Returns: value with multibase
    prefix removed.

    Raises an exception if [value] is of zero length. *)
val sub_prefix : ?code:char -> base:t -> Bigstring.t -> Bigstring.t

(** [decoder base] Returns function to decode value using given multibase
    encoding. Requires: [base] is the multibase encoding to use. Returns:
    function which decodes value. *)
val decoder : t -> Bigstring.t -> Bigstring.t

(** [encoder base] Returns function to encode value using given multibase
    encoding. Requires: [base] is the multibase encoding to use. Returns:
    function which encodes value. *)
val encoder : t -> Bigstring.t -> Bigstring.t

(** [encode ~base value] Encodes bytes with multibase prefix. Requires: [base]
    is the multibase encoding to use.

    @return encoded value with multibase prefix added. *)
val encode : base:t -> Bigstring.t -> Bigstring.t

type error =
  [ `Empty_string
  | `Multibase_not_found of char
  ]
[@@deriving sexp]

(** [decode value] Decodes multibase prefixed value.

    @return
      decoded value or error if the value is empty or if the multibase prefix
      is not found. *)
val decode : Bigstring.t -> (Bigstring.t, [> error ]) result

(** [decode_exn value] Decodes multibase prefixed value.

    Raises an exception if the value is empty or if the multibase prefix is
    not found. *)
val decode_exn : ?here:Lexing.position -> Bigstring.t -> Bigstring.t

(** [decode_info value] Decodes multibase prefixed value. Returns
    base-encoding type used to decode.

    @return
      decoded value and used multibase encoding or error if the multibase
      prefix is not found. *)
val decode_info : Bigstring.t -> (t * Bigstring.t, [> error ]) result
