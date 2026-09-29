#!/bin/bash

LOGFILE=/root/step1-verify.log
set -e

{
    date

    docker network ls | grep -q dca-bridge
    docker network inspect dca-bridge | grep -q web-a
    docker network inspect dca-bridge | grep -q web-b

} >> "${LOGFILE}" 2>&1

echo "done"
