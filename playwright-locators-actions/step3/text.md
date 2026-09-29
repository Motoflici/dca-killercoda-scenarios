Add three todos, then pick **one specific item** out of the list. This is where chaining and filtering come in: `page.getByRole('listitem')` matches all three `<li>` rows, and `.filter({ hasText: '...' })` narrows that locator down to the one row you actually care about — no CSS `nth-child`, no brittle index-based selectors. We also use **`getByLabel`** here: TodoMVC's toggle checkbox carries `aria-label="Toggle Todo"`, so `getByLabel('Toggle Todo')` finds it directly.

Append the next test to the same file:

```
cat >> ~/pw-lab/tests/todomvc.spec.ts << 'SPEC_EOF'

test('filters to one todo among several and toggles it', async ({ page }) => {
  const newTodo = page.getByRole('textbox', { name: 'What needs to be done?' });
  for (const item of ['Buy milk', 'Walk dog', 'Finish report']) {
    await newTodo.fill(item);
    await newTodo.press('Enter');
  }

  const walkDog = page.getByRole('listitem').filter({ hasText: 'Walk dog' });
  await walkDog.getByLabel('Toggle Todo').click();

  await expect(walkDog.getByLabel('Toggle Todo')).toBeChecked();
  await expect(page.getByText('2 items left')).toBeVisible();
});
SPEC_EOF
```{{exec}}

Run the file again — both tests should pass:

```
cd ~/pw-lab && npx playwright test --reporter=line
```{{exec}}

`walkDog` is itself a `Locator`, not a single element handle — you can keep chaining off it (`walkDog.getByLabel(...)`) and Playwright re-resolves the whole chain against the live DOM every time you use it. That's why these locators stay reliable even as the page re-renders after each click.
