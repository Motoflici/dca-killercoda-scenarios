Create a swarm service named `web`:
* use image `nginx:alpine`
* run 3 replicas
* publish host port `8080` to container port `80`

<br>
<details><summary>Info</summary>
<br>

```plain
A swarm "service" is a declarative desired state (image, replica count, ports,
...) that the swarm scheduler continuously reconciles against. This is
different from "docker run", which just starts one container with no
reconciliation.

Documentation - https://docs.docker.com/engine/swarm/how-swarm-mode-works/services/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Create the service:

<br>

```plain
docker service create --name web --replicas 3 --publish published=8080,target=80 nginx:alpine
```{{exec}}

<br>

List services and confirm 3/3 replicas are up:

<br>

```plain
docker service ls
```{{exec}}

<br>

List the individual tasks (containers) behind the service:

<br>

```plain
docker service ps web
```{{exec}}

</details>
