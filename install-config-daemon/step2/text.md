Back up the current `daemon.json` (if any), then write a new one that sets:
* logging driver `local` with `max-size: 10m` and `max-file: 3`
* storage driver `overlay2` (explicit, even though it's already the default)

Validate the file's syntax *before* touching the running daemon.

<br>
<details><summary>Info</summary>
<br>

```plain
Invalid JSON in daemon.json prevents dockerd from starting at all — that
takes down every container on the host with no way to recover until it's
fixed. "dockerd --validate" checks the file without starting the daemon, so
you catch a typo before you restart, not after.

Documentation - https://docs.docker.com/reference/cli/dockerd/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Back up whatever's there now (or an empty placeholder if the file doesn't exist yet):

<br>

```plain
test -f /etc/docker/daemon.json && cp /etc/docker/daemon.json /etc/docker/daemon.json.bak || echo '{}' > /etc/docker/daemon.json.bak
```{{exec}}

<br>

Write the new configuration:

<br>

```plain
cat > /etc/docker/daemon.json <<'EOF'
{
  "log-driver": "local",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  },
  "storage-driver": "overlay2"
}
EOF
```{{exec}}

<br>

Validate it before restarting:

<br>

```plain
dockerd --validate --config-file /etc/docker/daemon.json
```{{exec}}

</details>
