Standard setup, plus a minimal test suite worth actually running in CI:

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

The `reporter: 'html'` setting below matters here more than in earlier modules: it's what makes the workflow's last step (uploading `playwright-report/`) have something real to upload once we replay it.

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

```
cat > ~/pw-lab/tests/todo.spec.ts << 'SPEC_EOF'
import { test, expect } from '@playwright/test';

test('loads TodoMVC and adds an item', async ({ page }) => {
  await page.goto('https://demo.playwright.dev/todomvc/');
  const newTodo = page.getByRole('textbox', { name: 'What needs to be done?' });
  await newTodo.fill('Ship the pipeline');
  await newTodo.press('Enter');
  await expect(page.getByTestId('todo-item')).toHaveCount(1);
});
SPEC_EOF
```{{exec}}

Killercoda also shipped a real workflow file onto this VM as a scenario asset (the same way `actions/checkout` would put it there on a real runner). Make sure it landed:

```
find ~/pw-lab/.github -type f
```{{exec}}
