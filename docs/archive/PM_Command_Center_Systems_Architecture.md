# PM Command Center: Systems Architecture Deep Dive

## Answering the Five Critical Design Questions

---

## 1. Meeting Notes: The Full Lifecycle

### The Problem
Meetings are the PM's richest source of signal — decisions, commitments, stakeholder sentiment, blockers — but that signal decays within hours if not captured. The system needs to handle the full lifecycle: **capture → structure → analyze → integrate → act**.

### Architecture: The Meeting Intelligence Pipeline

```
┌──────────────────────────────────────────────────────────────────────┐
│                     MEETING INTELLIGENCE PIPELINE                     │
│                                                                       │
│  ┌─────────┐   ┌──────────┐   ┌──────────┐   ┌────────┐   ┌──────┐ │
│  │ CAPTURE  │──▶│ STRUCTURE│──▶│ ANALYZE  │──▶│INTEGRATE──▶│ ACT  │ │
│  └─────────┘   └──────────┘   └──────────┘   └────────┘   └──────┘ │
│                                                                       │
│  Zoom/Teams     Summarize      Cross-ref      Update KB    Create    │
│  Otter/Granola  Extract AIs    w/ context     Feed themes  tickets   │
│  Manual notes   Decisions      Spot gaps      Log decisions Draft    │
│                 Sentiment                                   emails   │
└──────────────────────────────────────────────────────────────────────┘
```

### Stage-by-Stage Design

**Stage 1: Capture**
Multiple input paths because different meetings have different capture methods:

| Source | How It Gets In | Notes |
|--------|---------------|-------|
| Zoom/Teams auto-transcript | Export .txt/.docx → drop in `inbox/meeting-recordings/` | Most common path |
| Otter.ai / Granola / Tactiq | Auto-export or copy transcript | Best for high-fidelity |
| Audio recording | Whisper CLI transcription via Claude Code | For offline/in-person meetings |
| Manual notes | Quick notes during meeting → drop in inbox | Lightweight fallback |
| Calendar context | MCP integration pulls meeting title, attendees, agenda | Auto-enrichment |

**Stage 2: Structure (the Summarizer Skill)**
The meeting summarizer doesn't just summarize — it produces a structured artifact:

```markdown
# Meeting: [Title from calendar]
date: 2026-04-15
type: sprint-planning | 1:1 | stakeholder-review | discovery | standup
attendees: [pulled from calendar or transcript]
project: [matched to active projects in context/]
related_prd: [auto-linked if mentioned]

## TL;DR (3 sentences max)
[Executive summary suitable for someone who missed the meeting]

## Decisions Made
| # | Decision | Rationale | Decided By | Reversible? |
|---|----------|-----------|------------|-------------|
| 1 | Ship v2 API by March 30 | Customer pressure from Acme | Sarah (PM) + Mike (Eng) | No - committed to client |

## Action Items
| # | Owner | Action | Deadline | Status | Source Quote |
|---|-------|--------|----------|--------|--------------|
| 1 | Mike | Spike on auth refactor | Apr 18 | 🔴 Open | "I'll look into the auth thing this sprint" |
| 2 | Chetan | Share updated timeline with stakeholders | Apr 16 | 🔴 Open | "I'll send that out by EOW" |

## Open Questions / Parking Lot
- [ ] Do we need a separate endpoint for bulk operations? (Owner: TBD)
- [ ] Budget approval for contractor — needs Finance input

## Stakeholder Sentiment
- Mike: Concerned about tech debt — flagged twice
- Sarah: Excited about the partnership angle
- Tom: Neutral, waiting on data

## Key Quotes (for future reference)
> "If we don't address the auth refactor now, it'll block us in Q3" — Mike
> "The Acme deal alone justifies this timeline" — Sarah

## Context Updates Needed
- [ ] Update context/strategy/current-priorities.md — API v2 is now P0
- [ ] Add Acme timeline commitment to context/decisions/decision-log.md
```

