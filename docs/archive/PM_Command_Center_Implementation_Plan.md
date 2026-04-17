# PM Command Center: Pre-Build & Implementation Plan
### What to build now, how to make it portable, and the week-by-week rollout

---

## The Big Picture

Everything splits into two clean categories:

| Category | When | What | Employer-dependent? |
|---|---|---|---|
| **The chassis** | Build NOW (pre-start) | Folder structure, templates, generic skills, personal context, Git repo | No — 100% portable |
| **The engine** | Build AFTER starting | Product context, team directory, MCP connections, tool-specific integrations | Yes — employer-specific |

The chassis is everything that makes *you* effective as a PM regardless of company. The engine is the company-specific context that powers the chassis. You build the chassis now; you plug in the engine on Day 1.

---

## Part 1: What You Can Pre-Build (No Employer Context Needed)

### Tier 1: Build This Weekend (4-6 hours)

**1. The Git Repository + Folder Structure**

```bash
# Create the repo
mkdir pm-command-center
cd pm-command-center
git init

# Create the full skeleton
mkdir -p context/{team,strategy,competitors,users,metrics,decisions}
mkdir -p context/strategy/active-prds
mkdir -p context/strategy/retrospectives
mkdir -p context/metrics/weekly-snapshots
mkdir -p context/competitors/teardowns
mkdir -p tracking/archive
mkdir -p templates
mkdir -p skills/{daily,meetings,discovery,definition,strategy,execution,communication,data}
mkdir -p artifacts/{meetings,prds,reports,decks,emails,prototypes}
mkdir -p research/{interviews,surveys,market-data}
mkdir -p inbox/{meeting-recordings,screenshots,raw-feedback}

# Create placeholder README
echo "# PM Command Center" > README.md
echo "Private AI-powered PM productivity system" >> README.md

# Create .gitignore
cat > .gitignore << 'EOF'
# Sensitive company data (added after onboarding)
context/team/directory.md
context/team/org-context.md
context/strategy/*
!context/strategy/.gitkeep

# Raw recordings (large files)
inbox/meeting-recordings/*.mp3
inbox/meeting-recordings/*.m4a
inbox/meeting-recordings/*.wav

# Temporary working files
*.tmp
.DS_Store
node_modules/
EOF

# Initial commit
git add -A
git commit -m "Initial PM Command Center skeleton"
```

**2. CLAUDE.md (Personal Section — Employer-Agnostic)**

This is your identity layer. The product/team sections stay as placeholders until Day 1.

```markdown
# PM Command Center

## About Me
- Name: Chetan
- Role: Senior Product Manager (10+ years experience)
- Background: AWS (agentic AI platforms), Generac, Accenture, PwC
- Education: MASc + BASc Biomedical Engineering, University of Toronto
- Strengths: 0→1 product builds, AI/ML platforms, enterprise SaaS,
  multi-agent systems, data-driven decision making
- Location: Vancouver, BC

## My Working Style
- Communication: Direct and concise. Lead with the "so what"
- Documents: Start with recommendation, then supporting evidence
- Decisions: Data-informed but not data-paralyzed. Bias to action
- Meetings: Come prepared, leave with clear owners and deadlines
- Feedback: Be specific, actionable, and challenge my assumptions

## How AI Should Work With Me
- Default output: Markdown files saved to artifacts/
- Never: Use corporate buzzwords, hedge excessively, bury the lead
- When drafting for me: Confident but not arrogant, precise, structured
- When critiquing my work: Be rigorous. I want to find gaps before
  stakeholders do. Don't soften feedback
- When I say "think harder": Use deeper reasoning, consider edge cases,
  challenge the premise of my question

## Product Context
[TO BE FILLED — Day 1 onboarding]
- Product: [TBD]
- Users: [TBD]
- Business model: [TBD]
- North star metric: [TBD]

## Team Context
[TO BE FILLED — Week 1 onboarding]
- Manager: [TBD]
- Key stakeholders: [TBD]
- Team structure: [TBD]

## Current Priorities
[TO BE FILLED — after first week]
1. [TBD]
2. [TBD]
3. [TBD]

## Tools & Integrations
[TO BE FILLED — based on employer stack]
- Project tracker: [Jira / Linear / Asana / TBD]
- Docs: [Confluence / Notion / Google Docs / TBD]
- Communication: [Slack / Teams / TBD]
- Design: [Figma / TBD]
- Analytics: [TBD]

## Knowledge Base Routing
- See INDEX.md for complete file map
- Before answering any product question, check relevant context/ files
- After completing any workflow, update appropriate context/ and tracking/
```

