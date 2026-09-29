#!/bin/bash

LOGFILE=/root/step2-verify.log
set -e

{
    date

    docker exec web-a sh -c "curl -sS web-b" | grep -qi "Welcome to nginx"
    docker exec web-a getent hosts web-b

} >> "${LOGFILE}" 2>&1

echo "done"
