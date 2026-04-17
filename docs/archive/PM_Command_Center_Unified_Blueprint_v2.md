# PM Command Center: Unified Blueprint
### AI-Powered Product Management System — Design Specification v2.0

---

## Table of Contents

1. Vision & Principles
2. System Architecture
3. The Three-Layer Context System
4. Skill Library (Complete Inventory)
5. Integration Map (MCP + Tools)
6. User Workflows (Detailed Walkthroughs)
7. Implementation Roadmap
8. Success Metrics
9. Portability & Migration Strategy

---

## 1. Vision & Principles

### What This System Does

The PM Command Center is a personal AI operating system for product management. It turns Claude (Code + Web) into a persistent, context-aware PM partner that handles operational overhead — so you focus on judgment, relationships, and strategy.

### Design Principles

1. **Context is king** — Every AI interaction draws from a persistent, growing knowledge base about your product, team, market, and decisions. Without persistent context, AI is guessing.
2. **Skills over chat** — Repeatable workflows are codified as reusable skills, not ad-hoc prompts. You build them once, refine over time, and they compound in value.
3. **Local-first, portable** — All context stored as markdown files. No vendor lock-in. Move to any AI platform by copying a folder.
4. **Human-in-the-loop** — AI drafts, you decide. AI critiques, you refine. AI surfaces, you act.
5. **Progressive automation** — Start manual, observe patterns, then codify. Every workflow you do twice should become a skill.
6. **Compound intelligence** — The system gets smarter with use. Every output becomes input for future context. Meeting notes feed the decision log. Interview synthesis feeds personas. Decisions feed strategy critique.

### The Force Multiplier Math

| PM Activity | Without System | With System | Multiplier |
|---|---|---|---|
| Meeting follow-up & notes | 30 min/meeting | 5 min/meeting | 6x |
| Weekly stakeholder update | 2-3 hours | 30 min | 5x |
| PRD authoring | 1-2 days | 2-3 hours | 4x |
| Interview batch synthesis (10) | 2 weeks | 2 hours | 40x |
| Competitive analysis update | 4-6 hours | 45 min | 6x |
| New role onboarding | 60-90 days to productive | <30 days | 2-3x |
| Email triage & response | 45 min/day | 10 min/day | 4x |
| Status report creation | 1-2 hours | 15 min | 6x |

---

## 2. System Architecture

### Folder Structure

```
PM-Command-Center/
│
├── CLAUDE.md                              # Master context (identity + preferences)
├── INDEX.md                               # Knowledge base router — AI reads this first
│
├── context/                               # PERSISTENT KNOWLEDGE BASE
│   ├── product-overview.md                # What we build, for whom, why
│   ├── team/
│   │   ├── directory.md                   # Who does what, communication prefs
│   │   ├── stakeholder-map.md             # Influence, interests, relationship notes
│   │   └── org-context.md                 # Company culture, norms, politics
│   ├── strategy/
│   │   ├── current-priorities.md          # What matters this quarter
│   │   ├── okrs.md                        # Current OKRs with status
│   │   ├── active-prds/                   # PRDs in flight
│   │   └── retrospectives/               # Launch retros, lessons learned
│   ├── decisions/
│   │   └── decision-log.md               # All product decisions with rationale
│   ├── competitors/
│   │   ├── matrix.md                      # Feature/pricing comparison table
│   │   └── teardowns/                     # Individual competitor deep-dives
│   ├── users/
│   │   ├── personas.md                    # User personas with JTBD
│   │   ├── journey-maps.md               # Current user journeys
│   │   └── feedback-themes.md            # Recurring patterns from all sources
│   └── metrics/
│       ├── north-star.md                  # Key metrics definitions & current values
│       ├── baselines.md                   # Baseline measurements
│       └── weekly-snapshots/             # Historical metric snapshots
│
├── tracking/                              # OPERATIONAL STATE
│   ├── action-items.md                    # Single source of truth for all AIs
│   ├── current-sprint.md                  # Sprint goals, capacity, progress
│   ├── risks-and-blockers.md             # Active risks being monitored
│   └── archive/                           # Completed items by quarter
│
├── templates/                             # REUSABLE TEMPLATES
│   ├── prd-template.md
│   ├── user-story-template.md
│   ├── exec-update-template.md
│   ├── meeting-summary-template.md
│   ├── 1on1-template.md
│   ├── interview-guide-template.md
│   ├── launch-checklist-template.md
│   ├── competitive-teardown-template.md
│   ├── decision-record-template.md
│   └── sprint-review-template.md
│
├── skills/                                # AUTOMATED WORKFLOWS
│   ├── daily/
│   │   ├── morning-briefing.md
│   │   ├── email-triage.md
│   │   └── end-of-day-rollup.md
│   ├── meetings/
│   │   ├── meeting-summarizer.md
│   │   ├── 1on1-processor.md
│   │   └── meeting-prep.md
│   ├── discovery/
│   │   ├── interview-synthesis.md
│   │   ├── feedback-clustering.md
│   │   ├── competitive-scan.md
│   │   └── market-sizing.md
│   ├── definition/
│   │   ├── prd-generator.md
│   │   ├── user-story-generator.md
│   │   ├── spec-reviewer.md
│   │   └── release-notes.md
│   ├── strategy/
│   │   ├── strategy-critique.md
│   │   ├── opportunity-scoring.md
│   │   └── roadmap-narrative.md
│   ├── execution/
│   │   ├── status-report.md
│   │   ├── blocker-scanner.md
│   │   └── ticket-generator.md
│   ├── communication/
│   │   ├── exec-update-writer.md
│   │   ├── stakeholder-faq.md
│   │   ├── deck-builder.md
│   │   └── email-drafter.md
│   └── data/
│       ├── metric-explorer.md
│       ├── funnel-analyzer.md
│       └── nps-analyzer.md
│
├── artifacts/                             # GENERATED OUTPUTS
│   ├── meetings/                          # Structured meeting notes by date
│   ├── prds/                              # Generated PRDs
│   ├── reports/                           # Status reports, analyses
│   ├── decks/                             # Presentations
│   ├── emails/                            # Draft emails
│   └── prototypes/                        # HTML prototypes
│
├── research/                              # WORKING RESEARCH
│   ├── interviews/                        # Raw transcripts + synthesis
│   ├── surveys/                           # Survey designs + results
│   └── market-data/                       # Industry data, reports
│
└── inbox/                                 # DROP ZONE (unprocessed inputs)
    ├── meeting-recordings/                # Transcripts waiting for processing
    ├── screenshots/                       # Product screenshots, competitor captures
    └── raw-feedback/                      # Unprocessed feedback data
```

