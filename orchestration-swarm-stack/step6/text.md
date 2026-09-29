Inspect the stack's running tasks two ways: at the stack level and at the
service level.

<br>
<details><summary>Info</summary>
<br>

```plain
"docker stack ps <stack>" lists every task across every service in the stack —
your first stop when a stack won't converge. "docker service ps <service>" drills
into one service and shows its individual task history, including past failed
attempts, which is exactly what you inspect to diagnose a crash-looping task.

Documentation - https://docs.docker.com/reference/cli/docker/stack/ps/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Every task in the stack:

<br>

```plain
docker stack ps dca
```{{exec}}

<br>

Just the `web` service's tasks:

<br>

```plain
docker service ps dca_web
```{{exec}}

<br>

Just the `cache` service's tasks:

<br>

```plain
docker service ps dca_cache
```{{exec}}

</details>
