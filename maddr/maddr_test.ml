(* Copyright © 2020-2022 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core

let dns_addr =
  "/dns4/garden.bootnode.kulupu.network/tcp/30333/p2p/12D3KooWMviaZ5JH2b8gkzcWmD5RWt7jAm9eFSSGYbVTe6qrJqv1"
;;

let ipv4_addr_str =
  "/ip4/47.92.231.194/tcp/30333/p2p/12D3KooWMbVAhnxJikkgitMKmyCzoKxgLeMLdGD28tuLTzNtqsNL"
;;

let ipv4_addr =
  [ `Ip4 "47.92.231.194"
  ; `Tcp 30333
  ; `P2p "12D3KooWMbVAhnxJikkgitMKmyCzoKxgLeMLdGD28tuLTzNtqsNL"
  ]
;;

let%expect_test "maddr parse" =
  let addr = Maddr.parse_exn ipv4_addr_str in
  print_s [%sexp (addr : Maddr.t)];
  [%expect
    {|
    ((Ip4 47.92.231.194) (Tcp 30333)
     (P2p 12D3KooWMbVAhnxJikkgitMKmyCzoKxgLeMLdGD28tuLTzNtqsNL)) |}];
  let addr = Maddr.parse "/ip4/test/wlp/123" in
  print_s [%sexp (addr : (Maddr.t, string) Result.t)];
  [%expect {| (Error "unrecognized protocol wlp") |}];
  let addr = Maddr.parse "/ip4/test/tcp/ads" in
  print_s [%sexp (addr : (Maddr.t, string) Result.t)];
  [%expect {| (Error "(Failure\"Int.of_string: \\\"ads\\\"\")") |}]
;;
