Compare the size of `dca-app:single` vs `dca-app:multistage`, then run the
multi-stage image and confirm it still serves requests.

<br>
<details><summary>Solution</summary>
<br>

List both images side by side:

<br>

```plain
docker images | grep dca-app
```{{exec}}

<br>

Run the multi-stage image:

<br>

```plain
docker run -d --name dca-multistage -p 8082:8080 dca-app:multistage
```{{exec}}

<br>

Confirm it responds:

<br>

```plain
curl localhost:8082
```{{exec}}

</details>
