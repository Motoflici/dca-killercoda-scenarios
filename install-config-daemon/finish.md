## What you just proved

- `docker info` — read the Engine's *live* configuration (logging driver,
  storage driver, and a lot more) rather than guessing from `daemon.json`
  alone; the two can and do drift out of sync until you restart.
- Edited `/etc/docker/daemon.json` to set an explicit `log-driver`, `log-opts`,
  and `storage-driver` — the file the exam expects you to know how to use for
  every engine-wide setting that isn't a per-`docker run` flag.
- Validated the file with `dockerd --validate --config-file` *before*
  restarting — invalid JSON in `daemon.json` prevents the daemon from
  starting at all and takes every container on the host down with it, so this
  step is not optional in production.
- Restarted the daemon with `systemctl restart docker` and confirmed it came
  back healthy.
- Verified the change with `docker info --format` and `docker inspect
  --format '{{.HostConfig.LogConfig.Type}}'` on a freshly started container —
  proving the new default actually applies to new containers, not just that
  the file parses.

This maps directly to DCA exam domain 3, **Installation and Configuration
(15%)**: the exam guide explicitly lists "configure logging drivers" and
"troubleshoot the Docker daemon" as objectives, and this is exactly that
workflow end to end.
