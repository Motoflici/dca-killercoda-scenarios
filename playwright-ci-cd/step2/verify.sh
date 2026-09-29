#!/bin/bash
set -u

FILE="$HOME/pw-lab/.github/workflows/playwright.yml"
[ -f "$FILE" ] || { echo "workflow file not found"; exit 1; }

for needle in "actions/checkout" "actions/setup-node" "npm ci" "playwright install --with-deps" "npx playwright test" "actions/upload-artifact"; do
  grep -q "$needle" "$FILE" || { echo "expected to find: $needle"; exit 1; }
done

echo "Workflow file inspected"
exit 0
