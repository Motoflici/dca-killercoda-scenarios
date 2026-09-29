Write a test that adds three todos, but assert the wrong count on purpose — the kind of off-by-one mistake that's extremely easy to make for real:

```
cat > ~/pw-lab/tests/todomvc.spec.ts << 'SPEC_EOF'
import { test, expect } from '@playwright/test';

test('adds three todos', async ({ page }) => {
  await page.goto('https://demo.playwright.dev/todomvc/');

  const newTodo = page.getByRole('textbox', { name: 'What needs to be done?' });
  for (const item of ['Buy milk', 'Walk dog', 'Finish report']) {
    await newTodo.fill(item);
    await newTodo.press('Enter');
  }

  // BUG: we just added three todos above, but this expects two.
  await expect(page.getByTestId('todo-item')).toHaveCount(2);
});
SPEC_EOF
```{{exec}}

Run it and watch it fail for real:

```
cd ~/pw-lab && npx playwright test --reporter=line
```{{exec}}

You should see `1 failed`, with Playwright's error message telling you it expected `2` elements and received `3`. That's a genuine assertion failure against a genuine live page — nothing here is staged output.
