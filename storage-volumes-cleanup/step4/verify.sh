#!/bin/bash

LOGFILE=/root/step4-verify.log
set -e

{
    date

    docker volume ls | grep -q dca-scratch
    docker images --filter dangling=true --format '{{.Repository}}' | grep -q '<none>'
    docker images dca-scratch-image:latest --format '{{.Repository}}' | grep -q dca-scratch-image

} >> "${LOGFILE}" 2>&1

echo "done"