**Stage 3: Analyze (Cross-referencing)**
After structuring, the skill automatically:
- Checks action items against existing open items (are there duplicates? carryovers?)
- Flags decisions that contradict previous decisions in the decision log
- Identifies recurring themes (e.g., "Mike has raised tech debt in 3 of last 5 meetings")
- Notes sentiment shifts from previous meetings with same stakeholders

**Stage 4: Integrate (Knowledge Base Updates)**
This is where the magic happens — the meeting doesn't just produce a note, it feeds the living knowledge base:

```
Meeting output ──▶ context/decisions/decision-log.md (append new decisions)
               ──▶ context/metrics/commitments.md (append deadlines)
               ──▶ context/users/feedback-themes.md (if user feedback discussed)
               ──▶ context/team/stakeholder-sentiment.md (update sentiment tracker)
               ──▶ tracking/action-items.md (append new items, check off completed)
```

**Stage 5: Act (Outputs)**
From one meeting transcript, the system can generate:
- Structured meeting notes (saved to `artifacts/meetings/`)
- Follow-up email draft (via email integration)
- Jira/Linear tickets (via MCP for action items that are stories/tasks)
- Slack summary for the team channel (via MCP)
- Updated context files (automatic)

### Meeting Types Get Different Treatment

| Meeting Type | Special Processing |
|---|---|
| **1:1 with manager** | Track career discussion themes, accumulate feedback over time, maintain relationship context |
| **Sprint planning** | Extract committed stories, velocity data, capacity concerns → update sprint context |
| **Stakeholder review** | Focus on decisions, political dynamics, approval/blockers → update stakeholder map |
| **Customer/user interview** | Full interview synthesis skill (pain points, quotes, feature requests) → update persona/feedback files |
| **Design review** | Extract design decisions, open UX questions, accessibility concerns |
| **Standup** | Lightweight — just blockers and status changes, append to sprint tracking |

---

## 2. The Growing Knowledge Base: Compound Intelligence

### The Core Idea
Every interaction with the system should make it smarter. This isn't a static wiki — it's a living, self-maintaining knowledge graph stored as interconnected markdown files.

### Architecture: Three-Layer Context System

The key insight from practitioners who've built these systems successfully: **separate your context into layers with different update cadences**. Without this, the system gets noisy within weeks.

```
┌─────────────────────────────────────────────────────────────────────┐
│                    THREE-LAYER CONTEXT SYSTEM                        │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  LAYER 1: IDENTITY (changes rarely — monthly/quarterly)      │   │
│  │  Who I am, product vision, team structure, company context   │   │
│  │  → CLAUDE.md, context/product-overview.md, context/team/     │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  LAYER 2: STRATEGY (changes weekly/biweekly)                 │   │
│  │  Current priorities, roadmap, OKRs, active PRDs, competitor  │   │
│  │  landscape, key metrics, decision log                        │   │
│  │  → context/strategy/, context/competitors/, context/metrics/ │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  LAYER 3: OPERATIONAL (changes daily)                        │   │
│  │  Action items, sprint status, meeting notes, open questions, │   │
│  │  recent feedback, current blockers                           │   │
│  │  → tracking/, artifacts/meetings/, inbox/                    │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  INDEX: context/INDEX.md — routing file the AI reads first   │   │
│  │  Maps topics to files so AI loads only what's relevant       │   │
│  └──────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────┘
```

### How Context Grows Automatically

Every skill should have a "context update" step built into its workflow:

| Activity | What Gets Added to KB | Where |
|----------|----------------------|-------|
| Meeting summarized | Decisions, action items, sentiment updates | decision-log, tracking, stakeholder map |
| PRD written | Feature context, success metrics, assumptions | strategy/active-prds/ |
| Interview synthesized | Pain points, quotes, persona updates | users/feedback-themes, users/personas |
| Competitor analyzed | Feature gaps, pricing changes, positioning shifts | competitors/matrix, competitors/teardowns/ |
| Status report generated | Metric snapshots, risk flags | metrics/weekly-snapshots/ |
| Email thread analyzed | Stakeholder positions, commitments, context | stakeholder-map, decision-log |
| Launch completed | Launch retrospective, lessons learned | strategy/retrospectives/ |

