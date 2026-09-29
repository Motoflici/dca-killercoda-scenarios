#!/bin/bash
set -u

FILE="$HOME/pw-lab/fixtures.ts"
[ -f "$FILE" ] || { echo "fixtures.ts not found"; exit 1; }

grep -q "base.extend<MyFixtures>" "$FILE" || { echo "expected base.extend<MyFixtures>({...})"; exit 1; }
grep -q "todoPage:" "$FILE" || { echo "expected a todoPage fixture entry"; exit 1; }
grep -q "await use(todoPage)" "$FILE" || { echo "expected await use(todoPage)"; exit 1; }

echo "fixtures.ts looks good"
exit 0
