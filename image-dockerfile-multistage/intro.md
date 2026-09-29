## DCA Exam Domain: Image Creation, Management, and Registry (20% of the exam)

This lab builds a tiny Go web app twice: once as a naive single-stage image
(everything, including the whole Go toolchain, ships in the final image), and
once as a multi-stage build (only the compiled binary ships). You'll inspect
`docker history` to see exactly what each `Dockerfile` instruction cost you in
layer size, then measure the real difference multi-stage builds make.

**Time:** ~20 minutes. **Steps:** 5.

You'll finish having proven: writing a Dockerfile, building an image, reading
`docker history`, converting to a multi-stage build with `COPY --from`, and
tagging an image with multiple tags.
