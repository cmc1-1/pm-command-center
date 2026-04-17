# AI-Powered PM Assistant: Blueprint & Requirements

## Executive Summary

This document outlines the design for a comprehensive AI assistant system that will act as a **force multiplier for a Senior Product Manager** — automating operational overhead, accelerating discovery and delivery, and preserving institutional context across projects. The system is designed initially on Claude (Claude.ai + Claude Code) and is architected to be portable to any LLM platform.

The core insight from current PM-AI research: **the tool matters less than the workflow**. The best PM-AI systems aren't single tools — they're persistent, context-aware workspaces with automated skills that operate across the full product lifecycle.

---

## Part 1: Research Findings — How Top PMs Use AI in 2026

### The State of Play

Over 73% of product managers now use at least one AI-powered tool daily (up from 45% in 2024). PMs spend roughly 30% of their time on documentation, meeting notes, and status updates — all highly automatable. The emerging consensus from practitioners like Sachin Rekhi, the Productside team, and the Claude Code PM community is that the real unlock comes from **four capabilities layered together**:

| Capability | What It Means | Key Insight |
|---|---|---|
| **Context Engineering** | Persistent product knowledge that survives across sessions | "Without persistent context, AI is guessing" — Productside |
| **Workflow Automation (Skills)** | Repeatable, templated workflows that run autonomously | Sachin Rekhi runs 13+ custom skills covering strategy critique, interview synthesis, NPS analysis, release notes |
| **Agentic Execution** | AI handles research, data gathering, and drafting while you focus on decisions | One PM analyzed 34,000 Reddit comments in hours instead of weeks |
| **Vibe Coding / Prototyping** | Going from PRD to clickable prototype in minutes, not sprint cycles | Collapses stakeholder feedback loops from weeks to hours |

### What Leading PMs Automate Today

**Sachin Rekhi's 13-Skill Stack:**
- Strategy critique (fed with his own frameworks for "what great looks like")
- Competitor pricing matrix updates
- Competitive teardowns
- Interview script generation
- Customer interview summarization
- NPS analysis (runs autonomously)
- Exploratory data analysis (no manual SQL)
- Meeting management & agenda drafting
- Release notes generation

**Carl Vellotti's End-to-End Flow (Claude Code PM Course):**
- Draft user research survey → collect mock data → analyze → create PRD → build deck → generate images → write tickets into Linear → auto-update PRD as engineers start work

**Productside's Four AI Motions:**
1. Context engineering (persistent workspaces)
2. Synthetic evals (validation tests for AI reasoning)
3. Agentic research workflows (background competitive/market research)
4. Vibe-coded prototypes (functional HTML from PRDs in minutes)

---

## Part 2: PM Job Functions × AI Opportunity Map

Below is a comprehensive mapping of every major PM function to specific AI automation opportunities, rated by **impact** (how much time/quality it saves) and **feasibility** (how easy it is to build with current tools).

### 1. Product Discovery & Research

| Task | AI Automation | Impact | Feasibility |
|---|---|---|---|
| Customer interview synthesis | Auto-transcribe (Whisper) → extract pain points, quotes, feature requests → rank by frequency | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Competitive analysis | Agentic web crawl of competitor sites, pricing pages, changelogs → structured teardown | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Market sizing (TAM/SAM/SOM) | Structured reasoning with persistent context + web research | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| User feedback synthesis | Pull from support tickets, NPS, app reviews, Slack → cluster themes, track sentiment | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Survey design & analysis | Generate survey from research goals → analyze responses → surface insights | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Trend / signal monitoring | Scheduled agents that scan industry sources and surface relevant changes | ⭐⭐⭐⭐ | ⭐⭐⭐ |

### 2. Product Strategy

| Task | AI Automation | Impact | Feasibility |
|---|---|---|---|
| Strategy critique / red-teaming | Feed AI your frameworks + strategy doc → get rigorous critique | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Opportunity assessment | Score opportunities against RICE/ICE/weighted frameworks with data | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Roadmap narrative generation | Convert prioritized backlog into stakeholder-ready roadmap narrative | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| OKR/KPI definition | Suggest measurable objectives aligned to strategy with benchmark data | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| Decision documentation | Capture decision context, alternatives considered, rationale — searchable log | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

### 3. Product Definition & Documentation

