# Command: Validate RLS

Input:
- schema scope
- linked migration id

Output:
- RLS validation report
- policy drift summary

## Triggered Agents
- Security Engineer Agent
- Infra Agent

## Preconditions
- Migration artifacts exist.
- Schema scope is provided.

## Routing Guards
- If RLS is disabled on any user-scoped table, fail validation.
- If policy drift cannot be resolved automatically, escalate and stop.
