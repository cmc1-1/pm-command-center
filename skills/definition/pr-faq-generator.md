# Skill: PR/FAQ Generator (Working Backwards)

## Metadata
- name: pr-faq-generator
- trigger: "draft a PR/FAQ", "working backwards", "press release for", "PRFAQ", "write the announcement"
- version: 1.0
- author: PM Command Center Team
- category: definition

## Purpose
Force customer-obsessed clarity *before* resource commitment. Generate a press release + internal FAQ + external FAQ that would make a customer say "I want this" — *before* a single engineer is tasked. Based on Amazon's Working Backwards method: if the press release isn't exciting, the product isn't worth building.

This is the narrative gate that runs **before** `prd-generator`. A weak PR/FAQ is the cheapest possible signal that the idea isn't ready.

## Inputs
- **Required**: Feature or product concept (rough is fine — the skill sharpens it)
- **Optional**:
  - Target customer segment
  - Hypothetical launch date
  - Strategic context ("this ladders to OKR X")
  - Known constraints to preserve
- **Auto-loaded context** (read silently before drafting):
  - `context/company/product-overview.md` — product voice and positioning
  - `context/users/personas.md` — who this is for
  - `context/users/feedback-themes.md` — customer pain the PR should speak to
  - `context/competitors/matrix.md` — differentiation angles
  - `context/strategy/current-priorities.md` — strategic alignment
  - `context/metrics/north-star.md` — what outcome this needs to move
  - `MY_PROFILE.md` — voice and tone for the quoted exec

## Process

### Phase 1: Customer-Obsession Questioning (2-3 rounds, interactive)

Do not draft until the customer is sharp. Ask:

**Round 1 — The customer and the pain**
- "Who specifically is the customer? Name the persona from `context/users/personas.md` or describe a new segment."
- "What job are they trying to do today, and what makes it painful? Reference a specific feedback theme if possible."
- "What would they celebrate if this shipped tomorrow? What's the emotional win?"

**Round 2 — The delta and the proof**
- "Today they do X. After this launches, they do Y. What's the single biggest delta?"
- "Why now? What's changed — technology, market, regulation, user expectation — that makes this possible now and not 2 years ago?"
- "Why us? What unique right-to-win do we have vs. competitors?"

**Round 3 — Stakes and scope**
- "What metric from the north star would this move? By how much, in what timeframe?"
- "What's explicitly *not* included? What will people ask for that we should say no to?"
- "Hypothetical launch date — when does the press release get published?"

### Phase 2: Draft the Press Release (1 page, max)

Follow Amazon's strict structure. The press release is **for the customer, not for the team**.

```
# FOR IMMEDIATE RELEASE — [Target Launch Date]

## [Headline — under 10 words; states the customer benefit, not the feature]
### [Subheadline — one sentence; who it's for and what it does]

[CITY, DATE] — [Company] today announced [product/feature], a [one-line category
description] that enables [target customer] to [primary benefit]. [Product] is
available [when/how].

[Paragraph 2 — The problem]
Until today, [customer] had to [current painful reality]. [Evidence of the pain:
feedback quote, data point, or observable behavior]. This meant [consequence].

[Paragraph 3 — The solution]
With [product], customers can now [specific new capability]. [One concrete example
of the new workflow in action, in customer terms, not feature terms]. [What makes
this uniquely possible now].

[Paragraph 4 — Customer quote]
"[Quote from a real or representative customer — 2 sentences that would sound
natural in their mouth, not marketing-speak]," said [Name, Title, Company]. "[Second
sentence describing the tangible outcome they expect]."

[Paragraph 5 — Executive quote]
"[Quote from MY_PROFILE persona — strategic framing, not feature boasting]," said
[Name, Title]. "[Second sentence tying to company mission or customer obsession]."

[Paragraph 6 — Availability]
[Product] is available [starting when] for [pricing/tier]. To learn more, visit
[URL]. Media contact: [contact].
```

**Rules:**
- No jargon. No acronyms without expansion. A smart non-expert must understand it.
- Customer benefit before feature mechanics.
- Quotes must sound human, not like marketing copy.
- If you can't write a compelling headline, the idea isn't ready — stop and flag this.

### Phase 3: Internal FAQ (10-15 questions the team will ask)

These are the hard questions a skeptical reviewer, VP, or bar-raiser would surface. Draft them, then answer them honestly.

