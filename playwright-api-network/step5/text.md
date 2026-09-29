Run everything — the two API tests and the network-mocking UI test — in one go:

```
cd ~/pw-lab && npx playwright test
```{{exec}}

You should see `3 passed`. Open the HTML report to see the API tests and the browser test sitting side by side, with a real request/response trace attached where relevant:

```
cd ~/pw-lab && npx playwright show-report --host=0.0.0.0 --port=9323 &
```{{exec}}

[OPEN HTML REPORT]({{TRAFFIC_HOST1_9323}})
