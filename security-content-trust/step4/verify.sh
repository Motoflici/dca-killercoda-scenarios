#!/bin/bash

LOGFILE=/root/step4-verify.log
set -e

{
    date

    docker scout cves --only-severity critical,high python:3.9 >/root/scout-cves-39.out 2>&1
    test -s /root/scout-cves-39.out

    docker image inspect python:3.12-slim >/dev/null
    docker scout cves --only-severity critical,high python:3.12-slim >/root/scout-cves-slim.out 2>&1
    test -s /root/scout-cves-slim.out

} >> "${LOGFILE}" 2>&1

echo "done"
