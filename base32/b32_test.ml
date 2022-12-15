(* Copyright © 2020-2022 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core

let test_encode_decode input expected_output =
  let input_bigstring = Bigstring.of_string input in
  let encoded = B32.encode input_bigstring in
  let expected_encoded = Bigstring.of_string expected_output in
  [%test_result: Bigstring.t] ~expect:expected_encoded encoded;
  let decoded = B32.decode encoded in
  [%test_result: Bigstring.t] ~expect:input_bigstring decoded
;;

let%test_unit "test" = test_encode_decode "test" "orsxg5a"

let%test_unit "other string" =
  test_encode_decode "yes mani !" "pfsxgidnmfxgsibb"
;;

let%test_unit "long string" =
  test_encode_decode
    "this is a long string that is longer than 8 bits"
    "orugs4zanfzsayjanrxw4zzaon2he2lom4qhi2dboqqgs4zanrxw4z3foiqhi2dbnyqdqidcnf2hg"
;;
