# Command: Create User Story

Input:
- user story id
- title
- linked feature id
- acceptance criteria

Output:
- new user story file under `/.claude/project/user-stories/`
- traceability metadata for QA

## Triggered Agents
- Product Owner Agent
- QA Agent

## Preconditions
- ID format is `us-XXX-*`.
- Linked feature exists.

## Routing Guards
- If linked feature is missing, stop execution.
- If acceptance criteria are empty, stop execution.