### The Three-Layer Context System

Context is separated by how frequently it changes to prevent noise and decay:

| Layer | Update Cadence | Contents | Files |
|---|---|---|---|
| **Identity** | Monthly / quarterly | Who I am, product vision, team structure, company context, working preferences | CLAUDE.md, context/product-overview.md, context/team/ |
| **Strategy** | Weekly / biweekly | Current priorities, roadmap, OKRs, active PRDs, competitor landscape, key metrics, decision log | context/strategy/, context/competitors/, context/metrics/, context/decisions/ |
| **Operational** | Daily | Action items, sprint status, meeting notes, open questions, recent feedback, current blockers | tracking/, artifacts/meetings/, inbox/ |

### Integration Map

```
                          YOU
                           │
                    ┌──────┴──────┐
                    │ CLAUDE CODE  │ ← Primary command interface
                    │  (Terminal)  │
                    └──────┬──────┘
                           │
              ┌────────────┼────────────┐
              ▼            ▼            ▼
        ┌──────────┐ ┌──────────┐ ┌──────────┐
        │  Local   │ │   MCP    │ │  Skills  │
        │  Files   │ │ Servers  │ │  Library │
        └──────────┘ └────┬─────┘ └──────────┘
                          │
          ┌───────┬───────┼───────┬───────┐
          ▼       ▼       ▼       ▼       ▼
       Gmail   Calendar  Jira   Slack   GitHub
                         Linear  Figma   Drive
```

| Integration | Protocol | What It Enables | Priority |
|---|---|---|---|
| Gmail | MCP (native in Claude.ai) | Email triage, thread analysis, draft responses, follow-up generation | P0 — Week 1 |
| Google Calendar | MCP (native in Claude.ai) | Meeting context, schedule awareness, prep notes | P0 — Week 1 |
| Jira / Linear | MCP server | Ticket creation from PRDs, sprint status, blocker scanning | P1 — Week 2 |
| Slack | MCP server | Team communication search, status post drafting | P1 — Week 3 |
| GitHub | MCP server | PR context, release notes from commits, changelog tracking | P2 — Month 2 |
| Google Drive | MCP server | Document access, shared doc analysis | P2 — Month 2 |
| Figma | MCP server | Design reference, design-to-spec workflows | P3 — Month 3 |

---

## 3. CLAUDE.md — Master Context File

```markdown
# PM Command Center

## About Me
- Name: [Your name]
- Role: Senior Product Manager
- Company: [Company name]
- Team: [Team name]
- Manager: [Name, title]
- Started: [Date]

## Product
- Product: [One-line description]
- Users: [Primary user segments]
- Business model: [How we make money]
- Stage: [Discovery / Build / Growth / Scale]
- North star metric: [Primary metric]

## Key Stakeholders
- [Name]: [Role] — [Communication style notes]
- [Name]: [Role] — [Communication style notes]

## How I Work
- Communication style: Direct and concise. Lead with the "so what"
- Document style: Start with recommendation, then evidence
- When reviewing my work: Be specific, actionable, and challenge assumptions
- When drafting for me: Match my voice — confident but not arrogant, data-informed
- Default output format: Markdown saved to artifacts/
- Never: Use corporate buzzwords, hedge excessively, or bury the lead

## Current Priorities (update weekly)
1. [Priority 1 — brief context]
2. [Priority 2 — brief context]
3. [Priority 3 — brief context]

## Team Norms
- Sprint cadence: [e.g., 2-week sprints, planning Mondays]
- Standup: [Time, format]
- Tools: [Jira/Linear, Slack, Confluence/Notion, Figma]
- Meeting culture: [Key norms]

## Knowledge Base Routing
- See INDEX.md for complete file map
- Before answering any product question, check relevant context/ files first
- After completing any workflow, update the appropriate context/ and tracking/ files
```

---

