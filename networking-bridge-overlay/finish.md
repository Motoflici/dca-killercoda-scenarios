## What you just proved

- `docker network create` — created a user-defined bridge network (the
  default driver is `bridge`, so no `--driver` flag was even required).
- Two containers on that network resolved each other **by container name**
  (`curl web-b` worked) — this is the embedded DNS server every
  user-defined network gets, which the *default* `bridge` network does
  **not** provide (name resolution there requires `--link`, which is
  deprecated).
- Published a container's port to the host with `-p 8080:80` and reached it
  from outside the container via `curl localhost:8080`.
- `docker network inspect` — read a network's IPAM config and exactly which
  containers are attached to it, with their assigned IPs.
- Put the node into swarm mode and created an **overlay** network
  (`docker network create -d overlay`), then attached a swarm service to it —
  the same DNS-discovery and inspection mechanics you just used on the
  bridge network apply here too, just spanning (potentially) multiple hosts.

This maps directly to DCA exam domain 4, **Networking (15%)**: the exam guide
explicitly lists identifying/using network drivers (bridge, overlay, host,
none, macvlan) and troubleshooting container network connectivity, which is
exactly what publishing a port and inspecting a network are for.
