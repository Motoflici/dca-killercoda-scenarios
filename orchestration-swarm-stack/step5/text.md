Deploy the stack from `/root/stack.yml` under the name `dca`.

<br>
<details><summary>Solution</summary>
<br>

Deploy the stack:

<br>

```plain
docker stack deploy -c /root/stack.yml dca
```{{exec}}

<br>

List the services that belong to it:

<br>

```plain
docker stack services dca
```{{exec}}

</details>
