# Command: Generate Job Handler

Input:
- job name
- trigger event
- responsibilities

Output:
- job code
- queue and retry logic
- status transition updates

## Triggered Agents
- Backend Agent
- Curator Agent
- Ingestion Agent
- Ranking Agent
- Mindmap Agent

## Preconditions
- Linked feature status is In Progress.
- Dependencies for linked item are Done.
- Job trigger and phase ownership are defined.

## Routing Guards
- If status is not eligible, stop and defer to Product Owner decision.
- If dependencies are unmet, stop execution.
- If phase ordering conflicts with sync rules, stop execution.