### The INDEX.md Router

This is critical for performance. Instead of loading everything, the AI reads this first:

```markdown
# Knowledge Base Index
Last updated: 2026-04-15

## Quick Routing
- Product overview & vision → context/product-overview.md
- Current priorities (Q2 2026) → context/strategy/current-priorities.md
- Team & stakeholders → context/team/directory.md
- Active PRDs → context/strategy/active-prds/ (3 active)
- Decision log → context/decisions/decision-log.md (47 entries)
- Competitor matrix → context/competitors/matrix.md
- User personas → context/users/personas.md
- Feedback themes → context/users/feedback-themes.md (updated daily)
- North star metrics → context/metrics/north-star.md
- Open action items → tracking/action-items.md (12 open)
- Sprint context → tracking/current-sprint.md
- Meeting notes → artifacts/meetings/ (sorted by date)

## Recent Changes (last 7 days)
- 2026-04-15: Added decision #47 (API v2 timeline committed)
- 2026-04-14: Updated competitor matrix (Acme launched new pricing)
- 2026-04-12: 3 new feedback themes from batch interview synthesis
- 2026-04-10: Q2 OKRs finalized
```

### Context Hygiene: Preventing Decay

The biggest risk with growing knowledge bases is **context rot** — stale information that misleads the AI. Build in maintenance:

| Maintenance Task | Cadence | How |
|---|---|---|
| Review & archive completed action items | Weekly | Automated skill on Friday |
| Verify decision log entries still current | Biweekly | Prompted review |
| Update competitor matrix | Monthly | Scheduled competitive scan skill |
| Archive old meeting notes (>90 days) | Monthly | Move to `archive/meetings/` |
| Audit INDEX.md accuracy | Monthly | Manual review |
| Prune feedback themes (resolved ones) | Quarterly | Synthesis skill |

### Session Start Hook

When you start a Claude Code session, it automatically:
1. Reads `INDEX.md` to understand what's available
2. Checks `inbox/` for new unprocessed items
3. Checks `tracking/action-items.md` for items due today/overdue
4. Surfaces any items needing attention

---

## 3. Action Item Tracking: The Accountability System

### The Problem
Action items are born in meetings, emails, Slack threads, PRD reviews, and hallway conversations. They die in the gap between "I'll look into that" and someone actually tracking it. The system needs a single source of truth that's automatically fed from every workflow.

### Architecture: Centralized Tracker with Distributed Inputs

```
┌──────────────┐
│  MEETING      │──┐
│  SUMMARIES    │  │
└──────────────┘  │
┌──────────────┐  │    ┌──────────────────────────────────────┐
│  EMAIL        │──┼──▶│  tracking/action-items.md             │
│  ANALYSIS     │  │   │  (Single Source of Truth)              │
└──────────────┘  │   │                                        │
┌──────────────┐  │   │  Auto-generated ID, Owner, Action,     │
│  PRD          │──┤   │  Deadline, Source, Status, Context     │
│  REVIEWS      │  │   └──────────────┬───────────────────────┘
└──────────────┘  │                   │
┌──────────────┐  │                   ▼
│  SLACK        │──┤   ┌──────────────────────────────────────┐
│  THREADS      │  │   │  OUTPUTS                              │
└──────────────┘  │   │  → Jira/Linear tickets (via MCP)      │
┌──────────────┐  │   │  → Daily digest (morning briefing)     │
│  MANUAL       │──┘   │  → Weekly status report               │
│  ENTRY        │      │  → Overdue alerts                     │
└──────────────┘      │  → Follow-up email drafts              │
                       └──────────────────────────────────────┘
```

### The Action Items File Format

