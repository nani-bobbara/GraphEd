# Command: Update Roadmap

Input:
- roadmap section
- proposed change
- dependency impact

Output:
- updated `/.claude/project/roadmap.md`
- impact summary for affected features

## Triggered Agents
- Product Owner Agent
- Architect Agent

## Preconditions
- Change rationale is documented.
- Dependency impact is explicitly listed.

## Routing Guards
- If change affects release scope without approval, stop execution.
- If dependency graph becomes invalid, stop execution.
