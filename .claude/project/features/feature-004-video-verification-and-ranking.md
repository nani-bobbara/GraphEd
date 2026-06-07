# Feature 004: Video Verification and Ranking

## Status
Ready for Development

## Epic
Epic 001: Topic Curation Pipeline

## Description
Use AI to verify alignment of videos to module objectives and rank them.

## Acceptance Criteria
- module_videos rows created with matching_score and llm_confidence.
- Only videos above threshold are marked as "selected".

## Dependencies
- Feature 003: YouTube Search and Ingestion
