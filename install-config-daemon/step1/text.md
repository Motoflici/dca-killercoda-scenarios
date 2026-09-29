Inspect the Engine's current logging driver and storage driver before
changing anything.

<br>
<details><summary>Info</summary>
<br>

```plain
"docker info" reports the live, in-effect configuration of the running
daemon — not just what's written in daemon.json. Once you edit the file in
the next step, these values won't change until the daemon actually restarts.

Documentation - https://docs.docker.com/reference/cli/docker/info/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Full engine info:

<br>

```plain
docker info
```{{exec}}

<br>

Just the two settings this lab changes:

<br>

```plain
docker info --format 'Logging Driver: {{.LoggingDriver}}'
```{{exec}}

```plain
docker info --format 'Storage Driver: {{.Driver}}'
```{{exec}}

</details>
