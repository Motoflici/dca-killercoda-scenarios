#!/bin/bash
set -u

cd "$HOME/pw-lab" || exit 1
npx playwright test --reporter=line > /tmp/pw-step2.log 2>&1
if ! grep -q "2 passed" /tmp/pw-step2.log; then
  echo "expected the flat baseline (2 tests) to pass"
  cat /tmp/pw-step2.log
  exit 1
fi

echo "Baseline: 2 passed"
exit 0
