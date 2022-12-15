(*
  The MIT License (MIT)

  Copyright © 2016 Maxime Ransan <maxime.ransan@gmail.com>
  Copyright © 2020 Łukasz Kurowski. All rights reserved.

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*)

module Bigstring = Core.Bigstring

let zero = Char.unsafe_chr 0

let convert inp from_base to_base =
  let inp_len = Bigstring.length inp in
  let inp_beg =
    let rec aux = function
      | i when i = inp_len || Bigstring.get inp i <> zero -> i
      | i -> aux (i + 1)
    in
    aux 0
  in
  let buf_len =
    let inp_len = float_of_int inp_len in
    let from_base = float_of_int from_base in
    let to_base = float_of_int to_base in
    int_of_float @@ (1. +. (inp_len *. log from_base /. log to_base))
  in
  let buf = Bigstring.create buf_len in
  Bigstring.memset ~pos:0 ~len:buf_len buf zero;
  let buf_last_index = buf_len - 1 in
  let carry = ref 0 in
  let buf_end = ref buf_last_index in
  for inp_i = inp_beg to inp_len - 1 do
    carry := Char.code (Bigstring.get inp inp_i);
    let rec iter = function
      | buf_i when buf_i > !buf_end || !carry <> 0 ->
        carry := !carry + (from_base * (Bigstring.get buf buf_i |> Char.code));
        Bigstring.set buf buf_i (Char.unsafe_chr (!carry mod to_base));
        carry := !carry / to_base;
        iter (buf_i - 1)
      | buf_end -> buf_end
    in
    buf_end := iter buf_last_index
  done
  (* [inp] iteration *);
  let buf_written_len = buf_len - !buf_end - 1 in
  let out_len = inp_beg + buf_written_len in
  let out = Bigstring.create out_len in
  Bigstring.memset ~pos:0 ~len:out_len out zero;
  Bigstring.blit
    ~src:buf
    ~src_pos:(!buf_end + 1)
    ~dst:out
    ~dst_pos:inp_beg
    ~len:buf_written_len;
  out
;;

let bigstring_map ~f input =
  let len = Bigstring.length input in
  for i = 0 to len - 1 do
    Bigstring.set input i (Bigstring.get input i |> f)
  done;
  input
;;

let encode alphabet bin =
  let b58 = convert bin 256 58 in
  bigstring_map ~f:(fun c -> Alphabet.chr (Char.code c) alphabet) b58
;;

let decode alphabet bin =
  let bin =
    bigstring_map
      ~f:(fun c -> Char.unsafe_chr (Alphabet.value c alphabet))
      bin
  in
  convert bin 58 256
;;
