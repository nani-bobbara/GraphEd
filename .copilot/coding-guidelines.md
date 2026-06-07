# Coding Guidelines

- Prefer TypeScript and async/await.
- Target Supabase Edge Functions for backend execution.
- Validate all external inputs and AI outputs.
- Keep business logic in service modules, not route handlers.
- Use a shared DB query layer for persistence.
- Treat OpenAPI as a strict contract for the active version.
- Add tests for critical workflows and schema validation.
- Avoid hidden side effects; make orchestration steps explicit.
