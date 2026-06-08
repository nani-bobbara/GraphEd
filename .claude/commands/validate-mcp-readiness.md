# Command: Validate MCP Readiness

Input:
- task id
- required server list
- requested capability set

Output:
- readiness matrix per MCP server
- allow/deny decision with reasons

## Triggered Agents
- AI Orchestrator Agent
- Product Owner Agent

## Preconditions
- Task has linked feature/story context.
- Required server list is defined.

## Required Servers
- mcp-github
- mcp-vercel
- mcp-supabase
- mcp-stripe
- mcp-localfs
- mcp-shell (restricted)

## Routing Guards
- If any required server is missing, deny execution and stop.
- If requested capability exceeds policy for the assigned agent, deny execution and escalate.
- If MCP readiness passes, `validate-agent-skill-fit.md` must run before task assignment.
- Log all server checks and decisions in task artifacts before returning.
