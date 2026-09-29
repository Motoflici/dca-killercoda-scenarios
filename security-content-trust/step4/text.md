Run a targeted CVE scan filtered to critical/high severity, then compare the
same scan against a newer, slimmer base image for the same job.

<br>
<details><summary>Info</summary>
<br>

```plain
"docker scout cves" lists every known CVE for an image; --only-severity
lets you filter the noise down to what you'd actually act on. Comparing
two base images this way is a real, everyday decision: fewer packages in
the base image (a "-slim" variant, or a newer release) usually means fewer
CVEs to carry.

Documentation - https://docs.docker.com/reference/cli/docker/scout/cves/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Scan the older base image, critical/high only:

<br>

```plain
docker scout cves --only-severity critical,high python:3.9
```{{exec}}

<br>

Pull a newer, slimmer alternative and scan it the same way:

<br>

```plain
docker pull python:3.12-slim
```{{exec}}

```plain
docker scout cves --only-severity critical,high python:3.12-slim
```{{exec}}

</details>
