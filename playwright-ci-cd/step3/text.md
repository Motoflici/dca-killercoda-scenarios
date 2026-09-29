Before trusting a workflow file, lint it. Install `yamllint`, a standard YAML linter available directly from Ubuntu's package archive:

```
sudo apt-get update && sudo apt-get install -y yamllint
```{{exec}}

Run it straight away:

```
yamllint ~/pw-lab/.github/workflows/playwright.yml
```{{exec}}

You'll likely see a `truthy` warning on the `on:` line. That's a well-known, harmless false positive: YAML 1.1 treats bare words like `on`, `off`, `yes`, `no` as booleans, but GitHub Actions deliberately uses `on:` as a literal key name for "the list of triggers", not a boolean. Every GitHub Actions workflow ever written trips this same rule. Add a project-level yamllint config that relaxes it (and the very-common `line-length` rule, which isn't meaningful for generated-looking CI YAML):

```
cat > ~/pw-lab/.yamllint << 'YAMLLINT_EOF'
extends: default
rules:
  truthy: disable
  line-length: disable
YAMLLINT_EOF
```{{exec}}

Re-run with the config applied:

```
yamllint -c ~/pw-lab/.yamllint ~/pw-lab/.github/workflows/playwright.yml
```{{exec}}

No output and an exit code of `0` means clean: valid YAML, correctly indented, no syntax problems.
