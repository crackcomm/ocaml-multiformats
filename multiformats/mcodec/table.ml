(** Tag of multicodec. *)
type tag =
  | Multiaddr
  | Multibase
  | Multicodec
  | Multihash
  | Multiformat
  | Key
  | Serialization
  | IPLD
  | Namespace

(** Multicodec type. *)
type t =
  | Identity
  | CID'1
  | CID'2
  | CID'3
  | IP4
  | TCP
  | SHA1
  | SHA2'256
  | SHA2'512
  | SHA3'512
  | SHA3'384
  | SHA3'256
  | SHA3'224
  | Shake'128
  | Shake'256
  | Keccak'224
  | Keccak'256
  | Keccak'384
  | Keccak'512
  | Blake3
  | DCCP
  | Murmur3'128
  | Murmur3'32
  | IP6
  | IP6Zone
  | Path
  | Multicodec
  | Multihash
  | Multiaddr
  | Multibase
  | DNS
  | DNS4
  | DNS6
  | DNSAddr
  | Protobuf
  | CBOR
  | Raw
  | DBLSha2'256
  | RLP
  | Bencode
  | DAG'Pb
  | DAG'Cbor
  | Libp2pKey
  | GitRaw
  | TorrentInfo
  | TorrentFile
  | LeofcoinBlock
  | LeofcoinTx
  | LeofcoinPR
  | SCTP
  | DAG'Jose
  | DAG'Cose
  | ETHBlock
  | ETHBlockList
  | ETHTxTrie
  | ETHTx
  | ETHTxReceiptTrie
  | ETHTxReceipt
  | ETHStateTrie
  | ETHAccountSnapshot
  | ETHStorageTrie
  | BitcoinBlock
  | BitcoinTx
  | BitcoinWitnessCommitment
  | ZcashBlock
  | ZcashTx
  | Docid
  | StellarBlock
  | StellarTx
  | MD4
  | MD5
  | BMT
  | DecredBlock
  | DecredTx
  | IPLDNs
  | IPFSNs
  | SwarmNs
  | IPNSNs
  | Zeronet
  | Secp256k1'Pub
  | Bls12'381G1'Pub
  | Bls12'381G2'Pub
  | X25519'Pub
  | Ed25519'Pub
  | Bls12'381G1g2'Pub
  | DASHBlock
  | DASHTx
  | SwarmManifest
  | SwarmFeed
  | UDP
  | P2PWebrtcStar
  | P2PWebrtcDirect
  | P2PStardust
  | P2PCircuit
  | DAG'Json
  | UDT
  | UTP
  | UNIX
  | P2P
  | HTTPs
  | Onion
  | Onion3
  | Garlic64
  | Garlic32
  | TLS
  | QUIC
  | WS
  | WSS
  | P2PWebsocketStar
  | HTTP
  | JSON
  | Messagepack
  | SHA2'256Trunc254Padded
  | Ripemd'128
  | Ripemd'160
  | Ripemd'256
  | Ripemd'320
  | X11
  | P256'Pub
  | P384'Pub
  | P521'Pub
  | Ed448'Pub
  | X448'Pub
  | Ed25519'Priv
  | KangarooTwelve
  | SM3'256
  | Blake2b'8
  | Blake2b'16
  | Blake2b'24
  | Blake2b'32
  | Blake2b'40
  | Blake2b'48
  | Blake2b'56
  | Blake2b'64
  | Blake2b'72
  | Blake2b'80
  | Blake2b'88
  | Blake2b'96
  | Blake2b'104
  | Blake2b'112
  | Blake2b'120
  | Blake2b'128
  | Blake2b'136
  | Blake2b'144
  | Blake2b'152
  | Blake2b'160
  | Blake2b'168
  | Blake2b'176
  | Blake2b'184
  | Blake2b'192
  | Blake2b'200
  | Blake2b'208
  | Blake2b'216
  | Blake2b'224
  | Blake2b'232
  | Blake2b'240
  | Blake2b'248
  | Blake2b'256
  | Blake2b'264
  | Blake2b'272
  | Blake2b'280
  | Blake2b'288
  | Blake2b'296
  | Blake2b'304
  | Blake2b'312
  | Blake2b'320
  | Blake2b'328
  | Blake2b'336
  | Blake2b'344
  | Blake2b'352
  | Blake2b'360
  | Blake2b'368
  | Blake2b'376
  | Blake2b'384
  | Blake2b'392
  | Blake2b'400
  | Blake2b'408
  | Blake2b'416
  | Blake2b'424
  | Blake2b'432
  | Blake2b'440
  | Blake2b'448
  | Blake2b'456
  | Blake2b'464
  | Blake2b'472
  | Blake2b'480
  | Blake2b'488
  | Blake2b'496
  | Blake2b'504
  | Blake2b'512
  | Blake2s'8
  | Blake2s'16
  | Blake2s'24
  | Blake2s'32
  | Blake2s'40
  | Blake2s'48
  | Blake2s'56
  | Blake2s'64
  | Blake2s'72
  | Blake2s'80
  | Blake2s'88
  | Blake2s'96
  | Blake2s'104
  | Blake2s'112
  | Blake2s'120
  | Blake2s'128
  | Blake2s'136
  | Blake2s'144
  | Blake2s'152
  | Blake2s'160
  | Blake2s'168
  | Blake2s'176
  | Blake2s'184
  | Blake2s'192
  | Blake2s'200
  | Blake2s'208
  | Blake2s'216
  | Blake2s'224
  | Blake2s'232
  | Blake2s'240
  | Blake2s'248
  | Blake2s'256
  | Skein256'8
  | Skein256'16
  | Skein256'24
  | Skein256'32
  | Skein256'40
  | Skein256'48
  | Skein256'56
  | Skein256'64
  | Skein256'72
  | Skein256'80
  | Skein256'88
  | Skein256'96
  | Skein256'104
  | Skein256'112
  | Skein256'120
  | Skein256'128
  | Skein256'136
  | Skein256'144
  | Skein256'152
  | Skein256'160
  | Skein256'168
  | Skein256'176
  | Skein256'184
  | Skein256'192
  | Skein256'200
  | Skein256'208
  | Skein256'216
  | Skein256'224
  | Skein256'232
  | Skein256'240
  | Skein256'248
  | Skein256'256
  | Skein512'8
  | Skein512'16
  | Skein512'24
  | Skein512'32
  | Skein512'40
  | Skein512'48
  | Skein512'56
  | Skein512'64
  | Skein512'72
  | Skein512'80
  | Skein512'88
  | Skein512'96
  | Skein512'104
  | Skein512'112
  | Skein512'120
  | Skein512'128
  | Skein512'136
  | Skein512'144
  | Skein512'152
  | Skein512'160
  | Skein512'168
  | Skein512'176
  | Skein512'184
  | Skein512'192
  | Skein512'200
  | Skein512'208
  | Skein512'216
  | Skein512'224
  | Skein512'232
  | Skein512'240
  | Skein512'248
  | Skein512'256
  | Skein512'264
  | Skein512'272
  | Skein512'280
  | Skein512'288
  | Skein512'296
  | Skein512'304
  | Skein512'312
  | Skein512'320
  | Skein512'328
  | Skein512'336
  | Skein512'344
  | Skein512'352
  | Skein512'360
  | Skein512'368
  | Skein512'376
  | Skein512'384
  | Skein512'392
  | Skein512'400
  | Skein512'408
  | Skein512'416
  | Skein512'424
  | Skein512'432
  | Skein512'440
  | Skein512'448
  | Skein512'456
  | Skein512'464
  | Skein512'472
  | Skein512'480
  | Skein512'488
  | Skein512'496
  | Skein512'504
  | Skein512'512
  | Skein1024'8
  | Skein1024'16
  | Skein1024'24
  | Skein1024'32
  | Skein1024'40
  | Skein1024'48
  | Skein1024'56
  | Skein1024'64
  | Skein1024'72
  | Skein1024'80
  | Skein1024'88
  | Skein1024'96
  | Skein1024'104
  | Skein1024'112
  | Skein1024'120
  | Skein1024'128
  | Skein1024'136
  | Skein1024'144
  | Skein1024'152
  | Skein1024'160
  | Skein1024'168
  | Skein1024'176
  | Skein1024'184
  | Skein1024'192
  | Skein1024'200
  | Skein1024'208
  | Skein1024'216
  | Skein1024'224
  | Skein1024'232
  | Skein1024'240
  | Skein1024'248
  | Skein1024'256
  | Skein1024'264
  | Skein1024'272
  | Skein1024'280
  | Skein1024'288
  | Skein1024'296
  | Skein1024'304
  | Skein1024'312
  | Skein1024'320
  | Skein1024'328
  | Skein1024'336
  | Skein1024'344
  | Skein1024'352
  | Skein1024'360
  | Skein1024'368
  | Skein1024'376
  | Skein1024'384
  | Skein1024'392
  | Skein1024'400
  | Skein1024'408
  | Skein1024'416
  | Skein1024'424
  | Skein1024'432
  | Skein1024'440
  | Skein1024'448
  | Skein1024'456
  | Skein1024'464
  | Skein1024'472
  | Skein1024'480
  | Skein1024'488
  | Skein1024'496
  | Skein1024'504
  | Skein1024'512
  | Skein1024'520
  | Skein1024'528
  | Skein1024'536
  | Skein1024'544
  | Skein1024'552
  | Skein1024'560
  | Skein1024'568
  | Skein1024'576
  | Skein1024'584
  | Skein1024'592
  | Skein1024'600
  | Skein1024'608
  | Skein1024'616
  | Skein1024'624
  | Skein1024'632
  | Skein1024'640
  | Skein1024'648
  | Skein1024'656
  | Skein1024'664
  | Skein1024'672
  | Skein1024'680
  | Skein1024'688
  | Skein1024'696
  | Skein1024'704
  | Skein1024'712
  | Skein1024'720
  | Skein1024'728
  | Skein1024'736
  | Skein1024'744
  | Skein1024'752
  | Skein1024'760
  | Skein1024'768
  | Skein1024'776
  | Skein1024'784
  | Skein1024'792
  | Skein1024'800
  | Skein1024'808
  | Skein1024'816
  | Skein1024'824
  | Skein1024'832
  | Skein1024'840
  | Skein1024'848
  | Skein1024'856
  | Skein1024'864
  | Skein1024'872
  | Skein1024'880
  | Skein1024'888
  | Skein1024'896
  | Skein1024'904
  | Skein1024'912
  | Skein1024'920
  | Skein1024'928
  | Skein1024'936
  | Skein1024'944
  | Skein1024'952
  | Skein1024'960
  | Skein1024'968
  | Skein1024'976
  | Skein1024'984
  | Skein1024'992
  | Skein1024'1000
  | Skein1024'1008
  | Skein1024'1016
  | Skein1024'1024
  | PoseidonBls12'381A2FC1
  | PoseidonBls12'381A2FC1SC

