#!/bin/bash
set -u

FILE="$HOME/pw-lab/tests/todo.spec.ts"

if [ ! -f "$FILE" ]; then
  echo "tests/todo.spec.ts not found"
  exit 1
fi

grep -q "getByRole" "$FILE" || { echo "expected a getByRole locator in todo.spec.ts"; exit 1; }
grep -q "demo.playwright.dev/todomvc" "$FILE" || { echo "expected the TodoMVC demo URL in todo.spec.ts"; exit 1; }
grep -q "toHaveCount(2)" "$FILE" || { echo "expected a toHaveCount(2) assertion in todo.spec.ts"; exit 1; }

echo "todo.spec.ts looks good"
exit 0
