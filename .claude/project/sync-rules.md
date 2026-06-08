# GitHub Project <-> /.claude/project Sync Rules

**Version:** 1.0 (MVP)

**Scope:** GraphEd Platform - Agentic Development System

## 1. Purpose

GraphEd uses two project management systems:

### 1.1 GitHub Project (human-facing)

- Visual board
- Drag-and-drop
- PR linking
- Issue tracking
- Collaboration

### 1.2 /.claude/project (agent-facing)

- Machine-readable
- Version-controlled
- Structured definitions
- Acceptance criteria
- Dependencies
- Roadmap

These two systems must remain perfectly synchronized so that:

- Humans and agents always see the same truth
- No agent works on unapproved or out-of-sequence work
- No drift occurs between planning and execution

This document defines the sync protocol.

## 2. Object Mapping (1:1 Relationship)

### 2.1 Epics

/.claude/project                         GitHub Project
/epics/epic-XXX-*.md                    Project Group or label epic:XXX

Rules:

- Every epic file must have a matching GitHub epic group.
- Epic ID must match exactly.

### 2.2 Features

/.claude/project                         GitHub Project
/features/feature-XXX-*.md              Project Item (Feature)

Rules:

- Feature ID in filename equals Feature ID in GitHub item title.
- Each feature belongs to exactly one epic.
- Each feature must have a status field.

### 2.3 User Stories

/.claude/project                         GitHub Project
/user-stories/us-XXX-*.md               GitHub Issue

Rules:

- Issue title must start with US-XXX:.
- Must link to exactly one feature.
- Must contain acceptance criteria.

### 2.4 Technical Stories

/.claude/project                         GitHub Project
/tech-stories/tech-XXX-*.md             GitHub Issue

Rules:

- Issue title must start with TECH-XXX:.
- Must link to a feature or epic.

### 2.5 Spikes

/.claude/project                         GitHub Project
/spikes/spike-XXX-*.md                  GitHub Issue

Rules:

- Issue title must start with SPIKE-XXX:.
- Must include deliverables.

### 2.6 Bugs

/.claude/project                         GitHub Project
/bugs/bug-XXX-*.md                      GitHub Issue

Rules:

- Issue title must start with BUG-XXX:.
- Must reference feature + user story.
- Created by QA or Security Engineer Agent.

## 3. Status Sync Rules

GraphEd uses a canonical workflow:

Backlog -> Ready for Development -> In Progress -> In Review -> Ready for QA -> Done

### 3.1 In /.claude/project

Each file must include:

## Status
Backlog | Ready for Development | In Progress | In Review | Ready for QA | Done

### 3.2 In GitHub Project

Each status maps to a column with the same name.

### 3.3 Sync Contract

- When PO updates status in /.claude/project, GitHub item must be moved.
- When PO moves item in GitHub, file must be updated.
- If there is a conflict, /.claude/project wins (agent truth).

## 4. Dependency Enforcement

Each feature/story file may include:

## Dependencies
- Feature 007: Auth and User Accounts
- Tech 001: Supabase Setup and RLS

Rules:

- PO cannot move a feature to Ready for Development unless all dependencies are Done.
- Agents must not work on features with unmet dependencies.
- Backend Agent must check dependencies before generating code.
- Architect Agent must check dependencies before designing.

## 5. Security Sync Rules

Security is first-class in GraphEd.

### 5.1 PR Requirements

Every PR must reference:

Feature-XXX
US-XXX (optional)
TECH-XXX (optional)
BUG-XXX (optional)

### 5.2 Security Engineer Agent Responsibilities

- Runs security scan on every PR.
- Reads linked IDs and loads definitions from /.claude/project.
- If vulnerabilities found:
	- Creates bug-XXX-*.md in /bugs/
	- Opens GitHub Issue BUG-XXX
	- Links to PR + feature
	- Notifies PO Agent

### 5.3 Merge Blocking Rules

A PR cannot be merged if:

- Linked feature is not In Progress
- Security scan fails (high severity)
- QA has not validated acceptance criteria
- Feature is not marked Ready for QA -> Done

## 6. QA Sync Rules

### 6.1 QA Agent Responsibilities

- Reads acceptance criteria from /.claude/project.
- Validates features strictly against PO definitions.
- Files bugs in /bugs/ and GitHub Issues.

### 6.2 QA Blocking Rules

A feature cannot move to Done unless:

- All acceptance criteria pass
- No open bugs remain
- Security scan passed
- Backend implementation matches OpenAPI

## 7. Agent Behavior Contract

Before generating any output, each agent must:

1. Read /.claude/project/board.md
2. Locate relevant feature/story/tech/spike/bug file
3. Check status
4. Check dependencies
5. Check acceptance criteria

### Allowed Work States

- Architect Agent works only on items in Ready for Development
- Backend Agent works only on items in In Progress
- AI Orchestrator works only on items in In Progress
- QA Agent works only on items in Ready for QA
- Security Engineer works on every PR

### Forbidden

- No agent may modify /.claude/project except PO Agent.
- No agent may work on items in Backlog or Review.

## 8. Files Covered by Sync Rules

/.claude/project/epics/*
/.claude/project/features/*
/.claude/project/user-stories/*
/.claude/project/tech-stories/*
/.claude/project/spikes/*
/.claude/project/bugs/*
/.claude/project/board.md
/.claude/project/roadmap.md

## 9. Autonomous Safety Governance

### 9.1 Command Contract Requirement

- All command documents in `/.claude/commands/` must have a machine-readable counterpart in `/.claude/contracts/commands/commands.registry.json`.
- Command contract schema is defined in `/.claude/contracts/commands/command-contract.schema.json`.
- Agents must not execute commands missing a contract entry.

### 9.2 Mandatory Preflight Sequence

Before assignment of any command:

1. Run `validate-mcp-readiness.md`
2. Run `validate-agent-skill-fit.md`
3. If both pass, continue normal routing.

Any failure in this sequence blocks execution.

### 9.3 Escalation Reference

- All agent escalations must follow `/.claude/project/escalation-matrix.md`.
- Level 2 and Level 3 escalations block autonomous continuation until resolved.
