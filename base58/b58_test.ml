(* Copyright © 2020-2022 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core

let%test "encode_decode" =
  let input = "QmamnuntjR1Jmh8DZy3uMceJjpdqpE1Mx7W2KUisZr2A66" in
  let encoded =
    input
    |> Bigstring.of_string
    |> B58.decode B58.btc_alphabet
    |> B58.encode B58.btc_alphabet
    |> Bigstring.to_string
  in
  String.equal input encoded
;;
