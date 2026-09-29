Scale the `web` service up to 5 replicas.

<br>
<details><summary>Info</summary>
<br>

```plain
"docker service scale" only changes desired replica count — the scheduler does
the rest. You never manually start/stop the extra containers yourself.

Documentation - https://docs.docker.com/engine/swarm/swarm-tutorial/scale-service/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Scale the service:

<br>

```plain
docker service scale web=5
```{{exec}}

<br>

Confirm 5/5 replicas:

<br>

```plain
docker service ls
```{{exec}}

</details>
