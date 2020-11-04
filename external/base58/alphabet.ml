(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   Copyright © 2016 Maxime Ransan <maxime.ransan@gmail.com>
   SPDX-License-Identifier: MIT *)

open Core_kernel

exception Invalid
exception Invalid_base58_character

type t = string * int array

let make s =
  if String.length s <> 58
  then raise Invalid
  else (
    let a = Array.create ~len:256 (-1) in
    Caml.String.iteri (fun i c -> Array.unsafe_set a (Char.to_int c) i) s;
    s, a)
;;

let value c (_, alphabet_values) =
  match Array.unsafe_get alphabet_values (Char.to_int c) with
  | -1 -> raise Invalid_base58_character
  | i -> i
;;

let chr i (s, _) = String.unsafe_get s i
