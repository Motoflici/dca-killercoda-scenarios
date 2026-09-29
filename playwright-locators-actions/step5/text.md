One last test, leaning entirely on **web-first assertions** — `toHaveCount`, `toBeChecked`, and `.not.toBeVisible()`. Each of these polls the page and retries automatically until it's true or the assertion's timeout runs out, instead of checking the DOM exactly once:

```
cat >> ~/pw-lab/tests/todomvc.spec.ts << 'SPEC_EOF'

test('checks web-first assertions directly', async ({ page }) => {
  const newTodo = page.getByRole('textbox', { name: 'What needs to be done?' });
  await newTodo.fill('Ship the feature');
  await newTodo.press('Enter');

  await expect(page.getByTestId('todo-item')).toHaveCount(1);

  const item = page.getByRole('listitem').filter({ hasText: 'Ship the feature' });
  await item.getByLabel('Toggle Todo').click();
  await expect(item.getByLabel('Toggle Todo')).toBeChecked();

  await page.getByRole('button', { name: 'Clear completed' }).click();
  await expect(page.getByText('Ship the feature')).not.toBeVisible();
});
SPEC_EOF
```{{exec}}

Run the whole suite one final time:

```
cd ~/pw-lab && npx playwright test
```{{exec}}

All four tests should be green. Open the HTML report to see them all in one place:

```
cd ~/pw-lab && npx playwright show-report --host=0.0.0.0 --port=9323 &
```{{exec}}

[OPEN HTML REPORT]({{TRAFFIC_HOST1_9323}})
