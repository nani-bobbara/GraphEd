# Pull Request Gates

Version: 1.0 (MVP)

Scope: GraphEd merge policy aligned to /.claude/project/sync-rules.md.

## Required PR References

Each PR must reference at least one feature ID:
- Feature-XXX

Optional linked IDs:
- US-XXX
- TECH-XXX
- BUG-XXX

## Status Gate

- Linked feature must be In Progress when PR is opened.
- PR cannot merge unless linked feature progresses through Ready for QA and Done workflows.

## Dependency Gate

- If any linked item dependency is not Done, PR is blocked.

## Quality Gate

- CI checks must pass:
- lint
- type-check
- tests

## Security Gate

- Security scan must run on every PR.
- High-severity findings block merge.
- Secret detection failures block merge.
- RLS-related policy regressions block merge.

## QA Gate

- Acceptance criteria for linked items must be validated.
- Open P0/P1 bugs block merge.

## Contract Gate

- API changes must remain compatible with active OpenAPI contract.
- Breaking contract changes require explicit version bump and changelog updates.

## Enforcement Ownership

- Product Owner Agent approves status transitions.
- QA provides validation outcome and bug reports.
- Security checks enforce merge safety.
- Final merge allowed only when all gates pass.
