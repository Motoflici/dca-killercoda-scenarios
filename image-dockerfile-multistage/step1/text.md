Create a tiny Go HTTP app in `/root/app`, write a single-stage `Dockerfile` for
it that uses the full `golang:1.23` image as its base, and build it as
`dca-app:single`.

<br>
<details><summary>Info</summary>
<br>

```plain
Dockerfile: list of instructions an image is built from.
Image: the built artifact (layers + metadata).
Container: a running instance of an image.

Documentation - https://docs.docker.com/reference/dockerfile/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Create the app files:

<br>

```plain
mkdir -p /root/app
```{{exec}}

```plain
cat > /root/app/go.mod <<'EOF'
module dca-demo

go 1.23
EOF
```{{exec}}

```plain
cat > /root/app/main.go <<'EOF'
package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "Hello from the DCA image lab!")
	})
	http.ListenAndServe(":8080", nil)
}
EOF
```{{exec}}

<br>

Write the single-stage Dockerfile:

<br>

```plain
cat > /root/app/Dockerfile <<'EOF'
FROM golang:1.23
WORKDIR /app
COPY go.mod main.go ./
RUN go build -o server .
EXPOSE 8080
CMD ["./server"]
EOF
```{{exec}}

<br>

Build it:

<br>

```plain
docker build -t dca-app:single /root/app
```{{exec}}

</details>
