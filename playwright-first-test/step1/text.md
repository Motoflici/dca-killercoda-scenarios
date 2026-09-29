Playwright needs a fairly recent Node.js — the officially supported versions are the latest 22.x, 24.x or 26.x releases. This VM has no Node at all, so let's install it from the official NodeSource repository rather than the (often ancient) version in Ubuntu's default `apt` repos.

Update the package index and install the prerequisites for adding a third-party `apt` repository:

```
sudo apt-get update
```{{exec}}

```
sudo apt-get install -y ca-certificates curl gnupg
```{{exec}}

Add the NodeSource 22.x LTS repository and install Node.js from it:

```
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
```{{exec}}

```
sudo apt-get install -y nodejs
```{{exec}}

Confirm both landed correctly:

```
node -v && npm -v
```{{exec}}

You should see `v22.x.x` for Node and an `npm` 10.x version underneath it.

<details><summary>Nothing printed, or an old Node version showed up?</summary>

Ubuntu sometimes ships a `nodejs` shim from `unattended-upgrades` or a snap. Confirm you're running the NodeSource build:

```
which node
```{{exec}}

It should point at `/usr/bin/node`. If it doesn't, re-run the two commands above — the NodeSource script needs to run before `apt-get install nodejs`.

</details>
