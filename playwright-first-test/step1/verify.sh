#!/bin/bash
set -u

if ! command -v node >/dev/null 2>&1; then
  echo "node was not found on PATH"
  exit 1
fi

NODE_MAJOR=$(node -e "console.log(process.versions.node.split('.')[0])" 2>/dev/null)
if [ -z "$NODE_MAJOR" ] || [ "$NODE_MAJOR" -lt 22 ]; then
  echo "Expected Node.js 22 or newer, found: $(node -v 2>/dev/null)"
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  echo "npm was not found on PATH"
  exit 1
fi

echo "Node.js $(node -v) and npm $(npm -v) are ready"
exit 0
