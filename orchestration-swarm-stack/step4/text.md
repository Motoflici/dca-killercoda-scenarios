Write a stack file at `/root/stack.yml` describing two services:
* `web` — image `nginx:alpine`, 3 replicas, host port `8081` mapped to container port `80`
* `cache` — image `redis:alpine`, 1 replica

<br>
<details><summary>Info</summary>
<br>

```plain
A "stack" is a group of services deployed together from a Compose file using the
"deploy:" key (replicas, resources, placement, ...). It's the standard way to
describe a multi-service swarm application as one versioned file instead of a
sequence of "docker service create" commands.

Documentation - https://docs.docker.com/engine/swarm/stack-deploy/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Write the stack file:

<br>

```plain
cat > /root/stack.yml <<'EOF'
version: "3.8"
services:
  web:
    image: nginx:alpine
    deploy:
      replicas: 3
    ports:
      - "8081:80"
  cache:
    image: redis:alpine
    deploy:
      replicas: 1
EOF
```{{exec}}

<br>

Review it:

<br>

```plain
cat /root/stack.yml
```{{exec}}

</details>
