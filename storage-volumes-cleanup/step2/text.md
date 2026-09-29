Read the file back from a **second, brand-new** container that also mounts
`dca-vol` — proving the data lives on the volume, not on `dca-keepalive`'s
writable layer.

<br>
<details><summary>Solution</summary>
<br>

```plain
docker run --rm -v dca-vol:/data alpine cat /data/msg.txt
```{{exec}}

</details>
