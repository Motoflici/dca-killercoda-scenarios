Run the flat baseline before touching anything, so you have a known-good result to compare against once the refactor is done:

```
cd ~/pw-lab && npx playwright test --reporter=line
```{{exec}}

You should see `2 passed`. Keep that number in your head — it's the number we're going to match, not beat, after the refactor.
