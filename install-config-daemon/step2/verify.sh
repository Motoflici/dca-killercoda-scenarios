#!/bin/bash

LOGFILE=/root/step2-verify.log
set -e

{
    date

    test -f /etc/docker/daemon.json.bak
    grep -q '"log-driver": "local"' /etc/docker/daemon.json
    grep -q '"storage-driver": "overlay2"' /etc/docker/daemon.json
    python3 -c "import json; json.load(open('/etc/docker/daemon.json'))"

} >> "${LOGFILE}" 2>&1

echo "done"
