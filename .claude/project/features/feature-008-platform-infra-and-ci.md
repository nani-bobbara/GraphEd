# Feature 008: Platform Infra and CI

## Status
Ready for Development

## Epic
Epic 003: Platform Infrastructure

## Description
Set up core infra: CI, secrets, security scanning.

## Acceptance Criteria
- GitHub Actions workflow runs tests and lint on each PR.
- Secrets are stored in GitHub Actions + Supabase, not in code.
- Security scan runs on each PR (see Tech 005).

## Dependencies
- Tech 003: GitHub Actions CI CD
- Tech 004: Secret Management Strategy
- Tech 005: Security Scan on PRs