## 4. Skill Library — Complete Inventory

### Tier 1: Build First (Weeks 1-2)

| Skill | Trigger | Input | Output | Context Updates |
|---|---|---|---|---|
| Morning Briefing | "morning briefing" | Calendar, email, action items, sprint | Daily briefing document | None (read-only) |
| Meeting Summarizer | "summarize this meeting" + transcript | Transcript + meeting type + attendees | Structured notes + action items + follow-up draft | decision-log, action-items, stakeholder-map |
| Action Item Tracker | "check action items" | tracking/action-items.md | Status dashboard + overdue alerts | Status updates |
| Email Triage | "triage email" | Gmail inbox via MCP | Categorized summary + draft responses | action-items (new items extracted) |

### Tier 2: Core Workflows (Weeks 3-6)

| Skill | Trigger | Input | Output | Context Updates |
|---|---|---|---|---|
| PRD Generator | "create PRD for {feature}" | Feature description + context files | Full PRD with user stories + acceptance criteria | active-prds/ |
| Status Report | "weekly status" | Sprint data, action items, metrics, meetings | Exec-ready weekly update | metrics/weekly-snapshots/ |
| Strategy Critique | "critique this strategy" | Strategy doc + context files | Scored critique with specific improvements | None |
| Interview Synthesis | "synthesize interviews in {folder}" | Batch of transcripts | Ranked pain points + hypotheses + quotes | personas, feedback-themes |
| Meeting Prep | "prep me for {meeting}" | Calendar event + stakeholder context | Talking points, anticipated questions, context brief | None |
| Competitive Scan | "update competitor {name}" | Competitor name/URL | Structured teardown + matrix update | competitors/matrix, teardowns/ |

### Tier 3: Advanced (Weeks 7-12)

| Skill | Trigger | Input | Output | Context Updates |
|---|---|---|---|---|
| Prototype Builder | "prototype {feature}" | PRD or feature description | Functional HTML prototype | None |
| Release Notes | "generate release notes" | Git commits / changelog via MCP | Customer-friendly release notes | None |
| Roadmap Narrative | "write roadmap narrative" | Priority list + strategy context | Stakeholder-ready roadmap document | strategy/ |
| Launch Planner | "plan launch for {feature}" | PRD + context | Launch checklist with owners + timelines | tracking/ |
| Opportunity Scorer | "score these opportunities" | List of opportunities | RICE/weighted scoring with recommendations | None |
| Stakeholder FAQ | "generate FAQ for {feature}" | PRD + stakeholder context | Anticipated questions with prepared answers | None |
| 1:1 Processor | "process 1:1 notes" | 1:1 transcript/notes | Structured notes + career themes tracking | stakeholder-map, action-items |
| End-of-Day Rollup | "end of day" | Today's activities | Updated trackers + tomorrow's preview | action-items, decision-log |

---

## 5. User Workflows — Detailed Walkthroughs

What follows are step-by-step walkthroughs of the five most impactful PM workflows, showing exactly what you type, what the system does, and what you get back.

---

### WORKFLOW 1: Morning Briefing
**Time: 3 minutes | Replaces: 30-45 min of tab-hopping**

**The scenario:** It's 8:00 AM. You need to know what's on fire, what's due, what meetings you have, and whether any emails need immediate attention — before you even open Slack.

**Step 1 — You type:**
```
$ claude
You: morning briefing
```

**Step 2 — The system executes (behind the scenes):**
```
1. Reads tracking/action-items.md → finds 2 overdue, 4 due this week
2. Connects to Calendar MCP → pulls today's 5 meetings with attendees
3. Connects to Gmail MCP → scans unread (18 new), categorizes by urgency
4. Reads tracking/current-sprint.md → sprint is Day 8/10, 9 of 14 stories done
5. Reads context/strategy/current-priorities.md → checks alignment
6. Generates briefing → saves to artifacts/daily/2026-04-15-briefing.md
```

**Step 3 — You see:**
```markdown
# Morning Briefing — Tuesday, April 15, 2026

## ⚠️ ATTENTION NEEDED
- Action item AI-034 is 3 days overdue: "Share updated timeline
  with leadership" (from Sprint Review 04/10). Suggested: draft
  email now — I have the context from the meeting notes.
- Sprint ends Friday. 5 stories remain, 2 are blocked (see below).

## 📅 TODAY'S MEETINGS
| Time | Meeting | With | Prep Note |
|------|---------|------|-----------|
| 9:00 | Standup | Team | Mike's auth blocker is Day 2 — ask for update |
| 10:30 | 1:1 with Sarah | Sarah (Dir. Prod) | Last 1:1 she asked about Q2 hiring plan — have answer ready |
| 1:00 | Design Review | Design + Eng | Onboarding v2 mockups — review uploaded to Figma yesterday |
| 3:00 | Customer Call | Acme Corp | Contract discussion — legal sent new terms last night (see email) |
| 4:30 | Sprint Planning Prep | Eng Leads | Need to finalize Q2 sprint 1 scope |

## 📬 EMAIL HIGHLIGHTS (18 unread)
- 🔴 URGENT: Legal team re: Acme contract — new redlines on data clause
- 🟡 ACTION: VP Eng asking about API v2 resource allocation
- 🟡 ACTION: Design lead sharing onboarding mockups for review
- 📋 FYI: 12 newsletters, notifications, automated alerts (skippable)

## 📊 SPRINT STATUS
Sprint 7 | Day 8 of 10 | 9/14 stories complete (64%)
- 🔴 Blocked: AUTH-142 (Mike — waiting on API key from DevOps, Day 2)
- 🔴 Blocked: UX-089 (Lisa — depends on AUTH-142)
- 🟡 At risk: API-201 (complex, started late)
- 🟢 On track: 2 remaining stories

## 🎯 THIS WEEK'S PRIORITIES (from your current-priorities.md)
1. Close Acme contract terms ← today's customer call is key
2. Finalize onboarding v2 PRD ← design review today feeds this
3. Q2 sprint 1 planning ← prep session this afternoon
```

