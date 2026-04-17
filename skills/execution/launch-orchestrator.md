# Skill: Launch Orchestrator (Phase-Gated)

## Metadata
- name: launch-orchestrator
- trigger: "orchestrate launch", "launch plan", "phase-gate launch", "go-to-market plan", "GA rollout", "launch readiness"
- version: 1.0
- author: PM Command Center Team
- category: execution

## Purpose
Drive a product launch through explicit phase gates — **fishfood → teamfood → dogfood → closed beta → open beta → GA → launch** — rather than running a flat launch checklist. Each phase has entry criteria, exit criteria, observables, and a go/no-go decision. Inspired by Shopify's GSD (Get Sh*t Done) launch framework and Google's staged-rollout playbook.

**The core discipline**: **GA ≠ launch**. Shipping bits to users is an engineering event; launch is a customer-awareness event. This skill separates them and makes both intentional.

**Where this skill fits**: downstream of `prd-generator` (the PRD says *what* we're shipping), parallel to `pre-mortem-runner` (the pre-mortem finds failure modes before launch), upstream of `impact-journal` (a successful launch is a SHIP / METRIC entry).

This skill replaces the older flat `launch-checklist.md`. The phase-gated model is strictly more rigorous — every checklist item is now attached to a specific phase.

## Inputs
- **Required**: Product, feature, or initiative being launched (name + scope + target audience)
- **Optional**:
  - Target launch date (works backwards from here)
  - Launch tier (Tier 1 = company-wide announcement; Tier 2 = segment or channel; Tier 3 = silent / gradual rollout)
  - Prior PRD, PR/FAQ, or strategy memo references
  - Risk tolerance (consumer-grade iteration vs. enterprise-grade caution)
- **Auto-loaded context** (read silently):
  - `context/company/product-overview.md` — what the product is
  - `context/users/personas.md` — target audience for launch messaging
  - `context/users/feedback-themes.md` — known pain this launch addresses
  - `context/strategy/current-priorities.md` — strategic weight of this launch
  - `context/metrics/north-star.md` — what success looks like quantitatively
  - `context/team/stakeholder-map.md` — cross-functional partners
  - `context/decisions/decision-log.md` — decisions that shaped this launch
  - `tracking/current-sprint.md` — engineering readiness
  - `tracking/risks-and-blockers.md` — existing blockers
  - `artifacts/prd/` — the canonical PRD for this launch
  - `artifacts/prfaqs/` — the PR/FAQ (customer narrative)
  - `artifacts/pre-mortems/` — any pre-mortem findings to incorporate as gates

## Process

### Step 1: Classify the launch tier

Launches are not equal. The tier decides how many phases apply and how rigorous each gate is.

| Tier | What it is | Phases that apply | Announcement treatment |
|------|-----------|-------------------|------------------------|
| **Tier 1** | Flagship — changes the product story, moves the north star, press-worthy | Fishfood → Teamfood → Dogfood → Closed Beta → Open Beta → GA → Launch | Full PR + customer announcement + exec comms |
| **Tier 2** | Significant — meaningful to a segment or channel; worth proactive comms | Dogfood → Closed Beta → GA → Launch | Segment email / in-product announcement |
| **Tier 3** | Incremental — quality-of-life improvement, risk-managed rollout | Dogfood → GA | Silent / changelog only |

State the tier explicitly before proceeding. Push back if the tier seems inflated ("is this really a flagship, or a Tier 2 in a flagship costume?") — Tier 1 should be rare.

### Step 2: Define each phase with explicit gates

For each phase that applies, generate:

```
## Phase: [Name]
**Purpose**: [Why this phase exists — what it's designed to catch]
**Duration**: [Target window — e.g., 3-5 days]
**Audience**: [Exactly who sees it]
**Feature flag / access mechanism**: [How the cohort is scoped]

### Entry criteria (must be true to START this phase)
- [ ] [Specific, testable condition]
- [ ] [...]

### Work during this phase
- [ ] [Activity 1]
- [ ] [...]

### Observables (what we measure in this phase)
- [Metric 1 — definition + target]
- [Metric 2]
- [Qualitative signal — e.g., "No blocking bugs filed by audience"]

### Exit criteria (must be true to EXIT this phase)
- [ ] [Specific, testable condition]
- [ ] [...]

### Go/no-go decision
**Decider**: [Named person or forum]
**Decision window**: [When the go/no-go is made]
**No-go options**: Halt / Rollback / Extend phase / Scope down
```

**Defaults by phase** (scale these to the launch tier):

#### Fishfood (PM / designer / closest engineers eating their own fish)
- **Purpose**: Catch "this is embarrassing" before anyone else sees it
- **Duration**: 1-3 days
- **Audience**: 3-5 people, the core team
- **Exit**: No P0 bugs; PM willing to show this to their own skip-level

#### Teamfood (engineering + design team; broader product org)
- **Purpose**: Catch workflow breaks and "obvious to outsiders" issues
- **Duration**: 3-5 days
- **Audience**: 10-30 people, full team + adjacent teams
- **Exit**: No P0/P1 bugs; positive signal from ≥60% of testers; support team briefed

#### Dogfood (all employees)
- **Purpose**: Stress-test with real-usage patterns at small scale
- **Duration**: 1-2 weeks
- **Audience**: Whole company
- **Exit**: Crash-free rate ≥ 99.5%; internal NPS ≥ target; support runbook validated; legal/privacy sign-off

#### Closed beta (opt-in external, small cohort)
- **Purpose**: Prove it works for real users with known-cohort controls
- **Duration**: 2-4 weeks
- **Audience**: 50-500 opt-in users, ideally spanning segments
- **Exit**: Activation ≥ target; retention D7 ≥ target; qualitative feedback synthesized; SLO held

#### Open beta (broader opt-in, public-facing)
- **Purpose**: Stress-test at scale with self-selected users
- **Duration**: 4-6 weeks
- **Audience**: Self-service opt-in via waitlist / feature flag
- **Exit**: All metrics hold at 10× prior scale; no new failure modes; GA launch comms ready

#### GA (generally available — on by default for the target segment)
- **Purpose**: Ship to everyone in the target segment
- **Duration**: N/A — this is the steady-state default
- **Audience**: 100% of target segment
- **Exit**: *GA is not an exit phase* — it enters monitoring

#### Launch (customer-awareness event)
- **Purpose**: Drive awareness, adoption, and the narrative
- **Duration**: A day or a week
- **Audience**: Every customer touchpoint (email, in-product, blog, press, socials, sales)
- **Exit**: Announcement shipped; metrics tracking dashboard live; sales enablement delivered

**Rule**: GA and Launch can be decoupled. Shipping bits to users on Monday and announcing on Thursday is legitimate and often wise. State the gap intentionally, not accidentally.

### Step 3: The seven cross-functional readiness tracks

Each phase depends on readiness in seven domains. Missing any one is a no-go risk. Generate a RAG-status table:

| Track | What "ready" means for GA | Owner |
|-------|---------------------------|-------|
| **Product** | PRD shipped; acceptance criteria verified; scope frozen | PM |
| **Engineering** | Feature flag rollout plan; rollback procedure; SLO monitoring; on-call coverage | Tech Lead |
| **Design / UX** | Final polish; accessibility pass (WCAG AA minimum); empty / error / loading states | Design Lead |
| **Data / Measurement** | Instrumentation deployed; dashboards live; north-star metric trackable; guardrails monitored | Data / PM |
| **Support / CX** | Runbook delivered; common-issue playbook; training for support team; escalation path | Support Lead |
| **Go-to-market** | Positioning; messaging; pricing; sales enablement; partner / channel comms | Marketing / Sales |
| **Legal / Privacy / Compliance** | Terms-of-service review; privacy impact; data-handling audit; regulatory filings | Legal |

For each, color-code Red / Amber / Green with a one-line reason. Any Red blocks GA by default.

### Step 4: Comms plan

A launch without comms is just a deploy. Map every audience to a channel and a moment:

| Audience | Channel | Timing | Owner | Draft location |
|----------|---------|--------|-------|----------------|
| Existing customers | In-product + email | GA day | Marketing | [Link] |
| Prospects / general public | Blog post + social | Launch day (may lag GA) | Marketing | [Link] |
| Sales team | Enablement session + FAQ | 1 week before GA | Sales Enablement | [Link] |
| Support team | Runbook + training | 3 days before GA | Support Lead | [Link] |
| Partners / channel | Partner brief | 1 week before launch | BD / Partnerships | [Link] |
| Analysts / press | Analyst brief under embargo | 2-3 days before launch | Comms / PR | [Link] |
| Executive team | Pre-launch briefing | 1 week before launch | PM | [Link] |
| Investors (if applicable) | Investor update | Post-launch | Finance | [Link] |
| Internal — whole company | All-hands / #announcements | Launch day | PM + Comms | [Link] |

**Rule**: Every row has an owner and a draft location. "TBD" is a red flag that the launch is under-staffed.

### Step 5: Rollback plan (the gate nobody wants to design)

Before GA, define the rollback plan. This is Amazon's "two-way door" discipline applied to launches.

```
## Rollback Plan

### Trigger conditions (any one triggers a rollback decision)
- [ ] Crash-free rate drops below [X%] for [N] minutes
- [ ] North-star metric degrades by [Y%] over [window]
- [ ] Guardrail metric [name] breaches [threshold]
- [ ] Critical security / privacy incident
- [ ] Customer-reported P0 bug rate > [N] per [window]

### Rollback mechanism
- **How**: [Feature flag off / version pin / database migration reverse / DNS flip]
- **Time to rollback**: [Minutes from decision to restored state]
- **Who can trigger**: [Named role(s)]
- **Blast radius during rollback**: [What users experience during the flip]

### Decision protocol
- **Detection**: [How we see the trigger]
- **Assessment window**: [How long we observe before deciding]
- **Decision maker**: [Named person]
- **Escalation**: [Who gets paged]

### Post-rollback
- Incident retrospective within [N] business days
- PRD / pre-mortem updated with learnings
- Restart gate: what conditions must hold before we try again
```

### Step 6: Success criteria — what does "launched well" mean?

Tie the launch to the north-star metric and 2-3 leading indicators. Be specific about the window.

```
## Success Criteria (revisited at T+30, T+60, T+90)

### Primary (north-star movement)
- [Metric] moves from [baseline] to [target] by [date]

### Leading indicators (visible in first 2 weeks)
- [Activation rate] ≥ [X%]
- [Feature adoption among target segment] ≥ [Y%]
- [Support ticket rate] ≤ [Z per N users]

### Guardrails (must not degrade)
- Overall crash-free rate ≥ [X%]
- Core-flow completion rate held at baseline ± [Y%]
- Revenue per user held at baseline ± [Z%]

### Qualitative signals
- Sales reports [specific positive signal] from [N] customers
- Support tickets show [pattern of understanding] not [pattern of confusion]
- Analysts / press coverage reflects the intended narrative
```

### Step 7: Generate the launch brief

Pull everything into a single artifact:

```
# Launch Brief: [Product / Feature Name]
**PM owner**: [From MY_PROFILE.md]
**Launch tier**: [1 / 2 / 3]
**Target GA date**: [Date]
**Target Launch date**: [Date — may differ from GA]
**Status**: Planning → In Phase X → GA → Launched → Monitoring → Complete

---

## TL;DR (for exec comms)
[3-4 sentences: what, who it's for, why now, expected impact]

## Canonical References
- PRD: [link]
- PR/FAQ: [link]
- Strategy memo: [link]
- Pre-mortem: [link]
- Experiment brief (if applicable): [link]

## Phase Plan
[Phase-by-phase with entry/exit criteria from Step 2]

## Readiness Tracks (RAG status)
[Table from Step 3, updated at each phase gate]

## Comms Plan
[Full table from Step 4]

## Rollback Plan
[Section from Step 5]

## Success Criteria
[Section from Step 6]

## Open Risks & Blockers
[Pulled from tracking/risks-and-blockers.md + new risks surfaced]

## Phase-Gate Log
[Rolling log of each go/no-go decision — date, decider, outcome, rationale]
```

### Step 8: Save and integrate

1. Save to `artifacts/launches/YYYY-MM-DD-[launch-slug].md`
2. Update `tracking/current-sprint.md` with the active phase
3. Update `tracking/risks-and-blockers.md` with any new risks
4. Add a decision log entry at each phase gate: `context/decisions/decision-log.md`
5. After GA + Launch complete:
   - Log an impact-journal entry (SHIP + likely METRIC)
   - Run a retrospective — feed learnings into `context/my/lessons-learned.md`
   - Update `context/my/opportunity-solution-tree.md` — solutions shipped move to "Validated" status
6. Offer follow-ups:
   - "Run `pre-mortem-runner` before Closed Beta to stress-test the plan?"
   - "Run `experiment-designer` if GA is behind a holdout?"
   - "Draft the internal announcement via `email-drafter` and the exec update via `exec-update-writer`?"
   - "If this launch moved a metric, run `hearts-gsm-builder` to formalize the measurement structure?"

## Tool Integrations (when MCP connected)

**Jira / Linear** (if connected):
- Create an epic per phase; sub-tasks for each readiness track
- Auto-update phase status as sub-tasks close

**Statuspage / incident-management** (if connected):
- Pre-stage an incident template for rollback scenarios
- Link the rollback plan so on-call can execute without hunting

**Slack** (if connected):
- Create a `#launch-[name]` channel; post phase-gate decisions automatically
- Pin the launch brief to the channel

**Figma** (if connected):
- Link the final design files to the Design readiness track

**Analytics (Amplitude / Mixpanel / etc.)** (if connected):
- Verify instrumentation is live for north-star + guardrail metrics before GA
- Auto-generate the monitoring dashboard link for the brief

**Calendar** (if connected):
- Block the go/no-go decision windows on the team's calendar
- Schedule the retrospective at T+14

## Quality Checklist (self-verify)
- [ ] Launch tier is stated and justified
- [ ] Every applicable phase has explicit entry + exit criteria
- [ ] Every phase has a named decider for go/no-go
- [ ] All seven readiness tracks have an owner and RAG status
- [ ] Comms plan has no "TBD" owners
- [ ] Rollback plan exists with trigger conditions, mechanism, and decision maker
- [ ] Success criteria include primary, leading, guardrail, and qualitative signals
- [ ] GA date and Launch date are distinct (or the same, stated intentionally)
- [ ] Brief links to PRD, PR/FAQ, pre-mortem (if they exist)

## What Makes This Skill Different From a Launch Checklist
- Phase-gated with explicit entry/exit criteria — not a flat list of tasks
- Separates GA (engineering event) from Launch (customer-awareness event)
- Seven named readiness tracks with owners — not "is marketing ready?" hand-waving
- Rollback plan is designed before GA, not improvised during an incident
- Launch tier scales the rigor — Tier 3 doesn't carry Tier 1 overhead
- Phase-gate log creates an audit trail of every go/no-go decision

## Integration Points
- **PRD Generator**: The PRD is the canonical scope for this launch
- **PR/FAQ Generator (H1)**: The PR/FAQ is the customer narrative this launch delivers
- **Product Strategy Memo (H7)**: The strategy memo sets the weight of this launch (Tier 1 vs 3)
- **Pre-Mortem Runner (H2)**: Pre-mortem informs Step 5 (rollback) and Step 3 (risks per track)
- **Experiment Designer (H5)**: If GA is gated by an experiment, experiment-designer outputs feed Phase plans
- **Assumption Test Designer (H4)**: Assumptions tested pre-build reduce launch risk — track which validated
- **Exec Update Writer**: Every phase gate is a loggable exec update
- **Email Drafter**: Comms-plan audiences each get a drafted message
- **Decision Logger**: Every go/no-go is a decision log entry
- **Impact Journal**: Successful launch = SHIP / METRIC entry; failed launch = RESCUE / PROCESS lesson
- **HEART/GSM Builder (M9)**: Formalizes the success-criteria metrics for ongoing monitoring
- **Team Health Monitor (M3)**: A botched launch is a "Proof of Progress" signal worth inspecting quarterly
