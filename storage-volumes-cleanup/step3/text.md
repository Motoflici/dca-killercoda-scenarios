Find where `dca-vol` actually lives on the host filesystem, and read the
file directly from there — no container involved.

<br>
<details><summary>Info</summary>
<br>

```plain
Named volumes managed by the "local" driver live under
/var/lib/docker/volumes/<name>/_data on the host. "Mountpoint" in
"docker volume inspect" is exactly that path — useful for backups, but
you should generally still write to volumes through a container, not
directly on the host in production.

Documentation - https://docs.docker.com/engine/storage/volumes/#back-up-a-volume
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Print the volume's on-disk mountpoint:

<br>

```plain
docker volume inspect dca-vol --format '{{.Mountpoint}}'
```{{exec}}

<br>

Read the file straight from the host at that path:

<br>

```plain
cat $(docker volume inspect dca-vol --format '{{.Mountpoint}}')/msg.txt
```{{exec}}

</details>
