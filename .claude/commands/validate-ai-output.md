# Command: Validate AI Output

Input:
- JSON output
- schema type

Output:
- pass/fail result
- normalized error list
- retry recommendation

## Triggered Agents
- AI Orchestrator Agent
- QA Agent (for validation failures or release-gate impact)

## Preconditions
- Linked feature or tech story status is In Progress or Ready for QA.
- Schema type is defined in project artifacts.

## Routing Guards
- If status is not eligible, stop and defer to Product Owner decision.
- If schema reference is missing, stop and request schema definition.
