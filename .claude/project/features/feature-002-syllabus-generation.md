# Feature 002: Syllabus Generation

## Status
Ready for Development

## Epic
Epic 001: Topic Curation Pipeline

## Description
Generate a structured syllabus (modules + objectives) for a topic.

## User Stories
- US-002: View and Confirm Syllabus

## Acceptance Criteria
- 5-12 modules generated.
- JSON matches syllabus schema.
- Stored in topics.ai_syllabus_json.
- topic_modules rows created.
- Topic status updated to "syllabus_ready".

## Dependencies
- Feature 001: Topic Creation
- Tech 002: OpenAPI Contract and Versioning
