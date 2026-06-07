# Command: Generate API Handler

Input:
- endpoint path
- method
- request schema
- response schema

Output:
- Supabase Edge Function code (TypeScript)
- input validation
- typed response shape

## Triggered Agents
- Backend Agent
- Architect Agent (when contract or boundary mismatch is detected)
- QA Agent (for acceptance alignment checks)

## Preconditions
- Linked feature status is In Progress.
- Dependencies for linked item are Done.
- OpenAPI active version and request/response schemas are available.

## Routing Guards
- If status is not eligible, stop and defer to Product Owner decision.
- If dependencies are unmet, stop execution.
- If contract change is required, request PO-approved version bump flow.
