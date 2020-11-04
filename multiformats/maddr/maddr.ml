(* Copyright © 2020 Łukasz Kurowski. All rights reserved.
   SPDX-License-Identifier: MIT *)

(** Multiaddr implementation. *)

open Base.Result

type port = int

let parse_port_exn v =
  let v : port = Base.Int.of_string v in
  if v > 65536 then failwith "port is out of range" else v
;;

let parse_port v =
  try Ok (parse_port_exn v) with
  | _ -> Error ("cannot parse " ^ v ^ " as port")
;;

module Addr = struct
  module Ipv4 = struct
    type t = string
  end

  module Ipv6 = struct
    type t = string
  end
end

module Multihash = struct
  type t = string
end

module Parser = struct
  (** Returns element at given index. *)
  let at_index addr ~index =
    let split, proto =
      match String.index_from_opt addr (index + 1) '/' with
      | Some split ->
        let proto = String.sub addr (index + 1) (split - index - 1) in
        split, proto
      | None ->
        let split = String.length addr in
        let proto = String.sub addr (index + 1) (split - index - 1) in
        split, proto
    in
    split, proto
  ;;
end

(** Protocol *)
module Proto = struct
  type t =
    | Http
    | Tcp of port
    | Ip4 of Addr.Ipv4.t
    | Ip6 of Addr.Ipv6.t
    | P2p of Multihash.t

  (** ASCII Multiaddr protocol parser. *)
  module Parser = struct
    let parse_proto addr ~index =
      let index, proto = Parser.at_index addr ~index in
      match proto with
      | "http" -> Ok (index, Http)
      | "ip4" ->
        let index, proto = Parser.at_index ~index addr in
        Ok (index, Ip4 proto)
      | "ip6" ->
        let index, proto = Parser.at_index ~index addr in
        Ok (index, Ip6 proto)
      | "p2p" ->
        let index, proto = Parser.at_index ~index addr in
        Ok (index, P2p proto)
      | "tcp" ->
        let index, proto = Parser.at_index ~index addr in
        parse_port proto >>| fun port -> index, Tcp port
      | proto -> Error ("unrecognized protocol " ^ proto)
    ;;
  end
end

(** ASCII Multiaddr parser. *)
let parse addr =
  let length = String.length addr in
  let rec parse acc index =
    Proto.Parser.parse_proto addr ~index
    >>= fun (index, proto) ->
    let acc = acc @ [ proto ] in
    if index = length then Ok acc else parse acc index
  in
  parse [] 0
;;

let parse_exn addr =
  match parse addr with
  | Ok addr -> addr
  | Error err -> failwith err
;;
