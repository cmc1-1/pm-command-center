# North Star Metric Tree: [Product / Team / Initiative]

> **Purpose**: North star metric decomposed into input metrics and counter-metrics — the causal map from team actions to business outcomes.
> **When to use**: Once per team per year minimum; reconfirm after major strategy shifts. Built by `hearts-gsm-builder` or authored directly.
> **Audience**: You, your team, cross-functional peers, and leadership reviewing whether the team is measuring what matters.

**Author:** [Your name]
**Date:** [Date]
**Status:** [Draft / Reviewed / Adopted / Deprecated]
**Review cadence:** Quarterly minimum; reconfirm after any major strategy shift

---

## Use This Template

Inspired by John Cutler's North Star framework and Amplitude's NSM Playbook.

A **North Star Metric (NSM)** is the one measure of value your product delivers. It's:
- **One metric**, not a scorecard — forcing clarity
- **One level out of reach** — you can't move it directly; only input metrics you control can
- **Leading of business outcomes**, not lagging (revenue is an *outcome*, usually not a good NSM)
- **Durable across roadmap changes** — if it changes every quarter, it's not a NSM

The tree below connects the NSM to input metrics (what you can actually move) and to outcome metrics (what the business ultimately cares about).

---

## 1. The North Star Metric

### Statement
**[NSM Name]: [1-sentence definition]**

Example phrasing:
- *"Weekly active learners who complete ≥1 lesson"* (Duolingo-style)
- *"Nights booked"* (Airbnb)
- *"Documents edited collaboratively per week"* (Notion-style)

### Why this is the NSM

