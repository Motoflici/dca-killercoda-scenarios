#!/bin/bash

LOGFILE=/root/step1-verify.log
set -e

{
    date

    docker volume ls | grep -q dca-vol
    docker ps | grep -q dca-keepalive
    docker exec dca-keepalive cat /data/msg.txt | grep -q "hello from writer"

} >> "${LOGFILE}" 2>&1

echo "done"
