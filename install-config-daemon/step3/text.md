Restart the Docker daemon so it picks up the new `daemon.json`, and confirm
it comes back healthy.

<br>
<details><summary>Solution</summary>
<br>

```plain
systemctl restart docker
```{{exec}}

<br>

Confirm the service is active:

<br>

```plain
systemctl status docker --no-pager
```{{exec}}

<br>

Confirm the client can talk to it again:

<br>

```plain
docker version
```{{exec}}

</details>