(** [code_of codec] Returns integer code of codec [t]. *)
let code_of = function
  | Identity -> 0
  | CID'1 -> 1
  | CID'2 -> 2
  | CID'3 -> 3
  | IP4 -> 4
  | TCP -> 6
  | SHA1 -> 17
  | SHA2'256 -> 18
  | SHA2'512 -> 19
  | SHA3'512 -> 20
  | SHA3'384 -> 21
  | SHA3'256 -> 22
  | SHA3'224 -> 23
  | Shake'128 -> 24
  | Shake'256 -> 25
  | Keccak'224 -> 26
  | Keccak'256 -> 27
  | Keccak'384 -> 28
  | Keccak'512 -> 29
  | Blake3 -> 30
  | DCCP -> 33
  | Murmur3'128 -> 34
  | Murmur3'32 -> 35
  | IP6 -> 41
  | IP6Zone -> 42
  | Path -> 47
  | Multicodec -> 48
  | Multihash -> 49
  | Multiaddr -> 50
  | Multibase -> 51
  | DNS -> 53
  | DNS4 -> 54
  | DNS6 -> 55
  | DNSAddr -> 56
  | Protobuf -> 80
  | CBOR -> 81
  | Raw -> 85
  | DBLSha2'256 -> 86
  | RLP -> 96
  | Bencode -> 99
  | DAG'Pb -> 112
  | DAG'Cbor -> 113
  | Libp2pKey -> 114
  | GitRaw -> 120
  | TorrentInfo -> 123
  | TorrentFile -> 124
  | LeofcoinBlock -> 129
  | LeofcoinTx -> 130
  | LeofcoinPR -> 131
  | SCTP -> 132
  | DAG'Jose -> 133
  | DAG'Cose -> 134
  | ETHBlock -> 144
  | ETHBlockList -> 145
  | ETHTxTrie -> 146
  | ETHTx -> 147
  | ETHTxReceiptTrie -> 148
  | ETHTxReceipt -> 149
  | ETHStateTrie -> 150
  | ETHAccountSnapshot -> 151
  | ETHStorageTrie -> 152
  | BitcoinBlock -> 176
  | BitcoinTx -> 177
  | BitcoinWitnessCommitment -> 178
  | ZcashBlock -> 192
  | ZcashTx -> 193
  | Docid -> 206
  | StellarBlock -> 208
  | StellarTx -> 209
  | MD4 -> 212
  | MD5 -> 213
  | BMT -> 214
  | DecredBlock -> 224
  | DecredTx -> 225
  | IPLDNs -> 226
  | IPFSNs -> 227
  | SwarmNs -> 228
  | IPNSNs -> 229
  | Zeronet -> 230
  | Secp256k1'Pub -> 231
  | Bls12'381G1'Pub -> 234
  | Bls12'381G2'Pub -> 235
  | X25519'Pub -> 236
  | Ed25519'Pub -> 237
  | Bls12'381G1g2'Pub -> 238
  | DASHBlock -> 240
  | DASHTx -> 241
  | SwarmManifest -> 250
  | SwarmFeed -> 251
  | UDP -> 273
  | P2PWebrtcStar -> 275
  | P2PWebrtcDirect -> 276
  | P2PStardust -> 277
  | P2PCircuit -> 290
  | DAG'Json -> 297
  | UDT -> 301
  | UTP -> 302
  | UNIX -> 400
  | P2P -> 421
  | HTTPs -> 443
  | Onion -> 444
  | Onion3 -> 445
  | Garlic64 -> 446
  | Garlic32 -> 447
  | TLS -> 448
  | QUIC -> 460
  | WS -> 477
  | WSS -> 478
  | P2PWebsocketStar -> 479
  | HTTP -> 480
  | JSON -> 512
  | Messagepack -> 513
  | SHA2'256Trunc254Padded -> 4114
  | Ripemd'128 -> 4178
  | Ripemd'160 -> 4179
  | Ripemd'256 -> 4180
  | Ripemd'320 -> 4181
  | X11 -> 4352
  | P256'Pub -> 4608
  | P384'Pub -> 4609
  | P521'Pub -> 4610
  | Ed448'Pub -> 4611
  | X448'Pub -> 4612
  | Ed25519'Priv -> 4864
  | KangarooTwelve -> 7425
  | SM3'256 -> 21325
  | Blake2b'8 -> 45569
  | Blake2b'16 -> 45570
  | Blake2b'24 -> 45571
  | Blake2b'32 -> 45572
  | Blake2b'40 -> 45573
  | Blake2b'48 -> 45574
  | Blake2b'56 -> 45575
  | Blake2b'64 -> 45576
  | Blake2b'72 -> 45577
  | Blake2b'80 -> 45578
  | Blake2b'88 -> 45579
  | Blake2b'96 -> 45580
  | Blake2b'104 -> 45581
  | Blake2b'112 -> 45582
  | Blake2b'120 -> 45583
  | Blake2b'128 -> 45584
  | Blake2b'136 -> 45585
  | Blake2b'144 -> 45586
  | Blake2b'152 -> 45587
  | Blake2b'160 -> 45588
  | Blake2b'168 -> 45589
  | Blake2b'176 -> 45590
  | Blake2b'184 -> 45591
  | Blake2b'192 -> 45592
  | Blake2b'200 -> 45593
  | Blake2b'208 -> 45594
  | Blake2b'216 -> 45595
  | Blake2b'224 -> 45596
  | Blake2b'232 -> 45597
  | Blake2b'240 -> 45598
  | Blake2b'248 -> 45599
  | Blake2b'256 -> 45600
  | Blake2b'264 -> 45601
  | Blake2b'272 -> 45602
  | Blake2b'280 -> 45603
  | Blake2b'288 -> 45604
  | Blake2b'296 -> 45605
  | Blake2b'304 -> 45606
  | Blake2b'312 -> 45607
  | Blake2b'320 -> 45608
  | Blake2b'328 -> 45609
  | Blake2b'336 -> 45610
  | Blake2b'344 -> 45611
  | Blake2b'352 -> 45612
  | Blake2b'360 -> 45613
  | Blake2b'368 -> 45614
  | Blake2b'376 -> 45615
  | Blake2b'384 -> 45616
  | Blake2b'392 -> 45617
  | Blake2b'400 -> 45618
  | Blake2b'408 -> 45619
  | Blake2b'416 -> 45620
  | Blake2b'424 -> 45621
  | Blake2b'432 -> 45622
  | Blake2b'440 -> 45623
  | Blake2b'448 -> 45624
  | Blake2b'456 -> 45625
  | Blake2b'464 -> 45626
  | Blake2b'472 -> 45627
  | Blake2b'480 -> 45628
  | Blake2b'488 -> 45629
  | Blake2b'496 -> 45630
  | Blake2b'504 -> 45631
  | Blake2b'512 -> 45632
  | Blake2s'8 -> 45633
  | Blake2s'16 -> 45634
  | Blake2s'24 -> 45635
  | Blake2s'32 -> 45636
  | Blake2s'40 -> 45637
  | Blake2s'48 -> 45638
  | Blake2s'56 -> 45639
  | Blake2s'64 -> 45640
  | Blake2s'72 -> 45641
  | Blake2s'80 -> 45642
  | Blake2s'88 -> 45643
  | Blake2s'96 -> 45644
  | Blake2s'104 -> 45645
  | Blake2s'112 -> 45646
  | Blake2s'120 -> 45647
  | Blake2s'128 -> 45648
  | Blake2s'136 -> 45649
  | Blake2s'144 -> 45650
  | Blake2s'152 -> 45651
  | Blake2s'160 -> 45652
  | Blake2s'168 -> 45653
  | Blake2s'176 -> 45654
  | Blake2s'184 -> 45655
  | Blake2s'192 -> 45656
  | Blake2s'200 -> 45657
  | Blake2s'208 -> 45658
  | Blake2s'216 -> 45659
  | Blake2s'224 -> 45660
  | Blake2s'232 -> 45661
  | Blake2s'240 -> 45662
  | Blake2s'248 -> 45663
  | Blake2s'256 -> 45664
  | Skein256'8 -> 45825
  | Skein256'16 -> 45826
  | Skein256'24 -> 45827
  | Skein256'32 -> 45828
  | Skein256'40 -> 45829
  | Skein256'48 -> 45830
  | Skein256'56 -> 45831
  | Skein256'64 -> 45832
  | Skein256'72 -> 45833
  | Skein256'80 -> 45834
  | Skein256'88 -> 45835
  | Skein256'96 -> 45836
  | Skein256'104 -> 45837
  | Skein256'112 -> 45838
  | Skein256'120 -> 45839
  | Skein256'128 -> 45840
  | Skein256'136 -> 45841
  | Skein256'144 -> 45842
  | Skein256'152 -> 45843
  | Skein256'160 -> 45844
  | Skein256'168 -> 45845
  | Skein256'176 -> 45846
  | Skein256'184 -> 45847
  | Skein256'192 -> 45848
  | Skein256'200 -> 45849
  | Skein256'208 -> 45850
  | Skein256'216 -> 45851
  | Skein256'224 -> 45852
  | Skein256'232 -> 45853
  | Skein256'240 -> 45854
  | Skein256'248 -> 45855
  | Skein256'256 -> 45856
  | Skein512'8 -> 45857
  | Skein512'16 -> 45858
  | Skein512'24 -> 45859
  | Skein512'32 -> 45860
  | Skein512'40 -> 45861
  | Skein512'48 -> 45862
  | Skein512'56 -> 45863
  | Skein512'64 -> 45864
  | Skein512'72 -> 45865
  | Skein512'80 -> 45866
  | Skein512'88 -> 45867
  | Skein512'96 -> 45868
  | Skein512'104 -> 45869
  | Skein512'112 -> 45870
  | Skein512'120 -> 45871
  | Skein512'128 -> 45872
  | Skein512'136 -> 45873
  | Skein512'144 -> 45874
  | Skein512'152 -> 45875
  | Skein512'160 -> 45876
  | Skein512'168 -> 45877
  | Skein512'176 -> 45878
  | Skein512'184 -> 45879
  | Skein512'192 -> 45880
  | Skein512'200 -> 45881
  | Skein512'208 -> 45882
  | Skein512'216 -> 45883
  | Skein512'224 -> 45884
  | Skein512'232 -> 45885
  | Skein512'240 -> 45886
  | Skein512'248 -> 45887
  | Skein512'256 -> 45888
  | Skein512'264 -> 45889
  | Skein512'272 -> 45890
  | Skein512'280 -> 45891
  | Skein512'288 -> 45892
  | Skein512'296 -> 45893
  | Skein512'304 -> 45894
  | Skein512'312 -> 45895
  | Skein512'320 -> 45896
  | Skein512'328 -> 45897
  | Skein512'336 -> 45898
  | Skein512'344 -> 45899
  | Skein512'352 -> 45900
  | Skein512'360 -> 45901
  | Skein512'368 -> 45902
  | Skein512'376 -> 45903
  | Skein512'384 -> 45904
  | Skein512'392 -> 45905
  | Skein512'400 -> 45906
  | Skein512'408 -> 45907
  | Skein512'416 -> 45908
  | Skein512'424 -> 45909
  | Skein512'432 -> 45910
  | Skein512'440 -> 45911
  | Skein512'448 -> 45912
  | Skein512'456 -> 45913
  | Skein512'464 -> 45914
  | Skein512'472 -> 45915
  | Skein512'480 -> 45916
  | Skein512'488 -> 45917
  | Skein512'496 -> 45918
  | Skein512'504 -> 45919
  | Skein512'512 -> 45920
  | Skein1024'8 -> 45921
  | Skein1024'16 -> 45922
  | Skein1024'24 -> 45923
  | Skein1024'32 -> 45924
  | Skein1024'40 -> 45925
  | Skein1024'48 -> 45926
  | Skein1024'56 -> 45927
  | Skein1024'64 -> 45928
  | Skein1024'72 -> 45929
  | Skein1024'80 -> 45930
  | Skein1024'88 -> 45931
  | Skein1024'96 -> 45932
  | Skein1024'104 -> 45933
  | Skein1024'112 -> 45934
  | Skein1024'120 -> 45935
  | Skein1024'128 -> 45936
  | Skein1024'136 -> 45937
  | Skein1024'144 -> 45938
  | Skein1024'152 -> 45939
  | Skein1024'160 -> 45940
  | Skein1024'168 -> 45941
  | Skein1024'176 -> 45942
  | Skein1024'184 -> 45943
  | Skein1024'192 -> 45944
  | Skein1024'200 -> 45945
  | Skein1024'208 -> 45946
  | Skein1024'216 -> 45947
  | Skein1024'224 -> 45948
  | Skein1024'232 -> 45949
  | Skein1024'240 -> 45950
  | Skein1024'248 -> 45951
  | Skein1024'256 -> 45952
  | Skein1024'264 -> 45953
  | Skein1024'272 -> 45954
  | Skein1024'280 -> 45955
  | Skein1024'288 -> 45956
  | Skein1024'296 -> 45957
  | Skein1024'304 -> 45958
  | Skein1024'312 -> 45959
  | Skein1024'320 -> 45960
  | Skein1024'328 -> 45961
  | Skein1024'336 -> 45962
  | Skein1024'344 -> 45963
  | Skein1024'352 -> 45964
  | Skein1024'360 -> 45965
  | Skein1024'368 -> 45966
  | Skein1024'376 -> 45967
  | Skein1024'384 -> 45968
  | Skein1024'392 -> 45969
  | Skein1024'400 -> 45970
  | Skein1024'408 -> 45971
  | Skein1024'416 -> 45972
  | Skein1024'424 -> 45973
  | Skein1024'432 -> 45974
  | Skein1024'440 -> 45975
  | Skein1024'448 -> 45976
  | Skein1024'456 -> 45977
  | Skein1024'464 -> 45978
  | Skein1024'472 -> 45979
  | Skein1024'480 -> 45980
  | Skein1024'488 -> 45981
  | Skein1024'496 -> 45982
  | Skein1024'504 -> 45983
  | Skein1024'512 -> 45984
  | Skein1024'520 -> 45985
  | Skein1024'528 -> 45986
  | Skein1024'536 -> 45987
  | Skein1024'544 -> 45988
  | Skein1024'552 -> 45989
  | Skein1024'560 -> 45990
  | Skein1024'568 -> 45991
  | Skein1024'576 -> 45992
  | Skein1024'584 -> 45993
  | Skein1024'592 -> 45994
  | Skein1024'600 -> 45995
  | Skein1024'608 -> 45996
  | Skein1024'616 -> 45997
  | Skein1024'624 -> 45998
  | Skein1024'632 -> 45999
  | Skein1024'640 -> 46000
  | Skein1024'648 -> 46001
  | Skein1024'656 -> 46002
  | Skein1024'664 -> 46003
  | Skein1024'672 -> 46004
  | Skein1024'680 -> 46005
  | Skein1024'688 -> 46006
  | Skein1024'696 -> 46007
  | Skein1024'704 -> 46008
  | Skein1024'712 -> 46009
  | Skein1024'720 -> 46010
  | Skein1024'728 -> 46011
  | Skein1024'736 -> 46012
  | Skein1024'744 -> 46013
  | Skein1024'752 -> 46014
  | Skein1024'760 -> 46015
  | Skein1024'768 -> 46016
  | Skein1024'776 -> 46017
  | Skein1024'784 -> 46018
  | Skein1024'792 -> 46019
  | Skein1024'800 -> 46020
  | Skein1024'808 -> 46021
  | Skein1024'816 -> 46022
  | Skein1024'824 -> 46023
  | Skein1024'832 -> 46024
  | Skein1024'840 -> 46025
  | Skein1024'848 -> 46026
  | Skein1024'856 -> 46027
  | Skein1024'864 -> 46028
  | Skein1024'872 -> 46029
  | Skein1024'880 -> 46030
  | Skein1024'888 -> 46031
  | Skein1024'896 -> 46032
  | Skein1024'904 -> 46033
  | Skein1024'912 -> 46034
  | Skein1024'920 -> 46035
  | Skein1024'928 -> 46036
  | Skein1024'936 -> 46037
  | Skein1024'944 -> 46038
  | Skein1024'952 -> 46039
  | Skein1024'960 -> 46040
  | Skein1024'968 -> 46041
  | Skein1024'976 -> 46042
  | Skein1024'984 -> 46043
  | Skein1024'992 -> 46044
  | Skein1024'1000 -> 46045
  | Skein1024'1008 -> 46046
  | Skein1024'1016 -> 46047
  | Skein1024'1024 -> 46048
  | PoseidonBls12'381A2FC1 -> 46081
  | PoseidonBls12'381A2FC1SC -> 46082
