# Skill: Experiment Designer

## Metadata
- name: experiment-designer
- trigger: "design an experiment", "design an A/B test", "experiment plan", "MDE for", "sample size for"
- version: 1.0
- author: PM Command Center Team
- category: data

## Purpose
Turn a PM hypothesis into a statistically rigorous experiment plan before any code ships. Outputs: hypothesis statement, primary metric + guardrail metrics, MDE (minimum detectable effect), sample size, runtime estimate, pre-registered analysis plan, stop conditions, and variant definitions. Supports A/B, holdout, switchback, and diff-in-diff patterns. Inspired by Reforge's growth experimentation practice and modern experimentation literature (Statsig, Eppo, Microsoft's controlled experimentation guidelines).

The discipline: **pre-register** the analysis plan so results can't be p-hacked after the fact.

## Inputs
- **Required**: Hypothesis to test (even a rough version — the skill sharpens it)
- **Optional**:
  - Primary metric (otherwise inferred from context)
  - Available traffic / sample size ceiling
  - Runtime constraint (e.g., "must conclude by end of quarter")
  - Experiment type (A/B default, or holdout / switchback / diff-in-diff)
- **Auto-loaded context**:
  - `context/metrics/north-star.md` — to select primary metric that ladders up
  - `context/metrics/baselines.md` — current rates for power calculation
  - `context/users/personas.md` — to reason about segment eligibility
  - `context/strategy/current-priorities.md` — strategic relevance check
  - `context/my/opportunity-solution-tree.md` — link experiment to OST assumption test
  - `context/decisions/decision-log.md` — prior experiment decisions that constrain this one

## Process

### Step 1: Sharpen the hypothesis

Convert the user's input to the standard hypothesis structure. Push back if any element is missing or vague.

```
**Hypothesis**: We believe that [change to treatment group]
for [target audience / segment]
will result in [expected directional change to primary metric]
because [causal mechanism — why we think this will work].

We'll know this is true when [primary metric moves by at least X over Y days
with ≥95% confidence] without harming [guardrail metrics].
```

**Reject the hypothesis if**:
- The causal mechanism is absent ("we think users will like it" is not a mechanism)
- The direction is unspecified ("might change conversion" — which way?)
- The audience is everyone (usually a mistake — segment)
- No guardrail metrics are named (protection against "win by breaking something else")

### Step 2: Define metrics

```
## Metrics

### Primary (the one we're judging this on)
| Metric | Definition | Baseline | Target lift | Source |
|--------|-----------|----------|-------------|--------|
| [Name] | [How it's calculated] | [Current rate with date] | [Relative or absolute] | [Dashboard/tool] |

### Secondary (richer understanding, not judgment)
| Metric | Why it matters |
|--------|---------------|
| [Name] | [Hypothesis about how it moves] |

### Guardrails (must NOT regress)
| Metric | Definition | Acceptable bound |
|--------|-----------|-----------------|
| [Name] | [How it's calculated] | [e.g., "no worse than -1% relative"] |

### Counter-metrics (things that often get worse when primary improves)
| Metric | Why we're watching it |
|--------|----------------------|
| [Name] | [Mechanism] |
```

**Rules:**
- Exactly ONE primary metric. If you have two, rank them and pick one.
- Primary must ladder to the north star (reference `context/metrics/north-star.md`)
- At least 2 guardrails (e.g., latency, error rate, revenue, retention)
- Counter-metrics are the "what could go wrong" list — separate from guardrails

### Step 3: Calculate MDE, sample size, and runtime

Work through the power analysis. If the user hasn't provided numbers, estimate with stated assumptions and flag them for validation.

**Inputs to the calculation:**
- Baseline conversion rate (from `context/metrics/baselines.md`)
- Desired lift (relative % change you want to detect — the MDE)
- Significance level (α, typically 0.05)
- Statistical power (1-β, typically 0.8)
- Ratio of variants (typically 50/50)
- Daily traffic to the surface under test

**Output:**
```
## Power & Runtime

| Input | Value | Source |
|-------|-------|--------|
| Baseline primary metric | X% | `context/metrics/baselines.md` |
| Desired MDE (relative) | Y% | Business judgment — [rationale] |
| Significance level (α) | 0.05 | Standard |
| Power (1-β) | 0.80 | Standard |
| Variant split | 50/50 | [or other with rationale] |
| Daily eligible traffic | N | [Dashboard/tool] |

**Sample size needed per variant**: [N]
**Estimated runtime**: [N days]
**Earliest possible peek**: [Date — only for sequential testing, otherwise do not peek]
```

**Flag warnings**:
- ⚠️ If MDE < 2% relative, note: "Small MDE — long runtime or you may not detect. Consider whether a smaller effect is still business-meaningful."
- ⚠️ If runtime > 8 weeks, note: "Long runtime. Consider reducing MDE expectation, increasing traffic, or re-scoping."
- ⚠️ If daily traffic × runtime < needed sample: "Insufficient traffic. This experiment cannot run as designed."

### Step 4: Choose the experiment type

| Type | When to use | Trade-offs |
|------|-------------|-----------|
| **A/B (concurrent)** | Default. Independent users, instant effects. | Assumes no spillover between users. |
| **Holdout** | Measuring cumulative impact of many changes over time. | Longer runtime; needs stable holdout group. |
| **Switchback** | When users can't be independently randomized (two-sided marketplaces, network effects). | Higher variance; more complex analysis. |
| **Diff-in-diff** | When randomization isn't possible; using a comparable non-treated group. | Requires parallel-trends assumption to hold; less causal power than randomized. |
| **Interleaved / multi-armed** | Ranking problems (search, feed). | Specialized; usually needs platform support. |

