(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Alcotest
open Core_kernel
open Core_kernel.Option

let encode_decode ~base input =
  input
  |> Bigstring.of_string
  |> Mbase.decode
  >>| Mbase.encode ~base
  >>| Bigstring.to_string
;;

let test_b32_e2e () =
  let input = "bafkreicle63y5t77gzneneyd7bf42sv3tm52gmpwuvgjd55jrcgkeordq4" in
  let output = encode_decode ~base:Mbase.B.Base32 input |> Caml.Option.get in
  Alcotest.(check string) "Outputs same value" input output
;;

let test_b58_e2e () =
  let input = "QmamnuntjR1Jmh8DZy3uMceJjpdqpE1Mx7W2KUisZr2A66" in
  let output =
    encode_decode ~base:Mbase.B.Base58btc input |> Caml.Option.get
  in
  Alcotest.(check string) "Outputs same value" input output
;;

let () =
  run
    "mbase"
    [ "b32", [ test_case "e2e" `Quick test_b32_e2e ]
    ; "b58", [ test_case "e2e" `Quick test_b58_e2e ]
    ]
;;
