#!/bin/bash
set -u

cd "$HOME/pw-lab" || exit 1

npx playwright test --reporter=line > /tmp/pw-step4.log 2>&1
if ! grep -q "1 passed" /tmp/pw-step4.log; then
  echo "expected the test to pass"
  cat /tmp/pw-step4.log
  exit 1
fi

echo "Test passed against the live TodoMVC demo"
exit 0