**Step 4 — You respond:**
```
You: Draft that overdue email about the timeline update for leadership.
     Pull context from the sprint review meeting notes.
```

**The system:**
- Reads `artifacts/meetings/2026-04-10-sprint-review.md`
- Extracts the timeline discussion and commitments
- Drafts an email in your voice (from CLAUDE.md preferences)
- Creates a Gmail draft via MCP (does NOT send)
- Appends to `artifacts/emails/` for your records
- Updates action item AI-034 status to "🟡 Draft ready"

**Total time:** 3 minutes. You now have complete situational awareness and your first overdue item is already handled.

---

### WORKFLOW 2: Meeting → Notes → Action → Follow-up
**Time: 5 minutes post-meeting | Replaces: 30-40 minutes**

**The scenario:** You just finished a 45-minute stakeholder review with your VP, engineering lead, and design lead. The Zoom transcript auto-saved.

**Step 1 — You drop the transcript and type:**
```
You: Summarize this stakeholder review. Attendees were Sarah (VP Product),
     Mike (Eng Lead), Lisa (Design Lead), and me. Focus on decisions
     and commitments.
```
[Drops transcript file into inbox/meeting-recordings/]

**Step 2 — The system executes:**
```
1. Reads transcript (12,000 words from 45-min meeting)
2. Reads context/team/directory.md → maps names to roles
3. Reads context/strategy/current-priorities.md → identifies what matters
4. Reads tracking/action-items.md → checks for carryover items discussed
5. Reads context/decisions/decision-log.md → flags if any decisions
   contradict previous ones
6. Generates structured summary
7. Saves to artifacts/meetings/2026-04-15-stakeholder-review.md
```

**Step 3 — You see:**
```markdown
# Stakeholder Review — April 15, 2026
Attendees: Sarah (VP Product), Mike (Eng Lead), Lisa (Design Lead), Chetan (PM)
Duration: 45 min | Type: Stakeholder Review

## TL;DR
The team aligned on shipping onboarding v2 by May 15 with a phased
rollout. Sarah approved the additional contractor budget for front-end
work. The API v2 timeline was debated — Mike pushed for a 2-week
extension which Sarah tentatively agreed to pending customer impact analysis.

## Decisions Made
| # | Decision | Rationale | Decided By | Reversible? |
|---|----------|-----------|------------|-------------|
| D-48 | Onboarding v2 ships May 15, phased rollout (10% → 50% → 100%) | Reduces risk, allows measurement | Sarah + Chetan | Yes — rollback plan in place |
| D-49 | Approved $15K contractor budget for front-end acceleration | Mike can't spare FTEs this sprint | Sarah | No — PO already issued |
| D-50 | API v2 deadline tentatively extended to April 30 | Auth refactor more complex than estimated | Sarah (tentative) | Pending — needs customer impact analysis from Chetan by Thursday |

⚠️ NOTE: Decision D-50 potentially conflicts with Decision D-47
(April 16 commit to Acme for API v2 delivery). Flag this in your
customer call today.

## Action Items (NEW)
| ID | Owner | Action | Deadline | Priority |
|----|-------|--------|----------|----------|
| AI-040 | Chetan | Customer impact analysis for API v2 delay | Apr 17 (Thu) | P0 |
| AI-041 | Chetan | Update onboarding v2 PRD with phased rollout plan | Apr 18 | P1 |
| AI-042 | Mike | Provide contractor onboarding requirements | Apr 16 | P1 |
| AI-043 | Lisa | Final onboarding mockups to eng by Friday | Apr 18 | P1 |
| AI-044 | Sarah | Confirm contractor PO with Finance | Apr 16 | P1 |

## Carryover Items Discussed
- AI-034 (overdue): Timeline update for leadership — Sarah asked about
  this. Chetan committed to sending today. STATUS: Still open.

## Stakeholder Sentiment
- Sarah: Supportive but firm on May 15 deadline. Slightly concerned
  about API v2 slip — wants data before committing.
- Mike: Relieved about contractor budget. Still anxious about tech debt.
  Third meeting in a row raising this.
- Lisa: Confident in design. Wants more user testing time.

## Key Quotes
> "I'll approve the extension but I need to see the customer impact
> first. If Acme is affected, that changes the calculus." — Sarah
> "The auth refactor isn't optional — if we skip it now, we're building
> on a foundation that won't scale past 10K users." — Mike
```

