# PM Command Center — Complete Guide
Version: 2.0 | Last updated: 2026-04-05

---

## 1. What Is This?

The PM Command Center is an AI-powered product management productivity system that learns your company over time and compounds in value the longer you use it.

**The mental model**: Think of it as an AI chief of staff that arrives on Day 1 with proven methodology, frameworks, and habits. Over the first few weeks, it learns your company, product, team, and market organically through every meeting you process, every decision you log, and every interaction you feed it. By month 2-3, it has more documented institutional memory than anyone in the org — and it uses all of it to make every output smarter.

**What it is**:
- A structured knowledge system built on Markdown files
- 13 automated workflow skills that read your context before acting
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

### First-time setup (once)
1. Clone the repo and run the setup script: `./setup.sh` (Mac/Linux) or `.\setup.ps1` (Windows)
2. Open `MY_PROFILE.md` and fill in your name, background, working style, and preferences
3. Review `context/my/` files — customize the ones relevant to you

### Start using it
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
├── CLAUDE.md              # Team framework + AI instructions (always loaded)
├── MY_PROFILE.md          # Your personal identity + preferences (gitignored)
├── MY_PROFILE.template.md # Blank profile template (committed)
├── INDEX.md               # Knowledge base router (loaded on demand)
├── GUIDE.md               # This file — complete user manual
├── README.md              # GitHub readme + team setup instructions
├── setup.sh / setup.ps1   # First-time setup scripts
│
├── skills/                # Workflow definitions (13 skills)
│   ├── daily/             # morning-briefing, impact-journal, end-of-day-rollup, onboarding-accelerator
│   ├── meetings/          # meeting-summarizer
│   ├── discovery/         # ai-research-scout, market-intelligence
│   ├── definition/        # prd-generator
│   ├── strategy/          # strategy-critique, decision-logger, bold-idea-lab
│   ├── execution/         # action-item-extractor
│   └── communication/     # email-drafter
│
├── templates/             # Document templates (19 templates)
├── context/               # Persistent knowledge base
│   ├── company/           # Your company context (gitignored, per-PM)
│   ├── company.template/  # Blank company context templates (committed)
│   ├── my/                # Your personal context (gitignored, per-PM)
│   ├── my.template/       # Blank personal context templates (committed)
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
└── docs/                  # Integration guide, architecture, patterns
```

### Tool Integrations (MCP)
When you connect your team's tools via MCP (Model Context Protocol), skills automatically upgrade:
- **Slack** → Morning briefing scans channels, meeting summaries auto-post, action item nudges via DM
- **Jira** → Action items become tickets, sprint data auto-populates, blocker detection
- **Confluence** → PRDs publish directly, onboarding pulls existing docs into context files
- **Amplitude** → Metrics auto-populate, morning briefing shows real data trends
- **Productboard** → Roadmap syncs, feature requests feed into PRDs and idea lab
- **GitHub** → PR context, CI status, technical depth for eng conversations

All MCP steps are gated by availability — skills work without them, they just get superpowers with them. See `docs/INTEGRATIONS.md` for full setup guide and connection priority.

### Key Principle
Skills are smart because they read context first. The Meeting Summarizer reads your team directory, priorities, action items, and decision log before processing a transcript — so it can flag conflicts, detect carryover items, and map speakers to roles. The richer your context, the smarter every skill becomes.

### Three-Layer Architecture
- **Shared (committed)** — Admin-managed, flows to all PMs: CLAUDE.md, INDEX.md, GUIDE.md, skills/, templates/, context/company.template/, context/my.template/, MY_PROFILE.template.md, setup scripts, docs/
- **Personal (gitignored)** — Per-PM, never conflicts on pull: MY_PROFILE.md, context/my/ (career goals, impact journal, promotion packet, frameworks), context/company/ (product overview, tool stack, team norms)
- **Confidential (gitignored)** — Company-specific, local only: context/team/, context/strategy/, context/users/, context/competitors/, context/metrics/, context/decisions/, context/cross-org/, tracking/, artifacts/, research/, inbox/

---

## 4. Complete Capability Reference

### Skills — Ready Now (13 built)

#### Daily Habits
| Skill | Trigger Phrases | What It Does | MCP Superpowers |
|-------|----------------|--------------|-----------------|
| **Morning Briefing** | "morning briefing", "start my day" | Daily digest: overdue items, today's priorities, metric alerts, cross-org signals, impact opportunities | +Slack: scans channels for overnight @mentions. +Jira: pulls live sprint status. +Amplitude: shows real metric trends. +Grafana/Sentry: surfaces overnight alerts |
| **Impact Journal** | "log impact", "record win" | Structured win/outcome entry tagged to 10 categories and 7 Principal PM competencies. Feeds promotion packet | — (local-only, no MCP needed) |
| **End of Day Rollup** | "end of day", "EOD", "wrap up" | EOD summary: what happened, gaps identified, tomorrow's top 3 priorities | +Slack: counts today's messages/threads. +Jira: shows tickets moved today. +GitHub: lists PRs reviewed/merged |

#### Meetings & Tracking
| Skill | Trigger Phrases | What It Does | MCP Superpowers |
|-------|----------------|--------------|-----------------|
| **Meeting Summarizer** | "summarize this meeting", "process meeting notes" | Transcript → structured notes with decisions, action items, sentiment, quotes, cross-org signals. Auto-updates knowledge base | +Slack: posts summary to channel. +Jira: creates tickets from action items. +Confluence: publishes as team-visible page |
| **Action Item Extractor** | "extract action items from..." | Any text → structured action items in tracker with IDs, owners, deadlines | +Jira: bulk-creates tickets with assignees/dates. +Slack: sends DM notifications to owners |
| **Decision Logger** | "log this decision" | Structured decision record with conflict detection against prior decisions | +Confluence: syncs to shared decision log page. +Slack: posts decision announcement. +Jira: creates follow-up tickets |

#### Strategy & Ideation
| Skill | Trigger Phrases | What It Does | MCP Superpowers |
|-------|----------------|--------------|-----------------|
| **Strategy Critique** | "critique this strategy", "red team this" | 7-dimension scoring (including Business Impact Clarity) + devil's advocate + gaps analysis | — (local-only, context-driven) |
| **Bold Idea Lab** | "bold idea lab", "brainstorm product ideas", "what if we..." | Generate 5-8 bold ideas, filter to 3-5, stress-test survivors, rank with validation plan | +Productboard: checks existing ideas first. +Amplitude: validates with usage data. +Confluence: publishes to innovation space |

#### Discovery & Research
| Skill | Trigger Phrases | What It Does | MCP Superpowers |
|-------|----------------|--------------|-----------------|
| **AI Research Scout** | "AI research scan", "what's new in AI" | Frontier scan: new models, techniques, papers, regulation → structured briefing with product implications | — (web-based research, no MCP needed) |
| **Market Intelligence** | "market intel", "market scan" | Competitive landscape: competitor moves, market trends, analyst reports → positioning assessment | — (web-based research, no MCP needed) |

#### Product Definition
| Skill | Trigger Phrases | What It Does | MCP Superpowers |
|-------|----------------|--------------|-----------------|
| **PRD Generator** | "create a PRD for...", "help me spec out" | Socratic Q&A (3-4 rounds) → full PRD with business case summary, auto-critique from engineering + UX perspectives | +Confluence: publishes PRD. +Jira: creates epic + stories. +Amplitude: pulls metric baselines. +Productboard: cross-references feature requests |

#### Communication
| Skill | Trigger Phrases | What It Does | MCP Superpowers |
|-------|----------------|--------------|-----------------|
| **Email Drafter** | "draft an email to...", "write an email" | Context-aware email calibrated to recipient, with 8 types including executive narrative | +Slack: offers to send as DM or channel post instead. +Confluence: publishes longer updates as pages |

#### Onboarding
| Skill | Trigger Phrases | What It Does | MCP Superpowers |
|-------|----------------|--------------|-----------------|
| **Onboarding Accelerator** | "onboarding accelerator", "pull company context" | Pulls from connected tools to auto-populate context files. Cuts onboarding from 2 weeks to 2-3 days | Requires MCPs: Confluence (docs), Jira (sprint/team), Productboard (roadmap), Slack (profiles), Amplitude (metrics) |

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
- `MY_PROFILE.md` — Your identity, product context, team context, preferences
- `context/company/product-overview.md` — What you build, for whom, why
- `context/team/directory.md` — Names, roles, reporting lines
- `context/team/stakeholder-map.md` — Relationships, preferences, influence
- `context/strategy/current-priorities.md` — This quarter's focus
- `context/strategy/okrs.md` — What you're measured on
- `context/users/personas.md` — Primary user segments and JTBD
- `context/competitors/matrix.md` — Competitive landscape
- `context/metrics/north-star.md` — The metric that matters most

### Compounds Over Months (long-term accumulation)
These become your unfair advantage over time:
- **Domain expertise** — Industry and technology knowledge grows weekly
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
| Anytime | Skim impact journal entries for the week | Read `context/my/impact-journal.md` |

### Monthly (~90 minutes)

| What | Trigger |
|------|---------|
| Update promotion packet with month's strongest evidence | Edit `context/my/promotion-packet.md` |
| Review innovation pipeline — promote/park/kill ideas | Edit `context/my/innovation-pipeline.md` |
| Market intelligence — full competitive landscape scan | "market intel" |
| Bold idea lab — creative session seeded from context | "bold idea lab" |
| Audit domain expertise — add new knowledge | Edit `context/my/domain-expertise.md` |
| Audit INDEX.md for accuracy | Review `INDEX.md` |
| Review cross-org tracker for stale entries | Review `context/cross-org/initiative-tracker.md` |

### Quarterly (~2 hours)

| What | Trigger |
|------|---------|
| Generate QBR | Use `templates/quarterly-business-review-template.md` |
| Career goals check-in | Review `context/my/career-goals.md` |
| Promotion packet major refresh | Review `context/my/promotion-packet.md` |
| Archive old tracking data | Move to `tracking/archive/` |
| Build a new skill from a workflow you've done 3+ times | Create new skill in `skills/` |

---

## 8. Principal PM Acceleration

The system is designed to create Principal PM operating leverage. Here's how each piece accelerates your trajectory:

### AI Domain Expertise
Weekly AI research scans + domain-expertise.md accumulation = you're always the most informed person in the room about AI developments. When leadership asks "what does this mean for us?", you have the answer with context.

### Market Intelligence
Bi-weekly market scans ensure you know every competitor move before your leadership does. You spot threats and opportunities first. That's Principal-level pattern recognition.

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

### Adding a Tool Integration (MCP)
When a new tool needs to be connected to the PM Command Center:

1. **Check for an MCP server**: Search the [MCP Registry](https://registry.modelcontextprotocol.io/) or run `claude mcp search <tool-name>`
2. **Connect the MCP**: Run `claude mcp add <server-name> <command>` with the appropriate auth token
3. **Verify the connection**: Run `claude mcp list` to confirm it's active
4. **Identify which skills benefit**: Determine which skills should use the new tool (reference `docs/INTEGRATIONS.md` for the pattern)
5. **Update affected skills**: Add a `**[Tool Name]** (if connected):` block to the "Tool Integrations" section of each relevant skill file. Gate all steps with "(if connected)" checks so skills still work without it
6. **Update `MY_PROFILE.md`**: Add the tool to your MCP Connections checklist under the appropriate tier
7. **Update `docs/INTEGRATIONS.md`**: Add the tool to the tool stack table, connection details, and any context auto-population mappings
8. **Update this GUIDE.md**: Add to Section 3 (Tool Integrations), Section 4 (skill descriptions if capabilities change), and Section 12 (if new files are created)
9. **Test end-to-end**: Run a skill that uses the new tool and verify the integration works

**Key rule**: Every MCP step must be gated by availability. Skills must work identically without the MCP — integrations are additive, never required.

### Modifying a Skill
Open the `.md` file and edit directly, or say "update the [skill name] skill to [change]" in Claude Code. Changes take effect immediately on the next run. Common modifications:
- Add/remove auto-loaded context files
- Add process steps
- Adjust output format
- Add integration points
- Add MCP tool integration steps (gate with "if connected")

---

## 11. Troubleshooting / FAQ

| Problem | Solution |
|---------|----------|
| Claude doesn't know my product | Populate `context/company/product-overview.md` and the Product Context section in `MY_PROFILE.md` |
| Meeting summaries missing speaker names | Populate `context/team/directory.md` with names and roles |
| System feels overwhelming | Start with just 3 things: morning briefing, meeting summarizer, impact journal |
| Worried about confidential info | Company-specific data is gitignored. Only shared framework files are committed — personal data stays local |
| Switching to a new role | Keep `MY_PROFILE.md` and `context/my/` (portable). Archive everything else. Re-clone, re-populate |
| How do other PMs get updates? | Admin pushes skill/template changes. PMs run `git pull origin main` — zero conflicts since personal files are gitignored |
| New PM onboarding | Clone repo → run `setup.sh` → fill `MY_PROFILE.md` → connect MCPs → say "onboarding accelerator" |
| How long until it's fully useful? | Immediately useful → noticeably better at 2 weeks → full stride at 4 weeks |
| Skills reference files that are empty | Skills handle empty context gracefully — output is thinner but still structured |
| Want to build a future skill early | Check the prerequisites table in Section 4 — if the context exists, build it |
| Output feels generic or surface-level | Say "think harder" — Claude will use deeper reasoning and challenge assumptions |
| Context window getting full | Skills only load relevant context, not everything. INDEX.md routes efficiently |
| MCP server won't connect | Check auth token and VPN/SSO requirements. See `docs/INTEGRATIONS.md` |
| Skills don't show MCP data | Verify MCP is listed in `claude mcp list`. Skills check for connection before attempting MCP steps |
| How do I connect my tools? | See `docs/INTEGRATIONS.md` — Tier 1 (Slack, Jira, Confluence) first, then Tier 2, then Tier 3 |

---

## 12. File Inventory

### Root Files (8)
| File | Purpose |
|------|---------|
| `CLAUDE.md` | Team framework, knowledge base routing, Principal PM directives |
| `MY_PROFILE.md` | Your personal identity, style, preferences (gitignored) |
| `MY_PROFILE.template.md` | Blank profile template for new PMs (committed) |
| `INDEX.md` | Knowledge base router — Claude reads this to find the right context |
| `GUIDE.md` | This file — complete user manual |
| `README.md` | Team setup instructions + daily usage reference |
| `setup.sh` / `setup.ps1` | First-time setup scripts (Mac/Linux + Windows) |

### Skills (13 across 7 categories)
| File | Purpose |
|------|---------|
| `skills/daily/morning-briefing.md` | Daily situational awareness digest |
| `skills/daily/impact-journal.md` | Log wins for promotion evidence |
| `skills/daily/end-of-day-rollup.md` | EOD summary + tomorrow prep |
| `skills/daily/onboarding-accelerator.md` | Pull connected tools → auto-populate context files |
| `skills/meetings/meeting-summarizer.md` | Transcript → structured notes + KB updates |
| `skills/discovery/ai-research-scout.md` | AI frontier monitoring |
| `skills/discovery/market-intelligence.md` | Competitive landscape tracking |
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

### Personal Context (11 files — gitignored, per-PM)
| File | Purpose |
|------|---------|
| `context/my/pm-frameworks.md` | PM methodology and frameworks |
| `context/my/interview-playbook.md` | Interview methodology |
| `context/my/stakeholder-strategies.md` | Stakeholder management playbook |
| `context/my/writing-samples.md` | Writing voice and samples |
| `context/my/career-goals.md` | Career goals with Principal PM framework |
| `context/my/lessons-learned.md` | Lessons from previous roles |
| `context/my/impact-journal.md` | Running log of wins and outcomes |
| `context/my/domain-expertise.md` | Domain knowledge base |
| `context/my/innovation-pipeline.md` | Idea inventory (kanban) |
| `context/my/mentorship-tracker.md` | Mentorship relationships |
| `context/my/promotion-packet.md` | 7-competency promotion evidence |

### Personal Context Templates (11 files — committed, copied on setup)
| Location | Purpose |
|----------|---------|
| `context/my.template/*.md` | Blank versions of all 11 personal context files. Copied to `context/my/` by setup script |

### Company Context (3 files — gitignored, per-PM)
| File | Purpose |
|------|---------|
| `context/company/product-overview.md` | Product overview for your company |
| `context/company/tool-stack.md` | Team tool inventory reference |
| `context/company/pm-team-norms.md` | PM team practices and cadences |

### Company Context Templates (3 files — committed, copied on setup)
| Location | Purpose |
|----------|---------|
| `context/company.template/*.md` | Blank versions of all 3 company context files. Copied to `context/company/` by setup script |

### Cross-Org Context (2 files — gitignored)
| File | Purpose |
|------|---------|
| `context/cross-org/initiative-tracker.md` | Cross-team visibility map |
| `context/cross-org/synergy-log.md` | Cross-org connections spotted & realized |

### Company Context Placeholders (13 files — gitignored, populate during onboarding)
| File | Purpose |
|------|---------|
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

### Docs (5 — committed)
| File | Purpose |
|------|---------|
| `docs/INTEGRATIONS.md` | Tool stack integration guide (MCP setup, tiers, automation) |
| `docs/AI_PM_Assistant_Blueprint.md` | Historical: original system design blueprint |
| `docs/PM_Command_Center_Implementation_Plan.md` | Historical: build plan and implementation log |
| `docs/PM_Command_Center_Systems_Architecture.md` | Historical: system architecture documentation |
| `docs/PM_Command_Center_Unified_Blueprint_v2.md` | Historical: unified blueprint v2 |

> **Note**: Historical docs reflect the original architecture, not current. See this GUIDE.md for the current system reference.

---

*Built with Claude Code. Designed to compound.*
