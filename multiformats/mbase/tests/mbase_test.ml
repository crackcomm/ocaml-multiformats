(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Alcotest
open Core_kernel
open Core_kernel.Result

let encode_decode ~base input =
  input
  |> Bigstring.of_string
  |> Mbase.decode
  >>| Mbase.encode ~base
  >>| Bigstring.to_string
;;

let test_empty_string () =
  let input = "" in
  let output = input |> Bigstring.of_string |> Mbase.decode in
  match Result.error output with
  | Some `Empty_string -> ()
  | _ -> Alcotest.fail "expected `Empty_string error"
;;

let test_b32_e2e () =
  let input = "bafkreicle63y5t77gzneneyd7bf42sv3tm52gmpwuvgjd55jrcgkeordq4" in
  let output =
    encode_decode ~base:Mbase.B.Base32 input |> ok |> Caml.Option.get
  in
  Alcotest.(check string) "Outputs same value" input output
;;

let test_b58_v1 () =
  let input = "zHeadAt96Dkyhp32wJYjzv4NHm6jqSBKzVEPBK2pBVmQnvNgYuRx" in
  let output =
    encode_decode ~base:Mbase.B.Base58btc input |> ok |> Caml.Option.get
  in
  Alcotest.(check string) "Outputs same value" input output
;;

let test_b58_v0 () =
  let input = "QmamnuntjR1Jmh8DZy3uMceJjpdqpE1Mx7W2KUisZr2A66" in
  let decoded =
    Bigstring.of_string input |> Mbase.decode |> ok |> Caml.Option.get
  in
  let encoded =
    Mbase.encoder Mbase.B.Base58btc decoded |> Bigstring.to_string
  in
  Alcotest.(check string) "Outputs same value" input encoded
;;

let () =
  run
    "mbase"
    [ "b32", [ test_case "e2e" `Quick test_b32_e2e ]
    ; ( "b58"
      , [ test_case "v0" `Quick test_b58_v0
        ; test_case "v1" `Quick test_b58_v1
        ] )
    ; "others", [ test_case "empty" `Quick test_empty_string ]
    ]
;;
