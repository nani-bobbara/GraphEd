# Command: Rank Videos

Input:
- topic id
- candidate video set

Output:
- ranked video list with score and confidence
- evidence bundle

## Triggered Agents
- Ranking Agent
- Evaluation Agent

## Preconditions
- Video candidates exist.
- Ranking schema is available.

## Routing Guards
- If confidence evidence is missing for thresholded scores, stop execution.
- If schema mismatch is detected, stop and escalate.
