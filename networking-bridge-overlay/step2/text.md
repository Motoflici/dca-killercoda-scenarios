From `web-a`, reach `web-b` **by container name** and confirm the request
succeeds.

<br>
<details><summary>Info</summary>
<br>

```plain
Every user-defined bridge network gets an embedded DNS server, so
containers on it resolve each other by name automatically. This is NOT
true of the default "bridge" network — there, name resolution between
containers doesn't work unless you use the deprecated --link flag.
```

</details>

<br>
<details><summary>Solution</summary>
<br>

```plain
docker exec web-a sh -c "curl -sS web-b | grep 'Welcome to nginx'"
```{{exec}}

<br>

Confirm the name actually resolves (not just that curl happened to work):

<br>

```plain
docker exec web-a getent hosts web-b
```{{exec}}

</details>
