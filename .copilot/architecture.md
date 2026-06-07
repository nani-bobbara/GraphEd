# GraphEd Architecture

Logical services:
- User Service
- Topic Service
- Curation Orchestrator
- Video Ingestion
- Ranking and Verification
- Mindmap Service
- Notification Service

Design constraints:
- Modular monolith boundaries must be explicit.
- Async jobs coordinate long-running curation phases.
- DB access goes through shared query modules.
- Backend runtime is Supabase Edge Functions with TypeScript.
- OpenAPI is strict per version; endpoint changes require explicit version and changelog updates.
