(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core_kernel

let encode_short () =
  let encoded =
    "test" |> Bigstring.of_string |> B32.encode |> Bigstring.to_string
  in
  Alcotest.(check string) "encoded test" "ORSXG5A" encoded
;;

let decode_short () =
  let encoded =
    "ORSXG5A" |> Bigstring.of_string |> B32.decode |> Bigstring.to_string
  in
  Alcotest.(check string) "encoded test" "test" encoded
;;

(* Run it *)
let () =
  let open Alcotest in
  run
    "B32"
    [ "encode", [ test_case "short" `Quick encode_short ]
    ; "decode", [ test_case "short" `Quick decode_short ]
    ]
;;
