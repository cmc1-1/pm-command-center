# Skill: Assumption Test Designer

## Metadata
- name: assumption-test-designer
- trigger: "design an assumption test", "how do we test", "assumption test for", "cheap test for", "validate before we build"
- version: 1.0
- author: PM Command Center Team
- category: discovery

## Purpose
For any proposed solution, enumerate the assumptions it depends on, rank them by risk × cost-to-test, and design the cheapest possible test for the highest-risk assumption. Based on Teresa Torres's *Continuous Discovery Habits* and lean startup methodology.

The discipline: **most solutions fail on a small number of critical assumptions that could have been tested in hours — not months of build**. The purpose of this skill is to find that assumption and design the test before engineering is mobilized.

This is the upstream gate of `experiment-designer` (H5). Where H5 designs rigorous live experiments, this skill designs cheap pre-build validation.

## Inputs
- **Required**: A proposed solution or idea (rough is fine — often comes from `bold-idea-lab`, `pr-faq-generator`, or an OST solution node)
- **Optional**:
  - Specific assumption to test (if already identified)
  - Test budget constraint (hours available, cost ceiling)
  - Access to customers / users (are interviews available? fake-door traffic available?)
- **Auto-loaded context** (read silently):
  - `context/my/opportunity-solution-tree.md` — links test to OST assumption node
  - `context/users/personas.md` — who to recruit / target
  - `context/users/feedback-themes.md` — patterns that inform which assumptions to prioritize
  - `context/competitors/matrix.md` — competitive context
  - `context/company/product-overview.md` — what infra / surfaces are available for tests
  - `context/metrics/baselines.md` — current rates to anchor desirability estimates

## Process

### Step 1: Enumerate assumptions (divergent)

