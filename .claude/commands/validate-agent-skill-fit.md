# Command: Validate Agent Skill Fit

Input:
- candidate agent
- task capability requirements
- forbidden capability set

Output:
- skill-fit score
- allow/deny assignment decision
- unmet skill list

## Triggered Agents
- AI Orchestrator Agent
- Product Owner Agent

## Preconditions
- Candidate agent file exists in `/.claude/agents/`.
- Candidate agent has `Required Skills` section.

## Routing Guards
- If candidate agent lacks any required skill, deny assignment and stop.
- If candidate agent requires forbidden MCP capability, deny assignment and stop.
- If skill metadata is missing, escalate and stop.
