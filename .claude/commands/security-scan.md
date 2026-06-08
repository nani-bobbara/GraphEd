# Command: Security Scan

Input:
- linked PR id
- linked feature id

Output:
- security findings report
- gate status (`pass|fail|blocked`)

## Triggered Agents
- Security Engineer Agent
- QA Agent (for remediation verification)

## Preconditions
- PR diff and linked IDs are available.

## Routing Guards
- If required scan tooling is unavailable, set gate to `blocked` and stop.
- If high-severity findings exist, set gate to `fail` and block merge.
