## What you just proved

- Wrote a `Dockerfile` from scratch and built it with `docker build -t`.
- Read `docker history` to see that every instruction in a Dockerfile becomes
  its own layer, and that `FROM golang:1.23` alone accounts for most of a
  naive image's size (the full Go toolchain, not just your binary).
- Refactored to a **multi-stage build**: a `build` stage compiles the binary
  with `CGO_ENABLED=0`, then `COPY --from=build` pulls *only the binary* into
  a minimal `alpine` final stage — the compiler, source, and module cache
  never make it into the image you ship.
- Measured the size difference directly with `docker image inspect -f
  '{{.Size}}'` instead of eyeballing `docker images` output.
- Tagged one image ID under two tags (`:v1` and `:latest`) with `docker tag`,
  proving a tag is just a pointer, not a copy.

This maps directly to DCA exam domain 2, **Image Creation, Management, and
Registry (20%)**: the exam guide explicitly calls out "create a Docker image
using a Dockerfile," and multi-stage builds are the standard answer to its
"minimize image size" objectives. Combined with domain 1 (Orchestration,
25%), these two domains are almost half the exam.
