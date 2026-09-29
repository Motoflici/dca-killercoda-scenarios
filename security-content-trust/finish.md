## What you just proved

- `docker info --format '{{json .SecurityOptions}}'` — read which kernel-level
  isolation mechanisms (seccomp, AppArmor, ...) the Engine enforces by
  default, and confirmed containers run as **root inside the container
  namespace** unless told otherwise (`id` returned `uid=0`).
- `--cap-drop=ALL --cap-add=NET_BIND_SERVICE` — the standard pattern for
  running a container with the minimum Linux capabilities it actually needs,
  instead of the full default set.
- Enabled Content Trust (`DOCKER_CONTENT_TRUST=1`) and used `docker trust
  inspect --pretty` to read a signed image's trust metadata — who signed it,
  and which key. With trust enabled, `docker pull`/`docker run` refuse
  images that have no valid signature, which is the actual security
  guarantee (not signing itself, but *enforcement* at pull time).
- Installed **Docker Scout** (the successor to the retired `docker scan`)
  and ran `docker scout quickview` for a fast pass/fail read on an image.
- Ran `docker scout cves --only-severity critical,high` against two
  different base images for the same job, and used the result to justify
  swapping to the smaller/newer one — fewer packages generally means fewer
  CVEs, which is the practical link between domain 2 (image size) and
  domain 5 (security).

This maps directly to DCA exam domain 5, **Security (15%)**: "describe the
Engine's default security posture," "configure and use Content Trust," and
"identify vulnerabilities in an image" are exam-guide objectives, in that
order, and that's exactly the sequence this lab walked.