**Step 4 — The system automatically updates:**
```
✅ context/decisions/decision-log.md — appended D-48, D-49, D-50
✅ tracking/action-items.md — added AI-040 through AI-044
✅ context/team/stakeholder-map.md — updated Sarah, Mike, Lisa sentiment
✅ tracking/risks-and-blockers.md — added D-50/D-47 conflict flag
```

**Step 5 — You say:**
```
You: Draft a follow-up email to the attendees summarizing decisions
     and action items. Professional but warm tone.
```

**The system generates a draft email via Gmail MCP:**
```
To: sarah@, mike@, lisa@
Subject: Stakeholder Review Recap — April 15

Hi all,

Thanks for a productive session today. Here's what we aligned on:

DECISIONS:
• Onboarding v2: May 15 ship date with phased rollout (10%→50%→100%)
• Contractor budget: $15K approved for front-end acceleration
• API v2: Tentative 2-week extension pending customer impact analysis

ACTION ITEMS:
• Chetan: Customer impact analysis by Thursday
• Chetan: Updated onboarding PRD with rollout plan by Friday
• Mike: Contractor requirements by tomorrow
• Lisa: Final mockups to eng by Friday
• Sarah: Contractor PO confirmation with Finance by tomorrow

One flag: the API v2 extension may conflict with our Acme commitment.
I'll address this in the impact analysis.

Let me know if I missed anything. — Chetan
```

**Step 6 — You review, tweak one line, confirm send.**

**Total time:** 5 minutes. Meeting notes, decisions logged, action items tracked, follow-up sent, stakeholder sentiment updated, conflict flagged.

---

### WORKFLOW 3: PRD Creation (From Scratch)
**Time: 2-3 hours (interactive) | Replaces: 1-2 days**

**The scenario:** You need to write a PRD for a new feature — self-service onboarding for enterprise customers. You have user research, competitive intel, and strategic context, but need to synthesize it into a structured document.

**Step 1 — You initiate:**
```
You: Create a PRD for self-service enterprise onboarding. Use the
     Socratic approach — ask me questions before drafting.
```

**Step 2 — The system reads context first (invisible to you):**
```
Reads: context/product-overview.md (understands the product)
       context/users/personas.md (knows the user segments)
       context/users/feedback-themes.md (knows the pain points)
       context/strategy/current-priorities.md (knows this is P2)
       context/competitors/matrix.md (knows competitor capabilities)
       templates/prd-template.md (follows the standard format)
```

**Step 3 — Socratic questioning round (the system asks YOU):**
```
Before I draft, let me make sure I understand the problem space.
Based on your user research, enterprise prospects currently go through
a 3-week manual onboarding process. I have a few questions:

1. PROBLEM SCOPING: Your feedback themes show "onboarding friction"
   is the #2 pain point (mentioned in 7 of last 12 interviews). Is
   this PRD addressing the full onboarding flow or a specific phase
   (e.g., account setup, data migration, team provisioning)?

2. SUCCESS CRITERIA: What does "self-service" mean here — fully
   autonomous (zero-touch), or guided self-service with optional
   human assist? Your competitor Acme offers guided self-service;
   CompetitorB is fully autonomous.

3. CONSTRAINTS: Mike raised infrastructure scalability concerns in
   last week's stakeholder review (Decision D-50). Does this feature
   depend on the API v2 refactor, or can it work on current infra?

4. SCOPE: Your Q2 OKR says "reduce onboarding time by 50%." Is that
   the primary success metric, or are there others (conversion rate,
   support ticket volume, NPS)?

5. USERS: Your enterprise persona ("Enterprise Eva") lists procurement,
   IT admin, and end-user champion as distinct sub-personas. Which
   sub-persona is the primary user of self-service onboarding?
```

**Step 4 — You answer. The conversation goes 3-4 rounds of questions.**

**Step 5 — The system generates the PRD:**
```markdown
# PRD: Self-Service Enterprise Onboarding

## 1. Problem Statement
Enterprise customers currently require 3 weeks and 12+ touchpoints
with our CS team to complete onboarding. This is our #2 customer
pain point (raised in 58% of recent interviews) and the primary
blocker to improving our 23% enterprise trial-to-paid conversion rate.
[continues with full context-aware PRD...]

## 2. Users & Personas
[Drawn from context/users/personas.md, refined by Socratic answers]

## 3. Goals & Success Metrics
[Aligned to OKRs from context/strategy/okrs.md]

## 4. Requirements
### Must Have (P0)
[User stories in INVEST format with acceptance criteria]

### Should Have (P1)
[...]

### Nice to Have (P2)
[...]

## 5. Out of Scope
[Explicitly called out based on scoping discussion]

## 6. Technical Considerations
[Flags API v2 dependency from Decision D-50]

## 7. Open Questions
[Items surfaced during Socratic questioning that need validation]

## 8. Assumptions to Validate
[AI-identified assumptions that could invalidate the approach]
```

**Step 6 — Multi-perspective critique (automatic):**
```
You: Run the engineering and user research critiques on this PRD.
```

The system spawns two sub-agent reviews:

**Engineering Perspective:**
```
⚠️ The data migration step assumes a standard CSV import, but 4 of
your last 6 enterprise customers used custom API integrations. The
PRD should address non-CSV migration paths.

⚠️ The "real-time provisioning" requirement conflicts with the
current batch-processing architecture. This would require the
API v2 refactor (Decision D-50) to be complete first. Suggest
adding this as a dependency or offering async provisioning as MVP.

✅ The phased rollout approach aligns well with the infrastructure
constraints Mike raised.
```

