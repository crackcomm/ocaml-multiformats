# ocaml-multiformats

OCaml implementation of multiformats

* cid
* multiaddr (partial)
* mutlibase (base58, base32)
* multicodec
* multihash (decoding)

## Concourse pipeline

In order to continously test this project during development we use concourse.

Example configuration file `concourse-config.yml`:

```sh
registry:
  address: 127.0.0.1:5000
```

To deploy the concourse pipeline you can use the following command:

```sh
fly -t oss set-pipeline --team oss -p ocaml-multiformats -c concourse.yml -l concourse-config.yml
```

## License

See `COPYING.txt` file in each directory.
