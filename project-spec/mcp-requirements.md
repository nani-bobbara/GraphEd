# GraphEd — MCP Requirements

## Required MCP Servers
- mcp-github
- mcp-vercel
- mcp-supabase
- mcp-stripe
- mcp-localfs
- mcp-shell (restricted)

## Orchestrator Rules
- Never assume a tool exists.
- Stop if any required MCP server is missing.
- Request configuration from developer.
- Log all MCP interactions.
