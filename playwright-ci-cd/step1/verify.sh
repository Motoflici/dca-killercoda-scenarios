#!/bin/bash
set -u

NODE_MAJOR=$(node -e "console.log(process.versions.node.split('.')[0])" 2>/dev/null)
if [ -z "$NODE_MAJOR" ] || [ "$NODE_MAJOR" -lt 22 ]; then
  echo "Expected Node.js 22 or newer"
  exit 1
fi

[ -d "$HOME/pw-lab/node_modules/@playwright/test" ] || { echo "@playwright/test not installed"; exit 1; }
ls "$HOME/.cache/ms-playwright" 2>/dev/null | grep -q "^chromium-" || { echo "Chromium not installed"; exit 1; }
[ -f "$HOME/pw-lab/tests/todo.spec.ts" ] || { echo "tests/todo.spec.ts not found"; exit 1; }
[ -f "$HOME/pw-lab/package-lock.json" ] || { echo "package-lock.json missing -- needed for npm ci later"; exit 1; }

if [ ! -f "$HOME/pw-lab/.github/workflows/playwright.yml" ]; then
  echo "workflow asset not found at ~/pw-lab/.github/workflows/playwright.yml (scenario asset provisioning)"
  exit 1
fi

echo "Environment and workflow asset ready"
exit 0
