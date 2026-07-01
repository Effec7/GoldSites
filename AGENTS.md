# AGENTS.md — GoldSites Engineering Rules

## Product context

GoldSites is a premium local-services marketplace for Slovakia.

The MVP includes:

- Customer discovery/search
- Provider profiles
- Provider onboarding
- Provider service management
- Service media/gallery uploads
- Provider availability
- Booking/reservation flow
- Reviews
- Favorites
- Notifications/messages later
- Stripe/subscription/payment flows later

Primary goals:

- MVP first
- Low-friction UX
- Premium modern feel
- Reliable data and booking logic
- Small safe changes over broad rewrites

## Repository context

This codebase is a FlutterFlow-generated Flutter export.

Preserve generated structure unless the issue explicitly asks for a refactor.

Important folders:

- `lib/pages/` — customer-facing screens
- `lib/provider_setup/` — provider onboarding/setup screens
- `lib/profil/` — profile/service/customer account screens
- `lib/rezervacie/` — booking/reservation screens
- `lib/databaza/` — data-backed detail/list screens
- `lib/backend/supabase/` — generated Supabase table/storage bindings
- `lib/custom_code/actions/` — FlutterFlow custom actions

## Technical rules

- Do not rename database columns unless the issue explicitly requires a migration.
- Do not remove existing working flows.
- Keep Supabase queries null-safe.
- Do not hardcode user IDs.
- Do not expose secrets or service-role keys.
- Do not log PII.
- Do not change payment/auth/RLS behavior without clearly calling it out in the PR.
- Keep changes small enough to review.
- Prefer fixing one flow per PR.

## UI/UX rules

GoldSites UI should feel:

- premium
- simple
- clear
- trustworthy
- mobile-first
- low cognitive load

Use:

- strong hierarchy
- readable spacing
- clear CTAs
- clear loading/empty/error states
- short labels
- obvious selected states

Avoid:

- huge headers
- oversized elements
- cluttered forms
- hidden required actions
- ambiguous booking/payment states

## Booking rules

Booking flow must preserve these concepts:

- selected provider
- selected service
- selected date
- selected time slot
- customer profile
- provider availability
- booking status
- payment status where relevant

Expected booking states:

- draft
- pending
- confirmed
- cancelled
- completed

## Provider service/media rules

Provider service setup must support:

- service title/name
- description
- category/subcategory where present
- price/duration where present
- main image
- gallery images
- active/inactive state

When fixing image upload or display:

- verify storage bucket/path assumptions
- store public or signed URL consistently
- show fallback image where image URL is missing
- avoid writing duplicate gallery rows
- handle upload failure with a visible error state

## Database rules

For database-related PRs:

- Include migration SQL in the PR body or a migration file.
- Explain whether RLS policies are affected.
- Explain whether existing data needs backfill.
- Never use Supabase service-role key in client code.

## PR expectations

Every PR should include:

1. What changed
2. Why it changed
3. Files/screens touched
4. Manual test steps
5. Known risks
6. Screenshots for UI changes when possible

## Review focus

When reviewing GoldSites PRs, flag:

- broken Supabase queries
- missing auth checks
- missing loading/empty/error states
- database mismatch
- unsafe nullable fields
- broken navigation
- payment flow regressions
- booking logic regressions
- UI that creates too much friction

Only leave comments for meaningful issues.