| Task | AI Automation | Impact | Feasibility |
|---|---|---|---|
| PRD authoring | Socratic questioning → structured PRD with user stories (INVEST), acceptance criteria, test scenarios | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| User story generation | From PRD context, generate epics → stories → sub-tasks with acceptance criteria | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Technical spec review | Critique tech specs against PRD requirements, flag gaps and ambiguities | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| API/integration documentation | Generate API docs, integration guides from codebase context | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Release notes | Convert engineering changelogs/commit messages to customer-friendly language | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

### 4. Design & UX

| Task | AI Automation | Impact | Feasibility |
|---|---|---|---|
| Wireframe / prototype generation | PRD → functional HTML prototype for stakeholder review | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| UX copy generation | Generate UI copy variants aligned to tone/brand guidelines | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Accessibility audit | Review designs/prototypes against WCAG standards | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| Design critique | Multi-perspective review (engineering, exec, user researcher sub-agents) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

### 5. Execution & Delivery

| Task | AI Automation | Impact | Feasibility |
|---|---|---|---|
| Sprint planning support | Analyze historical velocity, suggest story point estimates, flag dependency risks | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| Standup/meeting summarization | Auto-summarize meetings → extract action items → assign owners → track follow-ups | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Blocker identification | Monitor Jira/Linear for stale tickets, dependency chains, at-risk milestones | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| Status report generation | Pull data from PM tools → generate exec-friendly weekly update | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Jira/Linear ticket management | Auto-categorize, route, update tickets; generate ticket skeletons from PRDs | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

### 6. Stakeholder Communication

| Task | AI Automation | Impact | Feasibility |
|---|---|---|---|
| Exec update drafting | Rewrite detailed updates into exec-friendly summaries with key metrics | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Meeting prep & agendas | Generate structured agendas from context + previous meeting notes | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Presentation deck creation | Strategy/roadmap docs → polished slide deck | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Email/Slack drafting | Context-aware message drafting with appropriate tone per audience | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Stakeholder FAQ generation | Anticipate questions about a feature/launch and prepare answers | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

### 7. Data & Analytics

| Task | AI Automation | Impact | Feasibility |
|---|---|---|---|
| Metric dashboard generation | Natural language → SQL → visualization | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Funnel analysis | Analyze conversion funnels, identify drop-off points, suggest experiments | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| A/B test analysis | Statistical analysis of experiment results with recommendations | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| NPS/CSAT analysis | Trend analysis, verbatim clustering, driver analysis | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Anomaly detection | Flag unexpected metric movements with probable causes | ⭐⭐⭐⭐ | ⭐⭐⭐ |

### 8. Go-to-Market & Launch

| Task | AI Automation | Impact | Feasibility |
|---|---|---|---|
| Launch checklist generation | Context-aware launch plan with dependencies, owners, timelines | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Positioning & messaging | Generate positioning statements, value props, messaging matrices | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Customer comms drafting | Announcement emails, in-app copy, help articles | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Sales enablement | Generate battle cards, objection handling guides, demo scripts | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

### 9. Personal Productivity & Onboarding

| Task | AI Automation | Impact | Feasibility |
|---|---|---|---|
| New role onboarding accelerator | Structured 30-60-90 plan, stakeholder mapping, product/codebase ramp-up | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Knowledge base maintenance | Auto-update product wiki from PRDs, decisions, meeting notes | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Time audit & optimization | Track time allocation, suggest rebalancing toward high-impact work | ⭐⭐⭐ | ⭐⭐⭐ |
| Learning & upskilling | Curated reading/course recommendations based on identified gaps | ⭐⭐⭐ | ⭐⭐⭐⭐ |

---

## Part 3: System Architecture — "PM Command Center"

### Design Principles

1. **Context is king** — All AI interactions draw from a persistent, growing knowledge base about your product, team, market, and decisions
2. **Skills over chat** — Repeatable workflows are codified as skills/templates, not ad-hoc prompts
3. **Local-first, portable** — All context stored as markdown files; no vendor lock-in
4. **Human-in-the-loop** — AI drafts, you decide. AI critiques, you refine
5. **Progressive automation** — Start manual, observe patterns, then automate

### Recommended Architecture

