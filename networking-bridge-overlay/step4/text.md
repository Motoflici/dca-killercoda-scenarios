Inspect `dca-bridge` and read out each attached container's name and IP
address.

<br>
<details><summary>Solution</summary>
<br>

Full inspect output:

<br>

```plain
docker network inspect dca-bridge
```{{exec}}

<br>

Just the name + IP of each attached container:

<br>

```plain
docker network inspect dca-bridge --format '{{range .Containers}}{{.Name}} {{.IPv4Address}}{{"\n"}}{{end}}'
```{{exec}}

</details>
