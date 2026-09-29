#!/bin/bash
set -u

NODE_MAJOR=$(node -e "console.log(process.versions.node.split('.')[0])" 2>/dev/null)
if [ -z "$NODE_MAJOR" ] || [ "$NODE_MAJOR" -lt 22 ]; then
  echo "Expected Node.js 22 or newer"
  exit 1
fi

[ -d "$HOME/pw-lab/node_modules/@playwright/test" ] || { echo "@playwright/test not installed"; exit 1; }
ls "$HOME/.cache/ms-playwright" 2>/dev/null | grep -q "^chromium-" || { echo "Chromium not installed"; exit 1; }
[ -d "$HOME/pw-lab/public" ] || { echo "public/ directory not created"; exit 1; }

echo "Environment ready"
exit 0
