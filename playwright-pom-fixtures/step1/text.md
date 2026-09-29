Standard setup:

```
sudo apt-get update
```{{exec}}

```
sudo apt-get install -y ca-certificates curl gnupg
```{{exec}}

```
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
```{{exec}}

```
sudo apt-get install -y nodejs
```{{exec}}

```
mkdir -p ~/pw-lab && cd ~/pw-lab && npm init -y && npm install -D @playwright/test
```{{exec}}

```
cd ~/pw-lab && npx playwright install --with-deps chromium
```{{exec}}

```
mkdir -p ~/pw-lab/tests
```{{exec}}

```
cat > ~/pw-lab/playwright.config.ts << 'CONFIG_EOF'
import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './tests',
  reporter: 'html',
  use: {
    trace: 'on-first-retry',
  },
});
CONFIG_EOF
```{{exec}}

Now write the **flat baseline** — two tests that navigate, seed two todos in a `beforeEach`, then each do one more thing. This is deliberately repetitive; that repetition is exactly what we're about to remove.

```
cat > ~/pw-lab/tests/todo.spec.ts << 'SPEC_EOF'
import { test, expect } from '@playwright/test';

test.describe('todo flat tests', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('https://demo.playwright.dev/todomvc/');
    const newTodo = page.getByRole('textbox', { name: 'What needs to be done?' });
    await newTodo.fill('item1');
    await newTodo.press('Enter');
    await newTodo.fill('item2');
    await newTodo.press('Enter');
  });

  test('should add an item', async ({ page }) => {
    const newTodo = page.getByRole('textbox', { name: 'What needs to be done?' });
    await newTodo.fill('item3');
    await newTodo.press('Enter');
    await expect(page.getByTestId('todo-item')).toHaveCount(3);
  });

  test('should remove an item', async ({ page }) => {
    await page.getByRole('listitem').filter({ hasText: 'item1' }).hover();
    await page.getByRole('button', { name: 'Delete' }).click();
    await expect(page.getByTestId('todo-item')).toHaveCount(1);
  });
});
SPEC_EOF
```{{exec}}
