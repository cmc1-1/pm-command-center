# Skill: Product Strategy Memo (Rumelt-style)

## Metadata
- name: product-strategy-memo
- trigger: "draft a strategy memo", "product strategy for", "write a strategy doc", "strategy narrative"
- version: 1.0
- author: PM Command Center Team
- category: strategy

## Purpose
Author a net-new product strategy narrative using Richard Rumelt's kernel from *Good Strategy / Bad Strategy*: **Diagnosis → Guiding Policy → Coherent Actions**. Complemented by Stripe-style RFC discipline (clear bets, non-goals, assumptions, kill conditions) and Netflix context-memo culture (leaders set context, not control). This is distinct from `strategy-critique` which *reviews* strategy — this skill *authors* it.

Most "strategy docs" are actually goal lists wearing a costume. This skill forces the three-part kernel: name the real problem honestly, declare how you'll fight it, and commit to the moves that make everything else make sense.

## Inputs
- **Required**: Strategic question the memo must answer. Examples:
  - "How do we win in [segment] over the next 12 months?"
  - "Should we double down on [capability] or diversify?"
  - "Our strategy for the [X] market"
- **Optional**:
  - Target audience (team | leadership | board)
  - Time horizon (quarter | year | multi-year)
  - Constraints to preserve (headcount, tech stack, platform bets)
- **Auto-loaded context** (read silently before drafting):
  - `context/company/product-overview.md` — scope and business model
  - `context/strategy/current-priorities.md` — current commitments
  - `context/strategy/okrs.md` — measurable targets
  - `context/competitors/matrix.md` — competitive landscape
  - `context/users/personas.md` — customer segments
  - `context/users/feedback-themes.md` — pain evidence
  - `context/metrics/north-star.md` — outcome target
  - `context/decisions/decision-log.md` — prior commitments that constrain
  - `context/my/opportunity-solution-tree.md` — discovery signal
  - `MY_PROFILE.md` — voice and writing style

## Process

### Phase 1: Strategic Diagnosis (interactive, 3-5 questions)

The diagnosis is Rumelt's first and hardest step — name the *real* challenge, not a goal. Most memos fail here.

Ask:
- "What is the single hardest problem this strategy must address? (Not the goal — the *obstacle* between us and the goal.)"
- "What about today's reality makes that problem genuinely hard? What have others tried that failed, or what structural constraint exists?"
- "If we do nothing, what breaks first — revenue, retention, competitive position, team morale?"
- "Is this problem structural (baked into our model/market) or situational (fixable with effort)?"
- "What evidence convinced you this is the real problem, not a symptom?"

**Critical check**: If the user's diagnosis is actually a goal ("we need to grow by 30%"), push back: "That's a target, not a diagnosis. What makes growing by 30% hard for *us specifically* right now?"

### Phase 2: Guiding Policy (2-3 questions)

The guiding policy is the overall approach — how we'll fight the challenge. It's not a plan; it's the *lens* through which all plans get filtered.

Ask:
- "What's our theory of the case? If you had to finish the sentence 'We will beat this problem *by* ___________', what's the blank?"
- "What are we explicitly *not* doing? (A guiding policy that doesn't say no to anything isn't a policy.)"
- "What's our concentration of force — where do we pour resources and where do we starve?"

### Phase 3: Coherent Actions (interactive synthesis)

Propose 3-5 coherent actions — each one *required by* the guiding policy. These must reinforce each other; a strategy where the actions are independent is not a strategy, it's a list.

Ask:
- "What are the 3-5 moves that, together, embody the guiding policy?"
- "Do these moves reinforce each other? (If one succeeds and another fails, does the overall strategy still hold?)"
- "What's the sequencing? Which action unlocks the next?"

### Phase 4: Draft the Memo

