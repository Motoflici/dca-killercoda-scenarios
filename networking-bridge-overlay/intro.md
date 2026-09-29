## DCA Exam Domain: Networking (15% of the exam)

The exam expects you to know the difference between the **default bridge**
network (no embedded DNS, containers only reach each other by IP), a
**user-defined bridge** network (embedded DNS, containers resolve each other
by name), and an **overlay** network (the bridge equivalent for multi-host
swarm services). This lab builds all three network shapes and proves the
DNS-resolution difference directly, rather than just describing it.

**Time:** ~20 minutes. **Steps:** 5.

You'll finish having proven: `docker network create`, container-to-container
DNS discovery on a user-defined bridge, publishing a port to the host,
`docker network inspect`, and creating an attachable overlay network for a
swarm service.
