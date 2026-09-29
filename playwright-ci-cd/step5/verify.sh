#!/bin/bash
set -u

if [ ! -d "$HOME/pw-lab/playwright-report" ]; then
  echo "playwright-report/ directory not found -- run the tests first"
  exit 1
fi

if [ ! -f "$HOME/pw-lab/playwright-report/index.html" ]; then
  echo "playwright-report/index.html not found -- the HTML report was not generated"
  exit 1
fi

echo "playwright-report/ is exactly what upload-artifact would upload"
exit 0
