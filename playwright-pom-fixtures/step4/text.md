Now wire `TodoPage` into a custom **fixture** with `test.extend`. The fixture function runs its setup code, hands the test a ready-to-use `TodoPage` via `use(todoPage)`, and anything after `use(...)` runs as teardown once the test finishes:

```
cat > ~/pw-lab/fixtures.ts << 'FIXTURES_EOF'
import { test as base } from '@playwright/test';
import { TodoPage } from './pages/todo-page';

type MyFixtures = {
  todoPage: TodoPage;
};

export const test = base.extend<MyFixtures>({
  todoPage: async ({ page }, use) => {
    const todoPage = new TodoPage(page);
    await todoPage.goto();
    await todoPage.addToDo('item1');
    await todoPage.addToDo('item2');
    await use(todoPage);
    await todoPage.removeAll();
  },
});

export { expect } from '@playwright/test';
FIXTURES_EOF
```{{exec}}

Everything that used to live in the flat file's `beforeEach` — navigate, seed two items — now lives **once**, in the fixture, instead of being copy-pasted into every test file that needs a seeded todo list.
