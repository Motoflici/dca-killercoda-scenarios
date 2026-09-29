#!/bin/bash

LOGFILE=/root/step3-verify.log
set -e

{
    date

    grep -q "AS build" /root/app/Dockerfile
    grep -q "COPY --from=build" /root/app/Dockerfile
    docker images dca-app:multistage --format '{{.Repository}}' | grep -q dca-app

} >> "${LOGFILE}" 2>&1

echo "done"