```
PM-Command-Center/
├── CLAUDE.md                          # Master context file (product, team, preferences)
├── context/                           # Persistent product knowledge
│   ├── product-overview.md            # What we build, for whom, why
│   ├── team-directory.md              # Who does what, communication preferences
│   ├── tech-stack.md                  # Architecture, key services, APIs
│   ├── strategy/
│   │   ├── current-strategy.md        # Active product strategy
│   │   ├── okrs-q1-2026.md            # Current OKRs
│   │   └── decision-log.md            # Key decisions with rationale
│   ├── competitors/
│   │   ├── competitor-matrix.md       # Feature/pricing comparison
│   │   └── teardowns/                 # Individual competitor analyses
│   ├── users/
│   │   ├── personas.md                # User personas
│   │   ├── journey-maps.md            # Current user journeys
│   │   └── feedback-themes.md         # Recurring feedback patterns
│   └── metrics/
│       ├── north-star.md              # Key metrics definitions
│       └── baselines.md               # Current metric baselines
├── templates/                         # Reusable document templates
│   ├── prd-template.md
│   ├── user-story-template.md
│   ├── exec-update-template.md
│   ├── meeting-agenda-template.md
│   ├── launch-checklist-template.md
│   ├── interview-guide-template.md
│   └── competitive-teardown-template.md
├── skills/                            # Automated workflow definitions
│   ├── discovery/
│   │   ├── interview-synthesis.md
│   │   ├── feedback-clustering.md
│   │   ├── competitive-scan.md
│   │   └── market-sizing.md
│   ├── strategy/
│   │   ├── strategy-critique.md
│   │   ├── opportunity-scoring.md
│   │   └── roadmap-narrative.md
│   ├── definition/
│   │   ├── prd-generator.md
│   │   ├── user-story-generator.md
│   │   ├── release-notes.md
│   │   └── spec-reviewer.md
│   ├── execution/
│   │   ├── meeting-summarizer.md
│   │   ├── status-report.md
│   │   ├── blocker-scanner.md
│   │   └── ticket-generator.md
│   ├── communication/
│   │   ├── exec-update-writer.md
│   │   ├── stakeholder-faq.md
│   │   ├── deck-builder.md
│   │   └── email-drafter.md
│   ├── data/
│   │   ├── metric-explorer.md
│   │   ├── funnel-analyzer.md
│   │   ├── ab-test-analyzer.md
│   │   └── nps-analyzer.md
│   └── gtm/
│       ├── launch-planner.md
│       ├── positioning-generator.md
│       └── battle-card-creator.md
├── research/                          # Working research files
│   ├── interviews/                    # Raw transcripts + synthesis
│   ├── surveys/
│   └── market-data/
├── artifacts/                         # Generated outputs
│   ├── prds/
│   ├── decks/
│   ├── reports/
│   └── prototypes/
└── inbox/                             # Drop zone for raw inputs
    ├── meeting-recordings/
    ├── screenshots/
    └── raw-feedback/
```

### CLAUDE.md — The Master Context File

This is the most important file. It tells the AI who you are, what you're building, and how you work. It should include:

```markdown
# PM Command Center — [Product Name]

## About Me
- Role: Senior Product Manager
- Team: [Team name]
- Reports to: [Manager name/title]
- Key stakeholders: [List with communication preferences]

## Product Context
- Product: [One-line description]
- Users: [Primary personas with key jobs-to-be-done]
- Business model: [How we make money]
- Current phase: [Discovery / Build / Scale]
- North star metric: [What we optimize for]

## Working Preferences
- Tone: Direct and concise. No fluff
- Document style: Start with the "so what," then provide detail
- When critiquing: Be specific and actionable. Challenge assumptions
- Default output: Markdown files saved to /artifacts/

## Current Priorities
1. [Priority 1 with brief context]
2. [Priority 2 with brief context]
3. [Priority 3 with brief context]

## Team Norms
- Sprint cadence: [2-week sprints, planning on Mondays]
- Standups: [Daily at X time]
- Tools: [Jira/Linear, Slack, Confluence/Notion, Figma]
- Code review: [Process notes]
```

---

## Part 4: Implementation Roadmap

### Phase 0 — Pre-Start (Week -1): Foundation Setup

**Goal:** Have the AI system ready before Day 1 at the new role.

| Action | Tool | Time |
|---|---|---|
| Set up PM-Command-Center folder structure | Local filesystem | 30 min |
| Create CLAUDE.md with what you know so far | Claude Code | 30 min |
| Install Claude Code, authenticate | Terminal | 15 min |
| Create first 3 templates (PRD, meeting notes, exec update) | Claude Code | 1 hr |
| Build "onboarding accelerator" skill | Claude Code | 1 hr |

