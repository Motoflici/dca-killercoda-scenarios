#!/bin/bash
set -u

cd "$HOME/pw-lab" || exit 1

for browser in chromium firefox webkit; do
  if ! ls "$HOME/.cache/ms-playwright" 2>/dev/null | grep -q "^${browser}-"; then
    echo "expected ${browser} to be installed after 'npx playwright install --with-deps'"
    exit 1
  fi
done

npx playwright test --reporter=line > /tmp/pw-step4.log 2>&1
if ! grep -q "1 passed" /tmp/pw-step4.log; then
  echo "expected the replayed 'Run Playwright tests' step to pass"
  cat /tmp/pw-step4.log
  exit 1
fi

echo "CI recipe replayed locally and passed"
exit 0