**3. INDEX.md (Router Template)**

```markdown
# Knowledge Base Index
Last updated: [auto-update date]

## Quick Routing
- Product overview & vision → context/product-overview.md
- Current priorities → context/strategy/current-priorities.md
- Team & stakeholders → context/team/directory.md
- Active PRDs → context/strategy/active-prds/ (count: 0)
- Decision log → context/decisions/decision-log.md (count: 0)
- Competitor matrix → context/competitors/matrix.md
- User personas → context/users/personas.md
- Feedback themes → context/users/feedback-themes.md
- North star metrics → context/metrics/north-star.md
- Open action items → tracking/action-items.md (count: 0)
- Sprint context → tracking/current-sprint.md
- Meeting notes → artifacts/meetings/ (sorted by date)

## Recent Changes (last 7 days)
[Will auto-populate as you use the system]

## Onboarding Status
- [ ] Product overview populated
- [ ] Team directory built
- [ ] Stakeholder map created
- [ ] First sprint context captured
- [ ] Competitor matrix started
- [ ] User personas documented
- [ ] North star metrics defined
- [ ] First 3 decisions logged
```

**4. All Templates (100% portable — no employer context needed)**

These are the document skeletons your skills will use. Build all of them now:

| Template | File | What It Contains |
|---|---|---|
| PRD | templates/prd-template.md | Problem, users, goals, requirements (MoSCoW), user stories (INVEST), metrics, out of scope, open questions, tech considerations |
| Meeting Summary | templates/meeting-summary-template.md | TL;DR, decisions table, action items table, open questions, sentiment, key quotes, context updates needed |
| 1:1 Notes | templates/1on1-template.md | Career themes, feedback given/received, action items, relationship notes, discussion topics |
| Exec Update | templates/exec-update-template.md | TL;DR, key metrics table, sprint progress, decisions this period, risks, next period priorities |
| Interview Guide | templates/interview-guide-template.md | Research questions, warm-up, core questions, probes, wrap-up, synthesis format |
| Decision Record | templates/decision-record-template.md | Decision ID, date, decision, context, alternatives considered, rationale, decided by, reversible? |
| Competitive Teardown | templates/competitive-teardown-template.md | Overview, target users, positioning, feature comparison, pricing, strengths, weaknesses, gaps, implications |
| Launch Checklist | templates/launch-checklist-template.md | Pre-launch (eng, design, QA, docs, legal), launch day, post-launch monitoring, rollback plan |
| Sprint Review | templates/sprint-review-template.md | Sprint goals, completed/not completed, velocity, demos, retrospective items, next sprint preview |
| User Story | templates/user-story-template.md | As a [persona], I want [action], so that [outcome]. Acceptance criteria, test scenarios, dependencies |
| Action Items Tracker | templates/action-items-template.md | Dashboard, overdue section, open items table, completed section, archive reference |
| Stakeholder Map | templates/stakeholder-map-template.md | Name, role, influence level, interest level, communication preference, relationship notes, sentiment tracker |
| Risk Register | templates/risk-register-template.md | ID, risk, impact, likelihood, owner, mitigation, status, last reviewed |

**5. Generic Skills (work without any employer context)**

These skills are about *your PM craft*, not any specific product:

