# Command: Generate Mindmap

Input:
- topic id
- verified module graph inputs

Output:
- mindmap JSON (nodes and edges)
- layout validation report

## Triggered Agents
- Mindmap Agent
- Frontend Agent

## Preconditions
- Topic status is `verified`.
- Required node metadata exists.

## Routing Guards
- If graph contains invalid references, stop execution.
- If layout constraints are violated, stop and escalate.
