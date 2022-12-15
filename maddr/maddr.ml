(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

(** Multiaddr implementation. *)

open Core
open Result

let parse_port_exn v =
  let v = Int.of_string v in
  if v > 65536 then failwith "port is out of range" else v
;;

let parse_port v =
  try Ok (parse_port_exn v) with
  | _ -> Error ("cannot parse " ^ v ^ " as port")
;;

(** Protocol *)
module Proto = struct
  type t =
    [ `Http
    | `Tcp of int
    | `Ip4 of string
    | `Ip6 of string
    | `P2p of string
    ]
  [@@deriving bin_io, sexp, compare, equal]
end

(** Text multiaddr protocol parser. *)
module Parser = struct
  (*
  let at_index addr ~index =
    let proto =
      match String.lsplit2 addr ~on:'/' with
      | Some (_, proto) -> proto
      | None -> addr
    in
    let split = index + String.length proto + 1 in
    print_s [%sexp (index : int)];
    print_s [%sexp (addr : String.t)];
    split, proto
  ;;
  *)
  (** Returns element at given index. *)
  let at_index addr ~index =
    let split, proto =
      match String.index_from addr (index + 1) '/' with
      | Some split ->
        let proto =
          String.sub addr ~pos:(index + 1) ~len:(split - index - 1)
        in
        split, proto
      | None ->
        let split = String.length addr in
        let proto =
          String.sub addr ~pos:(index + 1) ~len:(split - index - 1)
        in
        split, proto
    in
    split, proto
  ;;

  type next = unit -> string
  type parser0 = next -> Proto.t

  let parse_proto_fn addr ~index =
    let index, proto = at_index addr ~index in
    let known_protocols : (string, parser0) List.Assoc.t =
      [ ("http", fun _ -> `Http)
      ; ("ip4", fun next -> `Ip4 (next ()))
      ; ("ip6", fun next -> `Ip6 (next ()))
      ; ("p2p", fun next -> `P2p (next ()))
      ; ("tcp", fun next -> `Tcp (parse_port_exn (next ())))
      ]
    in
    match List.Assoc.find ~equal:String.equal known_protocols proto with
    | Some f -> Ok (index, f)
    | None -> Error ("unrecognized protocol " ^ proto)
  ;;

  let parse_proto addr ~index =
    match parse_proto_fn addr ~index with
    | Ok (index, f) ->
      let next_index = ref index in
      let next () =
        let index, v = at_index addr ~index in
        next_index := index;
        v
      in
      Ok (!next_index, f next)
    | Error e -> Error e
  ;;
end

type t = Proto.t list [@@deriving bin_io, sexp, compare, equal]

let parse_ addr =
  let length = String.length addr in
  let rec parse acc index =
    Parser.parse_proto addr ~index
    >>= fun (index, proto) ->
    let acc = acc @ [ proto ] in
    if index = length then Ok acc else parse acc index
  in
  parse [] 0
;;

let parse addr =
  try parse_ addr with
  | e -> Error (Exn.to_string_mach e)
;;

let parse_exn addr : t =
  match parse_ addr with
  | Ok addr -> addr
  | Error err -> failwith err
;;
