(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Alcotest
open Core_kernel
open Core_kernel.Result

let unwrap = function
  | Ok x -> x
  | Error _ -> failwith "?"
;;

let encode_decode input = Cid.of_string input >>| Cid.to_string |> unwrap

let test_b58_e2e () =
  let input = "QmamnuntjR1Jmh8DZy3uMceJjpdqpE1Mx7W2KUisZr2A66" in
  Alcotest.(check bool) "Recognizes V0" (Cid.is_v0_string input) true;
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

let () =
  run
    "mbase"
    [ "b58", [ test_case "e2e" `Quick test_b58_e2e ]
    ; "b32", [ test_case "e2e" `Quick test_b32_e2e ]
    ]
;;
