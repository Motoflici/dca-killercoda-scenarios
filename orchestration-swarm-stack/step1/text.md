Initialize Docker in swarm mode on this node, so it becomes a manager (the **Leader**).

<br>
<details><summary>Info</summary>
<br>

```plain
"docker swarm init" turns the local Engine into a one-node swarm and makes it a
manager. --advertise-addr tells other (future) nodes which address/interface to
join through; passing the interface name (eth0) avoids ambiguity on multi-homed
hosts, which is exactly the kind of detail the exam likes to test.

Documentation - https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
"docker node ls" lists every node in the swarm along with its role and
availability. On a fresh single-node swarm you should see exactly one row,
marked as Leader under MANAGER STATUS.
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Initialize the swarm:

<br>

```plain
docker swarm init --advertise-addr eth0
```{{exec}}

<br>

Confirm this node is now the manager/leader:

<br>

```plain
docker node ls
```{{exec}}

<br>

Confirm swarm mode is active:

<br>

```plain
docker info --format 'Swarm: {{.Swarm.LocalNodeState}}'
```{{exec}}

</details>
