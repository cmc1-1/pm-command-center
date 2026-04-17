# Skill: Pre-Mortem Runner

## Metadata
- name: pre-mortem-runner
- trigger: "run a pre-mortem", "pre-mortem for", "what could go wrong", "failure-mode analysis", "red-team this launch"
- version: 1.0
- author: PM Command Center Team
- category: strategy

## Purpose
Walk through a structured "imagine this failed 6 months from now — why?" simulation to surface failure modes before launch. Based on Gary Klein's pre-mortem technique (widely adopted at Stripe and referenced repeatedly by Shreyas Doshi). The discipline: force the team to think from a *specific failed future*, not an abstract "what could go wrong" — the specificity is what generates honest answers.

This is not a risk register (passive list of risks with generic mitigations). It's an *active* failure-mode simulation that produces:
- Concrete failure narratives
- Clustering of failure modes by type
- Specific mitigations with owners
- Kill conditions (signals that would cause us to pull the plug)

## Inputs
- **Required**: What to pre-mortem (launch, strategy memo, experiment, major decision, bet)
- **Optional**:
  - Imagined failure timeframe (default: 6 months after launch)
  - Participants / perspectives to simulate (PM alone, or PM + eng + design + sales + CS)
  - Severity threshold ("only surface failures that would be career-defining" vs. "all failures worth mitigating")
