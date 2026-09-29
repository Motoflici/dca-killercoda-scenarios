Create a named volume `dca-vol`, then start a long-running container attached
to it (this container stays up for the whole lab, so the volume is never
"unused"). Write a file into the volume from that container.

<br>
<details><summary>Info</summary>
<br>

```plain
A named volume exists independently of any container. Mounting it into a
long-running container here also matters for the pruning steps later —
prune only ever removes volumes that no container (running OR stopped)
currently references.

Documentation - https://docs.docker.com/engine/storage/volumes/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Create the volume:

<br>

```plain
docker volume create dca-vol
```{{exec}}

<br>

Start a container that keeps it mounted for the rest of the lab:

<br>

```plain
docker run -d --name dca-keepalive -v dca-vol:/data alpine sleep 3600
```{{exec}}

<br>

Write data into the volume:

<br>

```plain
docker exec dca-keepalive sh -c "echo 'hello from writer' > /data/msg.txt"
```{{exec}}

</details>