```markdown
# Action Items Tracker
Last updated: 2026-04-15 09:30 AM

## Dashboard
- 🔴 Open: 12
- 🟡 In Progress: 4
- 🟢 Completed this week: 7
- ⚠️ Overdue: 2

## Overdue Items (ATTENTION NEEDED)
| ID | Owner | Action | Deadline | Source | Days Over |
|----|-------|--------|----------|--------|-----------|
| AI-034 | Chetan | Share updated timeline with leadership | Apr 12 | Sprint Review 04/10 | 3 days |
| AI-031 | Mike | Auth refactor spike results | Apr 14 | 1:1 04/08 | 1 day |

## Open Items
| ID | Owner | Action | Deadline | Status | Source | Priority |
|----|-------|--------|----------|--------|--------|----------|
| AI-038 | Chetan | Draft Q2 roadmap narrative | Apr 20 | 🔴 Open | OKR planning 04/15 | P1 |
| AI-037 | Chetan | Review design mockups for onboarding flow | Apr 18 | 🔴 Open | Design review 04/14 | P2 |
| AI-036 | Sarah | Confirm Acme contract terms | Apr 17 | 🟡 Waiting | Stakeholder mtg 04/13 | P1 |
| ... | | | | | | |

## Completed This Week
| ID | Owner | Action | Completed | Source |
|----|-------|--------|-----------|--------|
| AI-030 | Chetan | Send interview synthesis to design team | Apr 14 | Research sync 04/10 |
| AI-029 | Mike | Fix staging environment auth issue | Apr 13 | Standup 04/11 |

## Archive (completed items move here monthly)
→ See tracking/archive/action-items-2026-Q1.md
```

### How Items Flow Through the System

1. **Creation**: Every skill that processes meetings, emails, or reviews automatically appends new items with a unique ID, source reference, and inferred deadline
2. **Deduplication**: Before adding, the skill checks for similar existing items (same owner + similar action text)
3. **Status Updates**: When you mention completing something in a meeting or email, the summarizer updates the item status
4. **Escalation**: The daily briefing skill flags overdue items and suggests follow-up actions
5. **Jira/Linear Sync**: Items tagged as engineering work get pushed to the project tracker via MCP; status syncs back
6. **Weekly Rollup**: The status report skill pulls from this file to generate the "commitments tracking" section

### Daily Briefing Skill

Every morning, the system generates a brief:

```markdown
# Daily Briefing — April 15, 2026

## 🔴 Overdue (2 items)
- AI-034: Share updated timeline with leadership (3 days overdue)
  → Suggested action: Draft email now? [Meeting context: Sprint Review 04/10]
- AI-031: Mike's auth spike results (1 day overdue)
  → Suggested action: Ping Mike on Slack?

## 📅 Due Today (1 item)
- AI-035: Finalize interview guide for customer discovery batch

## 📋 This Week (4 items)
- AI-036: Confirm Acme contract terms (Apr 17)
- AI-037: Review design mockups (Apr 18)
- AI-038: Draft Q2 roadmap narrative (Apr 20)
- AI-039: Prep for board review (Apr 20)

## 📅 Today's Meetings (from calendar MCP)
- 10:00 AM: Standup (15 min)
- 11:00 AM: 1:1 with Sarah (30 min) — prep note ready
- 2:00 PM: Design review: Onboarding v2 (60 min)

## 📬 Email Highlights (from Gmail MCP)
- 3 unread from stakeholders requiring response
- 1 thread re: Acme contract — new message from legal
```

---

## 4. Email Integration: The Communication Layer

### Current State of the Art

Email integration via MCP is mature and production-ready. The three viable paths:

| Approach | Read | Write | Complexity | Best For |
|----------|------|-------|------------|----------|
| **Claude.ai native Gmail MCP** | ✅ | ✅ (drafts) | Low — already connected | Day-to-day in Claude.ai |
| **Google Workspace MCP** (taylorwilsdon) | ✅ | ✅ Full | Medium — self-hosted | Claude Code power users |
| **Zapier MCP bridge** | ✅ | ✅ Full | Low-Medium | Cross-platform automation |

### What Email Integration Enables for a PM

