# GraphEd — CI/CD Pipeline

## GitHub Actions Workflow
- Install dependencies
- Lint and type-check
- Run tests
- Build Next.js app
- Deploy to Vercel
- Run Supabase migrations

## Deployment Flow
1. Developer pushes to branch.
2. Preview deployment created.
3. Tests run automatically.
4. Orchestrator validates MCP readiness.
5. Merge triggers production deployment.

## Rollback Strategy
- Vercel instant rollback
- Supabase migration rollback scripts