| Test | Answer |
|------|--------|
| **Does it capture customer value?** | [How — 1-2 sentences] |
| **Is it durable?** | [Will this still be the right metric in 2 years?] |
| **Is it one level out of reach?** | [Confirm: you can't move this directly; only input metrics move it] |
| **Is it leading, not lagging?** | [Does it precede revenue, retention, expansion?] |
| **Is it measurable today?** | [Yes — baseline known / No — instrumentation needed] |

### Current baseline and target

| Period | Value | Note |
|--------|-------|------|
| [T-2 quarters] | [Value] | [Context] |
| [T-1 quarter] | [Value] | [Context] |
| **Today** | **[Value]** | **[Current state]** |
| Target (next quarter) | [Value] | [Plan] |
| Target (next year) | [Value] | [Ambition] |

---

## 2. Input Metrics (the 3–5 you can actually move)

The NSM is a lagging composite. Input metrics are the levers you *can* pull. Each has:
- A **causal hypothesis** connecting it to the NSM
- A **baseline**
- An **owner**
- A **moving average** (rolling 4-week or similar) to smooth noise

```
                    [NSM]
                      ▲
        ┌─────────────┼─────────────┐
        │             │             │
   [Input 1]     [Input 2]     [Input 3]  ...
```

| # | Input metric | Definition | Causal hypothesis | Baseline | Target | MA (4wk) | Owner |
|---|-------------|-----------|------------------|----------|--------|---------|-------|
| 1 | [Name] | [How calculated] | [How moving this moves the NSM] | [Value] | [Value] | [Value] | [Team/person] |
| 2 | [Name] | [How calculated] | [Hypothesis] | [Value] | [Value] | [Value] | [Team/person] |
| 3 | [Name] | [How calculated] | [Hypothesis] | [Value] | [Value] | [Value] | [Team/person] |
| 4 | [Name] | [How calculated] | [Hypothesis] | [Value] | [Value] | [Value] | [Team/person] |

**Rule**: If you can't state a causal hypothesis for how the input moves the NSM, it's not an input — it's a vanity metric.

---

## 3. Outcome Metrics (what the business cares about — downstream of the NSM)

Outcome metrics are what the NSM is supposed to produce. If the NSM moves and outcomes don't, the NSM is wrong.

```
   [Input metrics] → [NSM] → [Outcome metrics]
```

| Outcome metric | Expected relationship to NSM | Current value | Recent trend |
|----------------|------------------------------|---------------|--------------|
| Revenue | [NSM leads by N weeks] | [Value] | [↑/↓/→] |
| Retention | [Moving NSM by X should lift retention by Y] | [Value] | [↑/↓/→] |
| CAC:LTV ratio | [Expected relationship] | [Value] | [↑/↓/→] |
| Expansion revenue | [Expected relationship] | [Value] | [↑/↓/→] |

---

## 4. Segment Cuts

The NSM often behaves very differently across segments. Cut it by the 2-3 most strategic axes:

| Segment | NSM value | % of total | Trend | Note |
|---------|----------|-----------|-------|------|
| [e.g., New users <30d] | [Value] | [%] | [↑/↓/→] | [Insight] |
| [e.g., Power users] | [Value] | [%] | [↑/↓/→] | [Insight] |
| [e.g., By plan tier — Free] | [Value] | [%] | [↑/↓/→] | [Insight] |
| [e.g., By plan tier — Paid] | [Value] | [%] | [↑/↓/→] | [Insight] |
| [e.g., By geography] | [Value] | [%] | [↑/↓/→] | [Insight] |

---

## 5. Guardrails (what the NSM must NOT destroy)

Optimizing an NSM can harm other things. Name the guardrails and protect them:

| Guardrail metric | Why it matters | Acceptable bound | Current value |
|------------------|---------------|------------------|---------------|
| [e.g., NPS / CSAT] | Quality signal | [Don't drop below X] | [Value] |
| [e.g., Support ticket volume] | Efficiency signal | [Not more than Y per 1000 users] | [Value] |
| [e.g., P99 latency] | Experience signal | [≤ Z ms] | [Value] |
| [e.g., Unit economics — CAC:LTV] | Business sustainability | [LTV ≥ 3× CAC] | [Value] |

---

## 6. Counter-Metrics (things that often get worse when NSM goes up)

These aren't hard bounds like guardrails — they're watch-list metrics where the trade-off is acceptable but monitored.

| Counter-metric | Expected trade-off | Watch level |
|----------------|-------------------|-------------|
| [e.g., Unsubscribe rate during growth pushes] | [Slight increase tolerated] | [Current value] |
| [Metric 2] | [Trade-off] | [Current value] |

---

## 7. Review Cadence

| Cadence | What we review | Who |
|---------|---------------|-----|
| Weekly | Input metric movement; any breach of guardrails | Owner PM |
| Monthly | NSM trend; input-metric correlation check | PM + Data |
| Quarterly | Is the causal hypothesis still holding? Are we moving inputs but not the NSM? | Team + leadership |
| Annually | Is this still the right NSM? Has the business model shifted? | Leadership |

---

## 8. Decision Triggers

Pre-register what you'll do in specific scenarios — don't wait until the quarterly review to decide.

| Trigger | Action |
|---------|--------|
| NSM flat for 2 quarters while inputs improved | Re-examine causal hypothesis — input may not actually drive NSM |
| NSM up while revenue down | Re-examine whether NSM truly leads business outcome |
| Guardrail breached | Pause optimization; investigate root cause before resuming |
| Major strategy shift | Reconfirm NSM still reflects the new strategy |
| New competitor move | Assess whether input metrics are still competitive |

---

## 9. Red Flags (bad NSM patterns to avoid)

Red flags from Cutler, Amplitude, and practitioner experience:

- 🚩 **Revenue as NSM** — usually a lagging outcome; your team can't move it directly
- 🚩 **DAU / MAU alone** — presence ≠ value; weak signal unless paired with a value action
- 🚩 **Multiple NSMs** — pick one; if you can't, you haven't decided
- 🚩 **Vanity inputs** — "page views" is rarely a causal input to value
- 🚩 **Input that doesn't move the NSM when you move it** — if a quarter of improving Input X doesn't lift the NSM, the hypothesis is wrong
- 🚩 **NSM that's instrumented but not trusted** — if the team doesn't believe the number, no one will act on it
- 🚩 **NSM changes every quarter** — durability is a feature; churn is a tell

---

## 10. Linked Artifacts

- Underlying strategy memo: [`artifacts/strategy-memos/...`]
- Growth loops canvas: [`artifacts/growth-loops/...`]
- Relevant experiments: [`artifacts/experiments/...`]
- Decision logs: [D-NNN links]

---

## Formatting Guidelines

- **One NSM, not a dashboard**: If you list multiple "north stars," you've lost the point of the framework. Rank and pick one.
- **Causal hypothesis is mandatory**: Every input metric must have a stated hypothesis. "Intuition" doesn't count.
- **Baselines before targets**: You cannot set a target without a baseline. If the metric isn't instrumented, fix instrumentation first.
- **Guardrails are not optional**: Every NSM creates a gaming risk. Name the things you'll protect.
- **Keep it one level out of reach**: If a team can change the NSM directly with a single shipped feature, it's not a NSM — it's a feature metric.
