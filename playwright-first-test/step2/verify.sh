#!/bin/bash
set -u

if [ ! -d "$HOME/pw-lab/node_modules/@playwright/test" ]; then
  echo "@playwright/test is not installed in ~/pw-lab"
  exit 1
fi

if ! ls "$HOME/.cache/ms-playwright" 2>/dev/null | grep -q "^chromium-"; then
  echo "Chromium browser build not found in ~/.cache/ms-playwright"
  exit 1
fi

if [ ! -f "$HOME/pw-lab/playwright.config.ts" ]; then
  echo "playwright.config.ts was not created"
  exit 1
fi

echo "Playwright, Chromium and the config file are all in place"
exit 0
