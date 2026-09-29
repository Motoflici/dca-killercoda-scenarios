Inspect the layers of `dca-app:single` and note its total size.

<br>
<details><summary>Info</summary>
<br>

```plain
"docker history" prints one row per layer, in build order, with the
instruction that created it and the size it added. This is exactly how you
find *which* Dockerfile line is bloating an image.

Documentation - https://docs.docker.com/reference/cli/docker/image/history/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

```plain
docker history dca-app:single
```{{exec}}

<br>

Check the total image size:

<br>

```plain
docker images dca-app:single
```{{exec}}

<br>

> Notice how much of the size comes from the `golang:1.23` base layer alone —
> that's the entire Go compiler toolchain, which your running app never needs.

</details>