| Skill | Why It's Portable | Pre-buildable? |
|---|---|---|
| Meeting Summarizer | Processes any transcript into structured notes | ✅ 100% |
| PRD Generator (Socratic) | Asks questions then generates PRD from any context | ✅ 100% |
| Strategy Critique | Critiques any strategy doc against PM frameworks | ✅ 100% |
| Interview Synthesis | Synthesizes any batch of interview transcripts | ✅ 100% |
| Status Report Generator | Aggregates from tracking/ and artifacts/ files | ✅ 100% |
| Email Drafter | Drafts emails in specified tone for any audience | ✅ 100% |
| Decision Logger | Appends structured decisions to the decision log | ✅ 100% |
| Action Item Extractor | Extracts action items from any text source | ✅ 100% |
| Competitive Teardown | Analyzes any competitor via web research | ✅ 100% |
| Meeting Prep | Generates prep notes for any meeting given context | ✅ 90% (needs stakeholder context) |
| Opportunity Scorer | Scores features using RICE/ICE frameworks | ✅ 100% |
| Daily Briefing | Morning summary from tracking/ files | ✅ 90% (needs MCP for calendar/email) |

### Tier 2: Build Next Week (3-4 hours)

**6. Personal Knowledge That Travels With You**

Context about *you* that's useful at any company:

```
context/personal/
├── pm-frameworks.md         # Your preferred frameworks (RICE, Jobs-to-be-Done,
│                            # Opportunity Solution Trees, etc.) with notes on
│                            # when you use each
├── interview-playbook.md    # Your interviewing methodology, favorite questions,
│                            # probing techniques
├── stakeholder-strategies.md # Your playbook for managing different stakeholder
│                            # types (the skeptic, the HiPPO, the detail-oriented
│                            # exec, the disengaged sponsor)
├── writing-samples.md       # Examples of your best PRDs, emails, updates
│                            # (redacted) so the AI can match your voice
├── career-goals.md          # What you're optimizing for in this role
└── lessons-learned.md       # Product lessons from AWS, Generac, etc.
                             # (redacted) — your accumulated wisdom
```

**7. Open-Source PM Skills to Evaluate & Adopt**

Don't build everything from scratch. These repos have battle-tested PM skills:

| Resource | What It Offers | Link |
|---|---|---|
| deanpeters/Product-Manager-Skills | 65 skills, 36 workflows, 8 plugins — PRD, strategy, discovery, execution | github.com/deanpeters/Product-Manager-Skills |
| huytieu/COG-second-brain | Full PM lifecycle skills with Obsidian integration and role-based packs | github.com/huytieu/COG-second-brain |
| alirezarezvani/claude-skills | 192 skills including 12 product skills with templates and frameworks | github.com/alirezarezvani/claude-skills |
| automazeio/ccpm | Agile project management — PRD→Epic→Tasks→GitHub Issues pipeline | github.com/automazeio/ccpm |
| ccforpms.com (Carl Vellotti) | Free PM course with hands-on skills for meetings, PRDs, data analysis | ccforpms.com |

Evaluate these, cherry-pick what works, and integrate into your skills/ folder.

---

## Part 2: Git Strategy for Portability

### Repository Structure

```
pm-command-center/           ← Private GitHub/GitLab repo
├── .gitignore               ← Excludes sensitive company data
├── CLAUDE.md                ← Master context (personal section committed,
│                            ← company section gitignored or encrypted)
├── INDEX.md                 ← Knowledge base router
├── README.md                ← Setup instructions for new machine
│
├── templates/               ← ✅ COMMITTED (fully portable)
├── skills/                  ← ✅ COMMITTED (fully portable)
├── context/personal/        ← ✅ COMMITTED (your PM knowledge)
│
├── context/team/            ← ⚠️ GITIGNORED (employer-specific, sensitive)
├── context/strategy/        ← ⚠️ GITIGNORED (employer-specific, sensitive)
├── context/competitors/     ← ⚠️ PARTIALLY COMMITTED (public info only)
├── context/users/           ← ⚠️ GITIGNORED (may contain user data)
├── context/metrics/         ← ⚠️ GITIGNORED (confidential)
├── context/decisions/       ← ⚠️ GITIGNORED (confidential)
│
├── tracking/                ← ⚠️ GITIGNORED (operational state)
├── artifacts/               ← ⚠️ GITIGNORED (generated outputs)
├── research/                ← ⚠️ GITIGNORED (confidential research)
└── inbox/                   ← ⚠️ GITIGNORED (raw inputs)
```

