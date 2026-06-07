# Skill: Mindmap Layout

Defines node and edge layout policies for topic mindmaps.

Scope:
- Parent-child relationships
- Module and concept clustering
- Coordinate assignment and overlap avoidance
- Incremental relayout after edits

Rules:
- All edges must reference existing nodes.
- Coordinates remain within canvas bounds.
- Output must be deterministic for same input seed.
