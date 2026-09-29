#!/bin/bash

LOGFILE=/root/step1-verify.log
set -e

{
    date

    docker info --format '{{json .SecurityOptions}}' | grep -qi seccomp
    docker run --rm alpine id | grep -q "uid=0"
    docker run --rm --cap-drop=ALL --cap-add=NET_BIND_SERVICE alpine sh -c "id; echo capdrop-ok" | grep -q capdrop-ok

} >> "${LOGFILE}" 2>&1

echo "done"
