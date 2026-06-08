# Feature Map

## Delivered Features (Code Present)

### Authentication
- Email/password sign-in endpoint.
- Sign-out endpoint.
- Callback endpoint for code exchange to session.
- Middleware session refresh and protected route enforcement.

### User Data
- Authenticated `GET /api/users` profile endpoint.
- Profile table auto-provisioning trigger on auth user creation.

### Topic Data
- Authenticated `GET /api/topics` endpoint.
- Authenticated `POST /api/topics` endpoint with Zod validation.
- Topic status lifecycle enum (`draft`, `published`, `archived`) at database level.

### Platform Engineering
- OpenAPI contract for current API paths.
- Supabase SQL migrations with RLS policies.
- Generated typed DB contract package.
- CI, release, and deploy GitHub Actions workflows.

## In-Progress / Planned (Vision from README)
- AI syllabus generation.
- YouTube search/verification pipeline.
- Mind-map generation and rendering.
- Draft review/publish workflow.
- Notification and ranking services.

## Dependency Map
- `apps/web` depends on `@graphed/supabase-types` for compile-time safety.
- Route handlers depend on Supabase server client wrappers.
- Middleware depends on Supabase SSR client and runtime env variables.
- CI depends on local Supabase startup for migration and RLS validation.
