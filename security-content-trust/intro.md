## DCA Exam Domain: Security (15% of the exam)

This lab covers three things the exam guide asks for by name: the Engine's
**default security posture** (what isolation you get with zero extra
configuration), **Content Trust** (cryptographically verifying image
publishers before you pull/run), and **image vulnerability scanning**.

A note on tooling: the exam guide predates it, but `docker scan` was
retired — **Docker Scout** is the current, actively maintained scanning tool
and is what this lab uses; it isn't preinstalled on plain Docker Engine
(only on Docker Desktop), so step 3 installs it as a CLI plugin first.

**Time:** ~20 minutes. **Steps:** 4.

You'll finish having proven: reading Engine security options, dropping Linux
capabilities, enabling Content Trust and reading signed-image trust data with
`docker trust inspect`, and scanning an image for CVEs with `docker scout`.
