(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

open Core
open Lwt.Infix

let table_url =
  "https://raw.githubusercontent.com/multiformats/multicodec/master/table.csv"
;;

let tags =
  [ "multiaddr"
  ; "multibase"
  ; "multicodec"
  ; "multihash"
  ; "multiformat"
  ; "key"
  ; "serialization"
  ; "ipld"
  ; "namespace"
  ]
;;

let ignore = [ (* Conflicts with P2P. *) "ipfs" ]

let filter_entries entry =
  let tag = List.nth_exn entry 1 in
  let name = List.nth_exn entry 0 in
  List.mem ~equal:String.equal tags tag
  && not (List.mem ~equal:String.equal ignore name)
;;

let is_first_digit el = String.length el > 0 && el.[0] |> Char.is_digit

let is_last_digit el =
  let len = String.length el in
  len > 0 && el.[len - 1] |> Char.is_digit
;;

let to_symbol v =
  let notcap = [ "path"; "tx"; "pub"; "ns"; "key"; "pb"; "git"; "raw" ] in
  let local = function
    | "cidv1" -> "CID'1"
    | "cidv2" -> "CID'2"
    | "cidv3" -> "CID'3"
    | "ip6zone" -> "IP6Zone"
    | "http" -> "HTTP"
    | "https" -> "HTTPs"
    | "dnsaddr" -> "DNSAddr"
    | "kangarootwelve" -> "KangarooTwelve"
    | v -> v
  in
  let scap i el =
    let len = String.length el in
    if ((i = 0 && len < 5) || len < 4)
       && not (List.mem ~equal:String.equal notcap el)
    then String.uppercase el
    else String.capitalize el
  in
  let concat i accum el =
    let el = local el in
    if String.equal accum "DAG"
       || String.equal el "pub"
       || String.equal el "priv"
       || is_first_digit el
    then accum ^ "\'" ^ String.capitalize el
    else accum ^ scap i el
  in
  String.substr_replace_all ~pattern:"_" ~with_:"-" v
  |> String.split ~on:'-'
  |> List.foldi ~init:"" ~f:concat
;;

let map_entry entry =
  let column i =
    match i with
    | 0 -> "name"
    | 1 -> "tag"
    | 2 -> "code"
    | 3 -> "desc"
    | _ -> failwith "Column out of bounds"
  in
  let value i value =
    match i with
    (* Parse hex to int. *)
    | 0 | 1 -> value |> to_symbol
    | 2 -> value |> int_of_string |> string_of_int
    | _ -> value
  in
  let convert i v = [ column i, `String (value i v) ] in
  List.mapi ~f:convert entry |> List.concat
;;

let tmpl =
  Mustache.of_string
    (In_channel.read_all
       "works/multiformats/mcodec/gentable/table.ml.mustache")
;;

let main () =
  Hc.S.get table_url
  >|= Csv.of_string ~has_header:true
  >|= Csv.input_all
  >|= fun data ->
  List.filter ~f:filter_entries data
  |> List.map ~f:map_entry
  |> List.map ~f:(fun data -> `O data)
  |> fun data ->
  let tags =
    List.map tags ~f:(fun tag ->
        `O [ "symbol", `String (to_symbol tag); "tag", `String tag ])
  in
  let data =
    Mustache.render tmpl (`O [ "data", `A data; "tags", `A tags ])
    |> String.substr_replace_all ~pattern:"&apos;" ~with_:"\'"
  in
  Out_channel.write_all ~data "works/multiformats/mcodec/table.ml"
;;

let () = Lwt_main.run (main ())
