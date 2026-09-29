Install the Docker Scout CLI plugin and run a quick vulnerability overview
against an image.

<br>
<details><summary>Info</summary>
<br>

```plain
"docker scan" (Snyk-powered) was retired. Docker Scout is the current
scanning tool, ships built into Docker Desktop, but is NOT preinstalled on
a plain Docker Engine host like this one — it has to be installed as a CLI
plugin first. Anonymous scans work fine against public images without
logging in to Docker Hub.

Documentation - https://docs.docker.com/scout/quickstart/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Install the plugin:

<br>

```plain
curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s --
```{{exec}}

<br>

Confirm it installed:

<br>

```plain
docker scout version
```{{exec}}

<br>

Pull an older base image to scan and run a quickview:

<br>

```plain
docker pull python:3.9
```{{exec}}

```plain
docker scout quickview python:3.9
```{{exec}}

</details>