### What Gets Committed vs. Gitignored

| Layer | Committed to Git? | Reasoning |
|---|---|---|
| **Templates** | ✅ Yes | Your PM templates are your intellectual property and fully portable |
| **Skills** | ✅ Yes | Workflow definitions are generic PM craft, not company secrets |
| **Personal context** | ✅ Yes | Your frameworks, methodology, writing style |
| **CLAUDE.md (personal section)** | ✅ Yes | Your identity and preferences |
| **CLAUDE.md (company section)** | ❌ No | Confidential product/team info |
| **Team/strategy/decisions** | ❌ No | Company confidential |
| **Tracking/artifacts** | ❌ No | Operational data, potentially sensitive |
| **Research/inbox** | ❌ No | Raw data, recordings, user feedback |

### Moving to a New Laptop

```bash
# On new work laptop
git clone https://github.com/yourname/pm-command-center.git
cd pm-command-center

# You now have: folder structure, templates, skills, personal context
# Missing: company-specific context (you'll build this in Week 1)

# Install Claude Code
curl -fsSL https://claude.ai/install.sh | bash

# Start Claude Code in the project
claude

# Claude reads your CLAUDE.md, knows your preferences,
# has all your templates and skills ready to go
# You just need to fill in the company context
```

### Security Considerations

