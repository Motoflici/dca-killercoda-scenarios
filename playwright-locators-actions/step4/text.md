TodoMVC only shows a todo's **Delete** button on hover — a good excuse to use `hover()` as a real action before `click()`. Append a third test:

```
cat >> ~/pw-lab/tests/todomvc.spec.ts << 'SPEC_EOF'

test('deletes a specific todo by hovering and clicking Delete', async ({ page }) => {
  const newTodo = page.getByRole('textbox', { name: 'What needs to be done?' });
  for (const item of ['Task 1', 'Task 2', 'Task 3']) {
    await newTodo.fill(item);
    await newTodo.press('Enter');
  }

  await page.getByRole('listitem').filter({ hasText: 'Task 2' }).hover();
  await page.getByRole('button', { name: 'Delete' }).click();

  await expect(page.getByText('Task 1')).toBeVisible();
  await expect(page.getByText('Task 3')).toBeVisible();
  await expect(page.getByText('2 items left')).toBeVisible();
});
SPEC_EOF
```{{exec}}

Run the full file:

```
cd ~/pw-lab && npx playwright test --reporter=line
```{{exec}}

Three actions, three different jobs: `fill` sets an input's value directly, `press('Enter')` sends a real keyboard event, `hover` moves the (virtual) mouse to reveal the Delete button, and `click` fires the button. Playwright auto-waits before every one of these — it won't click a button that isn't visible and enabled yet, so there's no manual "wait for the hover state" code anywhere above.
