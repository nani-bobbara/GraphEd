# GraphEd — System Architecture

## High-Level Architecture
- **Frontend:** Next.js (App Router)
- **Backend:** Supabase (Postgres, Auth, Storage, Edge Functions)
- **AI Layer:** Multi‑agent system with Orchestrator
- **DevOps:** GitHub Actions + Vercel
- **Integrations:** Stripe, MCP servers

## Data Flow
1. User interacts with Next.js UI.
2. Supabase handles auth and data persistence.
3. Agents generate or evaluate content.
4. Orchestrator coordinates tasks and MCP tool access.
5. Vercel deploys frontend; Supabase deploys backend functions.

## Security Model
- Row‑level security (RLS)
- MCP permission boundaries
- API key isolation
- Role‑based access control
