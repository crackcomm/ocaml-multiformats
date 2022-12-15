(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Alcotest
open Core_kernel
open Core_kernel.Result

let unwrap = function
  | Ok x -> x
  | Error (`Codec_not_hash codec) ->
    failwithf
      "Codec_not_hash %s"
      (Mcodec.sexp_of_t codec |> Sexp.to_string)
      ()
  | Error (`Multibase_not_found b) ->
    failwithf "Multibase_not_found: %d" (Char.to_int b) ()
  | Error `VarintEOF -> failwith "VarintEOF"
  | Error `Empty_string -> failwith "Empty_string"
;;

let encode_decode ?base input =
  Cid.of_string input |> unwrap |> Cid.to_string ?base
;;

let test_empty_string () =
  let input = "" in
  let output = input |> Cid.of_string in
  match Result.error output with
  | Some `Empty_string -> ()
  | _ -> Alcotest.fail "expected `Empty_string error"
;;

let test_b58_e2e () =
  let input = "QmamnuntjR1Jmh8DZy3uMceJjpdqpE1Mx7W2KUisZr2A66" in
  Alcotest.(check bool) "is_v0_string" (Cid.is_v0_string input) true;
  let output = encode_decode input in
  Alcotest.(check string) "Outputs same value" input output;
  let cid = Cid.of_string input |> unwrap in
  Alcotest.(check bool) "Recognizes V0" (Cid.is_v0 cid) true;
  match Cid.(cid.mhash.kind) with
  | Mhash.Kind.SHA2'256 -> ()
  | _ -> Alcotest.fail "Wrong hash"
;;

let test_b32_e2e () =
  let input = "bafkreicle63y5t77gzneneyd7bf42sv3tm52gmpwuvgjd55jrcgkeordq4" in
  let output = encode_decode input in
  Alcotest.(check string) "Outputs same value" input output;
  let cid = Cid.of_string input |> unwrap in
  Alcotest.(check bool) "Recognizes V1" (Cid.is_v1 cid) true;
  match Cid.(cid.mhash.kind) with
  | Mhash.Kind.SHA2'256 -> ()
  | _ -> Alcotest.fail "Wrong hash"
;;

let test_head_cid () =
  let input = "zHeadAt96Dkyhp32wJYjzv4NHm6jqSBKzVEPBK2pBVmQnvNgYuRx" in
  let output = encode_decode ~base:Mbase.B.Base58btc input in
  Alcotest.(check string) "Outputs same value" input output;
  let cid = Cid.of_string input |> unwrap in
  Alcotest.(check bool) "Recognizes V1" (Cid.is_v1 cid) true;
  match Cid.(cid.mhash.kind) with
  | Mhash.Kind.Keccak'256 -> ()
  | _ ->
    Alcotest.failf
      "Wrong hash %s"
      (Mhash.Kind.sexp_of_t cid.mhash.kind |> Sexp.to_string)
;;

let () =
  run
    "mbase"
    [ ( "b58"
      , [ test_case "e2e" `Quick test_b58_e2e
        ; test_case "zhead" `Quick test_head_cid
        ] )
    ; "b32", [ test_case "e2e" `Quick test_b32_e2e ]
    ; "others", [ test_case "empty" `Quick test_empty_string ]
    ]
;;
