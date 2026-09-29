## What you just proved

- `docker volume create` — created a named volume independent of any
  container's lifecycle.
- Wrote data to the volume from one container and read the *exact same
  data* back from an entirely different container — the core promise of a
  named volume over a container's writable layer.
- `docker volume inspect --format '{{.Mountpoint}}'` — found the volume's
  real path on the host filesystem, and read the file directly from there
  to prove it's not a copy.
- Deliberately created cleanup candidates: an unused named volume
  (`dca-scratch`) and a **dangling image** (`<none>:<none>`, produced by
  rebuilding the same tag twice — the old image loses its tag and becomes
  dangling instead of disappearing).
- `docker system prune --force` removed the dangling image (system prune's
  default scope: stopped containers, dangling images, unused networks,
  build cache — **not** volumes, and not all unused images, unless you pass
  `--volumes` / `-a`).
- `docker volume prune --all --force` removed the unused *named* volume
  (plain `docker volume prune` only touches anonymous volumes — `--all` is
  required for named ones) while `dca-vol` **survived**, because a
  still-running container (`dca-keepalive`) referenced it — prune only ever
  removes what's truly unreferenced.

This maps directly to DCA exam domain 6, **Storage and Volumes (10%)**:
creating/mounting volumes, locating them on the host, and safely reclaiming
disk space are explicit exam-guide objectives.
