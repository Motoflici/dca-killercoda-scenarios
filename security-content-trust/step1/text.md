Inspect the Engine's default security options, confirm what user a container
runs as by default, and run a container with a reduced Linux capability set.

<br>
<details><summary>Info</summary>
<br>

```plain
By default a container's main process runs as root INSIDE the container's
user namespace, and gets Docker's default capability set (a subset of the
full root capability list, but still broad). "--cap-drop=ALL" followed by
selectively adding back only what's needed is the standard least-privilege
pattern the exam expects.

Documentation - https://docs.docker.com/engine/containers/run/#runtime-privilege-and-linux-capabilities
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Read the Engine's security options:

<br>

```plain
docker info --format '{{json .SecurityOptions}}'
```{{exec}}

<br>

Confirm the default user inside a container:

<br>

```plain
docker run --rm alpine id
```{{exec}}

<br>

Run a container with every capability dropped except the one it actually needs:

<br>

```plain
docker run --rm --cap-drop=ALL --cap-add=NET_BIND_SERVICE alpine sh -c "id; echo capdrop-ok"
```{{exec}}

</details>
