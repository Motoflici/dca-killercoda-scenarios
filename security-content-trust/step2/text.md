Enable Docker Content Trust, pull a **signed** demo image, and read its trust
metadata.

<br>
<details><summary>Info</summary>
<br>

```plain
Docker Content Trust (DCT) uses The Update Framework (Notary) to sign image
tags. With DOCKER_CONTENT_TRUST=1 set, "docker pull"/"docker run"/
"docker build" only accept tags that have valid, current trust data —
anything unsigned is refused outright, which is the actual security value
(publisher verification enforced at pull time, not just available).

Documentation - https://docs.docker.com/engine/security/trust/
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Once DOCKER_CONTENT_TRUST=1 is exported, EVERY pull in this shell will be
checked against trust data — including images without any, which will fail
with "no trust data for <tag>". That's expected: it's the enforcement
working as designed. Remember to unset it once you're done here, or later
steps that pull ordinary unsigned images will fail.
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Enable Content Trust:

<br>

```plain
export DOCKER_CONTENT_TRUST=1
```{{exec}}

<br>

Pull a known-signed demo image (Docker's own trust-enabled test repo):

<br>

```plain
docker pull docker/trusttest:latest
```{{exec}}

<br>

Read its signers and signed digest:

<br>

```plain
docker trust inspect --pretty docker/trusttest:latest
```{{exec}}

<br>

Turn enforcement back off before moving on — the rest of this lab pulls
ordinary unsigned images:

<br>

```plain
unset DOCKER_CONTENT_TRUST
```{{exec}}

</details>
