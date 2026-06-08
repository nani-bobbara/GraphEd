# Command: Create Feature

Input:
- feature id
- feature title
- epic link
- acceptance criteria
- dependencies

Output:
- new feature file under `/.claude/project/features/`
- linked board update request

## Triggered Agents
- Product Owner Agent
- Architect Agent (for dependency sanity check)

## Preconditions
- ID format is `feature-XXX-*`.
- Epic reference exists.

## Routing Guards
- If ID already exists, stop and request unique ID.
- If dependencies are undefined, stop and request completion.
