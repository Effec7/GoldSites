# Codex Workflow for GoldSites

Use Codex only through scoped GitHub issues and PRs.

## Best flow

```text
Issue with acceptance criteria
  → @codex implement this issue following AGENTS.md
  → Codex opens PR
  → CI/checks run
  → @codex review
  → Human final approval
```

## First useful Codex command

Paste this as a GitHub issue comment:

```text
@codex implement this issue following AGENTS.md. Keep the change small, preserve FlutterFlow generated structure, and open a draft PR with manual test steps.
```

## PR review command

```text
@codex review this PR for GoldSites MVP quality. Focus on Supabase query safety, auth regressions, booking regressions, payment regressions, loading/empty/error states, and UI friction. Follow AGENTS.md.
```

## CI fix command

```text
@codex fix the failing CI checks. Keep the fix minimal, do not rewrite unrelated files, and explain the root cause in the PR summary.
```

## Human approval required

Do not auto-merge changes touching:

- Supabase RLS policies
- Stripe/payment flows
- auth/session logic
- production config
- database destructive migrations
- app signing/deployment files
