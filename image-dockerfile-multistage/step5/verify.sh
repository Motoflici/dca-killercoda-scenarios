#!/bin/bash

LOGFILE=/root/step5-verify.log
set -e

{
    date

    MULTI_ID=$(docker image inspect dca-app:multistage --format '{{.Id}}')
    V1_ID=$(docker image inspect dca-app:v1 --format '{{.Id}}')
    LATEST_ID=$(docker image inspect dca-app:latest --format '{{.Id}}')

    test "${MULTI_ID}" = "${V1_ID}"
    test "${MULTI_ID}" = "${LATEST_ID}"

} >> "${LOGFILE}" 2>&1

echo "done"
