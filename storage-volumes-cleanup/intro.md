## DCA Exam Domain: Storage and Volumes (10% of the exam)

Named volumes are Docker's answer to "data that must outlive any single
container." This lab creates one, writes to it from one container, reads it
back from a completely different container, and proves it's the exact same
data on disk — then deliberately creates some unused images and volumes so
you can prune them safely, without touching anything still in use.

**Time:** ~15-20 minutes. **Steps:** 5.

You'll finish having proven: `docker volume create`, sharing a volume across
containers, finding a volume's real path on the host with `docker volume
inspect`, and the difference between `docker system prune` and `docker
volume prune --all` — including why an in-use volume survives both.
