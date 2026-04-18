# PM Command Center — Capability Catalogue

> **Purpose**: Single-source reference for every skill, template, automation, and multi-skill process in the PM Command Center. Use this as a quick scan when you need to remember "is there something for X?" or "when should I run Y?"
> **When to use**: Any time you're picking a tool for a task. Pair with `GUIDE.md` §4–7 for deeper narrative and `INDEX.md` for file-location routing.
> **Audience**: You (daily reference). Works for any PM using this system.

---

## 1. Skills Catalogue (26 built)

All skills work from Day 1 with empty context. MCPs add real-time data when connected. Triggers are natural-language phrases — Claude picks the right skill from any reasonable variant.

### Daily Habits (5)

| Skill | Trigger | When to run | Writes to |
|-------|---------|-------------|-----------|
| **morning-briefing** | `"morning briefing"`, `"start my day"` | Every weekday AM, before email | Conversation only (reads broadly) |
| **impact-journal** | `"log impact: [X]"`, `"record win"` | In-the-moment after every win | `context/my/impact-journal.md` |
| **end-of-day-rollup** | `"end of day"`, `"EOD"`, `"wrap up"` | Every weekday PM | Conversation + surfaces gaps |
| **lno-prioritizer** ✨ | `"LNO prioritize my week"`, `"LNO my day"` | Monday AM (weekly plan), daily EOD (retro) | Conversation; can log to `context/my/` |
| **onboarding-accelerator** | `"onboarding accelerator"`, `"pull company context"`, `"bootstrap context"` | Once, Day 2-3 after Tier 1 MCPs connected | Multiple `context/company/`, `context/strategy/`, `context/team/`, `tracking/` files |

### Meetings & Tracking (3)

| Skill | Trigger | When to run | Writes to |
|-------|---------|-------------|-----------|
| **meeting-summarizer** | `"summarize this meeting"`, `"process meeting notes"` | After every meeting with a transcript | `artifacts/meetings/YYYY-MM-DD-*.md`, appends to `tracking/action-items.md`, `context/decisions/decision-log.md` |
| **action-item-extractor** | `"extract action items from..."` | Any text with commitments (email, doc, Slack thread) | `tracking/action-items.md` |
| **decision-logger** | `"log this decision"`, `"log decision: [X]"` | Every meaningful decision | `context/decisions/decision-log.md` |

### Discovery & Research (6)

| Skill | Trigger | When to run | Writes to |
|-------|---------|-------------|-----------|
| **ai-research-scout** | `"AI research scan"`, `"what's new in AI"` | Friday PM, weekly | `context/my/domain-expertise.md` |
| **market-intelligence** | `"market intel"`, `"market scan"` | Monthly (or on competitor moves) | `context/my/domain-expertise.md`, `context/competitors/matrix.md` |
| **discovery-cadence** ✨ | `"weekly discovery"`, `"discovery plan"` | Mon (plan) / per-interview (synthesize) / Fri (reflect) | `context/my/opportunity-solution-tree.md`, `context/users/feedback-themes.md`, `artifacts/meetings/` |
| **assumption-test-designer** ✨ | `"design an assumption test"`, `"validate before we build"` | Before every major build | `artifacts/assumption-tests/` |
| **storyboard-generator** ✨ | `"generate storyboard"`, `"customer journey storyboard"` | During definition of customer-facing changes | `artifacts/storyboards/` |
| **cab-runner** ✨ | `"plan a CAB"`, `"customer advisory board"` | Quarterly (if applicable) | `artifacts/cab/` |

### Product Definition (3)

| Skill | Trigger | When to run | Writes to |
|-------|---------|-------------|-----------|
| **prd-generator** | `"create a PRD for..."`, `"help me spec out"` | After PR/FAQ approved + assumption tests passed | `artifacts/prds/` |
| **pr-faq-generator** ✨ | `"draft a PR/FAQ"`, `"working backwards"` | Before any major build — gates the PRD | `artifacts/prfaqs/` |
| **eval-and-model-spec-author** ✨ | `"author an eval"`, `"model spec for..."` | For every AI-powered feature | `artifacts/evals/`, `artifacts/model-specs/` |

### Strategy & Ideation (5)

