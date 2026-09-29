Extract everything the tests know about the TodoMVC page — the input locator, the item list, and the three actions they perform — into a `TodoPage` class. This is the exact shape [Playwright's own Page Object Model docs](https://playwright.dev/docs/pom) use for TodoMVC.

```
mkdir -p ~/pw-lab/pages
```{{exec}}

```
cat > ~/pw-lab/pages/todo-page.ts << 'PAGE_EOF'
import type { Page, Locator } from '@playwright/test';

export class TodoPage {
  readonly page: Page;
  readonly inputBox: Locator;
  readonly todoItems: Locator;

  constructor(page: Page) {
    this.page = page;
    this.inputBox = page.getByRole('textbox', { name: 'What needs to be done?' });
    this.todoItems = page.getByTestId('todo-item');
  }

  async goto() {
    await this.page.goto('https://demo.playwright.dev/todomvc/');
  }

  async addToDo(text: string) {
    await this.inputBox.fill(text);
    await this.inputBox.press('Enter');
  }

  async remove(text: string) {
    const todo = this.todoItems.filter({ hasText: text });
    await todo.hover();
    await this.page.getByRole('button', { name: 'Delete' }).click();
  }

  async removeAll() {
    while ((await this.todoItems.count()) > 0) {
      await this.todoItems.first().hover();
      await this.page.getByRole('button', { name: 'Delete' }).first().click();
    }
  }
}
PAGE_EOF
```{{exec}}

Notice this file imports nothing from `@playwright/test`'s `test`/`expect` — only the `Page` and `Locator` **types**. A Page Object describes *how to interact with a page*; it deliberately knows nothing about which test is calling it or what that test asserts.