### Phase 1 — Weeks 1-2: Onboarding Acceleration

**Goal:** Use AI to absorb product context 3x faster than normal.

**Priority skills to build:**
1. **Meeting Summarizer** — Drop recording → get structured summary + action items
2. **Stakeholder Mapper** — Build relationship graph from 1:1 notes
3. **Product Knowledge Extractor** — Feed existing docs → populate context files
4. **Question Generator** — Based on gaps in your context, suggest questions for 1:1s

**Key activities:**
- After every meeting: run meeting summarizer, update context files
- After every doc review: extract key facts into context/
- End of each day: ask Claude to identify gaps in your product understanding
- Build your 30-60-90 plan with AI assistance

### Phase 2 — Weeks 3-6: Core Workflow Automation

**Goal:** Automate the recurring 30% of your week.

**Priority skills to build:**
1. **Status Report Generator** — Auto-pull from project tools → exec summary
2. **PRD Generator** — Socratic questioning → structured PRD
3. **Interview Synthesis** — Batch-process transcripts → ranked pain points
4. **Strategy Critique** — Red-team your own strategy docs
5. **Competitive Scanner** — Scheduled competitor website monitoring

**MCP Integrations to set up:**
- Jira/Linear (ticket management)
- Slack (search organizational context)
- Google Drive/Confluence (document access)
- Calendar (meeting context)

### Phase 3 — Weeks 7-12: Advanced Capabilities

**Goal:** Move from automation to augmentation.

**Priority skills to build:**
1. **Prototype Generator** — PRD → functional HTML prototype
2. **Funnel Analyzer** — Data → conversion insights → experiment ideas
3. **Launch Planner** — Feature spec → comprehensive launch checklist
4. **Battle Card Creator** — Competitive data → sales enablement docs
5. **Decision Logger** — Capture and index all product decisions

**Advanced patterns:**
- Parallel agents for batch processing (10 interviews simultaneously)
- Sub-agents for multi-perspective review (engineer, exec, user researcher viewpoints)
- Scheduled agents for ongoing monitoring tasks

### Phase 4 — Ongoing: Compound Intelligence

**Goal:** The system gets smarter the more you use it.

- Every output becomes input for future context
- Templates improve based on what works
- Decision log becomes institutional memory
- Feedback themes accumulate and reveal trends over time
- New team members can ramp up by reading the context/ directory

---

## Part 5: Quick-Start Skill Specifications

### Skill 1: Meeting Summarizer

```yaml
name: meeting-summarizer
trigger: "Summarize this meeting"
inputs:
  - Meeting recording/transcript (audio file or text)
  - Meeting type (standup, 1:1, sprint planning, stakeholder review)
  - Attendees (optional)
outputs:
  - /artifacts/meetings/YYYY-MM-DD-{topic}.md
process:
  1. Transcribe audio (if recording) using Whisper
  2. Extract: key decisions, action items (with owners + deadlines),
     open questions, parking lot items
  3. Identify any updates to product context files
  4. Generate follow-up email draft (optional)
  5. Update context/ files with new information
```

### Skill 2: PRD Generator

```yaml
name: prd-generator
trigger: "Create a PRD for {feature}"
inputs:
  - Feature description / problem statement
  - Reads: context/product-overview.md, context/users/personas.md,
    context/strategy/current-strategy.md
outputs:
  - /artifacts/prds/{feature-name}-prd.md
process:
  1. Socratic questioning phase (5-8 questions to clarify scope)
  2. Generate PRD sections: Problem, Users, Goals, Requirements,
     User Stories (INVEST), Success Metrics, Out of Scope,
     Open Questions, Technical Considerations
  3. Run sub-agent critique from engineering perspective
  4. Run sub-agent critique from user-researcher perspective
  5. Highlight assumptions that need validation
```

### Skill 3: Strategy Critique

