Put this node into swarm mode, create an **overlay** network named
`dca-overlay`, and attach a 2-replica swarm service to it.

<br>
<details><summary>Info</summary>
<br>

```plain
"overlay" is the swarm-mode equivalent of a user-defined bridge network:
same embedded DNS, same per-container IP allocation, but it spans every
node in the swarm instead of being confined to one host. --attachable lets
plain "docker run" containers join it too, not just swarm service tasks.

Documentation - https://docs.docker.com/engine/network/drivers/overlay/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Enable swarm mode (skip if you already ran this in another lab on this node):

<br>

```plain
docker swarm init --advertise-addr eth0
```{{exec}}

<br>

Create the overlay network:

<br>

```plain
docker network create -d overlay --attachable dca-overlay
```{{exec}}

<br>

Attach a service to it:

<br>

```plain
docker service create --name overlay-web --network dca-overlay --replicas 2 nginx:alpine
```{{exec}}

<br>

Inspect the network and the service's tasks:

<br>

```plain
docker network inspect dca-overlay
```{{exec}}

```plain
docker service ps overlay-web
```{{exec}}

</details>
