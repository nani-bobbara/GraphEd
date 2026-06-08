# GraphEd — Data Model (Supabase)

## Tables

### users
- id (uuid)
- email
- role
- created_at

### courses
- id
- title
- description
- owner_id

### modules
- id
- course_id
- title
- order_index

### questions
- id
- module_id
- type
- difficulty
- content
- metadata (JSONB)

### attempts
- id
- user_id
- question_id
- response
- score
- feedback