| Skill | Trigger | When to run | Writes to |
|-------|---------|-------------|-----------|
| **strategy-critique** | `"critique this strategy"`, `"red team this"` | Before pitching strategy to leadership | `artifacts/reports/` or inline |
| **bold-idea-lab** | `"bold idea lab"`, `"what if we..."` | Friday PM or monthly; on strategy inflection | `context/my/innovation-pipeline.md` |
| **product-strategy-memo** ✨ | `"draft strategy memo"`, `"Rumelt memo"` | Quarterly or on major strategy shift | `artifacts/strategy-memos/` |
| **pre-mortem-runner** ✨ | `"run a pre-mortem"`, `"what could go wrong"` | Before every major launch | `artifacts/pre-mortems/` |
| **team-health-monitor** ✨ | `"team health check"`, `"quarterly team review"` | Quarterly | `artifacts/reports/team-health-*.md` |

### Data & Measurement (2)

| Skill | Trigger | When to run | Writes to |
|-------|---------|-------------|-----------|
| **experiment-designer** ✨ | `"design an experiment"` | Before any A/B-gated rollout | `artifacts/experiments/` |
| **hearts-gsm-builder** ✨ | `"build HEART"`, `"GSM for feature"` | During PRD definition (metrics section) | `artifacts/measurement-plans/` |

### Execution & Launch (1)

| Skill | Trigger | When to run | Writes to |
|-------|---------|-------------|-----------|
| **launch-orchestrator** ✨ | `"orchestrate launch"`, `"phase-gate launch"` | 4-6 weeks before GA | `artifacts/launches/` |

### Communication (1)

| Skill | Trigger | When to run | Writes to |
|-------|---------|-------------|-----------|
| **email-drafter** | `"draft an email to..."`, `"write an email"` | Any time a message needs to leave your head | `artifacts/emails/` (optional save) |

✨ = added in the Best Practices Enhancement pass.

---

## 2. Future Skills (8, build when prerequisites are met)

Don't build early — they produce generic output without their context. Details in `GUIDE.md:185-199` and `New-PM-Onboarding-Playbook.md` §7.

| # | Skill | Category | Build when |
|---|-------|----------|-----------|
| 1 | **Status Report** | execution | Week 2+ — action-items, sprint, risks active |
| 2 | **Blocker Scanner** | execution | Week 2+ — action-items + sprint tracked |
| 3 | **Opportunity Scorer** | strategy | Week 3+ — personas, OKRs, competitors populated |
| 4 | **Stakeholder FAQ Generator** | communication | Week 3+ — stakeholder-map, decisions, priorities populated |
| 5 | **Roadmap Narrative skill** | strategy | Week 4+ — priorities, OKRs, active PRDs populated |
| 6 | **Feedback Clustering** | discovery | Month 2+ — feedback-themes has 10+ entries |
| 7 | **Exec Narrative Writer** | communication | Month 2+ — impact-journal has 15+ entries |
| 8 | **Thought Leadership Generator** | communication | Month 3+ — domain-expertise well-populated |

---

## 3. Templates Catalogue (22 built)

Every template has a standardized preamble (Purpose / When to use / Audience) — check the file for specifics.

| Template | Used by / Feeds into | When to use |
|----------|---------------------|-------------|
| `meeting-summary-template.md` | meeting-summarizer | Every meeting summary |
| `action-items-template.md` | action-item-extractor, meeting-summarizer | Auto-managed tracker structure |
| `decision-record-template.md` | decision-logger, meeting-summarizer | Auto-managed decision log |
| `1on1-template.md` | meeting-summarizer (1:1 type) | Every 1:1 meeting |
| `interview-guide-template.md` | discovery-cadence | Before every user/customer interview |
| `competitive-teardown-template.md` | market-intelligence | Quarterly per key competitor |
| `prd-template.md` | prd-generator | Every PRD |
| `user-story-template.md` | prd-generator downstream | Breaking PRD into eng units |
| `launch-checklist-template.md` | launch-orchestrator | 4-6 weeks before launch |
| `risk-register-template.md` | pre-mortem-runner | Active risk tracking |
| `exec-update-template.md` | email-drafter (exec-update mode) | Weekly/biweekly leadership update |
| `sprint-review-template.md` | — | Every sprint close |
| `business-case-template.md` | product-strategy-memo downstream | Before funding/headcount asks |
| `roadmap-narrative-template.md` | (future) Roadmap Narrative skill | Half-year or annual planning |
| `opportunity-assessment-template.md` | discovery-cadence, bold-idea-lab | Before committing eng to an opportunity |
| `quarterly-business-review-template.md` | — | End of each quarter |
| `impact-narrative-template.md` | impact-journal assembly | Performance reviews, promo packets |
| `stakeholder-map-template.md` | email-drafter, morning-briefing | Week 1 + quarterly refresh |
| `process-playbook-template.md` | — | "How we do X" documentation |
| `plg-growth-loop-canvas-template.md` ✨ | experiment-designer, bold-idea-lab | Mapping growth loops |
| `north-star-metric-tree-template.md` ✨ | hearts-gsm-builder | Once per year minimum |
| `product-trio-charter-template.md` ✨ | team-health-monitor | Trio formation or member change |

