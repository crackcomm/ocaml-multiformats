FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -qy opam pkg-config && rm -rf /var/lib/apt/lists/
RUN opam init -a --disable-sandboxing && \
  opam install -y dune alcotest digestif core stdint mustache csv csv-lwt lwt cohttp-lwt-unix conduit-lwt-unix ppx_deriving
RUN echo "eval \$(opam env)" >> /root/.bashrc
CMD ["dune", "runtest"]
