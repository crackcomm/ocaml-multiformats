(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Alcotest
open Core_kernel
open Core_kernel.Result

let encode_decode ?(v0 = false) ~base input =
  input
  |> Bigstring.of_string
  |> Mbase.decode
  >>| Mbase.encode ~v0 ~base
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

let test_b58 ~v0 input () =
  let output =
    encode_decode ~v0 ~base:Mbase.B.Base58btc input |> ok |> Caml.Option.get
  in
  Alcotest.(check string) "Outputs same value" input output
;;

let test_b58_e2e =
  test_b58 ~v0:true "QmamnuntjR1Jmh8DZy3uMceJjpdqpE1Mx7W2KUisZr2A66"
;;

let test_b58_v1 =
  test_b58 ~v0:false "zHeadAt96Dkyhp32wJYjzv4NHm6jqSBKzVEPBK2pBVmQnvNgYuRx"
;;

let () =
  run
    "mbase"
    [ "b32", [ test_case "e2e" `Quick test_b32_e2e ]
    ; ( "b58"
      , [ test_case "e2e" `Quick test_b58_e2e
        ; test_case "v1" `Quick test_b58_v1
        ] )
    ; "others", [ test_case "empty" `Quick test_empty_string ]
    ]
;;
