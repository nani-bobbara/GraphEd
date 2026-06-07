# Command: Setup Supabase Environment

Input:
- target environment (local | preview | production)
- supabase project ref
- required variables list

Output:
- validated Supabase environment variable map
- CLI auth and project link checklist
- migration and function deploy readiness report

## Triggered Agents
- Backend Agent
- Security Engineer Agent
- Product Owner Agent (for environment approval)

## Preconditions
- Linked feature or tech story status is In Progress.
- `SUPABASE_ACCESS_TOKEN` and `SUPABASE_PROJECT_REF` are available in the target CI or runtime context.
- Environment scope is approved by Product Owner Agent.

## Routing Guards
- If required secrets are missing, stop and report missing keys.
- If target environment is not approved, stop execution.
- If RLS or migration prerequisites are unmet, stop execution.
