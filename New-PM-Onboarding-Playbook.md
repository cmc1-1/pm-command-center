# New-PM Onboarding Playbook

> **Purpose**: Sequenced, time-boxed plan for turning a brand-new work laptop into a fully leveraged PM operating system using the PM Command Center.
> **When to use**: Day 0 of a new role (or the day you clone this repo). Read once top-to-bottom before starting; return to each part as you reach it.
> **Audience**: The PM onboarding with this system. Works for any company; personalize via `MY_PROFILE.md`.

---

## Context

You've just received your work laptop and you're starting a new PM role. The PM Command Center ships with 26 skills, 22 templates, and a 7-competency Principal PM framework. This playbook sequences the work of turning that fresh laptop into a fully leveraged operating system — without overwhelming you in Week 1.

The ordering respects four principles (sourced from `GUIDE.md` §6–7, `INDEX.md` onboarding checklist, and `skills/daily/onboarding-accelerator.md`):

1. **All 26 skills work from Day 1** — empty context + no MCPs is valid. MCPs and context are accelerants, not blockers (`GUIDE.md:45, 467`).
2. **Tier-staged MCPs** — Tier 1 on Day 1-3, Tier 2 on Week 2-3, Tier 3 on Month 1+ (`README.md:42-45`).
3. **Context grows naturally** — auto-populates through skills + MCPs; manual seeding is only needed for 9 files in Week 1 (`GUIDE.md:262-303`).
4. **Future skills are gated on context depth** — don't build them until their prerequisites are populated, else they produce generic output (`GUIDE.md:185-199`).

---

## Part 1 — Day 0: Laptop Prep (15 min, before Day 1)

Check prerequisites on your new laptop:

| Tool | Check | Install if missing |
|------|-------|--------------------|
| Git | `git --version` | Windows: `winget install Git.Git`; macOS: `brew install git` |
| Claude Code | `claude --version` | `curl -fsSL https://claude.ai/install.sh \| bash` (`README.md:29`) |
| Terminal | PowerShell 7+ (Windows) or zsh/bash (macOS) | Usually preinstalled |

No Node/npm required — setup scripts are pure shell + PowerShell.

---

## Part 2 — Day 1: Install + Profile (45 min)

1. **Clone the repo** to a stable location (not OneDrive/Dropbox if possible to avoid sync conflicts on `context/my/`):
   ```
   git clone https://github.com/cmc1-1/pm-command-center.git
   cd pm-command-center
   ```

2. **Run the setup script** (`setup.sh:13-121` or `setup.ps1` equivalent):
   - Windows: `.\setup.ps1`
   - macOS/Linux: `bash setup.sh`

   What it does (idempotent — safe to re-run):
   - Copies `MY_PROFILE.template.md` → `MY_PROFILE.md` (if not exists)
   - Copies 12 personal context templates into `context/my/` (includes opportunity-solution-tree)
   - Copies 3 company context templates into `context/company/`
   - Creates 18 gitignored artifact output directories + 13 tracking/context subdirs
   - Touches 18 placeholder files for auto-populated context

3. **Fill `MY_PROFILE.md`** (20 min) — this is the single highest-leverage file. Claude reads it before every skill (`CLAUDE.md:4-6`). Fill all 7 sections:
   - About Me, Core Strengths, Personal Brand, Working Style
   - Product Context, Team Context, Tools & Integrations (`MY_PROFILE.template.md:4-106`)

4. **Start Claude Code** in the repo: `claude`

5. **First smoke test** — run `"morning briefing"`. It should work with empty context and tell you the system is ready but needs Week 1 seeding. This verifies install without requiring any MCPs.

---

## Part 3 — Day 2-3: Tier 1 MCPs + First Real Skill Run (2 hours total, split across days)

### Connect Tier 1 MCPs (order matters — Slack first, then Atlassian)

| MCP | Install | Verification | Unblocks |
|-----|---------|--------------|----------|
| **Slack** (company workspace) | Official MCP server (`@anthropic-ai/slack-mcp-server`) per company auth flow | Run `"morning briefing"` — should see @mentions surfaced | morning-briefing, meeting-summarizer, action-item-extractor, email-drafter, end-of-day-rollup |
| **Atlassian** (Jira + Confluence combined) | `@atlassian/atlassian-mcp-server`, one config covers both | Run `"morning briefing"` — should see sprint status | onboarding-accelerator, prd-generator, meeting-summarizer, decision-logger |

