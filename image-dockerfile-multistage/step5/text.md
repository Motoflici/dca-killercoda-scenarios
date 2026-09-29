Tag the multi-stage image as both `dca-app:v1` and `dca-app:latest`.

<br>
<details><summary>Info</summary>
<br>

```plain
"docker tag" doesn't copy anything — it just points a new
repository:tag at an existing image ID. All three tags below will resolve
to the exact same image.

Documentation - https://docs.docker.com/reference/cli/docker/image/tag/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

```plain
docker tag dca-app:multistage dca-app:v1
```{{exec}}

```plain
docker tag dca-app:multistage dca-app:latest
```{{exec}}

<br>

Confirm all three tags share the same IMAGE ID:

<br>

```plain
docker images dca-app
```{{exec}}

</details>