**Inbound Processing (Read)**
- **Morning email triage**: "Scan my inbox for anything urgent or stakeholder-related" → categorized summary
- **Thread analysis**: "Summarize the Acme contract thread and extract any commitments made"
- **Sentiment detection**: Flag emails where stakeholders sound frustrated or escalating
- **Action item extraction**: Pull commitments from email threads into the tracker
- **Context enrichment**: When prepping for a 1:1, pull recent email threads with that person

**Outbound Drafting (Write)**
- **Meeting follow-ups**: Auto-draft follow-up emails after meeting summarization
- **Status updates**: Generate and draft weekly stakeholder updates
- **Stakeholder communication**: Draft emails with appropriate tone for each audience (exec vs. IC)
- **Nudges**: Draft gentle follow-up emails for overdue action items owned by others

### Email Processing Skill

```yaml
name: email-triage
trigger: "Check my email" or daily scheduled run
inputs:
  - Gmail inbox (via MCP — reads last 24 hours unread)
  - context/team/directory.md (to identify stakeholders)
  - tracking/action-items.md (to match commitments)
outputs:
  - Daily email briefing section
  - New action items appended to tracker
  - Draft responses for urgent items
process:
  1. Fetch unread emails via Gmail MCP
  2. Categorize: Urgent/Stakeholder/FYI/Noise
  3. For stakeholder emails: summarize thread context
  4. Extract any action items or commitments
  5. Cross-reference with existing action items
  6. Draft responses for items marked urgent
  7. Generate triage summary for daily briefing
```

### Safety Boundaries

Email is sensitive. The system should:
- **Never auto-send** — always draft, never send without explicit confirmation
- **Flag external recipients** — highlight when a draft goes outside the org
- **Redact sensitive content** — don't store full email bodies in context files; store only summaries and extracted items
- **Audit trail** — log every email action (read/draft/categorize) for review

---

## 5. The Interaction Layer: Single Pane of Glass

### The Challenge
Right now, the PM tool landscape looks like this:
- Claude.ai for thinking and writing
- Claude Code for automation and file operations
- Jira/Linear for tickets
- Slack for communication
- Gmail for email
- Google Docs/Notion for documents
- Figma for design
- Analytics dashboards for data

The "single pane of glass" goal means: **one place to initiate any workflow, see all status, and access all context**.

### Architecture: Hub-and-Spoke with Three Interface Tiers

```
┌─────────────────────────────────────────────────────────────────┐
│                    INTERACTION LAYER OPTIONS                     │
│                                                                  │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │  TIER 1: CLAUDE CODE (Power Mode — Primary Interface)      │ │
│  │  Terminal-based, full automation, all MCP connections       │ │
│  │  Best for: skill execution, batch processing, complex      │ │
│  │  workflows, prototyping, data analysis                     │ │
│  │  "claude" → natural language → it does the work            │ │
│  └────────────────────────────────────────────────────────────┘ │
│                         ▲                                        │
│                         │ shares context via                     │
│                         │ local markdown files                   │
│                         ▼                                        │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │  TIER 2: CLAUDE.AI (Thinking Mode — Secondary Interface)   │ │
│  │  Web/mobile, conversational, Gmail/Calendar MCP built-in   │ │
│  │  Best for: strategy thinking, document review, quick       │ │
│  │  questions, mobile access, email triage                    │ │
│  │  Also: Claude Projects for persistent context spaces       │ │
│  └────────────────────────────────────────────────────────────┘ │
│                         ▲                                        │
│                         │ visual layer for                       │
│                         │ dashboards & status                    │
│                         ▼                                        │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │  TIER 3: DASHBOARD (Visibility Mode — Status View)         │ │
│  │  Auto-generated HTML dashboard from markdown files          │ │
│  │  Best for: morning review, stakeholder visibility,          │ │
│  │  action item status at a glance                             │ │
│  │  Built by Claude Code, served locally or via GitHub Pages   │ │
│  └────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────┘
```

### Tier 1: Claude Code as the Command Center

