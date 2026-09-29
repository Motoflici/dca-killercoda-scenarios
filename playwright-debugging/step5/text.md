Re-run the test:

```
cd ~/pw-lab && npx playwright test
```{{exec}}

It should now report `1 passed`. Open the fresh HTML report to confirm, and notice the report **still has a trace attached even for a passing run**, because we left `trace: 'on'` in the config:

```
cd ~/pw-lab && npx playwright show-report --host=0.0.0.0 --port=9323 &
```{{exec}}

[OPEN HTML REPORT]({{TRAFFIC_HOST1_9323}})

> In a real project you'd usually switch `trace` back to `'on-first-retry'` once you're done debugging — `'on'` is great for a focused debugging session, but it writes a trace for every single test on every single run, which adds up in CI.
