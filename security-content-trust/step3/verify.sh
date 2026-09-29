#!/bin/bash

LOGFILE=/root/step3-verify.log
set -e

{
    date

    test -f "${HOME}/.docker/cli-plugins/docker-scout"
    docker scout version
    docker scout quickview python:3.9 >/root/scout-quickview.out 2>&1
    test -s /root/scout-quickview.out

} >> "${LOGFILE}" 2>&1

echo "done"