This is where the real leverage lives. Claude Code becomes your primary interface because it can:
- Read and write all your context files
- Execute any skill with a slash command or natural language
- Connect to Jira, Linear, Slack, Gmail, Calendar, GitHub via MCP
- Run parallel agents for batch processing
- Generate artifacts (docs, decks, dashboards) directly

**Daily workflow in Claude Code:**

```
$ claude

You: "Morning briefing"
→ Runs daily-briefing skill
→ Checks action items, calendar, email, sprint status
→ Generates briefing document + surfaces items needing attention

You: "Summarize yesterday's design review"
→ Reads transcript from inbox/
→ Runs meeting-summarizer skill
→ Generates structured notes, extracts action items
→ Updates decision log and tracker
→ Drafts follow-up email

You: "How is the API v2 project tracking?"
→ Reads context/strategy/active-prds/api-v2.md
→ Checks tracking/action-items.md for related items
→ Queries Linear/Jira via MCP for ticket status
→ Provides comprehensive status with risks flagged

You: "Draft the weekly stakeholder update"
→ Reads week's meeting notes, action items, metrics
→ Runs status-report skill
→ Generates exec-friendly update
→ Drafts email via Gmail MCP
```

### Tier 2: Claude.ai for Thinking & Mobile

Claude.ai (with Projects) serves as the thinking partner:
- **Claude Project "PM Command Center"**: Upload key context files as project knowledge, enabling persistent context for strategy conversations
- **Gmail/Calendar MCP**: Already built into Claude.ai for email triage and calendar awareness
- **Mobile access**: Quick queries on the go — "what's the status of the Acme deal?"
- **Strategy sessions**: Longer conversations about product direction, drawing on project knowledge

**Sync between Tier 1 and Tier 2:**
Since both share the same local markdown files (via Claude Code), the context stays synchronized. Claude.ai Projects can be loaded with the same context files. The key discipline: **all outputs save to the local file system**, so nothing gets trapped in a chat conversation.

### Tier 3: The Dashboard (Auto-Generated Status View)

Claude Code can build and maintain an HTML dashboard that renders your markdown tracking files:

```
PM COMMAND CENTER DASHBOARD
─────────────────────────────────────────────
📊 STATUS AT A GLANCE
─────────────────────────────────────────────
Action Items: 12 open | 2 overdue | 4 due this week
Sprint Progress: Day 7/10 | 8/13 stories complete
Key Metrics: DAU ↑3.2% | Conversion ↓0.5% | NPS 42 (stable)

📋 TODAY'S PRIORITIES
─────────────────────────────────────────────
1. 🔴 Share updated timeline with leadership (3 days overdue)
2. 📅 Finalize interview guide (due today)
3. 📅 1:1 with Sarah at 11:00 AM

📬 EMAIL REQUIRING ACTION
─────────────────────────────────────────────
• Acme contract — new message from legal (urgent)
• VP Engineering — resource allocation question
• Design team — mockup review request

📝 RECENT DECISIONS
─────────────────────────────────────────────
• Apr 15: API v2 timeline committed to March 30
• Apr 12: Switched to weekly customer interview cadence
• Apr 10: Q2 OKRs finalized
```

This dashboard can be:
- A local HTML file that auto-refreshes (built by Claude Code skill)
- A React artifact in Claude.ai
- Pushed to GitHub Pages for mobile access
- A simple markdown file rendered in Obsidian

### The "Single Pane" Mental Model

The honest truth: there is no perfect single pane of glass today. But the closest thing is **Claude Code as the orchestration hub** with everything else connected to it:

```
                     YOU
                      │
                      ▼
               ┌──────────────┐
               │  CLAUDE CODE  │ ← Your primary interface
               │  (Terminal)   │
               └──────┬───────┘
                      │
          ┌───────────┼───────────┐
          ▼           ▼           ▼
    ┌──────────┐ ┌──────────┐ ┌──────────┐
    │ Local    │ │   MCP    │ │  Skills  │
    │ Files    │ │ Servers  │ │  Library │
    │ (Context)│ │          │ │          │
    └──────────┘ └──────────┘ └──────────┘
                      │
        ┌─────────────┼─────────────┐
        ▼             ▼             ▼
   ┌─────────┐  ┌─────────┐  ┌─────────┐
   │ Gmail   │  │ Jira/   │  │ Slack   │
   │ Calendar│  │ Linear  │  │ GitHub  │
   │ Drive   │  │         │  │ Figma   │
   └─────────┘  └─────────┘  └─────────┘
```

