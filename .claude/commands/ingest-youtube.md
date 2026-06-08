# Command: Ingest YouTube

Input:
- topic id
- module ids
- query set

Output:
- normalized video metadata records
- ingestion report

## Triggered Agents
- Ingestion Agent
- Backend Agent

## Preconditions
- Topic status is `syllabus_ready`.
- Quota policy is available.

## Routing Guards
- If quota is exhausted, stop and escalate.
- If metadata schema validation fails, stop execution.