```
# [Strategy Memo Title — One Sentence Thesis]

**Author**: [From MY_PROFILE.md]
**Date**: [Today]
**Audience**: [Team / Leadership / Board]
**Status**: Draft v1 — for review

---

## TL;DR (3 sentences, read in 30 seconds)
1. **Diagnosis**: [The real problem, not the goal.]
2. **Guiding Policy**: [How we'll fight it.]
3. **Commitment**: [The 3-5 coherent actions and the one metric we'll be judged on.]

---

## 1. Diagnosis

### The challenge
[2-3 paragraphs naming the real obstacle. Concrete. Evidence-backed. Structural vs. situational is named explicitly.]

### Why this is hard
[What makes this problem resistant to the obvious answers. What others have tried. Structural constraints. Customer or market realities.]

### Evidence
- [Data point from `context/metrics/` or `context/users/feedback-themes.md`]
- [Competitive move from `context/competitors/matrix.md`]
- [Discovery signal from `context/my/opportunity-solution-tree.md`]
- [Prior decision from `context/decisions/decision-log.md` that now constrains us]

---

## 2. Guiding Policy

### Our theory of the case
We will [overcome the challenge] by [the approach]. This is different from [common alternative] because [what makes our angle defensible or right-timed].

### Concentration of force
We will pour resources into: [areas]
We will starve: [areas]
This trade-off is worth it because: [rationale tied to diagnosis]

### Non-goals (explicit)
- We will NOT [tempting action we're rejecting] — because [reason]
- We will NOT [second tempting action] — because [reason]

---

## 3. Coherent Actions

### The moves (3-5)
| # | Action | Why it's required by the guiding policy | Owner | Timeline |
|---|--------|----------------------------------------|-------|----------|
| 1 | [Specific action] | [How this embodies the policy] | [Team/person] | [When] |
| 2 | ... | ... | ... | ... |

### How they reinforce each other
[2-3 sentences explaining the coherence. If this section is weak, the strategy is actually a list.]

### Sequencing
[Which action comes first; which unlocks which; where parallel work is possible.]

---

## 4. Bets, Assumptions & Kill Conditions

### The bets we're making
- [Bet 1 — the belief we're acting on]
- [Bet 2]
- [Bet 3]

### Assumptions (and how we'd know we were wrong)
| Assumption | How we'd know it's wrong | Cost to test |
|------------|-------------------------|--------------|
| [Belief 1] | [Disconfirming signal] | [Effort] |
| [Belief 2] | [Disconfirming signal] | [Effort] |

### Kill conditions
**We will reverse or re-scope this strategy if:**
- [Specific disconfirming evidence by specific date]
- [Specific metric failure by specific threshold]

---

## 5. Measurement & Review

### The one metric we'll be judged on
[One north-star-aligned metric. Target. Timeframe.]

### Leading indicators (monthly)
- [Leading metric 1 — baseline → target]
- [Leading metric 2 — baseline → target]

### Review cadence
- Monthly: [What we check]
- Quarterly: [Full strategy review — what could change]

---

## 6. Open Questions
- [Unresolved item 1]
- [Unresolved item 2]

## 7. Appendix
- Related decisions: [D-NNN links]
- Supporting research: [OST nodes, interview artifacts]
- Competitive analysis: [teardown links]
```

### Phase 5: Self-Critique Before Presenting

Before saving, apply Rumelt's red flags to the draft. Flag any that apply:

- 🚩 **Fluff**: Does any paragraph disappear if you remove the adjectives? Rewrite in plain language.
- 🚩 **Goals mistaken for strategy**: Is the guiding policy just a restatement of the goal? Force it to describe *how*, not *what*.
- 🚩 **Dog's dinner of objectives**: Is the action list mutually reinforcing, or a pile of independent initiatives?
- 🚩 **Bad strategic objectives**: Are action timelines wishful ("aggressive, ambitious") instead of sequenced and resourced?

### Phase 6: Save and Integrate

1. Save to `artifacts/strategy-memos/YYYY-MM-DD-[title-slug].md`
2. Offer:
   - "Run `strategy-critique` on this memo before sharing?"
   - "Run `pre-mortem-runner` (once built) to stress-test the bets?"
   - "Log the strategic decision to `context/decisions/decision-log.md` as D-[NNN]?"
   - "Update `context/strategy/current-priorities.md` to reflect the guiding policy?"
   - "Draft a 1-page exec summary for leadership?" (hands off to `email-drafter` exec-update type)

## Tool Integrations (when MCP connected)

**Confluence** (if connected):
- Publish memo to the strategy space
- Link to related PRDs, decisions, and metric dashboards

**Slack** (if connected):
- Post the TL;DR to the product-strategy channel for async review
- Collect comments as signal on where the strategy is unclear

**Jira** (if connected):
- For each coherent action, offer to create a parent epic
- Tag the epics with the memo ID for traceability

## Quality Checklist (self-verify before presenting)
- [ ] Diagnosis names the obstacle, not the goal
- [ ] Diagnosis is evidence-backed from specific context files
- [ ] Guiding policy explicitly says what we will NOT do
- [ ] Actions are coherent (they reinforce each other, not a list)
- [ ] Bets and assumptions are explicit
- [ ] Kill conditions are specific (evidence + date/threshold)
- [ ] One metric of judgment is named with target + timeframe
- [ ] No fluff — adjectives pass the "remove them" test
- [ ] Voice matches `MY_PROFILE.md`
- [ ] Related decisions and prior commitments are referenced

## What Makes This Skill Different From Generic Strategy Docs
- It uses Rumelt's kernel explicitly (Diagnosis / Guiding Policy / Coherent Actions)
- It pushes back when diagnosis is actually a goal
- It forces non-goals and kill conditions (Stripe RFC discipline)
- It reads your OST to ground strategy in discovery, not opinion
- It runs its own red-flag check before presenting
- It sets context for autonomous decision-making (Netflix pattern), not just goals

## Integration Points
- **Strategy Critique**: The memo gets critiqued before sharing (offer in Phase 6)
- **Pre-Mortem Runner (H2)**: Stress-tests the bets after authoring
- **Decision Logger**: The strategic decision itself gets logged, referencing this memo
- **PRD Generator**: PRDs downstream reference the memo as strategic grounding
- **Roadmap Narrative**: Future roadmap narratives inherit the guiding policy
- **PR/FAQ Generator (H1)**: For each coherent action that becomes a product, the PR/FAQ is the downstream narrative gate
- **Opportunity Solution Tree**: Diagnosis draws from the OST; actions may reshape which OST branches get resourced
- **Exec Update Writer**: Monthly exec updates reference the memo's one judgment metric