- **Never commit** customer data, internal metrics, employee names, meeting transcripts, or strategic documents to Git
- Use a **private repository** (GitHub Private or your employer's Git host)
- If employer has strict data policies, keep the entire `context/` folder gitignored and back up locally only
- Consider **two repos**: one public/portable (templates + skills) and one private/local (all context)
- Some employers may require you to use their Git instance — the repo clones cleanly to any Git host

---

## Part 3: Week-by-Week Implementation Plan

### Pre-Start: Build the Chassis (This Week + Next)

| Day | Task | Time | Deliverable |
|---|---|---|---|
| **Day 1** | Create Git repo + full folder skeleton | 30 min | Repo with structure |
| **Day 1** | Write CLAUDE.md (personal section) | 45 min | Identity layer ready |
| **Day 1** | Create INDEX.md template | 15 min | Router ready |
| **Day 2** | Build all 13 document templates | 2-3 hrs | templates/ folder complete |
| **Day 2** | Install Claude Code, test with the repo | 30 min | Working Claude Code setup |
| **Day 3** | Build Meeting Summarizer skill | 1 hr | First skill operational |
| **Day 3** | Build Action Item Extractor skill | 45 min | Tracking foundation ready |
| **Day 4** | Build PRD Generator skill (Socratic) | 1 hr | Core PM skill ready |
| **Day 4** | Build Strategy Critique skill | 45 min | Review capability ready |
| **Day 5** | Build Email Drafter skill | 30 min | Communication layer ready |
| **Day 5** | Build Decision Logger skill | 30 min | Decision tracking ready |
| **Day 5** | Evaluate open-source PM skills repos | 1 hr | Cherry-picked additions |
| **Day 6** | Write personal PM frameworks + methodology docs | 1 hr | context/personal/ populated |
| **Day 6** | Test full workflow: mock meeting → summarize → extract AIs → draft email | 1 hr | End-to-end validation |
| **Day 7** | Git commit, push to private repo, document setup in README | 30 min | Portable and backed up |

**Total pre-start investment: ~12-14 hours across one week**
**What you have at the end: A fully functional PM toolkit that works on any laptop, at any company, with any AI platform**

---

### Week 1 at New Job: Plug In the Engine

Your focus this week: absorb context as fast as possible. Every meeting, every doc, every 1:1 feeds the system.

| Day | Morning | During Work | End of Day |
|---|---|---|---|
| **Mon** | Clone repo to work laptop. Install Claude Code. Set up Claude.ai with Gmail/Calendar MCP | Every meeting: take notes or get transcript | Run meeting summarizer on each. Start populating context/product-overview.md |
| **Tue** | Read all onboarding docs — use Claude to extract key facts into context/ files | 1:1s with team members: run 1:1 processor | Update context/team/directory.md and stakeholder-map.md |
| **Wed** | First morning briefing attempt (may be sparse — that's fine) | Continue meetings. Start context/strategy/current-priorities.md | Decision log has first entries. Action items tracker is live |
| **Thu** | Morning briefing is getting useful now | Ask Claude to identify gaps: "What don't I know yet about this product?" | Update CLAUDE.md with company section. Fill in product context |
| **Fri** | Full morning briefing working | Generate first weekly status (mostly for yourself) | Commit templates/skills updates. Git push |

**Context files populated by end of Week 1:**
- ✅ context/product-overview.md (basic)
- ✅ context/team/directory.md (key people)
- ✅ context/team/stakeholder-map.md (started)
- ✅ context/strategy/current-priorities.md (initial)
- ✅ tracking/action-items.md (active)
- ✅ 5-10 meeting summaries in artifacts/meetings/
- ✅ 3-5 decision log entries
- ✅ CLAUDE.md fully populated

### Week 2: First Automations Go Live

| Focus | What You're Doing | Skills in Active Use |
|---|---|---|
| Meeting processing is now routine | Every meeting → 5 min post-processing → notes, AIs, follow-ups | Meeting Summarizer, Action Item Extractor, Email Drafter |
| Morning briefing is daily habit | 3 min each morning for full situational awareness | Daily Briefing |
| Start building user context | Begin populating personas, feedback themes from existing research | Interview Synthesis (if research exists) |
| Connect project tracker | Set up Jira/Linear MCP integration | Ticket Generator (basic) |

### Weeks 3-4: Core Workflows Automated

| Focus | What You're Doing | Skills in Active Use |
|---|---|---|
| First PRD written with AI assist | Use PRD Generator for a real feature | PRD Generator, Strategy Critique |
| Status reports are fast now | 15 min Friday reports pulling from all context | Status Report Generator |
| Competitive landscape started | First competitor teardown | Competitive Scan |
| Meeting prep is automatic | Before key meetings, generate prep notes | Meeting Prep |

### Weeks 5-8: Compound Intelligence Kicks In

| Focus | What You're Doing | Skills in Active Use |
|---|---|---|
| Context is rich enough for real leverage | AI references past decisions, knows stakeholder preferences, cites interview data when drafting PRDs | All skills benefit from accumulated context |
| Batch operations become possible | Process 10 interviews, analyze a quarter of feedback | Interview Synthesis (parallel), Feedback Clustering |
| First prototype built with AI | PRD → functional HTML demo | Prototype Builder |
| Stakeholder communication is effortless | Exec updates, team updates, customer updates — all drafted from context | Exec Update Writer, Stakeholder FAQ |

### Weeks 9-12: Force Multiplier Mode

| Focus | What You're Doing | Skills in Active Use |
|---|---|---|
| Building custom skills for your specific workflow | Noticed you do X every week → make it a skill | Skill creation becomes organic |
| Context maintenance is a habit | Weekly hygiene: archive completed items, verify decision log, update INDEX.md | End-of-Day Rollup, context hygiene |
| Dashboard for visibility | Auto-generated status view from markdown files | Dashboard Generator |
| Scheduled tasks | Competitor monitoring, metric snapshots run on cadence | Scheduled skills |

---

## Part 4: What to Build First (Skill Priority Stack)

Based on the research and your profile, here's the build order optimized for maximum early impact:

```
PRIORITY STACK (build in this order)
═══════════════════════════════════

PRE-START (no employer needed)
──────────────────────────────
1. 📋 Meeting Summarizer          ← Highest daily frequency
2. ✅ Action Item Extractor        ← Foundation for accountability
3. 📄 PRD Generator (Socratic)     ← Core PM artifact
4. 🔍 Strategy Critique            ← Quality multiplier
5. ✉️ Email Drafter                ← Daily communication
6. 📝 Decision Logger              ← Institutional memory

WEEK 1-2 (employer context available)
─────────────────────────────────────
7. ☀️ Morning Briefing             ← Needs calendar/email MCP
8. 👤 Meeting Prep                 ← Needs stakeholder context
9. 📊 Status Report Generator      ← Needs sprint/metric context
10. 🎯 1:1 Processor               ← Needs relationship context

WEEK 3-6 (context is accumulating)
──────────────────────────────────
11. 🔬 Interview Synthesis         ← Needs user research data
12. ⚔️ Competitive Scan            ← Needs competitor context
13. 🎫 Ticket Generator            ← Needs Jira/Linear MCP
14. 📊 Opportunity Scorer          ← Needs backlog context

WEEK 7-12 (compound intelligence)
─────────────────────────────────
15. 🚀 Launch Planner              ← Needs deep product context
16. 💡 Prototype Builder            ← Needs PRD maturity
17. 📈 Metric Explorer              ← Needs data access
18. 🌅 End-of-Day Rollup           ← Polish once routine is set
```

---

## Part 5: Cost & Tooling Budget

| Tool | Cost | Required? | When |
|---|---|---|---|
| Claude Pro | $20/month | Yes — minimum for Claude Code access | Pre-start |
| Claude Max | $100/month | Optional — for heavy usage (1M token context window) | Consider in Month 2 if hitting limits |
| GitHub (private repo) | Free | Yes — for portability | Pre-start |
| Obsidian | Free | Optional — nice visual layer for the markdown files | Anytime |
| VS Code | Free | Recommended — split-screen view of files as Claude edits them | Pre-start |
| Otter.ai / Granola | Free tier / $10-15/month | Recommended — auto-transcription for meetings | Week 1 |

**Total pre-start cost: $20/month (Claude Pro) + free tools**

---

## Part 6: Quick Reference — Setup Checklist

### Before Day 1

- [ ] Git repo created with full folder skeleton
- [ ] CLAUDE.md written (personal section)
- [ ] INDEX.md template created
- [ ] All 13 document templates built
- [ ] Claude Code installed and authenticated
- [ ] 6 core skills built and tested (Meeting Summarizer, AI Extractor, PRD Generator, Strategy Critique, Email Drafter, Decision Logger)
- [ ] Personal PM context written (frameworks, methodology, writing samples)
- [ ] Open-source skills evaluated and best ones integrated
- [ ] End-to-end workflow tested with mock data
- [ ] README.md with setup instructions for new machine
- [ ] Everything committed and pushed to private Git repo

### Day 1 at New Job

- [ ] Clone repo to work laptop
- [ ] Install Claude Code
- [ ] Connect Gmail + Calendar MCP in Claude.ai
- [ ] Start populating CLAUDE.md company section
- [ ] Run meeting summarizer on first meeting
- [ ] Begin context/product-overview.md

### End of Week 1

- [ ] CLAUDE.md fully populated
- [ ] Team directory and stakeholder map started
- [ ] Morning briefing running daily
- [ ] 5+ meeting summaries generated
- [ ] Action item tracker active
- [ ] Decision log has entries

### End of Month 1

- [ ] 20+ context files populated
- [ ] 10+ skills in active use
- [ ] Weekly status reports automated
- [ ] First PRD generated with AI assist
- [ ] Competitive landscape documented
- [ ] Jira/Linear MCP connected
- [ ] 30-60-90 plan completed
- [ ] Estimated 3-4 hours/week saved

---

*PM Command Center Implementation Plan v1.0*
*Created: March 28, 2026*
*Status: Pre-build phase — no employer context required*