- **Auto-loaded context** (read silently):
  - `context/company/product-overview.md` — scope of what can fail
  - `context/strategy/current-priorities.md` — strategic bets that share failure risk
  - `context/competitors/matrix.md` — competitive failure modes
  - `context/decisions/decision-log.md` — prior decisions that this depends on (cascading failure risk)
  - `context/metrics/north-star.md` — what "failure" means quantitatively
  - `context/users/feedback-themes.md` — unresolved user pain that could undermine adoption
  - `tracking/risks-and-blockers.md` — existing known risks (don't re-generate)
  - `artifacts/strategy-memos/` — if pre-morteming a strategy memo, read its stated bets and kill conditions

## Process

### Step 1: Anchor the failed future

Do NOT ask "what could go wrong?" — that produces vague lists. Instead, anchor to a specific failed state:

> "It's **[6 months from today's date]**. This **[launch / strategy / experiment / bet]** has been judged a failure. The team, leadership, and customers all agree: it didn't work. Your job is to write the *post-mortem of what happened*."

State the anchored date and the nature of the failure. Examples:
- "It's October 14, 2026. The [feature] launched in April but has been rolled back. Usage never exceeded 5% of target. Executive leadership declared it a failure in the Q3 review."
- "It's October 14, 2026. We pursued the [strategy]. Six months in, the guiding policy was abandoned because [the diagnosis turned out to be wrong / competitive response neutralized us / execution collapsed]."

### Step 2: Generate failure narratives (divergent)

Generate **8-12 concrete failure narratives**. Each must be:
- **Specific** — names the mechanism of failure, not just "it didn't work"
- **Plausible** — grounded in real risks, not fantasy
- **Diverse** — spans multiple failure categories (see Step 3)

Template for each narrative:

```
### Narrative [N]: [Short name]
**What happened**: [2-3 sentence story of the failure unfolding]
**Root cause**: [The underlying reason]
**When we could have caught it**: [Earliest warning sign]
**Category**: [See Step 3]
```

**Generation technique**: Rotate through perspectives:
- 🧑‍💻 **Engineering**: Technical debt exploded, dependency broke, scaling wall hit, incident cascaded
- 🎨 **Design/UX**: Users didn't understand it, accessibility failed, workflow broke an adjacent habit
- 💼 **Go-to-market**: Sales didn't sell it, marketing messaged it wrong, pricing was off, onboarding drop-off
- 💰 **Business/Financial**: Unit economics broke, CAC exploded, churn spiked, revenue didn't materialize
- 🏢 **Organizational**: Team attrition, ownership gap, priority shift mid-build, exec sponsorship lost
- 🏁 **Competitive**: Competitor moved faster/cheaper/better, commoditized the space, priced us out
- 👥 **Customer**: Segment was wrong, JTBD was misunderstood, power user need wasn't addressed, enterprise blocker
- 📊 **Measurement**: Metric was gamed, we measured the wrong thing, success criteria were never tested
- ⚖️ **Regulatory / Trust**: Compliance issue, privacy concern, ethical backlash, AI misuse

Push until there are at least 2 narratives from at least 5 different categories. If fewer than 5 categories show up, you're thinking too narrowly.

### Step 3: Cluster failure modes (convergent)

Group the narratives into 3-5 failure-mode clusters. Each cluster represents a *type* of risk, not an individual narrative. This is where pattern meets signal.

```
## Failure Mode Clusters

### Cluster 1: [Name — e.g., "Adoption collapse in target segment"]
**Contributing narratives**: [#2, #5, #9]
**Root-cause pattern**: [1 sentence on the shared mechanism]
**Severity**: [High / Medium / Low — based on impact if it occurs]
**Probability**: [High / Medium / Low — based on leading evidence]

### Cluster 2: [Name]
...
```

**Rule**: If every narrative is in its own cluster, you haven't clustered. Force patterns to emerge — failures usually share root causes.

### Step 4: Design mitigations

For each cluster (not each narrative — mitigating the pattern beats chasing each story), generate:

```
### Cluster [N]: [Name]
**Mitigation**:
- [Specific action — not "we'll monitor for this"; state who does what by when]
- [Leading indicator to watch — what would tell us this is starting to happen?]
- [Decision trigger — if leading indicator hits X, we do Y]

**Owner**: [Named person or team]
**Review cadence**: [How often this mitigation gets re-checked]
```

**Rule**: "Monitor" is not a mitigation. "Be aware of" is not a mitigation. A mitigation has an action, an owner, and a trigger.

### Step 5: Kill conditions (the hardest step)

Kill conditions are signals so severe that we'd *stop* the launch/strategy/bet, not just adjust it. Rumelt's discipline: if you can't name a kill condition, you can't test the decision.

```
## Kill Conditions

We will **halt or reverse** this [launch/strategy/bet] if any of the following occur:

1. **[Trigger 1]** — [Specific metric threshold or event] by [date]
2. **[Trigger 2]** — [Specific observable evidence] within [window]
3. **[Trigger 3]** — [Competitor move or market shift] of [magnitude]

**Review cadence for kill conditions**: [Weekly / Monthly]
**Escalation path**: [Who decides when a kill condition is met]
```

If the team can't agree on 2-3 kill conditions, the launch or strategy is not yet ready — flag this.

### Step 6: Summary artifact

```
# Pre-Mortem: [What we pre-morteme'd]
**Date**: [Today]
**Imagined failure date**: [6 months out]
**Participants / perspectives**: [List]

---

## Executive Summary (TL;DR)
[3-4 sentences: what we pre-morteme'd, the top 2 failure clusters, the top 2 mitigations, the key kill condition]

---

## Failed-Future Anchor
[The specific failure scenario used for the simulation]

## Failure Narratives
[All 8-12 narratives — kept for reference; full team can read these]

## Failure Mode Clusters
[3-5 clusters with severity × probability]

## Mitigations (by cluster)
[Mitigations with owners and triggers]

## Kill Conditions
[2-3 specific, testable conditions that would halt the initiative]

## Pre-Mortem Verdict
Based on the analysis:
- [ ] **Green light** — mitigations are adequate; proceed with monitoring
- [ ] **Yellow light** — proceed only after implementing [specific pre-requisite mitigations]
- [ ] **Red light** — do not proceed as currently scoped; the failure modes are too severe or too likely

[1-2 sentence rationale for the verdict]

## Open Questions
- [Questions the pre-mortem surfaced but couldn't resolve]
```

### Step 7: Save and integrate

1. Save to `artifacts/pre-mortems/YYYY-MM-DD-[subject-slug].md`
2. Update `tracking/risks-and-blockers.md` with the cluster-level risks (not the narrative-level ones)
3. If kill conditions were defined, add them to the relevant `context/decisions/decision-log.md` entry
4. If pre-morteming a strategy memo, append a "Pre-mortem findings" section to the memo
5. Offer follow-ups:
   - "Run `strategy-critique` on the parent strategy?"
   - "Update `context/my/opportunity-solution-tree.md` — do any failure narratives imply new assumptions to test?"
   - "Share a 1-page summary to the exec channel via `email-drafter`?"

## Tool Integrations (when MCP connected)

**Slack** (if connected):
- Offer to post the TL;DR + verdict to the product-leads channel for visibility
- Create a reminder to re-check kill conditions at the stated cadence

**Jira** (if connected):
- Create tickets for each mitigation with owners and due dates
- Link tickets to the parent epic

**Confluence** (if connected):
- Publish the full pre-mortem artifact to the team's strategy space
- Cross-link with the subject (PRD, strategy memo, experiment brief)

## Quality Checklist (self-verify before presenting)
- [ ] The failed-future anchor names a specific date and specific failure
- [ ] At least 8 narratives were generated
- [ ] Narratives span at least 5 of the 9 categories
- [ ] Clusters reflect real patterns, not just groupings of 1
- [ ] Each cluster has severity AND probability assessed
- [ ] Every mitigation has an owner, an action, and a leading indicator
- [ ] At least 2 kill conditions are specific and testable
- [ ] The verdict (green/yellow/red) is explicit, not hedged
- [ ] "Monitor" and "be aware" are not mitigations anywhere in the output

## What Makes This Skill Different From a Risk Register
- Anchors to a *specific* failed future, not abstract risk brainstorming
- Forces narrative (story form) before listing — narrative surfaces details lists hide
- Rotates through perspectives systematically (9 categories)
- Clusters root causes before proposing mitigations
- Requires kill conditions, not just mitigations
- Produces a verdict, not just a document

## Integration Points
- **Product Strategy Memo (H7)**: Primary upstream — pre-mortems strategy memos to stress-test bets and harden kill conditions
- **PRD Generator**: Can pre-mortem a PRD before committing engineering investment
- **PR/FAQ Generator (H1)**: Pre-mortem a PR/FAQ to find which part of the customer narrative is most fragile
- **Experiment Designer (H5)**: Pre-mortem an experiment design — what would cause the experiment itself to fail (SRM, instrumentation, contamination)?
- **Launch Orchestrator (M7)**: Pre-mortem every major launch before phase-gate go/no-go
- **Decision Logger**: Kill conditions from the pre-mortem get logged with the parent decision
- **Strategy Critique**: Complementary — critique finds structural weakness; pre-mortem finds failure modes
- **Bold Idea Lab**: Already uses a lightweight pre-mortem in Step 4; this skill is the deeper version for committed work
