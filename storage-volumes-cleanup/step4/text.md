Create two things worth pruning: an **unused named volume** and a
**dangling image**.

<br>
<details><summary>Info</summary>
<br>

```plain
A dangling image (shown as <none>:<none>) is a real, disk-consuming image
that no longer has a tag pointing at it — typically left behind when you
rebuild the same tag with new content. Building the same tag twice below
recreates this on purpose so you have something real to prune next.
```

</details>

<br>
<details><summary>Solution</summary>
<br>

An unused volume (nothing will ever mount this one):

<br>

```plain
docker volume create dca-scratch
```{{exec}}

<br>

Build an image, then rebuild the same tag with different content so the
first build's image becomes dangling:

<br>

```plain
mkdir -p /root/scratch-image
```{{exec}}

```plain
cat > /root/scratch-image/Dockerfile <<'EOF'
FROM alpine
RUN echo v1
EOF
```{{exec}}

```plain
docker build -t dca-scratch-image:latest /root/scratch-image
```{{exec}}

```plain
cat > /root/scratch-image/Dockerfile <<'EOF'
FROM alpine
RUN echo v2
EOF
```{{exec}}

```plain
docker build -t dca-scratch-image:latest /root/scratch-image
```{{exec}}

<br>

Confirm you now have a dangling image:

<br>

```plain
docker images --filter dangling=true
```{{exec}}

</details>
