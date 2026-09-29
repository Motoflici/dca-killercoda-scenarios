Write the fixture-based version of the same two tests in a new file, importing `test`/`expect` from `../fixtures` instead of `@playwright/test` directly. Compare this to `tests/todo.spec.ts` from Step 1 — same two behaviors, no `beforeEach`, no repeated locators:

```
cat > ~/pw-lab/tests/todo-fixture.spec.ts << 'SPEC_EOF'
import { test, expect } from '../fixtures';

test('should add an item', async ({ todoPage, page }) => {
  await todoPage.addToDo('item3');
  await expect(page.getByTestId('todo-item')).toHaveCount(3);
});

test('should remove an item', async ({ todoPage, page }) => {
  await todoPage.remove('item1');
  await expect(page.getByTestId('todo-item')).toHaveCount(1);
});
SPEC_EOF
```{{exec}}

Run **everything** — the original flat file and the new fixture-based file, side by side:

```
cd ~/pw-lab && npx playwright test
```{{exec}}

You should see `4 passed`: the 2 original tests in `todo.spec.ts`, untouched, plus the 2 rewritten ones in `todo-fixture.spec.ts` doing the exact same thing through the fixture. The refactor didn't change test behavior — it changed how much of that behavior you'd have to retype for test number 21.

Open the report to see both files' results together:

```
cd ~/pw-lab && npx playwright show-report --host=0.0.0.0 --port=9323 &
```{{exec}}

[OPEN HTML REPORT]({{TRAFFIC_HOST1_9323}})
