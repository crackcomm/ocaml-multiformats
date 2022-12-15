(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Alcotest

let dns_addr =
  "/dns4/garden.bootnode.kulupu.network/tcp/30333/p2p/12D3KooWMviaZ5JH2b8gkzcWmD5RWt7jAm9eFSSGYbVTe6qrJqv1"
;;

let ipv4_addr_str =
  "/ip4/47.92.231.194/tcp/30333/p2p/12D3KooWMbVAhnxJikkgitMKmyCzoKxgLeMLdGD28tuLTzNtqsNL"
;;

let ipv4_addr =
  Maddr.Proto.
    [ Ip4 "47.92.231.194"
    ; Tcp 30333
    ; P2p "12D3KooWMbVAhnxJikkgitMKmyCzoKxgLeMLdGD28tuLTzNtqsNL"
    ]
;;

let test_parse () =
  let addr = Maddr.parse_exn ipv4_addr_str in
  Alcotest.(check bool) "parsed" true Stdlib.(addr = ipv4_addr);
  let addr = Maddr.parse "/ip4/test/tcp/ads" in
  Alcotest.(check bool) "not parsed" true (Result.is_error addr);
  let addr = Maddr.parse "/ip4/test/wlp/123" in
  Alcotest.(check bool) "not parsed" true (Result.is_error addr)
;;

(* TODO: dns_addr *)
(* let addr = Maddr.parse dns_addr in *)
(* Alcotest.(check bool) "parsed" false (Result.is_error addr) *)

let () = run "Maddr" [ "ascii", [ test_case "parse" `Quick test_parse ] ]
