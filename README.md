# GoldSites App

GoldSites is a premium local-services marketplace app for Slovakia, built from a FlutterFlow Flutter export.

This repo is prepared for a **GitHub + Codex + Make.com** workflow:

- GitHub = source of truth
- Codex = implementation agent
- Make.com = task dispatcher / automation layer
- ChatGPT = product, UX, database, and architecture brain

## Current stack

- Flutter / Dart
- FlutterFlow generated structure
- Supabase backend
- Firebase config present
- Android, iOS, and Web targets included

## First local setup

```bash
git clone https://github.com/YOUR_USERNAME/goldsites-app.git
cd goldsites-app
flutter pub get
flutter analyze --no-fatal-infos
```


## One-command GitHub push helper

After installing and authenticating the GitHub CLI, you can create a private GitHub repo and push this project with:

```bash
./scripts/push_to_github.sh YOUR_GITHUB_USERNAME/goldsites-app
```

## Repository safety

Keep this repository **private**. The FlutterFlow export includes normal client-side app configuration files such as Firebase and Supabase anon/client config. These are expected for mobile/web client builds, but the repo should not be made public without reviewing and rotating credentials.

Never commit:

- Supabase service-role keys
- Stripe secret keys
- Apple private keys
- Android keystores
- `.env` files
- production signing files

## Development rules

1. Keep changes small and scoped.
2. Do not rewrite generated FlutterFlow structure without a clear issue.
3. Every feature must include loading, empty, error, and success states where applicable.
4. Database changes must include SQL migration notes.
5. Auth, RLS, Stripe, and payment changes require human review before merge.
6. Do not auto-merge Codex PRs.

## Recommended task flow

```text
GitHub issue → Codex branch → Draft PR → CI/checks → Human review → Merge
```

## Useful commands

```bash
flutter pub get
flutter analyze --no-fatal-infos
flutter run -d chrome
```

## Main folders

```text
lib/pages/              Customer-facing pages
lib/provider_setup/     Provider onboarding and service setup
lib/profil/             Customer/provider profile area
lib/rezervacie/         Booking/reservation flow
lib/databaza/           Data-driven screens/details
lib/backend/supabase/   Supabase generated table/storage bindings
lib/custom_code/        FlutterFlow custom actions
```
