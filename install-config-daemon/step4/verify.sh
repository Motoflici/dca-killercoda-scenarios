#!/bin/bash

LOGFILE=/root/step4-verify.log
set -e

{
    date

    test "$(docker info --format '{{.LoggingDriver}}')" = "local"
    test "$(docker info --format '{{.Driver}}')" = "overlay2"
    docker ps | grep -q dca-logcheck
    test "$(docker inspect dca-logcheck --format '{{.HostConfig.LogConfig.Type}}')" = "local"

} >> "${LOGFILE}" 2>&1

echo "done"
