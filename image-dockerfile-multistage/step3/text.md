Refactor `/root/app/Dockerfile` into a **multi-stage build**: compile in a
`build` stage using `golang:1.23`, then copy only the resulting binary into a
minimal `alpine:3.20` final stage. Build the result as `dca-app:multistage`.

<br>
<details><summary>Info</summary>
<br>

```plain
A multi-stage Dockerfile has more than one FROM line. Each FROM starts a new,
independent stage. "COPY --from=<stage>" pulls files from an earlier stage
into the current one. Only the LAST stage becomes the final image — every
earlier stage (compiler, source, build cache) is discarded.

Documentation - https://docs.docker.com/build/building/multi-stage/
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
CGO_ENABLED=0 produces a statically linked binary with no dynamic glibc
dependency, so it will actually run on the minimal alpine base.
```

</details>

<br>
<details><summary>Solution</summary>
<br>

```plain
cat > /root/app/Dockerfile <<'EOF'
# ---- build stage ----
FROM golang:1.23 AS build
WORKDIR /app
COPY go.mod main.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o server .

# ---- final stage ----
FROM alpine:3.20
COPY --from=build /app/server /server
EXPOSE 8080
CMD ["/server"]
EOF
```{{exec}}

<br>

Build it:

<br>

```plain
docker build -t dca-app:multistage /root/app
```{{exec}}

</details>