**User Research Perspective:**
```
⚠️ The PRD assumes IT admins will configure SSO during self-service
onboarding, but interview transcript #7 shows IT admins are rarely
available during the trial period. Consider a "configure later" path.

⚠️ No mention of onboarding for the end-user champion (the person
who actually uses the product daily). Self-service setup ≠ self-service
adoption. Consider a guided first-use experience post-onboarding.

✅ Strong alignment with the top 3 pain points from feedback themes.
```

**Step 7 — You refine based on critiques, then:**
```
You: Generate Jira tickets from the P0 requirements. Create an epic
     called "Self-Service Enterprise Onboarding" and break into stories.
```

**The system:**
- Generates epic + 8 user stories with acceptance criteria
- Pushes to Jira/Linear via MCP
- Links the PRD to the epic
- Saves the PRD to `artifacts/prds/self-service-onboarding.md`
- Updates `context/strategy/active-prds/` with a summary

**Total time:** 2-3 hours of interactive work. You have a context-aware PRD, multi-perspective critique, validated assumptions, and Jira tickets created — work that would normally take 1-2 days of solo writing plus a review cycle.

---

### WORKFLOW 4: Interview Batch Synthesis
**Time: 30-45 minutes | Replaces: 1-2 weeks of manual analysis**

**The scenario:** You've conducted 10 customer discovery interviews over the past two weeks. The transcripts are sitting in your research folder. You need to synthesize them into actionable insights for your team.

**Step 1 — You type:**
```
You: Synthesize all interviews in research/interviews/batch-q2/.
     Focus on onboarding pain points — we're scoping the self-service
     onboarding feature. Also update our personas and feedback themes.
```

**Step 2 — The system executes (parallel processing):**
```
Spawns 10 parallel agents, one per transcript.
Each agent extracts:
  - Interviewee role, company size, industry
  - Top 3 pain points with verbatim quotes
  - Current onboarding workflow description
  - Feature requests (explicit and implied)
  - Emotional intensity signals (frustration, delight, indifference)
  - Willingness to pay / switching signals

Then a synthesis agent:
  - Aggregates across all 10
  - Ranks pain points by frequency
  - Identifies contradictions and outliers
  - Cross-references with existing feedback-themes.md
  - Generates hypotheses
```

**Step 3 — You see (after ~5-10 minutes of processing):**
```markdown
# Interview Synthesis: Q2 Discovery Batch
10 interviews | April 1-14, 2026
Focus: Enterprise onboarding experience

## Interviewee Profile
| # | Role | Company Size | Industry | Current Customer? |
|---|------|-------------|----------|-------------------|
| 1 | IT Director | 2,000 FTE | Healthcare | Yes (6 months) |
| 2 | VP Operations | 500 FTE | SaaS | Trial user |
| ... | | | | |

## TOP PAIN POINTS (ranked by frequency)

### 1. Manual data migration (9/10 mentioned — 90%)
> "We spent three weeks going back and forth with your team on CSV
> formatting. It was honestly the worst part." — IT Director, #1
> "I almost cancelled the trial when I realized I couldn't import
> our data myself." — VP Ops, #2
Intensity: 🔴 High frustration (7/9 expressed strong negative emotion)
Current workaround: Email CSV files to CS team, wait 3-5 business days
Implication: Self-service data import is table-stakes for the PRD

### 2. SSO configuration complexity (7/10 — 70%)
> "Our IT team doesn't have bandwidth to configure SSO during a trial.
> We need it to work with our IdP out of the box." — CTO, #5
Intensity: 🟡 Moderate (more resigned than frustrated)
Current workaround: Skip SSO during trial, configure post-purchase
Implication: "Configure later" path is validated — IT admins aren't
available during trial (confirms hypothesis from PRD critique)

### 3. No visibility into onboarding progress (6/10 — 60%)
[continues...]

## CONTRADICTIONS & OUTLIERS
- Interviewee #8 (startup, 50 FTE) said onboarding was "fine" and
  took only 2 days. Their needs differ significantly from enterprise
  segment. Consider: is self-service onboarding primarily an
  enterprise problem?
- Interviewee #4 and #6 disagreed on whether guided vs. autonomous
  onboarding is better. #4 wants hand-holding; #6 wants full control.
  Suggests: offer both modes (guided + advanced).

## HYPOTHESES TO VALIDATE
1. Self-service data import will reduce onboarding time by 60%+
   (based on 9/10 citing data migration as primary bottleneck)
2. A "configure later" path for SSO will increase trial completion
   by 20%+ (based on 7/10 citing IT availability as blocker)
3. Enterprise and SMB onboarding should be separate flows
   (based on outlier signal from smaller companies)

## UPDATES TO EXISTING KNOWLEDGE

### Persona updates (→ context/users/personas.md)
- Enterprise Eva: Add "IT admin availability during trial" as a
  key constraint (new finding from this batch)
- New sub-persona suggested: "Trial Champion" — the person who
  evaluates the product before IT/procurement get involved

### Feedback theme updates (→ context/users/feedback-themes.md)
- "Data migration friction" moves from #3 to #1 (frequency increase)
- NEW theme: "Onboarding progress visibility" (6/10 — not previously
  tracked)
- "SSO complexity" confirmed as persistent theme (now 15 total
  mentions across all research)

## RECOMMENDED NEXT STEPS
1. Share synthesis with design team — data migration UX is the
   highest-impact design problem
2. Update the self-service onboarding PRD with these findings
   (especially the "configure later" SSO pattern)
3. Schedule 3 follow-up interviews with enterprise IT admins
   specifically to validate the SSO hypothesis
4. Consider separate discovery for SMB onboarding needs
```

