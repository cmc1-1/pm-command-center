# PM Command Center — Complete Guide
Version: 2.0 | Last updated: 2026-04-05

---

## 1. What Is This?

The PM Command Center is an AI-powered product management productivity system that learns your company over time and compounds in value the longer you use it.

**The mental model**: Think of it as an AI chief of staff that arrives on Day 1 with proven methodology, frameworks, and habits. Over the first few weeks, it learns your company, product, team, and market organically through every meeting you process, every decision you log, and every interaction you feed it. By month 2-3, it has more documented institutional memory than anyone in the org — and it uses all of it to make every output smarter.

**What it is**:
- A structured knowledge system built on Markdown files
- 12 automated workflow skills that read your context before acting
- 19 templates encoding proven PM document structures
- A persistent context layer that grows with every interaction
- A career acceleration engine targeting Principal PM promotion

**What it is NOT**:
- Not a project management tool (use Jira/Linear for tickets)
- Not a chatbot (it's structured workflows, not free-form conversation)
- Not magic (it needs your input — garbage in, garbage out)
- Not a replacement for talking to users and stakeholders

**Why it works**: Skills are smart because they read context first. Context grows organically. Every meeting summary, decision log, and impact entry makes the next output richer. After 3 months, you operate with an unfair advantage.

---

## 2. Quick Start (First 5 Minutes)

1. Open terminal in `pm-command-center/`, run `claude`
2. Say **"morning briefing"** → get situational awareness (works even with sparse context)
3. Paste a meeting transcript → **"summarize this meeting"** → structured notes + auto-tracked action items and decisions
4. Say **"check action items"** → see what's tracked
5. Say **"log impact: completed first competitive teardown"** → start building promotion evidence

That's it. You're using the system. Everything else builds from here.

> **Note**: All skills work before company context is populated — they just get dramatically richer over time as context files fill in.

---

## 3. System Architecture

### How Data Flows
```
Trigger a skill → Skill reads relevant context files → Applies template structure →
Output saved to artifacts/ → Knowledge base auto-updates (decisions, action items, sentiment, etc.)
```

### Directory Map
```
pm-command-center/
├── CLAUDE.md              # Master identity + AI instructions (always loaded)
├── INDEX.md               # Knowledge base router (loaded on demand)
├── GUIDE.md               # This file — complete user manual
├── README.md              # GitHub readme
│
├── skills/                # Workflow definitions (12 skills)
│   ├── daily/             # morning-briefing, impact-journal, end-of-day-rollup
│   ├── meetings/          # meeting-summarizer
│   ├── discovery/         # ai-research-scout, market-intelligence
│   ├── definition/        # prd-generator
│   ├── strategy/          # strategy-critique, decision-logger, bold-idea-lab
│   ├── execution/         # action-item-extractor
│   └── communication/     # email-drafter
│
├── templates/             # Document templates (19 templates)
├── context/               # Persistent knowledge base
│   ├── personal/          # Portable PM identity (git-committed)
│   ├── cross-org/         # Cross-team visibility (gitignored)
│   ├── team/              # Team & stakeholder info (gitignored)
│   ├── strategy/          # Priorities, OKRs, PRDs (gitignored)
│   ├── users/             # Personas, feedback, journeys (gitignored)
│   ├── competitors/       # Competitive intelligence (gitignored)
│   ├── metrics/           # KPIs and baselines (gitignored)
│   └── decisions/         # Decision log (gitignored)
│
├── tracking/              # Operational tracking (gitignored)
├── artifacts/             # Generated outputs (gitignored)
├── research/              # Research data (gitignored)
├── inbox/                 # Raw inputs (gitignored)
└── docs/                  # Planning documents
```

### Key Principle
Skills are smart because they read context first. The Meeting Summarizer reads your team directory, priorities, action items, and decision log before processing a transcript — so it can flag conflicts, detect carryover items, and map speakers to roles. The richer your context, the smarter every skill becomes.

### What's Committed vs. Gitignored
- **Committed** (portable across roles): CLAUDE.md, INDEX.md, GUIDE.md, skills/, templates/, context/personal/, docs/
- **Gitignored** (company-specific): context/team/, context/strategy/, context/users/, context/competitors/, context/metrics/, context/decisions/, context/cross-org/, tracking/, artifacts/, research/, inbox/

---

## 4. Complete Capability Reference

### Skills — Ready Now (12 built)

#### Daily Habits
| Skill | Trigger Phrases | What It Does |
|-------|----------------|--------------|
| **Morning Briefing** | "morning briefing", "start my day" | Daily digest: overdue items, today's priorities, metric alerts, cross-org signals, impact opportunities |
| **Impact Journal** | "log impact", "record win" | Structured win/outcome entry tagged to 10 categories and 7 Principal PM competencies. Feeds promotion packet |
| **End of Day Rollup** | "end of day", "EOD", "wrap up" | EOD summary: what happened, gaps identified, tomorrow's top 3 priorities |

#### Meetings & Tracking
| Skill | Trigger Phrases | What It Does |
|-------|----------------|--------------|
| **Meeting Summarizer** | "summarize this meeting", "process meeting notes" | Transcript → structured notes with decisions, action items, sentiment, quotes, cross-org signals. Auto-updates knowledge base |
| **Action Item Extractor** | "extract action items from..." | Any text → structured action items in tracker with IDs, owners, deadlines |
| **Decision Logger** | "log this decision" | Structured decision record with conflict detection against prior decisions |

#### Strategy & Ideation
| Skill | Trigger Phrases | What It Does |
|-------|----------------|--------------|
| **Strategy Critique** | "critique this strategy", "red team this" | 7-dimension scoring (including Business Impact Clarity) + devil's advocate + gaps analysis |
| **Bold Idea Lab** | "bold idea lab", "brainstorm product ideas", "what if we..." | Generate 5-8 bold ideas, filter to 3-5, stress-test survivors, rank with validation plan |

#### Discovery & Research
| Skill | Trigger Phrases | What It Does |
|-------|----------------|--------------|
| **AI Research Scout** | "AI research scan", "what's new in AI" | Frontier scan: new models, techniques, papers, regulation → structured briefing with product implications |
| **Market Intelligence** | "market intel", "legal tech scan" | Legal tech landscape: competitor moves, market trends, analyst reports → positioning assessment |

#### Product Definition
| Skill | Trigger Phrases | What It Does |
|-------|----------------|--------------|
| **PRD Generator** | "create a PRD for...", "help me spec out" | Socratic Q&A (3-4 rounds) → full PRD with business case summary, auto-critique from engineering + UX perspectives |

#### Communication
| Skill | Trigger Phrases | What It Does |
|-------|----------------|--------------|
| **Email Drafter** | "draft an email to...", "write an email" | Context-aware email calibrated to recipient, with 8 types including executive narrative |

### Skills — Build Later (9 future, documented with prerequisites)

These skills need real company context to be valuable. Build each one when its prerequisites are met.

| Skill | Category | Prerequisites | When to Build |
|-------|----------|--------------|---------------|
| **Status Report** | execution | action-items, sprint, risks, metrics populated | Week 2+ |
| **Blocker Scanner** | execution | action-items, sprint actively tracked | Week 2+ |
| **Opportunity Scorer** | strategy | product-overview, personas, OKRs, competitors populated | Week 3+ |
| **Stakeholder FAQ Generator** | communication | stakeholder-map, decision-log, priorities populated | Week 3+ |
| **Roadmap Narrative** | strategy | priorities, OKRs, active-prds populated | Week 4+ |
| **Interview Synthesis** | discovery | personas populated, 3+ interviews conducted | After 3 interviews |
| **Feedback Clustering** | discovery | feedback-themes has 10+ entries | After 10 entries |
| **Exec Narrative Writer** | communication | impact-journal has 15+ entries, OKRs set | Month 2+ |
| **Thought Leadership Generator** | communication | domain-expertise well accumulated | Month 3+ |

---

## 5. Template Reference

### Meetings & Tracking (3)
| Template | File | When to Use |
|----------|------|-------------|
| Meeting Summary | `meeting-summary-template.md` | Every meeting processed through meeting-summarizer |
| Action Items | `action-items-template.md` | Tracker structure (auto-managed by skills) |
| Decision Record | `decision-record-template.md` | Decision log structure (auto-managed by skills) |

### Strategy & Planning (4)
| Template | File | When to Use |
|----------|------|-------------|
| Business Case | `business-case-template.md` | Justify investments to leadership |
| Roadmap Narrative | `roadmap-narrative-template.md` | Strategic roadmap — narrative, not feature list |
| Opportunity Assessment | `opportunity-assessment-template.md` | Evaluate new product opportunities |
| Quarterly Business Review | `quarterly-business-review-template.md` | QBR for leadership presentations |

### Product Definition (3)
| Template | File | When to Use |
|----------|------|-------------|
| PRD | `prd-template.md` | Product requirements (used by PRD generator skill) |
| User Story | `user-story-template.md` | Individual user stories for eng |
| Launch Checklist | `launch-checklist-template.md` | Pre-launch readiness verification |

### Communication (2)
| Template | File | When to Use |
|----------|------|-------------|
| Executive Update | `exec-update-template.md` | Stakeholder/leadership status updates |
| 1:1 Notes | `1on1-template.md` | Manager or report 1:1 structure |

### Discovery & Research (2)
| Template | File | When to Use |
|----------|------|-------------|
| Interview Guide | `interview-guide-template.md` | User/customer interview preparation |
| Competitive Teardown | `competitive-teardown-template.md` | Deep-dive analysis of a competitor |

### Execution & Operations (2)
| Template | File | When to Use |
|----------|------|-------------|
| Sprint Review | `sprint-review-template.md` | Sprint review/retro documentation |
| Risk Register | `risk-register-template.md` | Risk tracking for projects |

### People & Process (2)
| Template | File | When to Use |
|----------|------|-------------|
| Stakeholder Map | `stakeholder-map-template.md` | Map and manage stakeholder relationships |
| Process Playbook | `process-playbook-template.md` | Document reusable processes |

### Career & Growth (1)
| Template | File | When to Use |
|----------|------|-------------|
| Impact Narrative | `impact-narrative-template.md` | Performance reviews, promotion packets |

---

## 6. The Context System — How Your Assistant Learns

### Grows Automatically (skills update these)
These files get richer with every skill you run — no manual effort needed:
- **Decision log** — every meeting-summarizer and decision-logger run appends decisions
- **Action items** — every meeting-summarizer and action-item-extractor run updates the tracker
- **Stakeholder sentiment** — meeting-summarizer tracks tone shifts over time
- **Feedback themes** — customer interview processing feeds user feedback
- **Impact journal** — impact-journal skill appends structured entries
- **Cross-org signals** — meeting-summarizer flags other teams' work
- **Domain expertise** — AI research scout and market intelligence append insights
- **Innovation pipeline** — bold idea lab populates ideas

### You Populate During Onboarding (Week 1-2)
One-time effort that makes every skill dramatically smarter:
- `CLAUDE.md` — Company section (product, users, business model, team)
- `context/product-overview.md` — What you build, for whom, why
- `context/team/directory.md` — Names, roles, reporting lines
- `context/team/stakeholder-map.md` — Relationships, preferences, influence
- `context/strategy/current-priorities.md` — This quarter's focus
- `context/strategy/okrs.md` — What you're measured on
- `context/users/personas.md` — Primary user segments and JTBD
- `context/competitors/matrix.md` — Competitive landscape
- `context/metrics/north-star.md` — The metric that matters most

### Compounds Over Months (long-term accumulation)
These become your unfair advantage over time:
- **Domain expertise** — AI + legal tech knowledge grows weekly
- **Innovation pipeline** — Idea inventory from months of brainstorming
- **Promotion packet** — Documented evidence across 7 competencies
- **Mentorship tracker** — Relationships and growth over time
- **Process playbooks** — Your documented workflows

### The Compounding Timeline
| Timeframe | What Happens | System Value |
|-----------|-------------|--------------|
| **Day 1** | Methodology, frameworks, templates, habits | Immediately useful — saves 1-2 hrs/day |
| **Week 1-2** | Company context populates through onboarding | Noticeably smarter — PRDs reference real personas |
| **Week 3-4** | Institutional memory starts building | Context-aware — critiques check real competitors |
| **Month 2** | 30+ meetings processed, 50+ action items tracked | Pattern recognition emerging |
| **Month 3+** | Deep institutional memory accumulated | Force multiplier — 2-3x operating efficiency |

---

## 7. Recommended Cadence

### Daily (~25 minutes total)

| When | What | Time | Trigger |
|------|------|------|---------|
| Morning | Morning briefing | 5 min | "morning briefing" |
| After each meeting | Process transcript | 3 min each | "summarize this meeting" |
| When wins happen | Log impact | 1 min | "log impact: [what happened]" |
| End of day | EOD rollup | 5 min | "end of day" |

### Weekly (~60 minutes)

| When | What | Trigger |
|------|------|---------|
| Monday | Review action items, update priorities if shifted | "check action items" |
| Friday | Action item cleanup — archive completed, flag stale | Manual review |
| Friday | AI research scan — stay at the frontier | "AI research scan" |
| Anytime | Skim impact journal entries for the week | Read `context/personal/impact-journal.md` |

### Monthly (~90 minutes)

| What | Trigger |
|------|---------|
| Update promotion packet with month's strongest evidence | Edit `context/personal/promotion-packet.md` |
| Review innovation pipeline — promote/park/kill ideas | Edit `context/personal/innovation-pipeline.md` |
| Market intelligence — full legal tech landscape scan | "market intel" |
| Bold idea lab — creative session seeded from context | "bold idea lab" |
| Audit domain expertise — add new knowledge | Edit `context/personal/domain-expertise.md` |
| Audit INDEX.md for accuracy | Review `INDEX.md` |
| Review cross-org tracker for stale entries | Review `context/cross-org/initiative-tracker.md` |

### Quarterly (~2 hours)

| What | Trigger |
|------|---------|
| Generate QBR | Use `templates/quarterly-business-review-template.md` |
| Career goals check-in | Review `context/personal/career-goals.md` |
| Promotion packet major refresh | Review `context/personal/promotion-packet.md` |
| Archive old tracking data | Move to `tracking/archive/` |
| Build a new skill from a workflow you've done 3+ times | Create new skill in `skills/` |

---

## 8. Principal PM Acceleration

The system is designed to create Principal PM operating leverage. Here's how each piece accelerates your trajectory:

### AI Domain Expertise
Weekly AI research scans + domain-expertise.md accumulation = you're always the most informed person in the room about AI developments. When leadership asks "what does this mean for us?", you have the answer with context.

### Market Intelligence
Bi-weekly legal tech scans ensure you know every competitor move before your leadership does. You spot threats and opportunities first. That's Principal-level pattern recognition.

### Bold Thinking
Monthly bold-idea-lab sessions generate the ideas that become next quarter's roadmap. Principals bring ideas, not just execute them. The system stress-tests your ideas against real context before you pitch them.

### Cross-Org Thinking
Meeting summarizer flags cross-org signals automatically. Initiative tracker and synergy log create visible evidence of connecting dots across teams. Principals are the connective tissue of an organization — this system makes that visible.

### Business Impact Framing
Every PRD starts with a business case summary. Every strategy critique scores business impact clarity. Every executive email leads with outcomes. Over time, business-first thinking becomes automatic.

### Evidence Pipeline
```
Daily impact entries → Monthly promotion packet updates →
Quarterly impact narratives → Promotion conversation with documented proof
```
Across all 7 Principal PM competencies. No scrambling at review time.

### Institutional Memory
After 3 months of meeting processing + decision logging, you have more documented context than anyone in the org. You can say "we decided X in March because Y" — with receipts.

### Time Multiplication
30 minutes/day of system discipline saves 4-5 hours/week of manual overhead: meeting notes, action item tracking, status reports, decision documentation, stakeholder communication.

---

## 9. Dos and Don'ts

### Do
- **Process every meeting** through meeting-summarizer — this is the #1 value driver
- **Log decisions immediately** — context fades within hours
- **Use impact journal daily**, even for small wins — they compound
- **Run AI research scan weekly** — being the person who always knows what's new is a superpower
- **Run bold idea lab monthly** — Principals bring the ideas, not just execute them
- **Update context files** when you learn something new about product/team/market
- **Say "think harder"** when output feels surface-level — Claude will go deeper
- **Trust the templates** — they encode proven structure
- **Build a new skill** when you've done a workflow manually 3+ times
- **Share meeting summaries** with attendees — build trust through transparency

### Don't
- **Don't skip morning briefing** — it takes 5 minutes and prevents surprises
- **Don't leave action items only in meeting notes** — they must flow to the tracker
- **Don't populate context files with guesses** — wrong context is worse than no context
- **Don't expect perfection from day 1** — skills need 2-4 weeks of context to shine
- **Don't commit company-specific context to git** — it's gitignored for a reason
- **Don't modify template structure** without understanding the downstream skill that uses it
- **Don't use the system as a replacement** for talking to users and stakeholders
- **Don't hoard** — share insights, build trust through transparency

---

## 10. How to Customize and Extend

### Adding a Skill
1. Create in appropriate `skills/` subdirectory
2. Follow the pattern: Metadata → Purpose → Inputs (required/optional/auto-loaded context) → Process (numbered steps) → Output Format → Quality Checklist → Integration Points
3. Reference any existing skill as a model (meeting-summarizer.md is the most comprehensive)
4. Update INDEX.md and this GUIDE.md
5. Or just say: "create a new skill for [workflow]" — Claude will follow the pattern

### Adding a Template
1. Create in `templates/` with naming convention `[name]-template.md`
2. Include section headers with placeholder guidance in [brackets]
3. Add formatting guidelines at the bottom
4. Update INDEX.md and this GUIDE.md

### Adding a Context File
1. Create in appropriate `context/` subdirectory
2. Add to `.gitignore` if company-specific
3. Update INDEX.md
4. Reference in relevant skills' auto-loaded context so they read it

### Modifying a Skill
Open the `.md` file and edit directly, or say "update the [skill name] skill to [change]" in Claude Code. Changes take effect immediately on the next run. Common modifications:
- Add/remove auto-loaded context files
- Add process steps
- Adjust output format
- Add integration points

---

## 11. Troubleshooting / FAQ

| Problem | Solution |
|---------|----------|
| Claude doesn't know my product | Populate `context/product-overview.md` and the CLAUDE.md company section |
| Meeting summaries missing speaker names | Populate `context/team/directory.md` with names and roles |
| System feels overwhelming | Start with just 3 things: morning briefing, meeting summarizer, impact journal |
| Worried about confidential info | Company-specific data is gitignored. Only `context/personal/` and system files are committed |
| Switching to a new role | Keep `context/personal/` (portable). Archive everything else. Re-clone, re-populate |
| How long until it's fully useful? | Immediately useful → noticeably better at 2 weeks → full stride at 4 weeks |
| Skills reference files that are empty | Skills handle empty context gracefully — output is thinner but still structured |
| Want to build a future skill early | Check the prerequisites table in Section 4 — if the context exists, build it |
| Output feels generic or surface-level | Say "think harder" — Claude will use deeper reasoning and challenge assumptions |
| Context window getting full | Skills only load relevant context, not everything. INDEX.md routes efficiently |

---

## 12. File Inventory

### Root Files (4)
| File | Purpose |
|------|---------|
| `CLAUDE.md` | Master identity, preferences, AI instructions, Principal PM directives |
| `INDEX.md` | Knowledge base router — Claude reads this to find the right context |
| `GUIDE.md` | This file — complete user manual |
| `README.md` | GitHub readme with setup instructions |

### Skills (12 across 7 categories)
| File | Purpose |
|------|---------|
| `skills/daily/morning-briefing.md` | Daily situational awareness digest |
| `skills/daily/impact-journal.md` | Log wins for promotion evidence |
| `skills/daily/end-of-day-rollup.md` | EOD summary + tomorrow prep |
| `skills/meetings/meeting-summarizer.md` | Transcript → structured notes + KB updates |
| `skills/discovery/ai-research-scout.md` | AI frontier monitoring |
| `skills/discovery/market-intelligence.md` | Legal tech landscape tracking |
| `skills/definition/prd-generator.md` | Socratic PRD generation |
| `skills/strategy/strategy-critique.md` | 7-dimension strategy scoring |
| `skills/strategy/decision-logger.md` | Decision recording with conflict detection |
| `skills/strategy/bold-idea-lab.md` | Creative brainstorming engine |
| `skills/execution/action-item-extractor.md` | Text → structured action items |
| `skills/communication/email-drafter.md` | Context-aware email drafting |

### Templates (19)
| File | Purpose |
|------|---------|
| `templates/meeting-summary-template.md` | Meeting notes structure |
| `templates/action-items-template.md` | Action item tracker structure |
| `templates/decision-record-template.md` | Decision log structure |
| `templates/prd-template.md` | Product requirements document |
| `templates/user-story-template.md` | User story format |
| `templates/1on1-template.md` | 1:1 meeting notes |
| `templates/exec-update-template.md` | Executive/stakeholder update |
| `templates/interview-guide-template.md` | User interview preparation |
| `templates/competitive-teardown-template.md` | Competitor deep-dive |
| `templates/launch-checklist-template.md` | Pre-launch readiness |
| `templates/sprint-review-template.md` | Sprint review documentation |
| `templates/stakeholder-map-template.md` | Stakeholder relationship mapping |
| `templates/risk-register-template.md` | Risk tracking |
| `templates/business-case-template.md` | Investment justification |
| `templates/roadmap-narrative-template.md` | Strategic roadmap narrative |
| `templates/opportunity-assessment-template.md` | Opportunity evaluation |
| `templates/impact-narrative-template.md` | Performance review / promotion evidence |
| `templates/quarterly-business-review-template.md` | QBR for leadership |
| `templates/process-playbook-template.md` | Reusable process documentation |

### Personal Context (11 files — portable, git-committed)
| File | Purpose |
|------|---------|
| `context/personal/pm-frameworks.md` | PM methodology and frameworks |
| `context/personal/interview-playbook.md` | Interview methodology |
| `context/personal/stakeholder-strategies.md` | Stakeholder management playbook |
| `context/personal/writing-samples.md` | Writing voice and samples |
| `context/personal/career-goals.md` | Career goals with Principal PM framework |
| `context/personal/lessons-learned.md` | Lessons from previous roles |
| `context/personal/impact-journal.md` | Running log of wins and outcomes |
| `context/personal/domain-expertise.md` | AI + legal tech knowledge base |
| `context/personal/innovation-pipeline.md` | Idea inventory (kanban) |
| `context/personal/mentorship-tracker.md` | Mentorship relationships |
| `context/personal/promotion-packet.md` | 7-competency promotion evidence |

### Cross-Org Context (2 files — gitignored)
| File | Purpose |
|------|---------|
| `context/cross-org/initiative-tracker.md` | Cross-team visibility map |
| `context/cross-org/synergy-log.md` | Cross-org connections spotted & realized |

### Company Context Placeholders (14 files — gitignored, populate during onboarding)
| File | Purpose |
|------|---------|
| `context/product-overview.md` | Product vision, users, business model |
| `context/team/directory.md` | Team members, roles, reporting |
| `context/team/stakeholder-map.md` | Stakeholder relationships and preferences |
| `context/team/org-context.md` | Org culture and dynamics |
| `context/strategy/current-priorities.md` | This quarter's focus |
| `context/strategy/okrs.md` | Objectives and key results |
| `context/users/personas.md` | User segments and JTBD |
| `context/users/journey-maps.md` | User journey documentation |
| `context/users/feedback-themes.md` | Recurring user feedback patterns |
| `context/competitors/matrix.md` | Competitive landscape |
| `context/metrics/north-star.md` | Primary metric definition |
| `context/metrics/baselines.md` | Metric baselines and targets |
| `tracking/current-sprint.md` | Current sprint context |
| `tracking/risks-and-blockers.md` | Active risks and blockers |

### Operational (gitignored)
| Location | Purpose |
|----------|---------|
| `tracking/action-items.md` | Live action item tracker |
| `context/decisions/decision-log.md` | Live decision log |
| `artifacts/meetings/` | Generated meeting summaries |
| `artifacts/prds/` | Generated PRDs |
| `artifacts/reports/` | Research scans, market intel, idea lab output |
| `artifacts/emails/` | Email drafts |
| `research/` | Interview transcripts, survey data |
| `inbox/` | Raw inputs (recordings, screenshots) |

### Planning Docs (4 — committed)
| File | Purpose |
|------|---------|
| `docs/SETUP.md` | Original build instructions |
| `docs/ARCHITECTURE.md` | System design documentation |
| `docs/PATTERNS.md` | Skill and template design patterns |
| `docs/MAINTENANCE.md` | Ongoing maintenance guide |

---

*Built with Claude Code. Designed to compound.*
