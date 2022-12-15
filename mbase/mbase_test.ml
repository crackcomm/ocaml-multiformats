(* Copyright © 2020-2022 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core

let test_encode_decode ~base input =
  let input_bigstring = Bigstring.of_string input in
  let encoded =
    Mbase.decode_exn input_bigstring
    |> Mbase.encode ~base
    |> Bigstring.to_string
  in
  [%test_result: String.t] ~expect:input encoded
;;

let%expect_test "empty string fails" =
  let output = Bigstring.of_string "" |> Mbase.decode in
  print_s [%sexp (output : (Bigstring.t, Mbase.error) Result.t)];
  [%expect {| (Error Empty_string) |}]
;;

let%test_unit "base32 <-> base32" =
  test_encode_decode
    ~base:`Base32
    "bafkreicle63y5t77gzneneyd7bf42sv3tm52gmpwuvgjd55jrcgkeordq4"
;;

let%test_unit "base58 <-> base58" =
  test_encode_decode
    ~base:`Base58btc
    "zHeadAt96Dkyhp32wJYjzv4NHm6jqSBKzVEPBK2pBVmQnvNgYuRx"
;;

let%test_unit "base58 v0" =
  test_encode_decode
    ~base:`Base58btc_cid_v0
    "QmamnuntjR1Jmh8DZy3uMceJjpdqpE1Mx7W2KUisZr2A66"
;;

let%test_unit "other string" =
  test_encode_decode ~base:`Base32 "bpfsxgidnmfxgsibb"
;;