Each connection typically requires an OAuth flow or personal access token per company policy. Record connection status in `MY_PROFILE.md` §Tools & Integrations checklist (`MY_PROFILE.template.md:88-106`).

### Run onboarding-accelerator (one-time, ~15 min runtime)

Once Tier 1 is connected, run: `"onboarding accelerator"` (or `"pull company context"`, `"bootstrap context"`).

This pulls from Confluence/Jira/Slack/Productboard/Amplitude into:
- `context/company/product-overview.md` ← Confluence product docs
- `context/company/tool-stack.md` ← Confluence systems docs
- `context/company/pm-team-norms.md` ← Confluence PM handbook
- `context/strategy/current-priorities.md` ← Confluence + Productboard roadmap
- `context/strategy/okrs.md` ← Confluence OKR docs
- `context/team/directory.md` ← Slack profiles + Jira assignees
- `context/team/org-context.md` ← Confluence org pages
- `context/cross-org/initiative-tracker.md` ← cross-team labels/epics
- `tracking/current-sprint.md` ← active Jira sprint

This is a **one-time bootstrap** — after it runs, review each file for accuracy (flags confidence: High/Medium/Low per row in its output table). Don't re-run it; context grows organically from here.

### First real skill run

Process your first meeting: `"summarize this meeting"` after dropping a transcript into `inbox/`. Verifies the end-to-end loop (meeting → summary → action items → decision log → artifact file).

---

## Part 4 — Week 1: Manual Context Seed (4 hours spread across the week)

Some context can't be auto-populated — it requires your judgment, 1:1s, and shadowing. Seed these 9 files in priority order (`INDEX.md:154-168`; `GUIDE.md:275`):

| Priority | File | How to seed | When |
|----------|------|-------------|------|
| P0 | `context/team/stakeholder-map.md` | Build from 1:1s with manager and cross-functional leads; use power/interest grid in template | Days 2-5 |
| P0 | `context/strategy/current-priorities.md` | Confirm auto-populated version with manager in first 1:1 | Day 3 |
| P1 | `context/my/career-goals.md` | Personal — 30 min Sunday evening reflection | End of Week 1 |
| P1 | `context/my/impact-journal.md` | Start from Day 1; log via `"log impact: [what happened]"` | Daily from Day 1 |
| P1 | `context/users/personas.md` | Seed from product overview + Productboard + any existing research | Day 4-5 |
| P2 | `context/competitors/matrix.md` | One-hour scan; use `market-intelligence` skill | Day 5 |
| P2 | `context/metrics/north-star.md` | From Amplitude dashboard list + manager input | Day 5 |
| P2 | `context/decisions/decision-log.md` | Empty — populates via `decision-logger` per decision | Grows from Day 1 |
| P3 | `context/my/domain-expertise.md` | Empty — grows from `ai-research-scout` weekly | Week 2+ |

### Week 1 operating rhythm

- **Every morning (5 min)**: `"morning briefing"` — triages inbox, lists action items, metric deltas, sprint status, priorities. Works better every day as context builds.
- **Every meeting (3 min)**: `"summarize this meeting"` — auto-populates decisions, action items, stakeholder sentiment, cross-org signals.
- **On wins (1 min)**: `"log impact: [what happened]"` — STAR-framed, competency-mapped, feeds promotion packet.
- **Every evening (5 min)**: `"end of day"` — flags unsummarized meetings, unlogged impact, stale items, LNO drift.

---

## Part 5 — Week 2-3: Tier 2 MCPs + Strategic Depth (90 min setup + cumulative use)

### Connect Tier 2 MCPs

| MCP | Unblocks | Priority |
|-----|----------|----------|
| **Amplitude** | morning-briefing trends, prd-generator evidence, strategy-critique metric checks, hearts-gsm-builder | High — weekly metric trends show up in briefings |
| **Productboard** | bold-idea-lab deduping, prd-generator request context, onboarding-accelerator roadmap refresh | Medium — only if your org uses Productboard |
| **GitHub** | prd-generator PR context, launch-orchestrator CI gating, morning-briefing code deltas | Medium — high value during active builds |

