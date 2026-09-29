Prune unused images and unused volumes — and confirm `dca-vol` (still
referenced by the running `dca-keepalive` container) survives both.

<br>
<details><summary>Info</summary>
<br>

```plain
"docker system prune" by default removes stopped containers, dangling
images, unused networks, and build cache — it does NOT touch volumes
unless you add --volumes, and it only removes DANGLING images unless you
add -a (all unused images).

"docker volume prune" by default only removes ANONYMOUS unused volumes.
Named volumes (like dca-scratch) need the --all flag too.

Neither command ever removes something a container still references —
that's what protects dca-vol here.

Documentation - https://docs.docker.com/engine/manage-resources/pruning/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Clear dangling images (and other default system-prune targets):

<br>

```plain
docker system prune --force
```{{exec}}

<br>

Clear unused volumes, including named ones:

<br>

```plain
docker volume prune --all --force
```{{exec}}

<br>

Confirm the dangling image is gone but the tagged one remains:

<br>

```plain
docker images | grep dca-scratch-image
```{{exec}}

<br>

Confirm `dca-scratch` is gone but `dca-vol` survived:

<br>

```plain
docker volume ls
```{{exec}}

</details>
