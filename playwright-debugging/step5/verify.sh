#!/bin/bash
set -u

cd "$HOME/pw-lab" || exit 1

npx playwright test --reporter=line > /tmp/pw-step5.log 2>&1
if ! grep -q "1 passed" /tmp/pw-step5.log; then
  echo "expected the fixed test to pass"
  cat /tmp/pw-step5.log
  exit 1
fi

echo "Green"
exit 0
