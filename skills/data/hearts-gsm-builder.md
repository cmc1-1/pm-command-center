# Skill: HEART / GSM Builder

## Metadata
- name: hearts-gsm-builder
- trigger: "build HEART", "HEART/GSM", "HEARTS framework", "measure UX outcomes", "GSM for feature", "feature success metrics"
- version: 1.0
- author: PM Command Center Team
- category: data

## Purpose
For a feature or product area, build a structured **HEART × GSM** measurement plan:

- **HEART** (Google's UX metrics framework): five outcome categories — **H**appiness, **E**ngagement, **A**doption, **R**etention, **T**ask success
- **GSM** (Goals → Signals → Metrics): for each HEART category, define the goal, the behavioral signal that would indicate progress, and the metric(s) that operationalize the signal

**The principle**: teams reach for adoption metrics by default. HEART forces deliberate choice across five dimensions — and GSM forces each chosen dimension to be grounded in a real signal before it becomes a metric. This prevents the two common failures: (1) over-counting outputs (DAU, clicks) instead of outcomes, and (2) measuring everything equally instead of the 2-3 metrics that actually indicate the goal.

This skill complements `north-star-metric-tree` (which focuses on the single organization-level NSM and its input tree) and `experiment-designer` (which operationalizes metrics for an A/B). HEART/GSM is the feature / surface-level measurement plan.

## Inputs
- **Required**: Feature, surface, or product area to build measurement for
- **Optional**:
  - Existing metrics already tracked (to avoid duplication or to critique)
  - Time horizon (next sprint / this quarter / long-run)
  - Segment focus (all users / new users / power users / specific persona)
  - Linked PRD or launch brief
- **Auto-loaded context** (read silently):
  - `context/metrics/north-star.md` — NSM that HEART metrics should ladder to
  - `context/metrics/baselines.md` — current metric baselines
  - `context/company/product-overview.md` — product scope
  - `context/users/personas.md` — who the feature serves
  - `context/users/feedback-themes.md` — pain themes (often Happiness signals)
  - `artifacts/prd/` — PRD for this feature, if exists
  - `artifacts/prfaqs/` — PR/FAQ for customer-level promise
  - `artifacts/storyboards/` — if a storyboard exists, emotional arc informs Happiness

## Process

### Step 1: Establish the feature's goal at the top

Before picking categories or metrics, state the goal in one sentence. If you can't, the measurement plan will be confused.

```
## Feature / Surface: [Name]

**Goal (one sentence)**: [What this feature enables for what user, with what outcome]

**Laddering to NSM**: [Which input metric of the north star does this ladder to?]

**Time horizon**: [Sprint / quarter / year]

**Segment in focus**: [All users / specific segment]
```

### Step 2: Choose which HEART categories apply

**Not every feature deserves metrics in every HEART category**. Forcing all five is a red flag — it produces a 15-metric dashboard no one reads.

Guidance:

| HEART category | When to include | When to skip |
|----------------|----------------|--------------|
| **Happiness** (subjective attitude / satisfaction) | Feature aims to change how users *feel* about the product; NPS / CSAT moves expected | Pure infrastructure with no UX surface |
| **Engagement** (depth of use in a session) | Feature increases what users do or how deeply they engage | Transactional features where "less time is more" |
| **Adoption** (new users / new user of this feature) | Net-new feature or new target segment | Already-ubiquitous features |
| **Retention** (users returning) | Feature aims to pull users back / reduce churn | Single-use features (e.g., onboarding steps) |
| **Task success** (efficiency / accuracy / completion) | Feature is a workflow or task flow | Purely exploratory / browsing features |

State which 2-4 categories apply and **explicitly name the ones you're skipping**, with the reason. "We're not measuring Engagement because this is a quick-task feature and long engagement would be a bad signal" is the kind of reasoning that prevents vanity metrics.

### Step 3: For each included category, run the GSM triple

For each HEART category you're including, produce:

```
### HEART: [Category]

**Goal** (outcome-level): [What we want users to experience or achieve — in behavioral terms, not product terms. "Users feel confident completing X" NOT "users use feature Y"]

**Signal** (behavioral evidence): [What observable behavior would indicate the goal is being met. Must be something that can be detected in logs, surveys, or session data. "A user who completes X without support tickets" is a signal; "users are happy" is not.]

**Metric(s)** (operationalization): [The actual numeric measure that captures the signal]

| Metric | Definition | Measurement method | Baseline | Target | Cadence |
|--------|-----------|-------------------|----------|--------|---------|
| [Name] | [Precise definition — what goes in numerator, denominator, time window] | [Event log / survey / inferred] | [Current #] | [Target by when] | [Daily / weekly / monthly] |
```

**Rules**:
- **Goal** is outcome-phrased. "Reduce time-to-complete" is a goal. "Ship the new editor" is not.
- **Signal** is behavioral and observable. "Users love it" is not a signal. "Users complete the flow without reopening Help" is a signal.
- **Metric** must have a precise numerator, denominator, time window, and unit. "Engagement" is not a metric; "sessions per active user per week, 7-day rolling" is.

#### Good vs. bad GSM examples

✅ Good (Happiness for a new search feature):
- **Goal**: Users feel the new search helps them find what they need faster than the old search.
- **Signal**: Users rate the search experience ≥ 4/5 on post-search survey; fewer "I couldn't find what I wanted" support tickets.
- **Metric 1**: Post-search CSAT, weekly avg, target ≥ 4.2/5 (baseline 3.6)
- **Metric 2**: "Couldn't find X" ticket rate per 1K searches, weekly, target ≤ 0.8 (baseline 2.1)

❌ Bad:
- **Goal**: Increase search usage.
- **Signal**: More searches happen.
- **Metric**: Total searches per day.

(The bad example measures an *output* — more searches could mean the search is worse and users are retrying, not better.)

### Step 4: Counter-metrics (the overlooked step)

For each HEART category included, name at least one **counter-metric**: a metric that would move in the wrong direction if we optimized the primary metric too hard.

```
### Counter-metrics

| Primary metric | Counter-metric | Why it matters |
|----------------|---------------|----------------|
| Time-on-feature (Engagement) | Task-completion rate (Task success) | If users spend more time but complete less, we're confusing time for value |
| Feature-adoption rate | Overall session quality | If adoption rises but users are frustrated (Happiness drops), we may be force-routing |
| Search CSAT | Search volume per user | If CSAT rises but searches drop, the feature may be hidden or users gave up |
```

**Rule**: Every HEART category gets at least one counter-metric. A single-sided metric plan produces Goodhart's-Law-style failure.

### Step 5: Instrumentation plan

A measurement plan without instrumentation is a wish. For every metric, specify:

```
## Instrumentation Plan

| Metric | Event name / survey | Captured by | Fires when | Dependency / blocker |
|--------|---------------------|-------------|-----------|---------------------|
| [Metric] | [event_name or "survey-X"] | [System — web, mobile, server, backend, etc.] | [Specific trigger] | [What needs to ship for this to work] |
```

**Rule**: If any primary metric's instrumentation is "not yet built", that's a pre-launch blocker, not a post-launch observation.

### Step 6: Reporting & review cadence

Metrics without a review cadence become shelfware.

```
## Review Cadence

| Metric tier | Who reviews | Cadence | Format |
|-------------|-------------|---------|--------|
| Primary HEART metrics | PM + trio | Weekly | Dashboard + 10-min sync |
| Counter-metrics | PM + TL + Data | Weekly | Same dashboard |
| Segment cuts | PM + Data | Bi-weekly | Drilldown review |
| North-star laddering | PM + leadership | Monthly | Monthly business review |

### Decision triggers
- [Metric] stays flat at [threshold] for [window] → investigate / re-design
- [Metric] moves in wrong direction by [Δ] for [window] → pause and diagnose
- [Counter-metric] breaches [threshold] → roll back primary optimization
```

### Step 7: Generate the measurement plan artifact

```
# HEART / GSM Plan: [Feature / Surface]
**Author**: [From MY_PROFILE.md]
**Date**: [Today]
**Linked to**: [PRD, PR/FAQ, launch brief, OST solution node]
**Status**: Draft → Instrumented → Live → Reviewed

---

## Feature Goal & Segment
[Step 1]

## HEART Categories Included (and Skipped)
| Category | Included? | Rationale |
|----------|-----------|-----------|
| Happiness | [Y/N] | [Why include or skip] |
| Engagement | [Y/N] | [...] |
| Adoption | [Y/N] | [...] |
| Retention | [Y/N] | [...] |
| Task Success | [Y/N] | [...] |

## GSM per Category
[Full expansion per Step 3 for each included category]

## Counter-Metrics
[Table from Step 4]

## Instrumentation Plan
[Table from Step 5]

## Review Cadence & Decision Triggers
[From Step 6]

## Laddering to North Star
[How the primary metrics here roll up to the NSM input metric from context/metrics/north-star.md]

## Open Risks for Measurement Validity
[E.g., survey response bias, observer effects, small-sample noise in early weeks, attribution confounds]
```

### Step 8: Save and integrate

1. Save to `artifacts/measurement-plans/YYYY-MM-DD-[feature-slug]-heart-gsm.md`
2. If the plan proposes new metrics not in `context/metrics/baselines.md`, add them with initial targets
3. If PRD exists, append or link this plan to the PRD's "Success Metrics" section
4. Update `context/metrics/north-star.md` — confirm laddering is visible in the NSM input tree
5. Create tickets for any instrumentation that's a blocker (Jira integration, if available)
6. Offer follow-ups:
   - "Run `experiment-designer` if we want to A/B test the feature rollout?"
   - "Update the PRD's success criteria section to match this plan?"
   - "Add this plan's review cadence to the weekly product review agenda?"
   - "If Happiness is a category, draft the survey questions via this skill's extension?"
   - "Log this as an impact entry? (Authoring a rigorous measurement plan = TECHNICAL DEPTH / PROCESS)"

## Tool Integrations (when MCP connected)

**Amplitude / Mixpanel / Heap** (if connected):
- Draft the event-taxonomy definitions needed for the instrumentation plan
- Verify that proposed events don't duplicate existing ones
- Pull baseline values from historical data

**Statsig / LaunchDarkly / Eppo** (if connected):
- Tag metrics as experiment-ready vs. observational
- Create guardrail-metric templates

**Looker / Tableau / Metabase** (if connected):
- Draft the dashboard skeleton for primary + counter metrics
- Schedule the weekly review report

**Typeform / Qualtrics / in-product survey** (if connected):
- Draft survey questions for Happiness metrics
- Schedule delivery cadence

## Quality Checklist (self-verify)
- [ ] Feature goal is stated in one sentence in behavioral / outcome terms
- [ ] HEART categories are deliberately included or skipped — not all five by default
- [ ] For each included category, Goal → Signal → Metric chain is complete
- [ ] Every metric has numerator, denominator, time window, unit, method, baseline, target
- [ ] At least one counter-metric per primary metric
- [ ] Instrumentation plan identifies blockers before launch
- [ ] Review cadence and decision triggers are specific
- [ ] Laddering to the NSM is visible
- [ ] No "Engagement" as a standalone metric — it's a category, not a number
- [ ] No "DAU" or "total clicks" as a primary outcome metric — outputs not outcomes

## What Makes This Skill Different From "Define Metrics for This Feature"
- Framework-driven: HEART forces consideration across 5 dimensions, not defaulting to adoption
- Deliberately skips categories that don't apply — prevents vanity dashboards
- Forces Goal → Signal → Metric chain — signals ground metrics in real behavior
- Counter-metrics are required, not optional — prevents Goodhart's Law failures
- Instrumentation blockers surface pre-launch, not post-launch
- Review cadence and decision triggers turn metrics into action, not wallpaper
- Ladders up to NSM — features don't have private metrics disconnected from strategy

## Integration Points
- **North Star Metric Tree (M1)**: HEART primary metrics should ladder to an NSM input metric; if they don't, either the feature or the tree needs revisiting
- **PRD Generator**: The "Success Metrics" section of the PRD references this plan — don't duplicate
- **PR/FAQ Generator (H1)**: The customer promise in the PR/FAQ should match the Happiness / Task-Success goals
- **Experiment Designer (H5)**: When HEART metrics become experiment metrics, H5 formalizes the MDE / sample size / guardrails
- **Launch Orchestrator (M7)**: Pre-GA gate requires instrumentation live — this plan is what gets verified at that gate
- **Storyboard Generator (M5)**: Storyboard emotional arc is qualitative evidence for Happiness; HEART is the quantitative side
- **Team Health Monitor (M3)**: "Value & Metrics" attribute score improves when every feature has a HEART plan
- **Decision Logger**: Decisions that hinge on a metric should reference the HEART plan that defines the metric
- **Impact Journal**: Shipping a rigorous measurement plan = TECHNICAL DEPTH / PROCESS entry; seeing a metric move after launch = METRIC entry