```yaml
name: strategy-critique
trigger: "Critique this strategy"
inputs:
  - Strategy document (markdown or PDF)
  - Reads: context/strategy/, context/competitors/, context/metrics/
outputs:
  - /artifacts/reviews/{doc-name}-critique.md
process:
  1. Evaluate against strategy frameworks (vision-strategy alignment,
     competitive differentiation, resource feasibility)
  2. Identify unstated assumptions
  3. List strongest and weakest elements
  4. Suggest specific improvements with rationale
  5. Generate devil's advocate arguments
  6. Score on clarity, coherence, ambition, feasibility (1-10 each)
```

### Skill 4: Competitive Teardown

```yaml
name: competitive-teardown
trigger: "Analyze competitor {name}"
inputs:
  - Competitor name or URL
  - Focus areas (pricing, features, positioning, UX)
  - Reads: context/competitors/competitor-matrix.md
outputs:
  - /artifacts/competitors/{competitor}-teardown.md
  - Updates: context/competitors/competitor-matrix.md
process:
  1. Web crawl competitor site (pricing, features, changelog, blog)
  2. Analyze positioning and messaging
  3. Feature-by-feature comparison against our product
  4. Identify gaps (theirs and ours)
  5. Summarize strengths, weaknesses, opportunities, threats
  6. Update the master competitor matrix
```

### Skill 5: Interview Synthesis

```yaml
name: interview-synthesis
trigger: "Synthesize interviews in {folder}"
inputs:
  - Folder of transcript files
  - Research questions (optional)
outputs:
  - /artifacts/research/interview-synthesis-{date}.md
  - Updates: context/users/feedback-themes.md
process:
  1. For each transcript, extract: interviewee role,
     top 3 pain points with quotes, current workflow,
     feature requests, emotional intensity signals
  2. Cross-transcript analysis: rank pain points by frequency,
     identify contradictions and outliers
  3. Generate 3-5 hypotheses worth validating
  4. Suggest follow-up research questions
  5. Update persistent feedback themes
```

---

## Part 6: Platform Strategy — Build Once, Run Anywhere

### Why Start with Claude

- **Claude Code** provides the richest skill/agent/context primitives for PMs today
- **Local markdown files** = zero vendor lock-in
- **MCP integrations** connect to Jira, Linear, Slack, Google Drive, GitHub
- **Skills format** is becoming an open standard (agentskills.io)

### Portability Plan

The entire system is designed to be platform-agnostic:

| Component | Portable? | Migration Path |
|---|---|---|
| Context files (markdown) | ✅ Fully portable | Copy to any AI workspace |
| Templates (markdown) | ✅ Fully portable | Works with any LLM |
| Skill definitions (markdown) | ✅ Mostly portable | Adapt syntax for target platform |
| MCP integrations | ⚠️ Partially portable | MCP is becoming a standard; most tools support it |
| Claude Code-specific syntax | ❌ Needs adaptation | Translate slash commands to target platform |

### If New Employer Uses a Different Platform

- **ChatGPT/OpenAI:** Use ChatGPT Projects for persistent context; adapt skills to Custom GPTs or Assistants API
- **Google Gemini:** Use Google Gems for context; Vertex AI agents for automation
- **Microsoft Copilot:** Use Copilot Studio for custom agents; SharePoint for context
- **Internal LLM:** The markdown context and templates work with any model

---

## Part 7: Success Metrics for the AI PM System

Track these to measure whether the system is delivering value:

| Metric | Target | How to Measure |
|---|---|---|
| Time spent on documentation | Reduce by 50% | Weekly time audit |
| PRD creation time | < 2 hours (from 1-2 days) | Track per PRD |
| Meeting follow-up time | < 10 min per meeting | Track per meeting |
| Stakeholder update creation | < 30 min/week | Track weekly |
| Days to productive onboarding | < 30 days (from 60-90) | Self-assessment |
| Context files created | 20+ in first month | Count |
| Skills built and in active use | 10+ by end of Q1 | Count |
| Feedback synthesis turnaround | < 1 hour for 10 interviews | Track per batch |

---

## Next Steps

1. **Validate this plan** — Review and customize the job function map for your specific role
2. **Prioritize Phase 0 actions** — Set up folder structure and CLAUDE.md before Day 1
3. **Build your first 3 skills** — Meeting summarizer, PRD generator, status reporter
4. **Iterate weekly** — Add one new skill per week based on biggest time sink
5. **Build the full requirements spec** — Once priorities are clear, create detailed requirements for Claude Code skills or a custom skill set

---

*Generated: March 28, 2026 | Designed for Claude ecosystem, portable to any LLM platform*