**Why this works as a "single pane":**
- You never leave the terminal to initiate any PM workflow
- All context lives in one place (local markdown files)
- All external tools are accessible via MCP from the same interface
- All outputs are saved locally and can be pushed to any destination
- The system remembers everything because it's files, not chat history

### What to Build on Day 1 vs. What to Evolve

| Timeframe | Interaction Layer Focus |
|---|---|
| **Week 1** | Claude Code + basic CLAUDE.md + manual context files |
| **Week 2** | Add Gmail/Calendar MCP + meeting summarizer skill |
| **Week 3** | Add Jira/Linear MCP + action item tracker + daily briefing |
| **Month 2** | Build dashboard view + add Slack MCP + automate context updates |
| **Month 3** | Claude.ai Project mirror for mobile/thinking + scheduled skills |
| **Ongoing** | Every workflow you do manually → observe → codify as a skill |

---

## Putting It All Together: A Day in the Life

**7:30 AM — Morning Briefing (2 min)**
```
$ claude
You: "morning briefing"
```
→ System checks calendar, email, action items, sprint status
→ Surfaces: 2 overdue items, 1 urgent email, today's 4 meetings, sprint at 60%

**8:00 AM — Email Triage (5 min)**
```
You: "triage my email — draft responses for anything urgent"
```
→ Categorizes 15 unread emails, surfaces 3 needing action
→ Drafts 2 responses, extracts 1 new action item

**10:30 AM — After Standup (3 min)**
```
You: "summarize this standup" [drops transcript]
```
→ Extracts blockers, status updates, updates sprint tracking
→ Flags: "Mike is blocked on API access — same blocker as yesterday"

**11:30 AM — After 1:1 with Manager (5 min)**
```
You: "process this 1:1 transcript — update my relationship tracker"
```
→ Structured notes, action items, sentiment tracking
→ Adds career development discussion themes to 1:1 history

**2:00 PM — PRD Work (30 min)**
```
You: "help me write a PRD for the new onboarding flow"
```
→ Socratic questioning drawing from user research, personas, strategy context
→ Generates full PRD with acceptance criteria
→ Runs engineering + design sub-agent critique
→ Saves to artifacts/prds/

**4:00 PM — Stakeholder Prep (10 min)**
```
You: "prep me for tomorrow's exec review — what should I know?"
```
→ Pulls recent decisions, metrics, risks, open questions
→ Generates talking points and anticipated questions with answers
→ Drafts exec update email

**5:00 PM — End of Day (2 min)**
```
You: "end of day — update my trackers and tell me what's carrying over"
```
→ Updates action items, logs today's decisions
→ Surfaces items for tomorrow
→ Total active PM assistant time today: ~57 minutes
→ Estimated time saved: 3-4 hours

---

## Next Steps

This systems design answers your five questions. The immediate actions are:

1. **Decide on Tier 1 platform**: Claude Code (terminal) vs. Claude.ai (web) as primary — I recommend Claude Code for the automation depth, with Claude.ai as the mobile/thinking companion
2. **Set up the folder structure** with the three-layer context system
3. **Build the first three skills**: Meeting summarizer → Action item tracker → Daily briefing
4. **Connect first MCP**: Gmail + Calendar (already available in Claude.ai, or Google Workspace MCP for Claude Code)
5. **Establish the daily rhythm**: Morning briefing → meeting processing → end-of-day rollup

Shall I start building any of these skills as executable specifications?

---

*Document: PM Command Center Systems Architecture v1.0*
*Created: March 28, 2026*
*Designed for portability across Claude Code, Claude.ai, and future LLM platforms*
