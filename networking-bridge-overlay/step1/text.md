Create a custom bridge network named `dca-bridge`, then run two containers
attached to it:
* `web-a` — image `nginx:alpine`
* `web-b` — image `nginx:alpine`

<br>
<details><summary>Info</summary>
<br>

```plain
"bridge" is already the default driver, so "--driver bridge" is implicit
here — shown explicitly below purely for clarity.

Documentation - https://docs.docker.com/engine/network/tutorials/standalone/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

```plain
docker network create --driver bridge dca-bridge
```{{exec}}

```plain
docker run -d --name web-a --network dca-bridge nginx:alpine
```{{exec}}

```plain
docker run -d --name web-b --network dca-bridge nginx:alpine
```{{exec}}

</details>
