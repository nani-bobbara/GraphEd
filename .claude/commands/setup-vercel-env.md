# Command: Setup Vercel Environment

Input:
- target environment (preview | production)
- vercel org id
- vercel project id
- required variables list

Output:
- validated Vercel environment variable map
- CLI auth and project link checklist
- frontend deploy readiness report

## Triggered Agents
- Frontend Agent
- Security Engineer Agent
- Product Owner Agent (for environment approval)

## Preconditions
- Linked feature status is In Progress.
- `VERCEL_TOKEN`, `VERCEL_ORG_ID`, and `VERCEL_PROJECT_ID` are available in the target CI or runtime context.
- Environment scope is approved by Product Owner Agent.

## Routing Guards
- If required secrets are missing, stop and report missing keys.
- If target environment is not approved, stop execution.
- If release or deploy gate requirements are unmet, stop execution.
