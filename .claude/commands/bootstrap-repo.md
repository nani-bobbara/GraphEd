# Command: Bootstrap Repository

Input:
- target environment (local | codespace | ci)
- supabase project ref (optional — skip if local-only)
- vercel project id (optional — skip if backend-only)

Output:
- validated local development environment
- installed dependencies
- linked Supabase project
- linked Vercel project
- generated .env.local from .env.example
- passing `supabase db lint` report
- passing `npm run type-check` report
- bootstrap readiness summary

## Steps (in order)

1. Install Node.js dependencies
   - npm ci

2. Install Supabase CLI
   - npm install supabase OR brew install supabase/tap/supabase

3. Install Vercel CLI (optional, skip if backend-only)
   - npm install -g vercel

4. Create local environment file
   - Copy .env.example to .env.local
   - Fill required variables (SUPABASE_ACCESS_TOKEN, SUPABASE_PROJECT_REF, etc.)

5. Authenticate Supabase CLI
   - supabase login --token $SUPABASE_ACCESS_TOKEN

6. Link Supabase project
   - supabase link --project-ref $SUPABASE_PROJECT_REF

7. Start local Supabase stack
   - supabase start

8. Apply migrations to local database
   - supabase db reset

9. Validate RLS and migration quality
   - supabase db lint

10. Validate OpenAPI contract
    - npx @redocly/cli@latest lint openapi.yaml

11. TypeScript type-check
    - npm run type-check

12. Link Vercel project (optional, skip if backend-only)
    - vercel login
    - vercel link

13. Print bootstrap readiness summary

## Triggered Agents
- Backend Agent
- Security Engineer Agent
- Architect Agent (if schema or API contract issues are detected)

## Preconditions
- .env.example exists at repo root.
- openapi.yaml exists at repo root.
- supabase/migrations directory exists.
- Tech 001 (Supabase Setup and RLS) is In Progress or Done.

## Routing Guards
- If SUPABASE_ACCESS_TOKEN is missing, stop and display setup instructions.
- If SUPABASE_PROJECT_REF is missing, stop and display setup instructions.
- If supabase db lint fails, stop and report issues to Backend Agent.
- If npm run type-check fails, stop and report issues to Backend Agent.
- If openapi.yaml is missing, stop and report to Architect Agent.
- Do not proceed to Vercel link if Supabase bootstrap has not passed.
