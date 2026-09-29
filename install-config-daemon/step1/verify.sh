#!/bin/bash

LOGFILE=/root/step1-verify.log
set -e

{
    date

    docker info --format '{{.LoggingDriver}}'
    docker info --format '{{.Driver}}'

} >> "${LOGFILE}" 2>&1

echo "done"
