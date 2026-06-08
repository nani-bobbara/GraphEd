# Command: File Bug

Input:
- bug id
- severity
- linked feature/story
- reproduction steps

Output:
- bug file under `/.claude/project/bugs/`
- linked issue metadata

## Triggered Agents
- QA Agent
- Security Engineer Agent (for security-classified bugs)

## Preconditions
- Bug has reproducible evidence.
- Linked work item exists.

## Routing Guards
- If severity is missing, stop execution.
- If linked item is missing, stop execution.
