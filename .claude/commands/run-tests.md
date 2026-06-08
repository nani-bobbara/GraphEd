# Command: Run Tests

Input:
- scope (`unit|integration|smoke|all`)
- linked item id

Output:
- test report
- pass/fail status

## Triggered Agents
- QA Agent
- Backend Agent

## Preconditions
- Item status is `Ready for QA` or explicitly approved for test run.

## Routing Guards
- If test scope is undefined, stop execution.
- If reproducible failure artifacts are missing, stop sign-off.
