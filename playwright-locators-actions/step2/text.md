We'll build one file, `tests/todomvc.spec.ts`, adding a test per step. First, the file with a shared `beforeEach` and one test that uses **`getByRole`** to find the input by the role a screen reader would announce (`textbox`) plus its accessible name, and **`getByText`** to assert on visible page text:

```
cat > ~/pw-lab/tests/todomvc.spec.ts << 'SPEC_EOF'
import { test, expect } from '@playwright/test';

test.beforeEach(async ({ page }) => {
  await page.goto('https://demo.playwright.dev/todomvc/');
});

test('adds a todo using a role locator', async ({ page }) => {
  const newTodo = page.getByRole('textbox', { name: 'What needs to be done?' });
  await newTodo.fill('Buy groceries');
  await newTodo.press('Enter');

  await expect(page.getByText('Buy groceries')).toBeVisible();
  await expect(page.getByText('1 item left')).toBeVisible();
});
SPEC_EOF
```{{exec}}

Run just this test:

```
cd ~/pw-lab && npx playwright test --reporter=line
```{{exec}}

`getByRole('textbox', { name: '...' })` locates the element the way assistive technology would: by its role plus its accessible name (here, the placeholder text doubles as the accessible name). This is Playwright's **first-choice** locator strategy — it survives CSS refactors and doesn't care what class names the frontend team renames next sprint.
