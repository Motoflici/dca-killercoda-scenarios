#!/bin/bash

LOGFILE=/root/step3-verify.log
set -e

{
    date

    docker ps | grep -q web-a
    docker port web-a | grep -q "8080"
    curl -sS localhost:8080 | grep -qi "Welcome to nginx"

} >> "${LOGFILE}" 2>&1

echo "done"
