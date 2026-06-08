# Command: Update Board

Input:
- item id
- source status
- target status
- reason

Output:
- updated `/.claude/project/board.md`
- transition audit note

## Triggered Agents
- Product Owner Agent

## Preconditions
- Item exists in project files.
- Transition follows canonical workflow.

## Routing Guards
- If dependency gates are unmet, stop execution.
- If status transition is invalid, stop and escalate.
