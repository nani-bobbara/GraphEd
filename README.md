
# 📘 **GraphEd — Repository README (Production‑Ready)**  
*A graph‑based learning platform that transforms YouTube educational videos into structured, distraction‑free mind‑maps.*

---

## 🚀 Overview

GraphEd is an AI‑powered learning platform that converts public YouTube educational videos into structured learning topics, modules, and interactive mind‑maps.  
The system stores **only metadata and relationships**, never video files.

GraphEd uses a **phased curation pipeline**:

1. **Syllabus Generation** — AI creates modules, difficulty levels, and learning objectives.  
2. **Targeted YouTube Search** — system finds high‑quality videos per module.  
3. **AI Verification** — validates each video against module objectives with timestamps.  
4. **Mind‑map Generation** — AI builds a graph of modules, concepts, and videos.  
5. **Draft Review** — user reviews and publishes (private/public).  

GraphEd is built as a **modular monolith** on a managed backend (Supabase or Firebase), with clear service boundaries and async jobs.

---

## 🏗 Architecture

### **Frontend**
- React / Next.js  
- Renders mind‑map canvas  
- Embedded YouTube player  
- Auth via Supabase/Firebase  

### **Backend (Modular Monolith)**
- Supabase Edge Functions or Firebase Cloud Functions  
- Logical services:
  - User Service  
  - Topic Service  
  - Curation Orchestrator  
  - Video Ingestion Service  
  - Ranking & Verification Service  
  - Mind‑map Service  
  - Notification Service  

### **Async Jobs**
- Jobs table + scheduled functions  
- Used for:
  - syllabus generation  
  - YouTube search  
  - verification  
  - mind‑map generation  

### **Database (Postgres via Supabase or Firebase SQL Connect)**  
Tables:
- users  
- topics  
- topic_modules  
- videos  
- module_videos  
- favorites  
- study_notes  

---

## 📚 Data Model Summary

### **topics**
- id  
- user_id  
- title  
- description  
- status  
- ai_syllabus_json  
- ai_mindmap_json  
- visibility  
- created_at  

### **topic_modules**
- id  
- topic_id  
- module_index  
- title  
- learning_objectives  
- difficulty  
- canvas_x, canvas_y  

### **videos**
- id  
- youtube_id  
- title  
- description  
- captions  
- transcript_summary_json  

### **module_videos**
- id  
- topic_module_id  
- video_id  
- matching_score  
- llm_confidence  
- excerpt_segments  

---

## 🔄 Curation Pipeline

### **Phase A — Syllabus Generation**
- Triggered when topic is created  
- AI generates modules + objectives  
- Stored in `ai_syllabus_json`  
- Creates `topic_modules` rows  

### **Phase B — YouTube Search**
- AI generates search queries  
- Video Ingestion Service fetches metadata  
- Inserts into `videos`  

### **Phase C — Verification**
- Ranking + AI verification  
- Writes `module_videos`  

### **Phase D — Mind‑map**
- AI generates nodes + edges  
- Stored in `ai_mindmap_json`  

### **Phase E — Draft Review**
- User edits  
- Publishes topic  

---

## 🧠 AI Orchestrator

Centralized module containing:
- Prompt templates  
- Output schemas  
- Validation logic  
- Retry logic  

---

## 📁 Repository Structure

```
/src
  /.claude
   /agents
      architect.md
      backend.md
      ai-orchestrator.md
      curator.md
      ingestion.md
      ranking.md
      mindmap.md
      frontend.md
      qa.md
   /skills
      db-schema.md
      api-design.md
      prompt-design.md
      validation.md
      youtube-ingestion.md
      mindmap-layout.md
   /commands
      generate-module.md
      generate-api.md
      generate-job.md
      validate-ai-output.md

/.copilot
   project-context.md
   architecture.md
   coding-guidelines.md
   prompts.md
 /services
    /user
    /topic
    /curation
    /videoIngestion
    /ranking
    /mindmap
    /notification
  /ai
    prompts/
    validators/
  /db
    queries/
    migrations/
  /api
    handlers/
  /jobs
    syllabusJob.js
    searchJob.js
    verifyJob.js
    mindmapJob.js

/frontend
  /components
  /pages
  /mindmap
```

---

## 🧪 Testing

- Unit tests for each service  
- AI output validation tests  
- End‑to‑end tests for topic lifecycle  

---

## 📦 Deployment

- Supabase/Firebase backend  
- Vercel/Netlify frontend  
- Background jobs via scheduled functions  

---

# 📘 **OpenAPI 3.0 Specification for GraphEd**

Below is the complete OpenAPI spec for all endpoints used in v1.

---

```yaml
openapi: 3.0.3
info:
  title: GraphEd API
  version: 1.0.0
  description: API for GraphEd — graph-based education platform.

servers:
  - url: https://api.graphed.app

paths:

  /auth/me:
    get:
      summary: Get current user profile
      responses:
        '200':
          description: User profile

  /topics:
    post:
      summary: Create a new topic
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                title: { type: string }
                description: { type: string }
      responses:
        '201':
          description: Topic created

    get:
      summary: List topics (optionally filtered)
      parameters:
        - in: query
          name: visibility
          schema: { type: string }
      responses:
        '200':
          description: List of topics

  /topics/search:
    get:
      summary: Search topics
      parameters:
        - in: query
          name: query
          schema: { type: string }
      responses:
        '200':
          description: Search results

  /topics/{topicId}:
    get:
      summary: Get topic with modules, videos, mindmap
      parameters:
        - in: path
          name: topicId
          required: true
          schema: { type: string }
      responses:
        '200':
          description: Topic details

    patch:
      summary: Update topic metadata
      parameters:
        - in: path
          name: topicId
          required: true
          schema: { type: string }
      requestBody:
        content:
          application/json:
            schema:
              type: object
              properties:
                title: { type: string }
                description: { type: string }
                visibility: { type: string }
      responses:
        '200':
          description: Topic updated

  /topics/{topicId}/publish:
    post:
      summary: Publish topic
      parameters:
        - in: path
          name: topicId
          required: true
          schema: { type: string }
      responses:
        '200':
          description: Topic published

  /topics/{topicId}/modules:
    get:
      summary: List modules for a topic
      parameters:
        - in: path
          name: topicId
          required: true
      responses:
        '200':
          description: List of modules

  /modules/{moduleId}/videos:
    get:
      summary: List videos mapped to a module
      parameters:
        - in: path
          name: moduleId
          required: true
      responses:
        '200':
          description: List of videos

  /favorites:
    post:
      summary: Add topic to favorites
      requestBody:
        content:
          application/json:
            schema:
              type: object
              properties:
                topicId: { type: string }
      responses:
        '201':
          description: Favorited

    get:
      summary: List user favorites
      responses:
        '200':
          description: List of favorites

  /favorites/{favoriteId}:
    delete:
      summary: Remove favorite
      parameters:
        - in: path
          name: favoriteId
          required: true
      responses:
        '200':
          description: Favorite removed
```
