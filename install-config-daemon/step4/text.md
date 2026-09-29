Confirm the new logging and storage driver are actually in effect — both for
the daemon itself and for a freshly started container.

<br>
<details><summary>Info</summary>
<br>

```plain
A restart having succeeded doesn't by itself prove the NEW settings are
live — you could have restarted with a stale or wrong file. Check
"docker info" (daemon-level) AND "docker inspect" on a new container
(container-level), which is what actually reflects the daemon's current
default LogConfig.

Documentation - https://docs.docker.com/engine/logging/configure/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Daemon-level check:

<br>

```plain
docker info --format 'Logging Driver: {{.LoggingDriver}}'
```{{exec}}

```plain
docker info --format 'Storage Driver: {{.Driver}}'
```{{exec}}

<br>

Container-level check — start a new container and inspect its log config:

<br>

```plain
docker run -d --name dca-logcheck alpine sleep 300
```{{exec}}

```plain
docker inspect dca-logcheck --format '{{.HostConfig.LogConfig.Type}}'
```{{exec}}

</details>
