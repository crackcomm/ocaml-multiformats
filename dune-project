(lang dune 2.7)

(name multiformats)

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
  (stdint
    (>= 0.7.0))
  (core
    (>= 0.14.2))
  (digestif
    (>= 1.1.0))
  (ppx_deriving
    (>= 5.1))))
