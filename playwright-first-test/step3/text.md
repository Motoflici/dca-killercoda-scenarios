Playwright ships a recorder called **codegen** that watches you click around a real site and writes matching test code as you go. Let's look at the real command:

```
cd ~/pw-lab && npx playwright codegen --help
```{{exec}}

Notice the usage line: `npx playwright codegen [options] [url]`. On your own laptop, running `npx playwright codegen https://demo.playwright.dev/todomvc` opens **two** windows — a real Chromium window you click through, and the Playwright Inspector, which writes matching code live as you interact with the page.

> **Why we don't launch it here:** codegen needs an actual screen to render a clickable browser window on. Killercoda's `ubuntu` backend is a terminal-only VM — there's no display server behind your browser tab for a GUI window to draw into. This isn't a Playwright limitation, it's true of any headless cloud shell or CI runner (which is exactly why Playwright *also* ships `--ui-host`/`--ui-port` flags for its UI mode and trace viewer, so those tools can be served over plain HTTP instead — you'll use exactly that trick in the Debugging module). Codegen has no such flag, because it drives a real local browser window directly over CDP, not a web page.

So instead, let's do what every Playwright engineer ends up doing anyway once they've used codegen a few times: recognize the shape of its output and type it straight in. What follows is *exactly* what codegen produces for a simple two-item add flow against `demo.playwright.dev/todomvc` — same locator strategy (role-based, exactly as codegen prioritizes), same shape.

Create the test file:

```
mkdir -p ~/pw-lab/tests
```{{exec}}

```
cat > ~/pw-lab/tests/todo.spec.ts << 'SPEC_EOF'
import { test, expect } from '@playwright/test';

test('add two todos', async ({ page }) => {
  await page.goto('https://demo.playwright.dev/todomvc/');
  await page.getByRole('textbox', { name: 'What needs to be done?' }).click();
  await page.getByRole('textbox', { name: 'What needs to be done?' }).fill('Buy milk');
  await page.getByRole('textbox', { name: 'What needs to be done?' }).press('Enter');
  await page.getByRole('textbox', { name: 'What needs to be done?' }).fill('Walk the dog');
  await page.getByRole('textbox', { name: 'What needs to be done?' }).press('Enter');
  await expect(page.getByTestId('todo-item')).toHaveCount(2);
});
SPEC_EOF
```{{exec}}

Read it for a second: every locator uses `getByRole`, the same accessibility-first strategy codegen always reaches for first on a real page. That's not a coincidence — it's [Playwright's documented locator priority](https://playwright.dev/docs/locators), and it's the whole subject of the next module.
