#!/bin/bash

LOGFILE=/root/step4-verify.log
set -e

{
    date

    docker network inspect dca-bridge --format '{{range .Containers}}{{.Name}}{{"\n"}}{{end}}' | grep -q web-a
    docker network inspect dca-bridge --format '{{range .Containers}}{{.Name}}{{"\n"}}{{end}}' | grep -q web-b

} >> "${LOGFILE}" 2>&1

echo "done"
