(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core_kernel

let encode_decode () =
  let input = "QmamnuntjR1Jmh8DZy3uMceJjpdqpE1Mx7W2KUisZr2A66" in
  let encoded =
    input
    |> Bigstring.of_string
    |> B58.decode B58.btc_alphabet
    |> B58.encode B58.btc_alphabet
    |> Bigstring.to_string
  in
  Alcotest.(check string) "encoded test" input encoded
;;

(* Run it *)
let () =
  let open Alcotest in
  run "B58" [ "encode", [ test_case "e2e" `Quick encode_decode ] ]
;;
