## DCA Exam Domain: Installation and Configuration (15% of the exam)

`/etc/docker/daemon.json` is the file the exam expects you to know cold: it's
how you configure the Engine itself — logging driver, storage driver, insecure
registries, default address pools, and more — without touching the systemd
unit or passing flags by hand. This lab edits it, restarts the daemon safely,
and proves the new configuration is actually what's running (not just what's
on disk).

**Time:** ~15 minutes. **Steps:** 4.

You'll finish having proven: reading engine config via `docker info`, editing
`daemon.json`, validating it *before* you bounce the daemon, restarting it,
and confirming the new logging and storage driver are live.
