#!/bin/bash

LOGFILE=/root/step4-verify.log
set -e

{
    date

    test -f /root/stack.yml
    grep -q "nginx:alpine" /root/stack.yml
    grep -q "redis:alpine" /root/stack.yml
    grep -q "replicas: 3" /root/stack.yml
    grep -q "replicas: 1" /root/stack.yml

} >> "${LOGFILE}" 2>&1

echo "done"
