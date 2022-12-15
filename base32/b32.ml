(**************************************************************************)
(*                                                                        *)
(*                        TypeRex OCaml Studio                            *)
(*                                                                        *)
(*                 Thomas Gazagnaire, Fabrice Le Fessant                  *)
(*                                                                        *)
(*  Copyright © 2011-2020 OCamlPro                                        *)
(*  Copyright © 2020-2021 Łukasz Kurowski                                 *)
(*                                                                        *)
(*  All rights reserved.  This file is distributed under the terms of     *)
(*  the GNU Public License version 3.0.                                   *)
(*                                                                        *)
(*  TypeRex is distributed in the hope that it will be useful,            *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*  GNU General Public License for more details.                          *)
(*                                                                        *)
(**************************************************************************)

module Bigstring = Core.Bigstring

let int5_of_char n =
  match n with
  | 'A' .. 'Z' -> int_of_char n - 65
  | 'a' .. 'z' -> int_of_char n - 97
  | '0' .. '9' -> int_of_char n + 26 - 50
  | _ -> failwith "Base32.int_of_char bad char"
;;

let decode r =
  let len = Bigstring.length r in
  let hash_length = (((len * 5) - 4) / 8) + 1 in
  let s = Bigstring.create hash_length in
  Bigstring.memset ~pos:0 ~len:hash_length s '\000';
  for i = 0 to len - 1 do
    let pos = i * 5 in
    let byte = pos / 8 in
    let bit = pos mod 8 in
    let c = int5_of_char (Bigstring.get r i) in
    if bit < 3
    then (
      let x = c lsl (3 - bit) in
      let b = Bigstring.get s byte in
      Bigstring.set s byte (char_of_int (int_of_char b lor x)))
    else (
      let x = (c lsr (bit - 3)) land 0xff in
      let b = Bigstring.get s byte in
      Bigstring.set s byte (char_of_int (int_of_char b lor x));
      if byte + 1 < hash_length
      then (
        let y = (c lsl (11 - bit)) land 0xff in
        let b = Bigstring.get s (byte + 1) in
        Bigstring.set s (byte + 1) (char_of_int (int_of_char b lor y))))
  done;
  s
;;

let get_int r i = Bigstring.get r i |> int_of_char

let char_of_int5 upper =
  let off = if upper then 65 else 97 in
  fun n -> char_of_int (if n < 26 then off + n else 50 + (n - 26))
;;

let encode_case ~upper s =
  let hash_length = Bigstring.length s in
  let len = ((hash_length * 8) + 4) / 5 in
  let r = Bigstring.create len in
  for i = 0 to len - 1 do
    let pos = i * 5 in
    let byte = pos / 8 in
    let bit = pos mod 8 in
    if bit < 3
    then (
      let x = get_int s byte in
      let c = (x lsr (3 - bit)) land 0x1f in
      Bigstring.set r i (char_of_int5 upper c))
    else (
      let x = get_int s byte in
      let y = if byte + 1 = hash_length then 0 else get_int s (byte + 1) in
      let x = (x lsl 8) + y in
      let c = (x lsr (11 - bit)) land 0x1f in
      Bigstring.set r i (char_of_int5 upper c))
  done;
  r
;;

let encode = encode_case ~upper:false
let encode_lower = encode_case ~upper:false
let encode_upper = encode_case ~upper:true
