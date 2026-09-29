#!/bin/bash

LOGFILE=/root/step4-verify.log
set -e

{
    date

    SINGLE_SIZE=$(docker image inspect dca-app:single --format '{{.Size}}')
    MULTI_SIZE=$(docker image inspect dca-app:multistage --format '{{.Size}}')
    echo "single=${SINGLE_SIZE} multistage=${MULTI_SIZE}"
    test "${MULTI_SIZE}" -lt "${SINGLE_SIZE}"

    docker ps | grep dca-multistage
    curl -sS localhost:8082 | grep "Hello from the DCA image lab"

} >> "${LOGFILE}" 2>&1

echo "done"
