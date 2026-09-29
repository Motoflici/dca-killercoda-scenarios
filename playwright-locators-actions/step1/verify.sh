#!/bin/bash
set -u

NODE_MAJOR=$(node -e "console.log(process.versions.node.split('.')[0])" 2>/dev/null)
if [ -z "$NODE_MAJOR" ] || [ "$NODE_MAJOR" -lt 22 ]; then
  echo "Expected Node.js 22 or newer"
  exit 1
fi

if [ ! -d "$HOME/pw-lab/node_modules/@playwright/test" ]; then
  echo "@playwright/test is not installed"
  exit 1
fi

if ! ls "$HOME/.cache/ms-playwright" 2>/dev/null | grep -q "^chromium-"; then
  echo "Chromium browser build not found"
  exit 1
fi

if [ ! -f "$HOME/pw-lab/playwright.config.ts" ]; then
  echo "playwright.config.ts was not created"
  exit 1
fi

echo "Environment ready"
exit 0
