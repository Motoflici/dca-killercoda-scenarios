#!/bin/bash
set -u

FILE="$HOME/pw-lab/pages/todo-page.ts"
[ -f "$FILE" ] || { echo "pages/todo-page.ts not found"; exit 1; }

for needle in "class TodoPage" "async goto" "async addToDo" "async remove" "async removeAll"; do
  grep -q "$needle" "$FILE" || { echo "expected to find: $needle"; exit 1; }
done

echo "TodoPage class looks good"
exit 0
