# Feature 001: Topic Creation

## Status
Ready for Development

## Epic
Epic 001: Topic Curation Pipeline

## Description
Allow a signed-in user to create a new topic that becomes the root of the curation pipeline.

## User Stories
- US-001: Create Topic

## Acceptance Criteria
- Authenticated user can create a topic with title and optional description.
- Topic stored in Supabase topics table.
- Initial status = "pending_syllabus".
- Topic is scoped to the creating user via RLS.

## Dependencies
- Feature 007: Auth and User Accounts
- Tech 001: Supabase Setup and RLS
