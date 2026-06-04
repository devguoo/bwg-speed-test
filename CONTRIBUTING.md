# Contributing

Thanks for helping improve BandwagonHost Speed Test.

This repository is intended to stay practical, small and verifiable. Contributions should improve route testing, public test-target accuracy, datacenter notes or buying-research documentation.

## Good Contributions

- Add or correct a public BandwagonHost test target.
- Improve `test.sh` without making it harder to audit.
- Add a real latency or route-testing note with enough context.
- Fix outdated datacenter wording or broken documentation links.
- Improve Chinese or English documentation clarity.

## Before Opening a Pull Request

1. Check whether the change is related to route testing or datacenter research.
2. Run `bash -n test.sh` if you changed the script.
3. Run `git diff --check`.
4. Do not include private account data, screenshots from affiliate dashboards, API keys, tokens or server credentials.
5. Keep promotional links secondary and directly related to this repository.

## Content Style

- Prefer factual notes over sales language.
- Avoid claims such as "official", "guaranteed", "best", "lowest price" or "always stable".
- Mention when a result is network-dependent.
- Use examples that can be reproduced or verified.

## Pull Request Checklist

- [ ] The change is related to testing, datacenter notes or documentation.
- [ ] The wording is factual and not promotional.
- [ ] No sensitive information is included.
- [ ] Script changes pass `bash -n test.sh`.
- [ ] Markdown changes pass `git diff --check`.