Document the choice with rationale:
```
## Experiment Type: [Choice]
**Why this type**: [1-2 lines tied to the constraint that ruled out simpler options]
**Key assumption this type requires**: [e.g., "User independence: treatment for user A does not leak to user B"]
```

### Step 5: Define variants & randomization

```
## Variants

### Control (V0)
[Exact description of current experience]

### Treatment (V1)
[Exact description of changed experience]
[If multi-variant: add V2, V3...]

## Randomization
- **Unit of randomization**: [user | session | account | device]
- **Hashing**: [Stable salt so users don't flip between variants]
- **Eligibility filters**: [Who is IN / OUT of the experiment and why]
- **Exclusion rules**: [Internal users, employees, specific plans, etc.]
```

### Step 6: Pre-register the analysis plan

This is the discipline step — write HOW you'll analyze BEFORE running.

```
## Analysis Plan (Pre-Registered)

### Success definition
We will declare the experiment a win if:
- Primary metric lift ≥ [X%] with p-value ≤ 0.05
- AND no guardrail metric regresses beyond its bound
- AND the effect is consistent across [N] pre-specified segments

### Segments to analyze (pre-registered)
1. [Segment 1 — e.g., new users vs. returning]
2. [Segment 2 — e.g., by plan tier]
3. [Segment 3 — e.g., by geography]

Analyzing more segments after the fact is p-hacking. If a segment isn't listed here, results on that segment are exploratory, not confirmatory.

### Statistical method
- Test: [Two-sample t-test / chi-squared / CUPED-adjusted / bootstrap]
- Multiple comparison correction: [Bonferroni / Holm / none + rationale]
- Variance reduction: [CUPED using pre-period metric, if applicable]

### Stop conditions (pre-specified)
- **Early win** (only if using sequential testing methodology): [Criteria]
- **Early kill**: Guardrail regression beyond [bound] at [confidence level]
- **Natural end**: At [date] regardless of status

### Peek policy
[Default: no peeking. For sequential tests: state the peek schedule and adjusted α.]
```

### Step 7: Risk & sanity checks

```
## Risk Checklist
- [ ] Sample Ratio Mismatch (SRM) check defined — how will we detect randomization bugs?
- [ ] Pre-period A/A comparison run — do control and treatment look identical before the change?
- [ ] Instrumentation verified end-to-end — can we trust the primary metric?
- [ ] Launch/treatment applied identically across variants except for the change under test
- [ ] No other experiments concurrent on the same surface that would confound results
- [ ] Rollback plan if guardrail trips
```

### Step 8: Draft the Experiment Brief

Assemble all sections above into a single artifact. Add meta:

```
# Experiment: [Name]
- Owner: [From MY_PROFILE.md]
- Trio: PM [Name] | Design [Name] | Eng [Name] | Data [Name]
- Status: Design → Review → Running → Analyzed → Archived
- OST link: [OST-2XX assumption test, if applicable]
- Decision link: [D-NNN in decision-log if this implements a strategic decision]
- Start date: [Planned]
- End date: [Planned]
```

### Step 9: Save and integrate

1. Save to `artifacts/experiments/YYYY-MM-DD-[experiment-slug].md`
2. If tied to an OST assumption test, update `context/my/opportunity-solution-tree.md` status
3. Offer:
   - "Run `strategy-critique` on the experiment design?"
   - "Run `pre-mortem-runner` (once built) — what could go wrong?"
   - "Log the decision to run this experiment to `decision-logger`?"
   - "When results come back, summarize into an impact-journal entry?"

## Tool Integrations (when MCP connected)

**Statsig / Eppo / Optimizely / LaunchDarkly** (if connected):
- Pull current allocation ceiling on the surface
- Check for concurrent experiments on the same users/surface
- Draft experiment configuration inside the tool

**Amplitude / Mixpanel** (if connected):
- Pull baseline rates automatically for the power calculation
- Identify available segments and their sizes

**Jira** (if connected):
- Create an epic for the experiment with sub-tasks for: instrumentation, variant build, launch, analysis

## Quality Checklist (self-verify before presenting)
- [ ] Hypothesis has all 4 elements: change, audience, expected direction, causal mechanism
- [ ] Exactly one primary metric, tied to the north star
- [ ] At least 2 guardrail metrics with acceptable bounds stated
- [ ] MDE is reasoned (not a round number without justification)
- [ ] Sample size is calculated, not assumed
- [ ] Runtime is feasible given daily traffic
- [ ] Experiment type is justified (not defaulted)
- [ ] Analysis plan is pre-registered, including segments
- [ ] Stop conditions are explicit
- [ ] SRM and A/A checks are in the risk checklist
- [ ] Rollback plan exists
- [ ] Linked to OST assumption test (if one exists)

## What Makes This Skill Different From "Let's A/B Test It"
- Forces the 4-part hypothesis before any design
- Calculates sample size — no "let's run it for a week and see"
- Separates primary / secondary / guardrail / counter-metrics
- Pre-registers the analysis plan — no p-hacking
- Names experiment type (A/B isn't always right)
- Builds in SRM and A/A sanity checks
- Links to OST assumption-test nodes (discovery ↔ delivery)

## Integration Points
- **Assumption Test Designer (H4)**: When an assumption is "desirability, needs a live test at scale", the assumption-test-designer hands off here
- **Opportunity Solution Tree**: Experiments link to OST-2XX assumption test nodes; results update node status
- **PRD Generator**: PRDs with a validated success metric often require this skill to design the measurement experiment
- **Decision Logger**: The decision to run, extend, or kill an experiment gets logged
- **Impact Journal**: Shipping a winning experiment becomes a METRIC impact entry with the lift quantified
- **North Star Metric Tree (M1)**: Primary metric selection references the tree to ensure laddering
- **Product Strategy Memo (H7)**: Strategy memos' bets often become experiment hypotheses
