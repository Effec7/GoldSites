# Repo Health Snapshot

Generated from the uploaded FlutterFlow export.

## Summary

- Project type: FlutterFlow Flutter export
- Package: `gold_sites`
- File count at import: 268
- App platforms present: Android, iOS, Web
- Backend bindings present: Supabase
- Firebase config present: yes
- Build artifacts present in export: no obvious `build/`, `.dart_tool/`, `.gradle/`, or `Pods/` directories
- Lockfile present: no `pubspec.lock` in export

## Important generated areas

- `lib/backend/supabase/database/tables/` contains generated table bindings.
- `lib/provider_setup/` contains provider onboarding/setup screens.
- `lib/rezervacie/` contains reservation/booking screens.
- `lib/profil/` contains profile and account-related screens.
- `lib/databaza/` contains several configured data-backed screens.

## High-risk areas for first fixes

1. Provider service image upload/display
2. Provider availability and booking slot logic
3. Search/filter query safety
4. Review creation/display
5. Auth/profile sync
6. Stripe/payment/subscription state

## Repo policy

Keep this repo private unless client config files are removed or reviewed.
