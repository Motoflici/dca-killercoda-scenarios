## DCA Exam Domain: Orchestration (25% of the exam — the single largest domain)

This lab covers the swarm-mode objectives from the Docker Certified Associate exam guide:
initializing a swarm, creating and scaling services, and deploying a multi-service
application from a stack (Compose) file.

You get **one** live node for this lab, and it will act as the swarm manager. Every
command below is identical to what you'd run against a real multi-node swarm — in
production you'd run `docker swarm join` on additional hosts using the token that
`docker swarm init` prints, then the exact same `docker service` / `docker stack`
commands would schedule tasks across all of them. The scheduler, service, and stack
concepts you're about to use don't change with node count.

**Time:** ~20 minutes. **Steps:** 6.

You'll finish having proven: swarm init, `docker service create`, `docker service scale`,
writing a stack YAML file, `docker stack deploy`, and inspecting state with
`docker service ps` / `docker stack ps`.
