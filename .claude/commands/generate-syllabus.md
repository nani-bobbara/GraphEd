# Command: Generate Syllabus

Input:
- topic id
- context constraints

Output:
- syllabus JSON artifact
- topic status transition proposal

## Triggered Agents
- AI Orchestrator Agent
- Content Agent

## Preconditions
- Topic status is `pending_syllabus`.
- Schema contract exists.

## Routing Guards
- If schema is missing, stop and escalate.
- If output fails validation after retries, stop and escalate to QA Agent.