---

## 4. Automations (what writes silently while you work)

These aren't skills you invoke — they're the auto-population that happens as a side effect of other skills. Understanding them prevents you from hand-editing files that skills already manage.

| Target file | Writer | Trigger |
|-------------|--------|---------|
| `tracking/action-items.md` | meeting-summarizer, action-item-extractor | Every meeting summary / text processed with commitments |
| `context/decisions/decision-log.md` | meeting-summarizer, decision-logger | Every meeting with decisions / explicit log-decision call |
| `context/my/impact-journal.md` | impact-journal | Every `"log impact"` call |
| `context/my/opportunity-solution-tree.md` | discovery-cadence, meeting-summarizer (opportunity signals) | Every interview synthesized, every meeting with user signals |
| `context/users/feedback-themes.md` | discovery-cadence, meeting-summarizer | Interview synthesis, customer meetings |
| `context/my/domain-expertise.md` | ai-research-scout, market-intelligence | Weekly/monthly scans |
| `context/my/innovation-pipeline.md` | bold-idea-lab | Every idea-lab session |
| `context/cross-org/initiative-tracker.md` | meeting-summarizer (cross-org signals), onboarding-accelerator | Cross-team mentions in meetings; one-time bootstrap |
| `context/team/stakeholder-map.md` (sentiment notes) | meeting-summarizer | Tone shifts detected in meetings |
| `context/my/promotion-packet.md` | impact-journal (assembly suggestions) | Monthly review of Strong-rated entries |
| `context/company/*`, `context/strategy/*`, `context/team/directory.md`, `tracking/current-sprint.md` | onboarding-accelerator | One-time Week 1 bootstrap |
| `artifacts/[type]/` (all generated docs) | respective skill | On each skill run |

**Rule of thumb**: if a skill writes to a file, don't hand-edit it — re-run the skill or spec a new one.

---

## 5. Processes (end-to-end multi-skill workflows)

These are the recurring chains where skills compose into a larger workflow. The PM Command Center is designed so these run themselves if you follow the daily/weekly rhythm.

### 5.1 Daily rhythm (~25 min)
```
AM: morning-briefing
    ↓ (per meeting) meeting-summarizer → action-item-extractor (embedded)
    ↓                                  → decision-logger (embedded)
    ↓ (on wins) impact-journal
PM: end-of-day-rollup
```

### 5.2 Weekly rhythm (~90 min, Mon-Fri)
```
Mon AM:  lno-prioritizer (week plan)
Mon-Fri: discovery-cadence
         ├─ Mon: plan mode (3 interviews scheduled)
         ├─ per-interview: synthesize mode
         └─ Fri: reflect mode (OST update)
Fri PM:  ai-research-scout → bold-idea-lab → action-item cleanup
```

### 5.3 Meeting → follow-up (per meeting, ~5 min)
```
transcript
 → meeting-summarizer
   ├─ artifacts/meetings/*.md (summary)
   ├─ tracking/action-items.md (new items, LNO-tagged)
   ├─ context/decisions/decision-log.md (new decisions)
   ├─ context/my/opportunity-solution-tree.md (opportunity signals)
   ├─ context/cross-org/initiative-tracker.md (cross-org signals)
   └─ stakeholder sentiment updates
 → email-drafter (follow-up mode) [optional]
```

### 5.4 Idea → launch (per initiative, weeks-to-months)
```
bold-idea-lab                     (generate + filter)
  → assumption-test-designer      (find cheapest risky test)
  → [run tests, update OST]
  → pr-faq-generator              (customer narrative gate)
  → product-strategy-memo         (Diagnosis → Guiding Policy → Actions)
  → prd-generator                 (full spec)
      ├─ hearts-gsm-builder       (measurement plan, embedded)
      └─ storyboard-generator     (journey, embedded)
  → eval-and-model-spec-author    [AI features only]
  → experiment-designer           [A/B-gated rollouts only]
  → pre-mortem-runner             (failure-mode check)
  → launch-orchestrator           (fishfood → teamfood → dogfood → beta → GA)
  → impact-journal                (record the outcome)
```