Record connections in `MY_PROFILE.md` §Tools & Integrations.

### Week 2-3 context expansion

Now that priorities/OKRs/personas are seeded, these skills become dramatically more useful:
- `"LNO prioritize my week"` on Monday — use `lno-prioritizer` to tier tasks
- `"weekly discovery"` — plan Monday, synthesize after each interview, reflect Friday. This seeds `context/my/opportunity-solution-tree.md`.
- `"draft a strategy critique on X"` — checks against real OKRs, real competitors
- `"design an experiment for X"` — produces MDE, sample size, guardrail metrics

### Weekly rhythm (Week 2+)

| When | Skill | Trigger |
|------|-------|---------|
| Mon AM | lno-prioritizer | `"LNO prioritize my week"` |
| Mon-Fri | discovery-cadence | `"weekly discovery"` |
| Fri PM | ai-research-scout | `"AI research scan"` |
| Fri PM | bold-idea-lab | `"bold idea lab"` |
| Fri PM | action item cleanup | `"archive completed items"` |

---

## Part 6 — Month 1+: Tier 3 MCPs (optional) + Context Maturity

### Tier 3 MCPs (connect only as needed — not all will apply)

| MCP | When | Unblocks |
|-----|------|----------|
| Salesforce | If you touch enterprise sales workflows | prd-generator CRM context, market-intelligence |
| Figma | If you're design-heavy | prd-generator design links, meeting-summarizer (design reviews) |
| LaunchDarkly | Once you have a live rollout | launch-orchestrator phase gates, morning-briefing flag state |
| Grafana + Sentry | Once you own production metrics | morning-briefing system health alerts |
| Notion | If your company has historical Notion docs | onboarding-accelerator historical pull |
| Miro | If you run workshops | bold-idea-lab workshop capture |

### Monthly cadence (~90 min, last Friday)

- Update `context/my/promotion-packet.md` from Strong-rated impact entries
- OST review — aging opportunities, untested assumptions (`context/my/opportunity-solution-tree.md`)
- `"market intel"` — monthly scan
- Innovation pipeline review — promote/park/kill (`context/my/innovation-pipeline.md`)
- Audit `INDEX.md` Recent Changes + cross-org tracker

### Quarterly cadence (~3 hours, last week of quarter)

- `"team health check"` — 8-attribute Atlassian assessment, forces one 90-day fix
- `"draft a product strategy memo"` (revision mode) — refresh Diagnosis/Guiding Policy/Coherent Actions
- CAB session (if applicable) — `"plan a CAB"`
- Product Trio Charter review (if applicable) — use `templates/product-trio-charter-template.md`
- Generate QBR — use `templates/quarterly-business-review-template.md`
- Career goals check-in — `context/my/career-goals.md` refresh

---

## Part 7 — Future Skills Build Sequence (Month 2+)

Eight skills are documented as future work in `GUIDE.md:185-199`. Each is gated on specific context depth. **Do not build them early** — they produce generic output without their prerequisites. Build in this order as context matures:

| # | Skill | Build when | Context prerequisites |
|---|-------|-----------|----------------------|
| 1 | Status Report (execution) | Week 2+ | `tracking/action-items.md`, sprint data, `risks-and-blockers.md` active |
| 2 | Blocker Scanner (execution) | Week 2+ | `tracking/action-items.md` + sprint actively tracked |
| 3 | Opportunity Scorer (strategy) | Week 3+ | `product-overview.md`, `personas.md`, `okrs.md`, `competitors/matrix.md` populated |
| 4 | Stakeholder FAQ Generator (communication) | Week 3+ | `stakeholder-map.md`, `decision-log.md`, `current-priorities.md` populated |
| 5 | Roadmap Narrative skill (strategy) | Week 4+ | `current-priorities.md`, `okrs.md`, active PRDs in `artifacts/prds/` |
| 6 | Feedback Clustering (discovery) | Month 2+ | `feedback-themes.md` with 10+ entries |
| 7 | Exec Narrative Writer (communication) | Month 2+ | `impact-journal.md` with 15+ entries, OKRs set |
| 8 | Thought Leadership Generator (communication) | Month 3+ | `domain-expertise.md` well-populated (weekly AI research for 2+ months) |

