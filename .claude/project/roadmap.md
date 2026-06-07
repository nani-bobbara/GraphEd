# D. GraphEd MVP Roadmap (Q3-Q4)

**Version:** 1.0

**Scope:** MVP + Infrastructure + Security

**Owner:** Product Owner Agent

## MVP Goal (Q4 Release)

Deliver a fully functional, secure, end-to-end learning curation platform where a user can:

1. Sign up / log in
2. Create a topic
3. Generate a syllabus
4. Ingest YouTube videos
5. Verify and rank videos
6. Generate a mindmap
7. View and consume the curated learning path
8. Publish the topic (private/public)

This is the minimum viable product.

## Phase 1 - Platform Foundations (Q3, Weeks 1-3)

Purpose: Establish secure backend, CI/CD, secrets, OpenAPI, and Supabase auth.

### Deliverables

- Supabase project + schema + RLS
- Auth (email/password + OAuth optional)
- OpenAPI v1.0.0 (strict contract)
- GitHub Actions CI (lint, type-check, tests)
- Secret management (GitHub + Supabase)
- Security scanning on every PR
- Local dev environment stable

### Features / Tech Stories

- Feature 007: Auth and User Accounts
- Feature 008: Platform Infra and CI
- Tech 001: Supabase Setup and RLS
- Tech 002: OpenAPI Contract and Versioning
- Tech 003: GitHub Actions CI/CD
- Tech 004: Secret Management Strategy
- Tech 005: Security Scan on PRs

### Dependencies

- None - this is the foundation.

## Phase 2 - Core Curation Pipeline (Q3, Weeks 4-8)

Purpose: Build the heart of GraphEd - topic -> syllabus -> videos -> verification.

### Deliverables

- Topic creation
- Syllabus generation
- YouTube search + ingestion
- Video verification + ranking
- AI validation layer
- All data stored in Supabase

### Features

- Feature 001: Topic Creation
- Feature 002: Syllabus Generation
- Feature 003: YouTube Search and Ingestion
- Feature 004: Video Verification and Ranking

### Spikes

- Spike 001: YouTube API Quotas and Caching

### Dependencies

- Requires Phase 1 to be complete
- Requires OpenAPI v1.0.0
- Requires Supabase schema + RLS

## Phase 3 - Mindmap Experience (Q3, Weeks 9-10)

Purpose: Provide a visual, interactive mindmap for the curated topic.

### Deliverables

- Mindmap JSON generation
- Node/edge layout
- Frontend rendering-ready API

### Features

- Feature 005: Mindmap Generation and View

### Spikes

- Spike 002: Mindmap Layout Approach

### Dependencies

- Feature 002 (syllabus)
- Feature 004 (video verification)

## Phase 4 - Topic Publishing and User Experience (Q4, Weeks 1-2)

Purpose: Allow users to consume curated topics and share them.

### Deliverables

- Topic publishing (private/public)
- Topic visibility rules
- Basic learner dashboard

### Features

- Feature 006: Topic Publishing and Visibility
- US-003: Consume Curated Topic

### Dependencies

- All curation pipeline features
- Mindmap generation

## Phase 5 - Security, QA, and Hardening (Q4, Weeks 3-4)

Purpose: Ensure the MVP is secure, stable, and production-ready.

### Deliverables

- Full QA validation
- Security Engineer Agent review
- Bug fixes
- Performance tuning
- Final OpenAPI v1.0.1 (non-breaking updates)

### Artifacts

- Bugs in /bugs/
- QA test results
- Security scan reports

### Dependencies

- All features must be in Ready for QA

## MVP Release (End of Q4)

Criteria for release:

- All features in Done
- No high-severity security issues
- No open P0/P1 bugs
- All acceptance criteria met
- All endpoints match OpenAPI
- All agents aligned with PO definitions
- CI/CD green
- Supabase RLS fully enforced

## Dependency Graph (High-Level)

Infra -> Auth -> OpenAPI -> Topic Creation -> Syllabus -> YouTube Ingestion -> Verification -> Mindmap -> Publishing -> QA -> Release

## Post-MVP (Not included in this roadmap)

These are intentionally excluded from MVP:

- Social features
- Notes and highlights
- Favorites
- Topic search
- Recommendations
- Multi-language support
- Mobile app
- Collaboration features

These will be added in Roadmap v2 after MVP release.