```
## Internal FAQ

### Strategy & positioning
Q: Why are we building this instead of [alternative X]?
A: [Honest answer grounded in strategy context]

Q: How does this ladder to our current priorities / OKRs?
A: [Specific OKR link and expected contribution]

Q: What's the biggest competitive risk?
A: [Competitor move that would neutralize this, and our response]

### Customer & market
Q: How many customers have asked for this?
A: [Specific count from feedback-themes or research]

Q: What's our evidence that this solves the problem, not a symptom?
A: [Research, assumption tests, data]

Q: What segments are we deprioritizing by building this?
A: [Honest trade-off]

### Scope & investment
Q: What's the estimated engineering investment?
A: [T-shirt size; dependencies]

Q: What's explicitly NOT in v1?
A: [Out-of-scope list]

Q: What would cause us to kill this mid-build?
A: [Kill conditions — specific signals]

### Success & risk
Q: What's the single metric that proves success?
A: [One metric, one target, one timeframe]

Q: What's the #1 way this fails?
A: [Biggest risk with mitigation]

Q: How do we roll this back if it underperforms?
A: [Rollback plan]

### Team
Q: Who owns what across PM / Design / Eng / Data?
A: [Trio ownership]

Q: What external dependencies exist (legal, security, infra, partner)?
A: [Explicit list]
```

### Phase 4: External FAQ (5-8 questions customers will ask)

Written in customer voice — what they'd actually type into a support chat.

```
## External FAQ

Q: What does [product] do?
A: [One paragraph, no jargon]

Q: Who is this for?
A: [Specific persona; be clear about who it's NOT for]

Q: How much does it cost?
A: [Pricing or "included in tier X"]

Q: How is this different from [competitor / existing feature]?
A: [Honest differentiation — 1-2 sentences]

Q: Do I need to [migrate / upgrade / integrate]?
A: [Setup steps or "no action required"]

Q: What data / privacy / security considerations apply?
A: [Plain-language answer — link to details]

Q: When is it available?
A: [Date / rollout plan]

Q: Where do I get help?
A: [Support channel]
```

### Phase 5: Quality gate — the "excite the customer?" test

Ask yourself:
- If a customer read ONLY the headline and first paragraph, would they say "I want this"?
- If the answer is no, the idea isn't ready. Flag this and suggest returning to `bold-idea-lab` or `assumption-test-designer`.
- If yes, proceed to save.

### Phase 6: Save and integrate

1. Save to `artifacts/prfaqs/[product-name]-prfaq.md`
2. Summarize in the chat: "PR/FAQ drafted. Excite-the-customer test: PASS / FAIL."
3. Offer follow-ups:
   - "Run `strategy-critique` on this PR/FAQ?"
   - "Proceed to `prd-generator` with this PR/FAQ as the narrative foundation?"
   - "Share to `context/decisions/decision-log.md` as D-[NNN] for the decision to explore this?"
   - "Add to `context/my/innovation-pipeline.md` in the 'Hypothesis' stage?"

## Tool Integrations (when MCP connected)

**Confluence** (if connected):
- Publish the PR/FAQ to the team's "Working Backwards" space
- Link to related PRD once one exists

**Slack** (if connected):
- Offer to post the headline + one-line summary to the product channel for async review
- Collect reactions as signal of internal excitement

**Productboard** (if connected):
- Pull top-requested items that match this PR/FAQ concept
- Attach customer request count as evidence in the Internal FAQ

## Quality Checklist (self-verify before presenting)
- [ ] Headline is under 10 words and states customer benefit (not feature mechanics)
- [ ] No jargon; a non-expert reader would understand it
- [ ] Customer quote sounds human, not marketing-speak
- [ ] Exec quote uses voice and tone from `MY_PROFILE.md`
- [ ] Internal FAQ includes at least one kill-condition question
- [ ] Internal FAQ references specific personas, competitors, and OKRs from context
- [ ] External FAQ answers what a real customer would ask, not what we want to say
- [ ] The "excite the customer?" test has been applied and noted (PASS/FAIL)
- [ ] Out-of-scope is explicit
- [ ] A single success metric is named with target + timeframe

## What Makes This Skill Different From Generic PR Writing
- It's diagnostic: a weak PR/FAQ is a signal to *not build*, not a marketing problem
- It reads actual feedback themes to ground the pain
- It uses your real voice from MY_PROFILE for the exec quote
- It forces kill conditions before build, not after failure
- It's the gate upstream of PRD — prevents building things that don't deserve a press release

## Integration Points
- **Upstream**: `bold-idea-lab` (ideas) → `assumption-test-designer` (cheap tests) → **`pr-faq-generator`** (narrative gate) → `prd-generator` (spec)
- **PRD Generator**: `prd-generator` checks for a PR/FAQ at Phase 1 and offers to run this first if missing
- **Strategy Critique**: Can critique the PR/FAQ before committing to build
- **Decision Logger**: The decision to proceed from PR/FAQ → PRD gets logged as D-[NNN]
- **Pre-Mortem Runner**: Once H2 is built, the PR/FAQ becomes input for pre-mortem failure-mode analysis
- **Impact Journal**: Successful launches reference the PR/FAQ as the origin artifact