**Step 4 — The system automatically updates:**
```
✅ context/users/feedback-themes.md — reranked, new theme added
✅ context/users/personas.md — Enterprise Eva updated, Trial Champion added
✅ research/interviews/batch-q2/synthesis.md — full synthesis saved
✅ Individual interview summaries saved to research/interviews/batch-q2/
```

**Step 5 — You follow up:**
```
You: Update the onboarding PRD with these findings. Specifically
     add the "configure later" SSO pattern and the data import
     self-service requirement.
```

The system reads the existing PRD, integrates new evidence, and generates a tracked-changes version showing what was added and why.

**Total time:** 30-45 minutes. Ten interviews synthesized with ranked pain points, persona updates, hypotheses, and your PRD updated — work that would typically take a researcher 1-2 weeks.

---

### WORKFLOW 5: Weekly Stakeholder Update
**Time: 15 minutes | Replaces: 2-3 hours**

**The scenario:** It's Friday afternoon. You need to send your weekly update to leadership covering progress, risks, metrics, and next week's priorities.

**Step 1 — You type:**
```
You: Generate this week's stakeholder update. Executive audience.
     Include sprint progress, key decisions, risks, and metrics.
```

**Step 2 — The system aggregates (reads 8+ sources automatically):**
```
1. artifacts/meetings/ — this week's 12 meeting summaries
2. tracking/action-items.md — completed vs. carryover items
3. tracking/current-sprint.md — sprint progress data
4. tracking/risks-and-blockers.md — active risks
5. context/decisions/decision-log.md — decisions made this week
6. context/metrics/north-star.md — current metric values
7. context/strategy/okrs.md — OKR progress
8. Gmail MCP — any stakeholder threads with important context
```

**Step 3 — You see:**
```markdown
# Weekly Product Update — Week of April 14, 2026
To: Sarah (VP Product), Leadership Team
From: Chetan

## TLDR
Onboarding v2 is on track for May 15. API v2 has a 2-week extension
risk pending customer impact analysis (due Thursday). Sprint 7 closing
at 85% completion — 2 stories carrying over due to auth dependency.

## 📊 KEY METRICS (vs. last week)
| Metric | Current | Δ | Target | Status |
|--------|---------|---|--------|--------|
| DAU | 12,340 | +3.2% | 15,000 | 🟡 Trending |
| Trial→Paid Conversion | 23.1% | -0.5% | 30% | 🔴 Below target |
| Enterprise Onboarding Time | 18 days | — | 9 days (Q2 goal) | 🟡 PRD in progress |
| NPS | 42 | +1 | 50 | 🟡 Stable |

Conversion dip likely driven by onboarding friction (validated by
this week's interview synthesis — 90% of enterprise users cite data
migration as primary pain point).

## 🏃 SPRINT 7 PROGRESS
Closing today: 12/14 stories complete (85%)
- 🟢 Completed: Notification system, payment flow redesign, 10 others
- 🔴 Carrying over: AUTH-142 (auth refactor spike), UX-089 (depends on AUTH-142)
- Root cause: API key provisioning blocked Mike for 2 days. DevOps
  resolved Thursday. Spike results expected Monday.

## 📋 DECISIONS THIS WEEK
1. D-48: Onboarding v2 ships May 15 with phased rollout (10%→50%→100%)
2. D-49: $15K contractor budget approved for front-end acceleration
3. D-50: API v2 deadline tentatively extended to April 30 (pending
   customer impact analysis — due Thursday)

## ⚠️ RISKS
| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| API v2 delay impacts Acme contract | High | Medium | Customer impact analysis Thursday; fallback: partial delivery |
| Sprint velocity declining (3rd sprint below plan) | Medium | High | Contractor approved; onboarding requirements shared with Mike |

## 🔜 NEXT WEEK
1. Deliver customer impact analysis for API v2 extension (Thursday)
2. Finalize onboarding v2 PRD with interview synthesis findings
3. Sprint 8 planning — scope Q2 sprint 1
4. Customer call with Acme — contract terms discussion
5. Design review: onboarding prototype (Lisa delivering mockups Monday)

## 📝 FOR YOUR AWARENESS
Interview synthesis from 10 customer conversations completed this week.
Key finding: data migration is the #1 onboarding pain point (90% of
interviewees). Full synthesis available — happy to walk through in
our next 1:1.
```

**Step 4 — You review, make minor edits, then:**
```
You: Looks good. Draft as an email to Sarah and the leadership
     distribution list. Also post a shorter version to #product-updates
     on Slack.
```

