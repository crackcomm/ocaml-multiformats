(lang dune 2.7)

(formatting
 (enabled_for ocaml))

(authors "\197\129ukasz Kurowski")

(maintainers "crackcomm@gmail.com")

(generate_opam_files true)

(package
 (name multiformats)
 (synopsis "Multiformats package")
 (description "Self-describing protocols implementation")
 (depends
  (alcotest :with-test)
  (base
   (>= 0.9.3))
  (zarith
   (>= 1.10))))

(package
 (name multiformats.maddr)
 (synopsis "Multiaddr implementation")
 (description "Multiaddr \226\128\147 self-describing network addresses")
 (depends
  (alcotest :with-test)
  (base
   (>= 0.9.3))
  (ipaddr
   (>= 5.0))))

(package
 (name multiformats.mbase)
 (synopsis "Multibase implementation")
 (description "Multibase \226\128\147 self-describing base encodings")
 (depends
  (alcotest :with-test)
  (base
   (>= 0.9.3))
  (ppx_deriving
   (>= 5.1))))

(package
 (name multiformats.mhash)
 (synopsis "Multihash implementation")
 (description "Multihash \226\128\147 self-describing hashes")
 (depends
  (alcotest :with-test)
  (base
   (>= 0.9.3))
  (digestif
   (>= 0.9.0))
  (ppx_deriving
   (>= 5.1))))

(package
 (name multiformats.mcodec)
 (synopsis "Multicodec implementation")
 (description "Multicodec \226\128\147 self-describing serialization")
 (depends
  (alcotest :with-test)
  (base
   (>= 0.9.3))
  (ppx_deriving
   (>= 5.1))))
