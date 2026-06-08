# H. Full Agent-to-Command Mapping Table

How commands trigger agents, in what order, and under what conditions.

## 1. High-Level Overview

Command -> Triggered Agent -> Secondary Agents -> Output -> Validation -> Merge/Deploy

Every command flows through this pipeline:

1. AI Orchestrator Agent executes `validate-mcp-readiness.md` first.
2. AI Orchestrator Agent executes `validate-agent-skill-fit.md`.
3. Product Owner Agent validates scope and workflow state.
4. Architect Agent runs for design, schema, or API boundary changes.
5. Backend and Frontend Agents implement runtime behavior.
6. Domain Agents run by capability: Content, Evaluation, Curation, Ingestion, Ranking, Mindmap, Infra, DevOps, Finance.
7. QA Agent validates acceptance criteria and regression risk.
8. Security Engineer Agent validates security gates.
9. Product Owner Agent performs final release decision.

This ensures zero drift and full control.

## 2. Command to Agent Mapping Table

### 2.1 Core Development Commands

| Command | Primary Agent Triggered | Secondary Agents | Conditions | Output |
| --- | --- | --- | --- | --- |
| validate-mcp-readiness.md | AI Orchestrator Agent | Product Owner Agent | Before every task | Readiness matrix and allow/deny decision |
| validate-agent-skill-fit.md | AI Orchestrator Agent | Product Owner Agent | After MCP readiness passes | Skill-fit allow/deny decision |
| generate-api.md | Backend Agent | Architect, Security Engineer | Feature = In Progress | API handler implementation |
| generate-module.md | Architect Agent | Backend Agent | Feature = Ready for Development | Module design and boundaries |
| generate-job.md | Backend Agent | Curation Agents | Feature = In Progress | Cron job and async worker |
| validate-ai-output.md | AI Orchestrator Agent | Backend, QA | AI output exists | Validated JSON |

### 2.2 Product Management Commands

| Command | Primary Agent | Secondary Agents | Conditions | Output |
| --- | --- | --- | --- | --- |
| create-feature.md | Product Owner Agent | Architect Agent | Always allowed | New feature file |
| create-user-story.md | Product Owner Agent | QA Agent | Always allowed | New user story |
| update-board.md | Product Owner Agent | All agents | Always allowed | Updated board status |
| update-roadmap.md | Product Owner Agent | Architect Agent | Always allowed | Updated roadmap |

### 2.3 AI and Curation Commands

| Command | Primary Agent | Secondary Agents | Conditions | Output |
| --- | --- | --- | --- | --- |
| generate-syllabus.md | AI Orchestrator Agent | Content Agent | Topic status = pending_syllabus | Syllabus JSON |
| ingest-youtube.md | Ingestion Agent | Backend Agent | Topic status = syllabus_ready | Video metadata |
| rank-videos.md | Ranking Agent | Evaluation Agent | Videos ingested | Ranked videos |
| generate-mindmap.md | Mindmap Agent | Frontend Agent | Topic status = verified | Mindmap JSON |

### 2.4 QA and Security Commands

| Command | Primary Agent | Secondary Agents | Conditions | Output |
| --- | --- | --- | --- | --- |
| run-tests.md | QA Agent | Backend Agent | Feature = Ready for QA | Test results |
| file-bug.md | QA Agent | Product Owner Agent | Bug found | Bug file and GitHub Issue |
| security-scan.md | Security Engineer Agent | Backend Agent | Every PR | Security report |
| validate-rls.md | Security Engineer Agent | Infra Agent | Schema change | RLS validation |

## 3. Command Execution Flow (Step-by-Step)

### 3.1 Example: generate-api.md

Developer -> generate-api.md -> Backend Agent

Backend Agent:
- Reads OpenAPI
- Reads feature acceptance criteria
- Generates runtime API implementation

Architect Agent:
- Validates architecture boundaries
- Ensures no schema drift

AI Orchestrator Agent:
- Validates any AI output used in the API

Security Engineer Agent:
- Scans PR
- Checks secrets
- Checks RLS
- Checks OpenAPI compliance

QA Agent:
- Validates acceptance criteria

Product Owner Agent:
- Approves merge

### 3.2 Example: generate-module.md

Developer -> generate-module.md -> Architect Agent

Architect Agent:
- Designs module
- Updates architecture notes
- Updates OpenAPI (with PO approval)

Backend Agent:
- Implements module

Security Engineer Agent:
- Validates design for security

### 3.3 Example: validate-ai-output.md

Backend -> validate-ai-output.md -> AI Orchestrator Agent

AI Orchestrator Agent:
- Validates JSON
- Retries if invalid
- Returns structured output

Backend Agent:
- Writes to DB

QA Agent:
- Validates correctness

## 4. Agent Trigger Rules (Critical)

### Product Owner Agent
Triggered by:
- Any change to roadmap
- Any change to board
- Any new feature/story
- Any dependency update

### Architect Agent
Triggered by:
- Feature moves to Ready for Development
- generate-module.md
- Schema/API changes

### Backend Agent
Triggered by:
- Feature moves to In Progress
- generate-api.md
- generate-job.md
- AI Orchestrator output

### AI Orchestrator Agent
Triggered by:
- validate-mcp-readiness.md
- validate-agent-skill-fit.md
- validate-ai-output.md
- Syllabus generation
- Video verification
- Mindmap generation

### Curation Pipeline Agents
Triggered by:
- Topic status changes
- Backend jobs

### DevOps Agent
Triggered by:
- Deployment and release workflows
- Environment setup and deploy validation

### Infra Agent
Triggered by:
- Migration and schema lifecycle operations
- RLS validation and infra safety checks

### Finance Agent
Triggered by:
- Billing and subscription operations
- Stripe-bound financial workflows

### QA Agent
Triggered by:
- Feature moves to Ready for QA
- run-tests.md

### Security Engineer Agent
Triggered by:
- Every PR
- Every migration
- Every API change
- Every secret change

## 5. Full End-to-End Example (Feature Lifecycle)

PO -> Architect -> Backend -> AI Orchestrator -> Backend -> QA -> Security -> PO

1. PO defines feature
2. Architect designs module
3. Backend implements API
4. AI Orchestrator validates AI logic
5. Backend stores results
6. QA validates acceptance criteria
7. Security scans PR
8. PO approves release

This is a real engineering team, fully automated.