;;

(** [of_code code] Returns codec [t] from integer [code]. *)
let of_code = function
  | 0 -> Some Identity
  | 1 -> Some CID'1
  | 2 -> Some CID'2
  | 3 -> Some CID'3
  | 4 -> Some IP4
  | 6 -> Some TCP
  | 17 -> Some SHA1
  | 18 -> Some SHA2'256
  | 19 -> Some SHA2'512
  | 20 -> Some SHA3'512
  | 21 -> Some SHA3'384
  | 22 -> Some SHA3'256
  | 23 -> Some SHA3'224
  | 24 -> Some Shake'128
  | 25 -> Some Shake'256
  | 26 -> Some Keccak'224
  | 27 -> Some Keccak'256
  | 28 -> Some Keccak'384
  | 29 -> Some Keccak'512
  | 30 -> Some Blake3
  | 33 -> Some DCCP
  | 34 -> Some Murmur3'128
  | 35 -> Some Murmur3'32
  | 41 -> Some IP6
  | 42 -> Some IP6Zone
  | 47 -> Some Path
  | 48 -> Some Multicodec
  | 49 -> Some Multihash
  | 50 -> Some Multiaddr
  | 51 -> Some Multibase
  | 53 -> Some DNS
  | 54 -> Some DNS4
  | 55 -> Some DNS6
  | 56 -> Some DNSAddr
  | 80 -> Some Protobuf
  | 81 -> Some CBOR
  | 85 -> Some Raw
  | 86 -> Some DBLSha2'256
  | 96 -> Some RLP
  | 99 -> Some Bencode
  | 112 -> Some DAG'Pb
  | 113 -> Some DAG'Cbor
  | 114 -> Some Libp2pKey
  | 120 -> Some GitRaw
  | 123 -> Some TorrentInfo
  | 124 -> Some TorrentFile
  | 129 -> Some LeofcoinBlock
  | 130 -> Some LeofcoinTx
  | 131 -> Some LeofcoinPR
  | 132 -> Some SCTP
  | 133 -> Some DAG'Jose
  | 134 -> Some DAG'Cose
  | 144 -> Some ETHBlock
  | 145 -> Some ETHBlockList
  | 146 -> Some ETHTxTrie
  | 147 -> Some ETHTx
  | 148 -> Some ETHTxReceiptTrie
  | 149 -> Some ETHTxReceipt
  | 150 -> Some ETHStateTrie
  | 151 -> Some ETHAccountSnapshot
  | 152 -> Some ETHStorageTrie
  | 176 -> Some BitcoinBlock
  | 177 -> Some BitcoinTx
  | 178 -> Some BitcoinWitnessCommitment
  | 192 -> Some ZcashBlock
  | 193 -> Some ZcashTx
  | 206 -> Some Docid
  | 208 -> Some StellarBlock
  | 209 -> Some StellarTx
  | 212 -> Some MD4
  | 213 -> Some MD5
  | 214 -> Some BMT
  | 224 -> Some DecredBlock
  | 225 -> Some DecredTx
  | 226 -> Some IPLDNs
  | 227 -> Some IPFSNs
  | 228 -> Some SwarmNs
  | 229 -> Some IPNSNs
  | 230 -> Some Zeronet
  | 231 -> Some Secp256k1'Pub
  | 234 -> Some Bls12'381G1'Pub
  | 235 -> Some Bls12'381G2'Pub
  | 236 -> Some X25519'Pub
  | 237 -> Some Ed25519'Pub
  | 238 -> Some Bls12'381G1g2'Pub
  | 240 -> Some DASHBlock
  | 241 -> Some DASHTx
  | 250 -> Some SwarmManifest
  | 251 -> Some SwarmFeed
  | 273 -> Some UDP
  | 275 -> Some P2PWebrtcStar
  | 276 -> Some P2PWebrtcDirect
  | 277 -> Some P2PStardust
  | 290 -> Some P2PCircuit
  | 297 -> Some DAG'Json
  | 301 -> Some UDT
  | 302 -> Some UTP
  | 400 -> Some UNIX
  | 421 -> Some P2P
  | 443 -> Some HTTPs
  | 444 -> Some Onion
  | 445 -> Some Onion3
  | 446 -> Some Garlic64
  | 447 -> Some Garlic32
  | 448 -> Some TLS
  | 460 -> Some QUIC
  | 477 -> Some WS
  | 478 -> Some WSS
  | 479 -> Some P2PWebsocketStar
  | 480 -> Some HTTP
  | 512 -> Some JSON
  | 513 -> Some Messagepack
  | 4114 -> Some SHA2'256Trunc254Padded
  | 4178 -> Some Ripemd'128
  | 4179 -> Some Ripemd'160
  | 4180 -> Some Ripemd'256
  | 4181 -> Some Ripemd'320
  | 4352 -> Some X11
  | 4608 -> Some P256'Pub
  | 4609 -> Some P384'Pub
  | 4610 -> Some P521'Pub
  | 4611 -> Some Ed448'Pub
  | 4612 -> Some X448'Pub
  | 4864 -> Some Ed25519'Priv
  | 7425 -> Some KangarooTwelve
  | 21325 -> Some SM3'256
  | 45569 -> Some Blake2b'8
  | 45570 -> Some Blake2b'16
  | 45571 -> Some Blake2b'24
  | 45572 -> Some Blake2b'32
  | 45573 -> Some Blake2b'40
  | 45574 -> Some Blake2b'48
  | 45575 -> Some Blake2b'56
  | 45576 -> Some Blake2b'64
  | 45577 -> Some Blake2b'72
  | 45578 -> Some Blake2b'80
  | 45579 -> Some Blake2b'88
  | 45580 -> Some Blake2b'96
  | 45581 -> Some Blake2b'104
  | 45582 -> Some Blake2b'112
  | 45583 -> Some Blake2b'120
  | 45584 -> Some Blake2b'128
  | 45585 -> Some Blake2b'136
  | 45586 -> Some Blake2b'144
  | 45587 -> Some Blake2b'152
  | 45588 -> Some Blake2b'160
  | 45589 -> Some Blake2b'168
  | 45590 -> Some Blake2b'176
  | 45591 -> Some Blake2b'184
  | 45592 -> Some Blake2b'192
  | 45593 -> Some Blake2b'200
  | 45594 -> Some Blake2b'208
  | 45595 -> Some Blake2b'216
  | 45596 -> Some Blake2b'224
  | 45597 -> Some Blake2b'232
  | 45598 -> Some Blake2b'240
  | 45599 -> Some Blake2b'248
  | 45600 -> Some Blake2b'256
  | 45601 -> Some Blake2b'264
  | 45602 -> Some Blake2b'272
  | 45603 -> Some Blake2b'280
  | 45604 -> Some Blake2b'288
  | 45605 -> Some Blake2b'296
  | 45606 -> Some Blake2b'304
  | 45607 -> Some Blake2b'312
  | 45608 -> Some Blake2b'320
  | 45609 -> Some Blake2b'328
  | 45610 -> Some Blake2b'336
  | 45611 -> Some Blake2b'344
  | 45612 -> Some Blake2b'352
  | 45613 -> Some Blake2b'360
  | 45614 -> Some Blake2b'368
  | 45615 -> Some Blake2b'376
  | 45616 -> Some Blake2b'384
  | 45617 -> Some Blake2b'392
  | 45618 -> Some Blake2b'400
  | 45619 -> Some Blake2b'408
  | 45620 -> Some Blake2b'416
  | 45621 -> Some Blake2b'424
  | 45622 -> Some Blake2b'432
  | 45623 -> Some Blake2b'440
  | 45624 -> Some Blake2b'448
  | 45625 -> Some Blake2b'456
  | 45626 -> Some Blake2b'464
  | 45627 -> Some Blake2b'472
  | 45628 -> Some Blake2b'480
  | 45629 -> Some Blake2b'488
  | 45630 -> Some Blake2b'496
  | 45631 -> Some Blake2b'504
  | 45632 -> Some Blake2b'512
  | 45633 -> Some Blake2s'8
  | 45634 -> Some Blake2s'16
  | 45635 -> Some Blake2s'24
  | 45636 -> Some Blake2s'32
  | 45637 -> Some Blake2s'40
  | 45638 -> Some Blake2s'48
  | 45639 -> Some Blake2s'56
  | 45640 -> Some Blake2s'64
  | 45641 -> Some Blake2s'72
  | 45642 -> Some Blake2s'80
  | 45643 -> Some Blake2s'88
  | 45644 -> Some Blake2s'96
  | 45645 -> Some Blake2s'104
  | 45646 -> Some Blake2s'112
  | 45647 -> Some Blake2s'120
  | 45648 -> Some Blake2s'128
  | 45649 -> Some Blake2s'136
  | 45650 -> Some Blake2s'144
  | 45651 -> Some Blake2s'152
  | 45652 -> Some Blake2s'160
  | 45653 -> Some Blake2s'168
  | 45654 -> Some Blake2s'176
  | 45655 -> Some Blake2s'184
  | 45656 -> Some Blake2s'192
  | 45657 -> Some Blake2s'200
  | 45658 -> Some Blake2s'208
  | 45659 -> Some Blake2s'216
  | 45660 -> Some Blake2s'224
  | 45661 -> Some Blake2s'232
  | 45662 -> Some Blake2s'240
  | 45663 -> Some Blake2s'248
  | 45664 -> Some Blake2s'256
  | 45825 -> Some Skein256'8
  | 45826 -> Some Skein256'16
  | 45827 -> Some Skein256'24
  | 45828 -> Some Skein256'32
  | 45829 -> Some Skein256'40
  | 45830 -> Some Skein256'48
  | 45831 -> Some Skein256'56
  | 45832 -> Some Skein256'64
  | 45833 -> Some Skein256'72
  | 45834 -> Some Skein256'80
  | 45835 -> Some Skein256'88
  | 45836 -> Some Skein256'96
  | 45837 -> Some Skein256'104
  | 45838 -> Some Skein256'112
  | 45839 -> Some Skein256'120
  | 45840 -> Some Skein256'128
  | 45841 -> Some Skein256'136
  | 45842 -> Some Skein256'144
  | 45843 -> Some Skein256'152
  | 45844 -> Some Skein256'160
  | 45845 -> Some Skein256'168
  | 45846 -> Some Skein256'176
  | 45847 -> Some Skein256'184
  | 45848 -> Some Skein256'192
  | 45849 -> Some Skein256'200
  | 45850 -> Some Skein256'208
  | 45851 -> Some Skein256'216
  | 45852 -> Some Skein256'224
  | 45853 -> Some Skein256'232
  | 45854 -> Some Skein256'240
  | 45855 -> Some Skein256'248
  | 45856 -> Some Skein256'256
  | 45857 -> Some Skein512'8
  | 45858 -> Some Skein512'16
  | 45859 -> Some Skein512'24
  | 45860 -> Some Skein512'32
  | 45861 -> Some Skein512'40
  | 45862 -> Some Skein512'48
  | 45863 -> Some Skein512'56
  | 45864 -> Some Skein512'64
  | 45865 -> Some Skein512'72
  | 45866 -> Some Skein512'80
  | 45867 -> Some Skein512'88
  | 45868 -> Some Skein512'96
  | 45869 -> Some Skein512'104
  | 45870 -> Some Skein512'112
  | 45871 -> Some Skein512'120
  | 45872 -> Some Skein512'128
  | 45873 -> Some Skein512'136
  | 45874 -> Some Skein512'144
  | 45875 -> Some Skein512'152
  | 45876 -> Some Skein512'160
  | 45877 -> Some Skein512'168
  | 45878 -> Some Skein512'176
  | 45879 -> Some Skein512'184
  | 45880 -> Some Skein512'192
  | 45881 -> Some Skein512'200
  | 45882 -> Some Skein512'208
  | 45883 -> Some Skein512'216
  | 45884 -> Some Skein512'224
  | 45885 -> Some Skein512'232
  | 45886 -> Some Skein512'240
  | 45887 -> Some Skein512'248
  | 45888 -> Some Skein512'256
  | 45889 -> Some Skein512'264
  | 45890 -> Some Skein512'272
  | 45891 -> Some Skein512'280
  | 45892 -> Some Skein512'288
  | 45893 -> Some Skein512'296
  | 45894 -> Some Skein512'304
  | 45895 -> Some Skein512'312
  | 45896 -> Some Skein512'320
  | 45897 -> Some Skein512'328
  | 45898 -> Some Skein512'336
  | 45899 -> Some Skein512'344
  | 45900 -> Some Skein512'352
  | 45901 -> Some Skein512'360
  | 45902 -> Some Skein512'368
  | 45903 -> Some Skein512'376
  | 45904 -> Some Skein512'384
  | 45905 -> Some Skein512'392
  | 45906 -> Some Skein512'400
  | 45907 -> Some Skein512'408
  | 45908 -> Some Skein512'416
  | 45909 -> Some Skein512'424
  | 45910 -> Some Skein512'432
  | 45911 -> Some Skein512'440
  | 45912 -> Some Skein512'448
  | 45913 -> Some Skein512'456
  | 45914 -> Some Skein512'464
  | 45915 -> Some Skein512'472
  | 45916 -> Some Skein512'480
  | 45917 -> Some Skein512'488
  | 45918 -> Some Skein512'496
  | 45919 -> Some Skein512'504
  | 45920 -> Some Skein512'512
  | 45921 -> Some Skein1024'8
  | 45922 -> Some Skein1024'16
  | 45923 -> Some Skein1024'24
  | 45924 -> Some Skein1024'32
  | 45925 -> Some Skein1024'40
  | 45926 -> Some Skein1024'48
  | 45927 -> Some Skein1024'56
  | 45928 -> Some Skein1024'64
  | 45929 -> Some Skein1024'72
  | 45930 -> Some Skein1024'80
  | 45931 -> Some Skein1024'88
  | 45932 -> Some Skein1024'96
  | 45933 -> Some Skein1024'104
  | 45934 -> Some Skein1024'112
  | 45935 -> Some Skein1024'120
  | 45936 -> Some Skein1024'128
  | 45937 -> Some Skein1024'136
  | 45938 -> Some Skein1024'144
  | 45939 -> Some Skein1024'152
  | 45940 -> Some Skein1024'160
  | 45941 -> Some Skein1024'168
  | 45942 -> Some Skein1024'176
  | 45943 -> Some Skein1024'184
  | 45944 -> Some Skein1024'192
  | 45945 -> Some Skein1024'200
  | 45946 -> Some Skein1024'208
  | 45947 -> Some Skein1024'216
  | 45948 -> Some Skein1024'224
  | 45949 -> Some Skein1024'232
  | 45950 -> Some Skein1024'240
  | 45951 -> Some Skein1024'248
  | 45952 -> Some Skein1024'256
  | 45953 -> Some Skein1024'264
  | 45954 -> Some Skein1024'272
  | 45955 -> Some Skein1024'280
  | 45956 -> Some Skein1024'288
  | 45957 -> Some Skein1024'296
  | 45958 -> Some Skein1024'304
  | 45959 -> Some Skein1024'312
  | 45960 -> Some Skein1024'320
  | 45961 -> Some Skein1024'328
  | 45962 -> Some Skein1024'336
  | 45963 -> Some Skein1024'344
  | 45964 -> Some Skein1024'352
  | 45965 -> Some Skein1024'360
  | 45966 -> Some Skein1024'368
  | 45967 -> Some Skein1024'376
  | 45968 -> Some Skein1024'384
  | 45969 -> Some Skein1024'392
  | 45970 -> Some Skein1024'400
  | 45971 -> Some Skein1024'408
  | 45972 -> Some Skein1024'416
  | 45973 -> Some Skein1024'424
  | 45974 -> Some Skein1024'432
  | 45975 -> Some Skein1024'440
  | 45976 -> Some Skein1024'448
  | 45977 -> Some Skein1024'456
  | 45978 -> Some Skein1024'464
  | 45979 -> Some Skein1024'472
  | 45980 -> Some Skein1024'480
  | 45981 -> Some Skein1024'488
  | 45982 -> Some Skein1024'496
  | 45983 -> Some Skein1024'504
  | 45984 -> Some Skein1024'512
  | 45985 -> Some Skein1024'520
  | 45986 -> Some Skein1024'528
  | 45987 -> Some Skein1024'536
  | 45988 -> Some Skein1024'544
  | 45989 -> Some Skein1024'552
  | 45990 -> Some Skein1024'560
  | 45991 -> Some Skein1024'568
  | 45992 -> Some Skein1024'576
  | 45993 -> Some Skein1024'584
  | 45994 -> Some Skein1024'592
  | 45995 -> Some Skein1024'600
  | 45996 -> Some Skein1024'608
  | 45997 -> Some Skein1024'616
  | 45998 -> Some Skein1024'624
  | 45999 -> Some Skein1024'632
  | 46000 -> Some Skein1024'640
  | 46001 -> Some Skein1024'648
  | 46002 -> Some Skein1024'656
  | 46003 -> Some Skein1024'664
  | 46004 -> Some Skein1024'672
  | 46005 -> Some Skein1024'680
  | 46006 -> Some Skein1024'688
  | 46007 -> Some Skein1024'696
  | 46008 -> Some Skein1024'704
  | 46009 -> Some Skein1024'712
  | 46010 -> Some Skein1024'720
  | 46011 -> Some Skein1024'728
  | 46012 -> Some Skein1024'736
  | 46013 -> Some Skein1024'744
  | 46014 -> Some Skein1024'752
  | 46015 -> Some Skein1024'760
  | 46016 -> Some Skein1024'768
  | 46017 -> Some Skein1024'776
  | 46018 -> Some Skein1024'784
  | 46019 -> Some Skein1024'792
  | 46020 -> Some Skein1024'800
  | 46021 -> Some Skein1024'808
  | 46022 -> Some Skein1024'816
  | 46023 -> Some Skein1024'824
  | 46024 -> Some Skein1024'832
  | 46025 -> Some Skein1024'840
  | 46026 -> Some Skein1024'848
  | 46027 -> Some Skein1024'856
  | 46028 -> Some Skein1024'864
  | 46029 -> Some Skein1024'872
  | 46030 -> Some Skein1024'880
  | 46031 -> Some Skein1024'888
  | 46032 -> Some Skein1024'896
  | 46033 -> Some Skein1024'904
  | 46034 -> Some Skein1024'912
  | 46035 -> Some Skein1024'920
  | 46036 -> Some Skein1024'928
  | 46037 -> Some Skein1024'936
  | 46038 -> Some Skein1024'944
  | 46039 -> Some Skein1024'952
  | 46040 -> Some Skein1024'960
  | 46041 -> Some Skein1024'968
  | 46042 -> Some Skein1024'976
  | 46043 -> Some Skein1024'984
  | 46044 -> Some Skein1024'992
  | 46045 -> Some Skein1024'1000
  | 46046 -> Some Skein1024'1008
  | 46047 -> Some Skein1024'1016
  | 46048 -> Some Skein1024'1024
  | 46081 -> Some PoseidonBls12'381A2FC1
  | 46082 -> Some PoseidonBls12'381A2FC1SC
  | _ -> None