**Build pattern** (for each future skill):
1. Copy the 8-section format from an existing skill in the same category (e.g., `skills/execution/action-item-extractor.md`).
2. Define trigger phrases, inputs (auto-loaded context paths), process steps.
3. Add to `INDEX.md` routing table and `GUIDE.md` §4.
4. Bump skill count in `INDEX.md`, `GUIDE.md`, `README.md` (keep all three in sync).
5. Cross-link from related existing skills in their Integration Points section.
6. Smoke test with real data before marking done.

---

## Part 8 — Day-to-Day Value Maximization Rules

These seven habits turn the system from "useful tool" to "force multiplier":

1. **Capture everything through skills, not raw notes.** Meeting notes outside `meeting-summarizer` lose their action items, decisions, and cross-org signals. Transcript → `"summarize this meeting"` → everything auto-routes.
2. **Log impact daily, not weekly.** `"log impact: [thing]"` takes 60 seconds and STAR-frames automatically. Weekly batch = lost detail, weak evidence.
3. **Run morning briefing before opening email.** Briefing already triaged everything — email becomes reactive noise if opened first.
4. **Every decision through decision-logger.** `"log decision: [what]"` writes to `decision-log.md` with rationale + alternatives. Six months from now this is your institutional memory goldmine and promo evidence.
5. **LNO every Monday.** Without explicit tiering, Overhead work expands. `"LNO prioritize my week"` forces the call.
6. **Weekly discovery is non-negotiable.** Three interviews + synthesize + reflect. The OST is the single artifact that separates Senior from Principal — it's the visible evidence of continuous discovery.
7. **Never edit `context/` files by hand if a skill writes there.** Skills are the write path; manual edits cause merge conflicts and stale references. If a skill doesn't write to a file you want populated, that's a signal to spec a new skill.

---

## Critical Files to Reference

- `README.md:1-100` — install + MCP progressive connection
- `GUIDE.md:121-199` — complete skill catalog + future skills
- `GUIDE.md:262-370` — context population + cadence (your operating manual)
- `INDEX.md:154-188` — Week 1 / Week 2 / Month 1 checklists
- `MY_PROFILE.template.md:1-106` — profile structure
- `skills/daily/onboarding-accelerator.md:40-95` — what the bootstrap pulls from where
- `setup.sh:13-121` / `setup.ps1` — setup steps reference

---

## Verification (how to know each phase worked)

### Day 1 verification
- [ ] `claude` runs in the repo; `MY_PROFILE.md` exists with your info
- [ ] `"morning briefing"` runs without error (output will note empty context — that's fine)
- [ ] `context/my/` contains 12 template files; `context/company/` contains 3

### Day 2-3 verification
- [ ] Tier 1 MCPs show in `MY_PROFILE.md` checklist
- [ ] `"morning briefing"` surfaces real @mentions and sprint status
- [ ] `onboarding-accelerator` completed, wrote to ≥5 context files with confidence ratings
- [ ] First meeting summary produced an artifact in `artifacts/meetings/` and wrote entries to `tracking/action-items.md` and `context/decisions/decision-log.md`

### Week 1 verification
- [ ] 9 manually-seeded context files populated per Part 4 table
- [ ] ≥3 meetings processed through `meeting-summarizer`
- [ ] ≥3 impact entries in `context/my/impact-journal.md`
- [ ] Morning briefing + EOD rollup run daily

### Week 2-3 verification
- [ ] Tier 2 MCPs connected (at least Amplitude if available)
- [ ] First LNO prioritization run produced tiered tasks
- [ ] First discovery interview synthesized → appears in `context/my/opportunity-solution-tree.md`
- [ ] PRD generator references real personas and priorities (not placeholders)

### Month 1 verification
- [ ] ≥30 decisions logged, ≥50 action items tracked
- [ ] First promotion-packet update from impact journal
- [ ] First future skill (Status Report or Blocker Scanner) built if context depth warrants

### Quarterly verification
- [ ] Team health report generated with one committed 90-day fix
- [ ] Strategy memo refreshed
- [ ] QBR narrative drafted
- [ ] Career goals reviewed with manager