**The system:**
- Creates Gmail draft with the full update
- Generates a condensed 5-line Slack version
- Posts to Slack via MCP (or drafts for your review)
- Saves the report to `artifacts/reports/weekly-2026-04-18.md`
- Updates `context/metrics/weekly-snapshots/` with this week's numbers

**Total time:** 15 minutes including review and edits. A comprehensive, data-rich stakeholder update that draws from a full week of meetings, decisions, metrics, and research — work that typically takes 2-3 hours of manual compilation.

---

## 6. Implementation Roadmap

### Phase 0: Pre-Start (Before Day 1)

| Action | Time | Tool |
|--------|------|------|
| Create PM-Command-Center folder structure | 30 min | Terminal |
| Write initial CLAUDE.md (with what you know) | 30 min | Claude Code |
| Create INDEX.md | 15 min | Claude Code |
| Install Claude Code + authenticate | 15 min | Terminal |
| Create 3 core templates (PRD, meeting notes, exec update) | 1 hr | Claude Code |
| Build morning-briefing skill | 1 hr | Claude Code |
| Connect Gmail + Calendar MCP (Claude.ai) | 15 min | Claude.ai settings |

### Phase 1: Weeks 1-2 (Onboarding Acceleration)

| Action | Priority |
|--------|----------|
| Run morning briefing daily — refine the skill | P0 |
| Process every meeting through the summarizer — build context fast | P0 |
| After every doc review: extract key facts into context/ files | P0 |
| Build stakeholder map from 1:1 notes | P0 |
| Connect Jira/Linear MCP | P1 |
| Build meeting-prep skill | P1 |
| Create 30-60-90 plan with AI assistance | P1 |

### Phase 2: Weeks 3-6 (Core Automation)

| Action | Priority |
|--------|----------|
| Build PRD generator skill | P0 |
| Build status report skill | P0 |
| Build interview synthesis skill | P1 |
| Build strategy critique skill | P1 |
| Connect Slack MCP | P1 |
| Build email triage skill | P1 |
| Build end-of-day rollup skill | P2 |

### Phase 3: Weeks 7-12 (Advanced)

| Action | Priority |
|--------|----------|
| Prototype builder skill | P1 |
| Competitive scanner (scheduled) | P1 |
| Launch planner skill | P2 |
| Release notes skill | P2 |
| Dashboard generator | P2 |
| Parallel agent workflows (batch processing) | P2 |

### Phase 4: Ongoing (Compound Intelligence)

| Action | Cadence |
|--------|---------|
| Review and archive completed action items | Weekly |
| Verify decision log entries still current | Biweekly |
| Update competitor matrix | Monthly |
| Archive old meeting notes | Monthly |
| Audit INDEX.md accuracy | Monthly |
| Refine templates based on what works | Monthly |
| Build new skill for any task done 3+ times manually | As needed |

---

## 7. Success Metrics

| Metric | Baseline (No System) | Target (Month 3) | How to Measure |
|--------|---------------------|-------------------|----------------|
| Time on documentation/reports | ~30% of week | <15% of week | Weekly time audit |
| PRD creation time | 1-2 days | <3 hours | Track per PRD |
| Meeting follow-up time | 30 min/meeting | <5 min/meeting | Track per meeting |
| Stakeholder update creation | 2-3 hours/week | <30 min/week | Track weekly |
| Days to productive onboarding | 60-90 days | <30 days | Self-assessment |
| Context files in knowledge base | 0 | 50+ | File count |
| Skills built and actively used | 0 | 12+ | Skill inventory |
| Interview synthesis turnaround | 1-2 weeks for 10 | <1 hour for 10 | Track per batch |
| Action items tracked & completed on time | ~60% | >85% | Tracker data |

---

## 8. Portability & Migration Strategy

### Everything Is Markdown

The entire system is designed to avoid lock-in. Every piece of context, every template, every skill definition is a markdown file. If you need to move to a different platform:

| Component | Portable? | Migration Effort |
|---|---|---|
| Context files (all markdown) | ✅ Fully | Copy folder |
| Templates (all markdown) | ✅ Fully | Copy folder |
| Skill definitions (markdown) | ⚠️ Mostly | Adapt syntax (slash commands → target platform format) |
| Generated artifacts | ✅ Fully | Copy folder |
| MCP integrations | ⚠️ Partially | MCP is becoming cross-platform standard |
| Claude Code-specific commands | ❌ Needs adaptation | Translate to target platform |

### Platform Migration Paths

| If Employer Uses... | Migration Approach |
|---|---|
| **Claude (any tier)** | Direct — you're already there |
| **ChatGPT / OpenAI** | Upload context to ChatGPT Projects; adapt skills to Custom GPTs |
| **Google Gemini** | Upload to Google Gems; use Vertex AI for automation |
| **Microsoft Copilot** | Use Copilot Studio for agents; SharePoint for context |
| **Internal / custom LLM** | Context files work with any model; rebuild skills as prompts |

### The Golden Rule
**Always save outputs as local files, never just in chat.** Chat history is ephemeral. Files are permanent. Every skill ends by writing to the file system.

---

*PM Command Center Blueprint v2.0*
*Created: March 28, 2026*
*Author: Designed with Claude for a Senior PM starting a new role*
*Architecture: Claude Code primary, Claude.ai secondary, portable to any LLM*
