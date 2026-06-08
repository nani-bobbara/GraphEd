# Global Escalation Matrix

Version: 1.0
Scope: All agentic workflows in `/.claude/agents` and `/.claude/commands`.

## Escalation Levels

- Level 0 (Auto-resolve): deterministic retry allowed with no policy risk.
- Level 1 (Agent escalation): handoff to owning domain agent.
- Level 2 (Governance escalation): Product Owner Agent decision required.
- Level 3 (Security escalation): Security Engineer Agent blocks execution.

## Trigger -> Owner Mapping

- Missing required MCP server -> Product Owner Agent (Level 2)
- Required skill mismatch -> AI Orchestrator Agent + Product Owner Agent (Level 2)
- OpenAPI contract ambiguity -> Architect Agent (Level 1)
- RLS or migration safety failure -> Security Engineer Agent + Infra Agent (Level 3)
- High-severity security finding -> Security Engineer Agent (Level 3)
- Unclear scope or dependency conflict -> Product Owner Agent (Level 2)
- Deployment failure with rollback risk -> DevOps Agent + Product Owner Agent (Level 2)
- Billing operation ambiguity -> Finance Agent + Product Owner Agent (Level 2)

## Fallback Rules

- If Level 2 or Level 3 is reached, do not continue autonomous execution.
- Any denied `validate-mcp-readiness.md` result blocks downstream command execution.
- Any denied `validate-agent-skill-fit.md` result blocks task assignment.
- All escalations must include reproducible context and linked item IDs.

## Logging Requirements

- Log escalation level, trigger, assigned owner, and decision timestamp.
- Persist escalation notes in local artifacts and linked PR/task context.
- Never include secrets or raw sensitive tokens in escalation logs.
