(* Copyright © 2020-2022 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core
open Result

let unwrap = function
  | Ok x -> x
  | Error e -> failwiths ~here:[%here] "unwrap" e Cid.sexp_of_error
;;

let encode_decode ?base input =
  Cid.of_string input |> unwrap |> Cid.to_string ?base
;;

let%expect_test "empty string" =
  print_s [%sexp (Cid.of_string "" : (Cid.t, Cid.error) Result.t)];
  [%expect {| (Error Empty_string) |}]
;;

let%expect_test "base58" =
  let inputs =
    [ "QmamnuntjR1Jmh8DZy3uMceJjpdqpE1Mx7W2KUisZr2A66"
    ; "QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG"
    ]
  in
  List.iter inputs ~f:(fun input ->
      assert (Cid.is_v0_string input);
      [%test_result: String.t] ~expect:input (encode_decode input);
      let cid = Cid.of_string input |> unwrap in
      assert (Cid.is_v0 cid);
      print_s [%sexp (cid.mhash.kind : Mhash.Kind.t)];
      [%expect {| SHA2'256 |}])
;;

let%expect_test "base32" =
  let input = "bafkreicle63y5t77gzneneyd7bf42sv3tm52gmpwuvgjd55jrcgkeordq4" in
  [%test_result: String.t] ~expect:input (encode_decode input);
  let cid = Cid.of_string input |> unwrap in
  assert (Cid.is_v1 cid);
  print_s [%sexp (cid.mhash.kind : Mhash.Kind.t)];
  [%expect {| SHA2'256 |}]
;;

let%expect_test "head cid" =
  let input = "zHeadAt96Dkyhp32wJYjzv4NHm6jqSBKzVEPBK2pBVmQnvNgYuRx" in
  [%test_result: String.t]
    ~expect:input
    (encode_decode ~base:`Base58btc input);
  let cid = Cid.of_string input |> unwrap in
  assert (Cid.is_v1 cid);
  print_s [%sexp (cid.mhash.kind : Mhash.Kind.t)];
  [%expect {| Keccak'256 |}]
;;

let%expect_test "identity functions" =
  let input = "zHeadAt96Dkyhp32wJYjzv4NHm6jqSBKzVEPBK2pBVmQnvNgYuRx" in
  let cid = Cid.of_string_exn input in
  [%test_result: String.t]
    ~expect:input
    (Cid.to_raw_bigstring cid
    |> Cid.of_raw_bigstring_exn
    |> Cid.to_string ~base:`Base58btc)
;;