;;

(** [tag_of codec] Returns [tag] of codec [t]. *)
let tag_of : t -> tag = function
  | Identity -> Multihash
  | CID'1 -> IPLD
  | CID'2 -> IPLD
  | CID'3 -> IPLD
  | IP4 -> Multiaddr
  | TCP -> Multiaddr
  | SHA1 -> Multihash
  | SHA2'256 -> Multihash
  | SHA2'512 -> Multihash
  | SHA3'512 -> Multihash
  | SHA3'384 -> Multihash
  | SHA3'256 -> Multihash
  | SHA3'224 -> Multihash
  | Shake'128 -> Multihash
  | Shake'256 -> Multihash
  | Keccak'224 -> Multihash
  | Keccak'256 -> Multihash
  | Keccak'384 -> Multihash
  | Keccak'512 -> Multihash
  | Blake3 -> Multihash
  | DCCP -> Multiaddr
  | Murmur3'128 -> Multihash
  | Murmur3'32 -> Multihash
  | IP6 -> Multiaddr
  | IP6Zone -> Multiaddr
  | Path -> Namespace
  | Multicodec -> Multiformat
  | Multihash -> Multiformat
  | Multiaddr -> Multiformat
  | Multibase -> Multiformat
  | DNS -> Multiaddr
  | DNS4 -> Multiaddr
  | DNS6 -> Multiaddr
  | DNSAddr -> Multiaddr
  | Protobuf -> Serialization
  | CBOR -> Serialization
  | Raw -> IPLD
  | DBLSha2'256 -> Multihash
  | RLP -> Serialization
  | Bencode -> Serialization
  | DAG'Pb -> IPLD
  | DAG'Cbor -> IPLD
  | Libp2pKey -> IPLD
  | GitRaw -> IPLD
  | TorrentInfo -> IPLD
  | TorrentFile -> IPLD
  | LeofcoinBlock -> IPLD
  | LeofcoinTx -> IPLD
  | LeofcoinPR -> IPLD
  | SCTP -> Multiaddr
  | DAG'Jose -> IPLD
  | DAG'Cose -> IPLD
  | ETHBlock -> IPLD
  | ETHBlockList -> IPLD
  | ETHTxTrie -> IPLD
  | ETHTx -> IPLD
  | ETHTxReceiptTrie -> IPLD
  | ETHTxReceipt -> IPLD
  | ETHStateTrie -> IPLD
  | ETHAccountSnapshot -> IPLD
  | ETHStorageTrie -> IPLD
  | BitcoinBlock -> IPLD
  | BitcoinTx -> IPLD
  | BitcoinWitnessCommitment -> IPLD
  | ZcashBlock -> IPLD
  | ZcashTx -> IPLD
  | Docid -> Namespace
  | StellarBlock -> IPLD
  | StellarTx -> IPLD
  | MD4 -> Multihash
  | MD5 -> Multihash
  | BMT -> Multihash
  | DecredBlock -> IPLD
  | DecredTx -> IPLD
  | IPLDNs -> Namespace
  | IPFSNs -> Namespace
  | SwarmNs -> Namespace
  | IPNSNs -> Namespace
  | Zeronet -> Namespace
  | Secp256k1'Pub -> Key
  | Bls12'381G1'Pub -> Key
  | Bls12'381G2'Pub -> Key
  | X25519'Pub -> Key
  | Ed25519'Pub -> Key
  | Bls12'381G1g2'Pub -> Key
  | DASHBlock -> IPLD
  | DASHTx -> IPLD
  | SwarmManifest -> IPLD
  | SwarmFeed -> IPLD
  | UDP -> Multiaddr
  | P2PWebrtcStar -> Multiaddr
  | P2PWebrtcDirect -> Multiaddr
  | P2PStardust -> Multiaddr
  | P2PCircuit -> Multiaddr
  | DAG'Json -> IPLD
  | UDT -> Multiaddr
  | UTP -> Multiaddr
  | UNIX -> Multiaddr
  | P2P -> Multiaddr
  | HTTPs -> Multiaddr
  | Onion -> Multiaddr
  | Onion3 -> Multiaddr
  | Garlic64 -> Multiaddr
  | Garlic32 -> Multiaddr
  | TLS -> Multiaddr
  | QUIC -> Multiaddr
  | WS -> Multiaddr
  | WSS -> Multiaddr
  | P2PWebsocketStar -> Multiaddr
  | HTTP -> Multiaddr
  | JSON -> Serialization
  | Messagepack -> Serialization
  | SHA2'256Trunc254Padded -> Multihash
  | Ripemd'128 -> Multihash
  | Ripemd'160 -> Multihash
  | Ripemd'256 -> Multihash
  | Ripemd'320 -> Multihash
  | X11 -> Multihash
  | P256'Pub -> Key
  | P384'Pub -> Key
  | P521'Pub -> Key
  | Ed448'Pub -> Key
  | X448'Pub -> Key
  | Ed25519'Priv -> Key
  | KangarooTwelve -> Multihash
  | SM3'256 -> Multihash
  | Blake2b'8 -> Multihash
  | Blake2b'16 -> Multihash
  | Blake2b'24 -> Multihash
  | Blake2b'32 -> Multihash
  | Blake2b'40 -> Multihash
  | Blake2b'48 -> Multihash
  | Blake2b'56 -> Multihash
  | Blake2b'64 -> Multihash
  | Blake2b'72 -> Multihash
  | Blake2b'80 -> Multihash
  | Blake2b'88 -> Multihash
  | Blake2b'96 -> Multihash
  | Blake2b'104 -> Multihash
  | Blake2b'112 -> Multihash
  | Blake2b'120 -> Multihash
  | Blake2b'128 -> Multihash
  | Blake2b'136 -> Multihash
  | Blake2b'144 -> Multihash
  | Blake2b'152 -> Multihash
  | Blake2b'160 -> Multihash
  | Blake2b'168 -> Multihash
  | Blake2b'176 -> Multihash
  | Blake2b'184 -> Multihash
  | Blake2b'192 -> Multihash
  | Blake2b'200 -> Multihash
  | Blake2b'208 -> Multihash
  | Blake2b'216 -> Multihash
  | Blake2b'224 -> Multihash
  | Blake2b'232 -> Multihash
  | Blake2b'240 -> Multihash
  | Blake2b'248 -> Multihash
  | Blake2b'256 -> Multihash
  | Blake2b'264 -> Multihash
  | Blake2b'272 -> Multihash
  | Blake2b'280 -> Multihash
  | Blake2b'288 -> Multihash
  | Blake2b'296 -> Multihash
  | Blake2b'304 -> Multihash
  | Blake2b'312 -> Multihash
  | Blake2b'320 -> Multihash
  | Blake2b'328 -> Multihash
  | Blake2b'336 -> Multihash
  | Blake2b'344 -> Multihash
  | Blake2b'352 -> Multihash
  | Blake2b'360 -> Multihash
  | Blake2b'368 -> Multihash
  | Blake2b'376 -> Multihash
  | Blake2b'384 -> Multihash
  | Blake2b'392 -> Multihash
  | Blake2b'400 -> Multihash
  | Blake2b'408 -> Multihash
  | Blake2b'416 -> Multihash
  | Blake2b'424 -> Multihash
  | Blake2b'432 -> Multihash
  | Blake2b'440 -> Multihash
  | Blake2b'448 -> Multihash
  | Blake2b'456 -> Multihash
  | Blake2b'464 -> Multihash
  | Blake2b'472 -> Multihash
  | Blake2b'480 -> Multihash
  | Blake2b'488 -> Multihash
  | Blake2b'496 -> Multihash
  | Blake2b'504 -> Multihash
  | Blake2b'512 -> Multihash
  | Blake2s'8 -> Multihash
  | Blake2s'16 -> Multihash
  | Blake2s'24 -> Multihash
  | Blake2s'32 -> Multihash
  | Blake2s'40 -> Multihash
  | Blake2s'48 -> Multihash
  | Blake2s'56 -> Multihash
  | Blake2s'64 -> Multihash
  | Blake2s'72 -> Multihash
  | Blake2s'80 -> Multihash
  | Blake2s'88 -> Multihash
  | Blake2s'96 -> Multihash
  | Blake2s'104 -> Multihash
  | Blake2s'112 -> Multihash
  | Blake2s'120 -> Multihash
  | Blake2s'128 -> Multihash
  | Blake2s'136 -> Multihash
  | Blake2s'144 -> Multihash
  | Blake2s'152 -> Multihash
  | Blake2s'160 -> Multihash
  | Blake2s'168 -> Multihash
  | Blake2s'176 -> Multihash
  | Blake2s'184 -> Multihash
  | Blake2s'192 -> Multihash
  | Blake2s'200 -> Multihash
  | Blake2s'208 -> Multihash
  | Blake2s'216 -> Multihash
  | Blake2s'224 -> Multihash
  | Blake2s'232 -> Multihash
  | Blake2s'240 -> Multihash
  | Blake2s'248 -> Multihash
  | Blake2s'256 -> Multihash
  | Skein256'8 -> Multihash
  | Skein256'16 -> Multihash
  | Skein256'24 -> Multihash
  | Skein256'32 -> Multihash
  | Skein256'40 -> Multihash
  | Skein256'48 -> Multihash
  | Skein256'56 -> Multihash
  | Skein256'64 -> Multihash
  | Skein256'72 -> Multihash
  | Skein256'80 -> Multihash
  | Skein256'88 -> Multihash
  | Skein256'96 -> Multihash
  | Skein256'104 -> Multihash
  | Skein256'112 -> Multihash
  | Skein256'120 -> Multihash
  | Skein256'128 -> Multihash
  | Skein256'136 -> Multihash
  | Skein256'144 -> Multihash
  | Skein256'152 -> Multihash
  | Skein256'160 -> Multihash
  | Skein256'168 -> Multihash
  | Skein256'176 -> Multihash
  | Skein256'184 -> Multihash
  | Skein256'192 -> Multihash
  | Skein256'200 -> Multihash
  | Skein256'208 -> Multihash
  | Skein256'216 -> Multihash
  | Skein256'224 -> Multihash
  | Skein256'232 -> Multihash
  | Skein256'240 -> Multihash
  | Skein256'248 -> Multihash
  | Skein256'256 -> Multihash
  | Skein512'8 -> Multihash
  | Skein512'16 -> Multihash
  | Skein512'24 -> Multihash
  | Skein512'32 -> Multihash
  | Skein512'40 -> Multihash
  | Skein512'48 -> Multihash
  | Skein512'56 -> Multihash
  | Skein512'64 -> Multihash
  | Skein512'72 -> Multihash
  | Skein512'80 -> Multihash
  | Skein512'88 -> Multihash
  | Skein512'96 -> Multihash
  | Skein512'104 -> Multihash
  | Skein512'112 -> Multihash
  | Skein512'120 -> Multihash
  | Skein512'128 -> Multihash
  | Skein512'136 -> Multihash
  | Skein512'144 -> Multihash
  | Skein512'152 -> Multihash
  | Skein512'160 -> Multihash
  | Skein512'168 -> Multihash
  | Skein512'176 -> Multihash
  | Skein512'184 -> Multihash
  | Skein512'192 -> Multihash
  | Skein512'200 -> Multihash
  | Skein512'208 -> Multihash
  | Skein512'216 -> Multihash
  | Skein512'224 -> Multihash
  | Skein512'232 -> Multihash
  | Skein512'240 -> Multihash
  | Skein512'248 -> Multihash
  | Skein512'256 -> Multihash
  | Skein512'264 -> Multihash
  | Skein512'272 -> Multihash
  | Skein512'280 -> Multihash
  | Skein512'288 -> Multihash
  | Skein512'296 -> Multihash
  | Skein512'304 -> Multihash
  | Skein512'312 -> Multihash
  | Skein512'320 -> Multihash
  | Skein512'328 -> Multihash
  | Skein512'336 -> Multihash
  | Skein512'344 -> Multihash
  | Skein512'352 -> Multihash
  | Skein512'360 -> Multihash
  | Skein512'368 -> Multihash
  | Skein512'376 -> Multihash
  | Skein512'384 -> Multihash
  | Skein512'392 -> Multihash
  | Skein512'400 -> Multihash
  | Skein512'408 -> Multihash
  | Skein512'416 -> Multihash
  | Skein512'424 -> Multihash
  | Skein512'432 -> Multihash
  | Skein512'440 -> Multihash
  | Skein512'448 -> Multihash
  | Skein512'456 -> Multihash
  | Skein512'464 -> Multihash
  | Skein512'472 -> Multihash
  | Skein512'480 -> Multihash
  | Skein512'488 -> Multihash
  | Skein512'496 -> Multihash
  | Skein512'504 -> Multihash
  | Skein512'512 -> Multihash
  | Skein1024'8 -> Multihash
  | Skein1024'16 -> Multihash
  | Skein1024'24 -> Multihash
  | Skein1024'32 -> Multihash
  | Skein1024'40 -> Multihash
  | Skein1024'48 -> Multihash
  | Skein1024'56 -> Multihash
  | Skein1024'64 -> Multihash
  | Skein1024'72 -> Multihash
  | Skein1024'80 -> Multihash
  | Skein1024'88 -> Multihash
  | Skein1024'96 -> Multihash
  | Skein1024'104 -> Multihash
  | Skein1024'112 -> Multihash
  | Skein1024'120 -> Multihash
  | Skein1024'128 -> Multihash
  | Skein1024'136 -> Multihash
  | Skein1024'144 -> Multihash
  | Skein1024'152 -> Multihash
  | Skein1024'160 -> Multihash
  | Skein1024'168 -> Multihash
  | Skein1024'176 -> Multihash
  | Skein1024'184 -> Multihash
  | Skein1024'192 -> Multihash
  | Skein1024'200 -> Multihash
  | Skein1024'208 -> Multihash
  | Skein1024'216 -> Multihash
  | Skein1024'224 -> Multihash
  | Skein1024'232 -> Multihash
  | Skein1024'240 -> Multihash
  | Skein1024'248 -> Multihash
  | Skein1024'256 -> Multihash
  | Skein1024'264 -> Multihash
  | Skein1024'272 -> Multihash
  | Skein1024'280 -> Multihash
  | Skein1024'288 -> Multihash
  | Skein1024'296 -> Multihash
  | Skein1024'304 -> Multihash
  | Skein1024'312 -> Multihash
  | Skein1024'320 -> Multihash
  | Skein1024'328 -> Multihash
  | Skein1024'336 -> Multihash
  | Skein1024'344 -> Multihash
  | Skein1024'352 -> Multihash
  | Skein1024'360 -> Multihash
  | Skein1024'368 -> Multihash
  | Skein1024'376 -> Multihash
  | Skein1024'384 -> Multihash
  | Skein1024'392 -> Multihash
  | Skein1024'400 -> Multihash
  | Skein1024'408 -> Multihash
  | Skein1024'416 -> Multihash
  | Skein1024'424 -> Multihash
  | Skein1024'432 -> Multihash
  | Skein1024'440 -> Multihash
  | Skein1024'448 -> Multihash
  | Skein1024'456 -> Multihash
  | Skein1024'464 -> Multihash
  | Skein1024'472 -> Multihash
  | Skein1024'480 -> Multihash
  | Skein1024'488 -> Multihash
  | Skein1024'496 -> Multihash
  | Skein1024'504 -> Multihash
  | Skein1024'512 -> Multihash
  | Skein1024'520 -> Multihash
  | Skein1024'528 -> Multihash
  | Skein1024'536 -> Multihash
  | Skein1024'544 -> Multihash
  | Skein1024'552 -> Multihash
  | Skein1024'560 -> Multihash
  | Skein1024'568 -> Multihash
  | Skein1024'576 -> Multihash
  | Skein1024'584 -> Multihash
  | Skein1024'592 -> Multihash
  | Skein1024'600 -> Multihash
  | Skein1024'608 -> Multihash
  | Skein1024'616 -> Multihash
  | Skein1024'624 -> Multihash
  | Skein1024'632 -> Multihash
  | Skein1024'640 -> Multihash
  | Skein1024'648 -> Multihash
  | Skein1024'656 -> Multihash
  | Skein1024'664 -> Multihash
  | Skein1024'672 -> Multihash
  | Skein1024'680 -> Multihash
  | Skein1024'688 -> Multihash
  | Skein1024'696 -> Multihash
  | Skein1024'704 -> Multihash
  | Skein1024'712 -> Multihash
  | Skein1024'720 -> Multihash
  | Skein1024'728 -> Multihash
  | Skein1024'736 -> Multihash
  | Skein1024'744 -> Multihash
  | Skein1024'752 -> Multihash
  | Skein1024'760 -> Multihash
  | Skein1024'768 -> Multihash
  | Skein1024'776 -> Multihash
  | Skein1024'784 -> Multihash
  | Skein1024'792 -> Multihash
  | Skein1024'800 -> Multihash
  | Skein1024'808 -> Multihash
  | Skein1024'816 -> Multihash
  | Skein1024'824 -> Multihash
  | Skein1024'832 -> Multihash
  | Skein1024'840 -> Multihash
  | Skein1024'848 -> Multihash
  | Skein1024'856 -> Multihash
  | Skein1024'864 -> Multihash
  | Skein1024'872 -> Multihash
  | Skein1024'880 -> Multihash
  | Skein1024'888 -> Multihash
  | Skein1024'896 -> Multihash
  | Skein1024'904 -> Multihash
  | Skein1024'912 -> Multihash
  | Skein1024'920 -> Multihash
  | Skein1024'928 -> Multihash
  | Skein1024'936 -> Multihash
  | Skein1024'944 -> Multihash
  | Skein1024'952 -> Multihash
  | Skein1024'960 -> Multihash
  | Skein1024'968 -> Multihash
  | Skein1024'976 -> Multihash
  | Skein1024'984 -> Multihash
  | Skein1024'992 -> Multihash
  | Skein1024'1000 -> Multihash
  | Skein1024'1008 -> Multihash
  | Skein1024'1016 -> Multihash
  | Skein1024'1024 -> Multihash
  | PoseidonBls12'381A2FC1 -> Multihash
  | PoseidonBls12'381A2FC1SC -> Multihash
