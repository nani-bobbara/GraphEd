# GraphEd Agent Hierarchy

Version: 1.0 (MVP)

Scope: Supabase-only backend, strict OpenAPI, sync-rules-governed workflow.

## Layered Ownership

1. Product Owner Agent
- Owns scope, statuses, acceptance criteria, and dependencies.
- Source of truth: /.claude/project/* and /.claude/project/sync-rules.md.

2. Architect Agent
- Designs solution boundaries for approved work.

3. Backend Agent
- Implements runtime behavior in Supabase Edge Functions and shared services.

4. AI Orchestrator Agent
- Defines prompts, schemas, and output validation behavior.

5. Curation Pipeline Agents
- Curator -> Ingestion -> Ranking -> Mindmap.

6. QA Agent
- Verifies acceptance criteria and quality gates.

7. Security Engineer responsibilities
- Enforced through PR gates in /.claude/project/pr-gates.md and sync rules.

## Interaction Diagram

Product Owner -> Architect -> Backend -> AI Orchestrator -> Curator -> Ingestion -> Ranking -> Mindmap -> QA -> Release Decision

Security checks run in parallel for every pull request and block merge on policy violations.

## Trigger Matrix

- Feature set to Ready for Development:
- Architect starts design and boundary checks.

- Feature set to In Progress:
- Backend starts implementation.
- AI Orchestrator supports prompt/schema/validator needs.
- Curator/Ingestion/Ranking/Mindmap run by pipeline stage and job triggers.

- Feature set to Ready for QA:
- QA executes acceptance validation and bug filing.

- Pull request opened or updated:
- Security gates execute via CI and policy checks.

## Handoff Contracts

1. PO to Architect
- Inputs: feature file, acceptance criteria, dependencies, status.
- Output: design decisions, boundary notes, approved contract deltas.

2. Architect to Backend
- Inputs: architecture notes, API and schema constraints.
- Output: implementation plan and concrete service changes.

3. Backend to AI Orchestrator
- Inputs: required prompt behaviors and schema interfaces.
- Output: validated prompt/schema package and retry strategy.

4. Backend to Pipeline Agents
- Inputs: topic/module identifiers and stage triggers.
- Output: stage artifacts (syllabus, videos, scores, mindmap).

5. Backend to QA
- Inputs: completed implementation mapped to acceptance criteria.
- Output: QA pass/fail results and bug reports.

## Global Guardrails

- Non-PO agents do not change /.claude/project statuses or definitions.
- All agents must run preflight checks before work.
- Dependencies marked not Done block execution even if status appears allowed.
- OpenAPI is strict by active version.
- Supabase-only backend policy is mandatory.
