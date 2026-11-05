# AGENTS.md

Follow [CONTRIBUTING.md](CONTRIBUTING.md) instructions.

## Tests

Tests run against the sandbox organisation.
CI authenticates with a GitHub App installed on that organisation only, so a leaked token cannot reach other accounts.

The root module test runs in plan mode: destroying `github_organization_settings` resets the billing email to
`email@example.com` instead of restoring the previous values.