;;

(** [is_multiaddr codec] Returns `true` if codec [t] is of tag [Multiaddr]. *)
let is_multiaddr = function
  | Multiaddr -> true
  | _ -> false
;;

(** [is_multibase codec] Returns `true` if codec [t] is of tag [Multibase]. *)
let is_multibase = function
  | Multibase -> true
  | _ -> false
;;

(** [is_multicodec codec] Returns `true` if codec [t] is of tag [Multicodec]. *)
let is_multicodec = function
  | Multicodec -> true
  | _ -> false
;;

(** [is_multihash codec] Returns `true` if codec [t] is of tag [Multihash]. *)
let is_multihash = function
  | Multihash -> true
  | _ -> false
;;

(** [is_multiformat codec] Returns `true` if codec [t] is of tag
    [Multiformat]. *)
let is_multiformat = function
  | Multiformat -> true
  | _ -> false
;;

(** [is_key codec] Returns `true` if codec [t] is of tag [Key]. *)
let is_key = function
  | Key -> true
  | _ -> false
;;

(** [is_serialization codec] Returns `true` if codec [t] is of tag
    [Serialization]. *)
let is_serialization = function
  | Serialization -> true
  | _ -> false
;;

(** [is_ipld codec] Returns `true` if codec [t] is of tag [IPLD]. *)
let is_ipld = function
  | IPLD -> true
  | _ -> false
;;

(** [is_namespace codec] Returns `true` if codec [t] is of tag [Namespace]. *)
let is_namespace = function
  | Namespace -> true
  | _ -> false
;;
