# GraphEd Project Context

GraphEd is a modular monolith with a Supabase-only backend (Supabase Edge Functions + TypeScript) and Next.js App Router frontend.

Core rules:
- Follow the phased curation pipeline (syllabus -> search -> verification -> mindmap -> review/publish).
- Treat OpenAPI as a strict contract for the active version.
- Store metadata and relationships only; never store raw video files.
- Keep AI orchestration centralized under shared prompt and validation layers.