For the proposed solution, list **every assumption** across the five risk categories (Torres's framework):

| Category | What it asks | Example assumptions |
|----------|-------------|---------------------|
| **Desirability** | Will customers want it? | "Users will choose this over their current workaround"; "This solves a pain they'll actually pay to fix" |
| **Viability** | Does it work for the business? | "We can price this profitably"; "This doesn't cannibalize a better revenue stream"; "Sales can sell it" |
| **Feasibility** | Can we build it? | "Our architecture supports this"; "We can integrate with X"; "Latency will stay under Y" |
| **Usability** | Can users actually use it? | "Users can complete the workflow without training"; "It works for our least technical segment" |
| **Ethical** | Should we build it? | "No segment is harmed"; "Data handling is consented and minimal"; "The AI doesn't amplify bias" |

Aim for **8-15 assumptions total**, with at least 1 from each of the 5 categories. Missing a category is a red flag.

For each assumption, state:
- **Assumption**: "We believe that __________"
- **Implicit evidence** (if any) — what supports this belief today?
- **Disconfirming signal** — what would convince us this is wrong?

### Step 2: Rank by risk × cost-to-test

For each assumption, score on two axes:

| Axis | Scale | Meaning |
|------|-------|---------|
| **Risk** (if wrong) | 1-5 | How damaging is it if this assumption is false? 1 = minor rework; 5 = entire initiative fails |
| **Uncertainty** | 1-5 | How confident are we today? 1 = near-certain; 5 = no evidence either way |
| **Cost to test** | Hours | Rough time cost of a meaningful test |

**Priority score** = Risk × Uncertainty, then rank by priority score *ascending by cost-to-test* (cheapest high-risk test first).

Display as a sorted table:

```
## Assumption Rankings

| # | Assumption | Category | Risk | Uncertainty | Priority (R×U) | Cost (hrs) | Test priority |
|---|-----------|----------|------|-------------|---------------|-----------|--------------|
| 1 | [Assumption] | Desirability | 5 | 5 | 25 | 4 | 🥇 Test first |
| 2 | [Assumption] | Feasibility | 4 | 4 | 16 | 2 | 🥈 |
| 3 | ... | ... | ... | ... | ... | ... | 🥉 |
```

**Rule**: The top 3-5 assumptions get test designs. The rest get documented but deferred.

### Step 3: Design tests (for top 3-5 assumptions)

For each high-priority assumption, design the **cheapest test that would meaningfully disconfirm** it. Match test type to assumption category:

| Assumption type | Best-fit test methods |
|-----------------|----------------------|
| **Desirability — do users want this?** | Customer interviews (5-8 users); landing page / fake door test; smoke-test ad; preference A/B; sign-up-intent survey |
| **Desirability — will they pay?** | Concierge MVP with real payment; Letter of Intent / pre-order; pricing survey with van Westendorp; sales ride-along with pitch |
| **Feasibility — technical** | Technical spike (1-3 days); prototype against bottleneck; architectural review; proof-of-concept integration |
| **Feasibility — data** | Query against existing data to validate assumption; dry-run analysis on historic data |
| **Viability — business model** | Unit-economics spreadsheet; pricing interview; sales-team check ("could you sell this?") |
| **Viability — market** | Sizing analysis; analyst check; competitor teardown |
| **Usability** | Wizard-of-Oz test; clickable prototype with 5 users (Nielsen rule); paper prototype; card sort |
| **Usability — at scale** | Unmoderated usability test (e.g., UserTesting); task-success A/B |
| **Ethical** | Harm audit with diverse users; red-team exercise; consultation with trust/legal/privacy; fairness analysis on representative data |

For each test, generate a complete design:

```
### Test [N]: [Short name]
**Assumption being tested**: [Full assumption statement]
**Test method**: [From the table above]
**Design**:
1. [Step 1 — specific, actionable]
2. [Step 2]
3. [Step 3]

**Participants / sample**: [Who, how many, from where]
**Recruit source**: [Support tickets / NPS list / existing CAB / Craigslist / etc.]
**Success criteria (validates assumption)**: [Specific, measurable — e.g., "≥4 of 6 users complete task without prompting"]
**Failure criteria (invalidates assumption)**: [Specific, measurable]
**Inconclusive range**: [What would make us say "still unclear, need deeper test"]
**Cost**: [Hours, dollars, headcount needed]
**Duration**: [How long from design to results]
**Primary risk to test validity**: [What could make the test lie to us — e.g., volunteer bias, Hawthorne effect, non-representative sample]
```

### Step 4: Sequence the tests

Tests aren't independent — failing Test 1 may make Tests 2-3 irrelevant. Design a sequence that maximizes information per hour:

```
## Test Sequence

### Stage 1 (Week 1) — [Title]
Run: Test [N], Test [N]
Gate: If both fail, **STOP** and reconsider the solution

### Stage 2 (Week 2) — [Title] — only if Stage 1 passes
Run: Test [N]
Gate: If this fails, [specific pivot]

### Stage 3 (Week 3) — [Title] — only if Stage 2 passes
Run: Test [N]
Gate: This is the final pre-build validation
```

**Rule**: Every stage has an explicit gate. A test sequence without gates is a research project, not a validation pipeline.

### Step 5: Draft the assumption-test brief

```
# Assumption Test Brief: [Solution name]
**Author**: [From MY_PROFILE.md]
**Date**: [Today]
**Linked to**: [OST-10X solution node, PR/FAQ, PRD draft, idea source]
**Status**: Designed → Running → Complete → Archived

---

## Solution Under Test
[1-paragraph summary of what we're considering building]

## Assumptions Enumerated
[All assumptions — full list, ranked table]

## Test Designs (Top 3-5)
[Full design for each prioritized test]

## Test Sequence & Gates
[Staged plan with decision gates]

## Expected Outcome
**Best case**: [All critical assumptions validate → proceed to PR/FAQ / PRD]
**Likely case**: [Some validate, some require deeper test or pivot]
**Worst case**: [Critical assumption invalidates → kill, pivot, or rescope]

## Budget
- Total hours: [Sum]
- Total dollars (if any): [Sum]
- Timeline: [Weeks]
```

### Step 6: Save and integrate

1. Save to `artifacts/assumption-tests/YYYY-MM-DD-[solution-slug].md`
2. Create/update OST assumption-test nodes in `context/my/opportunity-solution-tree.md`:
   - Each tested assumption becomes an OST-2XX node
   - Link brief to node
   - Set status: Not started / Running / Complete
3. Offer:
   - "Add this to the weekly `discovery-cadence` plan?"
   - "When results come back, update the OST and decide build/pivot/kill?"
   - "If a test validates at scale, design a live experiment next via `experiment-designer`?"

## Tool Integrations (when MCP connected)

**Gong / Chorus** (if connected):
- Pull existing call recordings where this assumption was already raised — free evidence before a new test
- Recruit interview participants from recent call participants

**Productboard** (if connected):
- Cross-reference feature requests related to this solution — built-in desirability signal
- Recruit from customer accounts that requested adjacent features

**Amplitude / Mixpanel** (if connected):
- Query existing data to validate assumptions that can be answered with historic behavior
- Size the segment for sample recruiting

**Figma** (if connected):
- For usability tests, link to existing prototype files
- For Wizard-of-Oz tests, use existing design assets

**Typeform / Google Forms** (if connected):
- Create structured pricing / preference surveys in minutes

## Quality Checklist (self-verify before presenting)
- [ ] At least 8 assumptions enumerated, spanning all 5 categories
- [ ] No assumption is missing a disconfirming signal
- [ ] Rankings are honest — don't soft-pedal high-risk assumptions because they're inconvenient
- [ ] Top 3-5 assumptions have complete test designs
- [ ] Each test has explicit success / failure / inconclusive criteria
- [ ] Test sequencing includes gates (not just "run them in parallel")
- [ ] Validity risks are named for each test
- [ ] Budget is realistic — if total > 2 weeks for pre-build validation, the solution may be over-scoped
- [ ] OST linkage is explicit (existing node or new OST-2XX ID)

## What Makes This Skill Different From "Research Before We Build"
- Enumerates assumptions systematically (all 5 categories) rather than just the obvious ones
- Prioritizes by risk × uncertainty, not by what's easy
- Matches test method to assumption type (no defaulting to "let's do interviews")
- Sequences tests with gates, not in parallel
- Names validity risks — honest about what the test can and can't prove
- Kills solutions cheaply when critical assumptions fail pre-build

## Integration Points
- **Bold Idea Lab**: Primary upstream — surviving ideas from the 5-axis filter hand off here for validation
- **PR/FAQ Generator (H1)**: Assumptions surfaced in PR/FAQ drafting (especially in Internal FAQ) become test candidates here
- **Discovery Cadence (H3)**: Tests run during weekly discovery; results update OST
- **Opportunity Solution Tree**: Every designed test becomes an OST-2XX node
- **Experiment Designer (H5)**: When an assumption needs in-product testing at scale, hand off to H5
- **PRD Generator**: A PRD should reference which critical assumptions have been validated (and which remain open)
- **Pre-Mortem Runner (H2)**: Pre-mortem narratives often reveal untested assumptions — loops back to this skill
- **Decision Logger**: The build/pivot/kill decision after test results gets logged with reference to the evidence
