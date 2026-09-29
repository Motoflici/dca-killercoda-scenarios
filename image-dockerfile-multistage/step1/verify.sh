#!/bin/bash

LOGFILE=/root/step1-verify.log
set -e

{
    date

    docker images dca-app:single --format '{{.Repository}}' | grep -q dca-app
    grep -q "FROM golang" /root/app/Dockerfile

} >> "${LOGFILE}" 2>&1

echo "done"
