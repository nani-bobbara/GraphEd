# Command: Generate Backend Module

Input:
- module name
- responsibilities

Output:
- folder structure
- function stubs
- imports
- concise implementation notes

## Triggered Agents
- Architect Agent
- Backend Agent

## Preconditions
- Linked feature status is Ready for Development or In Progress.
- Dependencies for linked item are Done.

## Routing Guards
- If status is not eligible, stop and defer to Product Owner decision.
- If dependencies are unmet, stop execution.