### 5.5 Strategy authoring & pressure-testing
```
market-intelligence + ai-research-scout    (context)
  → product-strategy-memo                  (author)
  → strategy-critique                      (red-team your own memo)
  → pre-mortem-runner                      (stress-test)
  → email-drafter (executive narrative)    (distribute to leadership)
  → decision-logger                        (log the adopted direction)
```

### 5.6 Enterprise discovery loop (quarterly)
```
cab-runner (plan + run session)
  → meeting-summarizer (CAB transcript)
  → discovery-cadence (synthesize mode, per insight)
  → opportunity-solution-tree update
  → email-drafter (CAB commitments memo back to members)
```

### 5.7 Quarterly close
```
team-health-monitor                        (8-attribute scorecard)
  → product-strategy-memo (revision mode)  (refresh diagnosis)
  → cab-runner                             [if applicable]
  → QBR template assembly
  → career-goals + promotion-packet refresh
  → impact-journal review (Strong entries → promo packet)
```

### 5.8 Onboarding flow (once, Day 0 → Week 2)
```
setup.sh / setup.ps1
  → fill MY_PROFILE.md
  → start Claude
  → connect Tier 1 MCPs (Slack, Atlassian)
  → onboarding-accelerator (bootstrap context from Confluence/Jira/Slack)
  → manual seed Week 1 files (stakeholder-map, personas, priorities)
  → first morning-briefing with real data
  → connect Tier 2 MCPs (Amplitude, Productboard, GitHub)
  → enter weekly rhythm
```

See `New-PM-Onboarding-Playbook.md` for the full sequenced version.

---

## 6. Quick Trigger Index (alphabetical)

When you don't remember a skill name but remember the action:

| If you want to... | Say | Skill |
|-------------------|-----|-------|
| Author an AI behavior contract | `"author an eval"` / `"model spec for..."` | eval-and-model-spec-author |
| Build a discovery rhythm | `"weekly discovery"` | discovery-cadence |
| Bootstrap company context from tools | `"onboarding accelerator"` | onboarding-accelerator |
| Catch failure modes before launch | `"run a pre-mortem"` | pre-mortem-runner |
| Critique a strategy | `"critique this strategy"` / `"red team this"` | strategy-critique |
| Decide what to focus on this week | `"LNO prioritize my week"` | lno-prioritizer |
| Design a measurement plan | `"build HEART"` / `"GSM for feature"` | hearts-gsm-builder |
| Design an A/B test | `"design an experiment"` | experiment-designer |
| Draft an email | `"draft an email to..."` | email-drafter |
| End-of-day wrap-up | `"end of day"` / `"EOD"` | end-of-day-rollup |
| Extract commitments from text | `"extract action items from..."` | action-item-extractor |
| Generate bold ideas | `"bold idea lab"` | bold-idea-lab |
| Generate a customer-headline narrative | `"draft a PR/FAQ"` | pr-faq-generator |
| Generate a customer journey | `"generate storyboard"` | storyboard-generator |
| Log a decision | `"log this decision"` | decision-logger |
| Log a win | `"log impact: [X]"` | impact-journal |
| Plan a customer advisory board | `"plan a CAB"` | cab-runner |
| Plan a phased launch | `"orchestrate launch"` | launch-orchestrator |
| Scan AI frontier | `"AI research scan"` | ai-research-scout |
| Scan competitive landscape | `"market intel"` | market-intelligence |
| Spec a new feature | `"create a PRD for..."` | prd-generator |
| Start the day | `"morning briefing"` | morning-briefing |
| Summarize a meeting | `"summarize this meeting"` | meeting-summarizer |
| Test before building | `"design an assumption test"` | assumption-test-designer |
| Write a strategy memo | `"draft strategy memo"` | product-strategy-memo |
| 8-attribute team review | `"team health check"` | team-health-monitor |

---

## Where to go deeper

- **`GUIDE.md` §4** — narrative description of each skill with MCP superpowers
- **`GUIDE.md` §5** — template narrative by category
- **`GUIDE.md` §6** — context-system explanation (auto vs. manual vs. compounding)
- **`GUIDE.md` §7** — full cadence detail with per-initiative triggers
- **`INDEX.md`** — file-location routing table
- **`New-PM-Onboarding-Playbook.md`** — Day 0 → Quarter 1 sequenced plan
- **Individual skill files** at `skills/<category>/<skill>.md` — full 8-section spec
