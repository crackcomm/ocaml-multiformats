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
  (core
   (>= 0.9.3))
  (ipaddr
   (>= 5.0))
  (ppx_deriving
   (>= 5.1))
  (digestif
   (>= 0.9.0))
  (ppx_deriving
   (>= 5.1))))
