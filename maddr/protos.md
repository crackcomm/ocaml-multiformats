

Protocols to include:

```OCaml
module Proto = struct
  type t =
    | Dccp of port
    | Dns of string
    | Dns4 of string
    | Dns6 of string
    | Dnsaddr of string
    | Https
    | P2pWebRtcDirect
    | P2pWebRtcStar
    | P2pWebSocketStar
    | Memory of Uint64.t
    | Onion of Addr.Onion.t * port
    | Onion3 of Addr.Onion3.t
    | P2pCircuit
    | Quic
    | Sctp of port
    | Udp of port
    | Udt
    | Unix of string
    | Utp
    | Ws of string
    | Wss of string
end
```