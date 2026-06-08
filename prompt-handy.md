You are an expert in agentic architectures, autonomous development systems, and Claude-style
code review. Perform a full audit of the current agentic setup, including:

1. Agent Roles & Responsibilities
   - Are all agents clearly defined?
   - Do they have explicit skill manifests?
   - Are their capabilities aligned with product requirements?
   - Are safety boundaries and escalation rules defined?

2. Skills, Tools, and Commands
   - Does each agent have the correct skills for its domain?
   - Are required commands defined with input/output schemas?
   - Are tools (MCP servers) properly mapped to the agents?
   - Are there missing skills or unsafe overlaps?

3. MCP Integration Readiness
   - Verify presence of required MCP servers:
       - GitHub MCP
       - Vercel MCP
       - Supabase MCP
       - Stripe MCP
       - Local FS MCP
       - Shell MCP (restricted)
   - Check if each server has:
       - configuration
       - permissions
       - routing rules
       - safety constraints
   - Identify missing or misconfigured MCP components.

4. Orchestrator Review
   - Does the orchestrator validate MCP readiness before any task?
   - Does it verify agent skills before assignment?
   - Does it prevent unsafe or unauthorized operations?
   - Does it have routing logic, fallback logic, and escalation logic?

5. Product Requirements Alignment
   - Compare agent capabilities with:
       - platform-overview.md
       - feature-map.md
       - user-stories.md
       - architecture.md
       - data-model.md
       - integration-map.md
       - ci-cd-pipeline.md
   - Identify gaps between requirements and agent capabilities.

6. DevOps & CI/CD
   - Are GitHub Actions workflows defined?
   - Are Vercel deployments automated?
   - Are Supabase migrations integrated?
   - Are rollback strategies defined?

7. Autonomous Development Best Practices
   - Check for:
       - deterministic workflows
       - reproducible actions
       - safe tool boundaries
       - no hallucinated capabilities
       - correct use of MCP for all external actions

8. Output Format
   - Provide a structured report with:
       - PASS/FAIL per category
       - Detailed findings
       - Missing components
       - Risks
       - Recommended fixes
       - Priority levels (High/Medium/Low)

Your goal is to determine whether the system is ready for autonomous agentic development.
If not, identify exactly what is missing and what must be added.




You are an expert in agentic architectures, autonomous development systems, and Claude-style
code review. Perform a full audit of the current agentic setup, including:

1. Agent Roles & Responsibilities
   - Are all agents clearly defined?
   - Do they have explicit skill manifests?
   - Are their capabilities aligned with product requirements?
   - Are safety boundaries and escalation rules defined?

2. Skills, Tools, and Commands
   - Does each agent have the correct skills for its domain?
   - Are required commands defined with input/output schemas?
   - Are tools (MCP servers) properly mapped to the agents?
   - Are there missing skills or unsafe overlaps?

3. MCP Integration Readiness
   - Verify presence of required MCP servers:
       - GitHub MCP
       - Vercel MCP
       - Supabase MCP
       - Stripe MCP
       - Local FS MCP
       - Shell MCP (restricted)
   - Check if each server has:
       - configuration
       - permissions
       - routing rules
       - safety constraints
   - Identify missing or misconfigured MCP components.

4. Orchestrator Review
   - Does the orchestrator validate MCP readiness before any task?
   - Does it verify agent skills before assignment?
   - Does it prevent unsafe or unauthorized operations?
   - Does it have routing logic, fallback logic, and escalation logic?

5. Product Requirements Alignment
   - Compare agent capabilities with:
       - platform-overview.md
       - feature-map.md
       - user-stories.md
       - architecture.md
       - data-model.md
       - integration-map.md
       - ci-cd-pipeline.md
   - Identify gaps between requirements and agent capabilities.

6. DevOps & CI/CD
   - Are GitHub Actions workflows defined?
   - Are Vercel deployments automated?
   - Are Supabase migrations integrated?
   - Are rollback strategies defined?

7. Autonomous Development Best Practices
   - Check for:
       - deterministic workflows
       - reproducible actions
       - safe tool boundaries
       - no hallucinated capabilities
       - correct use of MCP for all external actions

8. Output Format
   - Provide a structured report with:
       - PASS/FAIL per category
       - Detailed findings
       - Missing components
       - Risks
       - Recommended fixes
       - Priority levels (High/Medium/Low)

Your goal is to determine whether the system is ready for autonomous agentic development.
If not, identify exactly what is missing and what must be added.
