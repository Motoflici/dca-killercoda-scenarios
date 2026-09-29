## What you just proved

- `docker swarm init` — turned a single Docker Engine into a swarm manager (node
  `Leader` in `docker node ls`).
- `docker service create --replicas` — declared desired state for a replicated
  service instead of manually running containers.
- `docker service scale` — changed desired replica count without touching the
  service definition.
- Wrote a **stack file** (Compose v3 syntax under `deploy:`) describing multiple
  services as one deployable unit.
- `docker stack deploy -c` — deployed the whole stack in one command; the swarm
  scheduler reconciled actual state to match it.
- `docker service ps` / `docker stack ps` — inspected *where* and *how* tasks are
  actually running, which is what you use to debug a service that won't converge.

This maps directly to DCA exam domain 1, **Orchestration (25%)**: initializing swarm,
creating/scaling/inspecting services, and deploying stacks are explicitly listed exam
objectives. On the real exam, expect questions on rolling updates
(`docker service update --image`), placement constraints, and swarm node management
(`docker node promote` / `drain`) — those build directly on the mechanics you used
here.
