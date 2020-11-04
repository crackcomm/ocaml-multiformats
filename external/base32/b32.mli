(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core_kernel

(** [encode alphabet data] encodes [data] using alphabet defined in RFC 4648. *)
val encode : Bigstring.t -> Bigstring.t

(** [encode_case upper alphabet data] encodes [data] using alphabet defined in
    RFC 4648. If [upper] is true the output is in uppercase alphabet. *)
val encode_case : upper:bool -> Bigstring.t -> Bigstring.t

(** [encode_lower alphabet data] encodes [data] using lowercase alphabet
    defined in RFC 4648. *)
val encode_lower : Bigstring.t -> Bigstring.t

(** [encode_upper alphabet data] encodes [data] using uppercase alphabet
    defined in RFC 4648. *)
val encode_upper : Bigstring.t -> Bigstring.t

(** [decodedata] decodes [data] using alphabet defined in RFC 4648. *)
val decode : Bigstring.t -> Bigstring.t
