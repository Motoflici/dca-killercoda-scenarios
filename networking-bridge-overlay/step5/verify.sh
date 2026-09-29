#!/bin/bash

LOGFILE=/root/step5-verify.log
set -e

{
    date

    docker network inspect dca-overlay --format '{{.Driver}}' | grep -q overlay
    sleep 5
    test "$(docker service ps overlay-web --filter 'desired-state=running' -q | wc -l)" -eq 2

} >> "${LOGFILE}" 2>&1

echo "done"
