Recreate `web-a` publishing host port `8080` to container port `80`, and
confirm it's reachable from the host itself (not from inside another
container).

<br>
<details><summary>Info</summary>
<br>

```plain
"-p 8080:80" (or "--publish") maps a host port to a container port through
the userland proxy / iptables NAT rules — this is what actually exposes a
container to the outside world, as opposed to --network which only
controls reachability *between* containers.

Documentation - https://docs.docker.com/engine/network/tutorials/standalone/#use-the-default-bridge-network
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Remove and recreate `web-a` with a published port:

<br>

```plain
docker rm -f web-a
```{{exec}}

```plain
docker run -d --name web-a --network dca-bridge -p 8080:80 nginx:alpine
```{{exec}}

<br>

Reach it from the host:

<br>

```plain
curl localhost:8080
```{{exec}}

</details>
