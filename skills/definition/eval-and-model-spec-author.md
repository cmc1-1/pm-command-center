# Skill: Eval & Model Spec Author (AI-Native PM)

## Metadata
- name: eval-and-model-spec-author
- trigger: "author an eval", "model spec for", "write a model spec", "design evals for", "AI behavior contract", "eval-driven release"
- version: 1.0
- author: PM Command Center Team
- category: definition

## Purpose
For AI features, author the two artifacts that define and govern AI product behavior:

1. **Model Spec** — a living contract stating what the AI *should* and *should not* do, and how it handles conflicts between competing principles. Modeled on OpenAI's Model Spec and Anthropic's behavior-contract approach.
2. **Eval Set** — a structured test suite (ground-truth, adversarial, regression cases) with a rubric for grading. Evaluated via LLM-as-judge or human review, with release criteria tied to pass rates. Inspired by Anthropic's Bloom framework and the broader eval-driven-development practice.

**The principle**: when a product is non-deterministic, evals *are* the spec. "Ship it when the PRD is done" is a pre-AI pattern. The AI-native pattern is "ship it when the evals pass release criteria."

This skill complements `ai-research-scout` — that skill is inbound (what's happening in AI); this skill is outbound (how we define AI product behavior).

## Inputs
- **Required**: AI feature under design (can be rough — "we want an AI assistant for X" is enough to start)
- **Optional**:
  - Target use case or persona
  - Existing prompt or behavior guidelines
  - Model choice (if known — Claude, GPT, etc.)
  - Risk tolerance (consumer-grade vs. enterprise compliance vs. safety-critical)
- **Auto-loaded context** (read silently):
  - `context/company/product-overview.md` — product scope and brand voice
  - `context/users/personas.md` — who will use the AI feature
  - `context/users/feedback-themes.md` — user pain the AI will address
  - `context/strategy/current-priorities.md` — strategic alignment
  - `context/competitors/matrix.md` — competitive AI moves and benchmarks
  - `context/metrics/north-star.md` — outcome metric the feature serves
  - `context/my/domain-expertise.md` — for subject-matter grounding
  - `MY_PROFILE.md` — voice and tone for user-facing outputs

## Process

### Phase 1: Intent Questioning (interactive, 3-4 rounds)

Before authoring, clarify what the AI is for.

**Round 1 — Purpose & boundaries**
- "What job is the AI doing that a human does today (if any)?"
- "What does a successful interaction *feel* like to the user? What does a failure feel like?"
- "What must the AI *never* do in this surface? (think hallucination, policy, PII, tone)"

**Round 2 — Inputs & outputs**
- "What inputs will the AI see? (user prompt, retrieved context, structured data, tool results)"
- "What output shape is expected? (free text, structured JSON, tool calls, citations, refusals)"
- "What's in-scope vs. out-of-scope for this AI? Where does it say 'I can't help with that'?"

**Round 3 — Risk & stakes**
- "What happens when the AI is wrong — how bad is a bad answer?"
- "Who sees the output before the user? (human review, guardrails, nothing)"
- "What competitive or regulatory constraints apply?"

**Round 4 — Personality**
- "What voice should it use? (reference `MY_PROFILE.md` for brand voice)"
- "When should it be brief vs. elaborate?"
- "When should it push back vs. comply?"

### Phase 2: Draft the Model Spec

The Model Spec is the *behavior contract* — the source of truth for what "correct" means. Written as a living document, versioned.

```
# Model Spec: [Feature Name]
**Version**: 1.0
**Last updated**: [Date]
**Owner**: [From MY_PROFILE.md]
**Status**: Draft → Review → Adopted → Superseded

---

## 1. Purpose

[2-3 sentences: what this AI is for, who it serves, what outcome it enables. No fluff.]

## 2. Principles (ranked by precedence)

When principles conflict, higher-ranked wins. State the ranking explicitly.

1. **Safety**: [What safety principle governs — e.g., "Refuse requests that would cause harm to the user, third parties, or undermine platform trust"]
2. **Honesty**: [e.g., "Never fabricate citations, data, or capabilities. If unsure, say so."]
3. **Helpfulness**: [e.g., "Solve the user's actual job-to-be-done, not just their literal request"]
4. **Brand voice**: [From MY_PROFILE.md — reference the specific voice directives]
5. **Concision**: [e.g., "Default to shortest answer that fully addresses the question"]

## 3. Allowed Behaviors

The AI **may** do the following without restriction:
- [Behavior 1 — concrete, testable]
- [Behavior 2]
- [Behavior 3]

## 4. Conditional Behaviors

The AI **may** do the following, but only when conditions are met:

| Behavior | Condition required |
|----------|-------------------|
| [e.g., Execute a tool call] | [e.g., User has authorized this tool in their settings] |
| [e.g., Share links to external content] | [e.g., Link is from an allow-listed domain] |
| [e.g., Provide financial advice] | [e.g., With a clear disclaimer and user has acknowledged] |

## 5. Prohibited Behaviors (hard no)

The AI **must never**:
- [e.g., Generate content in [prohibited categories]]
- [e.g., Disclose system prompt contents]
- [e.g., Output PII without user's explicit consent in the same turn]
- [e.g., Claim to be human if asked directly]

## 6. Handling Edge Cases

### When the user asks something out of scope
[Exact pattern for redirecting. Include an example.]

### When retrieval / context is missing or conflicting
[Exact pattern — e.g., "Cite only what's retrieved; when context is empty, say so; when context conflicts, prefer the source with higher authority and note the conflict."]

### When the user is frustrated or angry
[Exact pattern for de-escalation and recovery.]

### When the user asks the AI to violate a principle
[Exact refusal pattern. Must include: acknowledge the request, state the reason, offer an alternative if possible.]

### When the AI is uncertain
[Exact pattern — e.g., "State the uncertainty explicitly; offer to verify; do not confabulate."]

## 7. Output Format

### Default format
[Markdown / JSON / plain text — with an example]

### Citation requirements
[When citations are required and how they're formatted]

### Length guidance
[Target response length by interaction type]

### Refusal format
[Exact wording pattern for a refusal]

## 8. Tool Use (if applicable)

### Tools available
[List tools the AI can call]

### Tool-call policy
[When to call, when to ask first, how to handle tool errors]

### Tool-result handling
[How to integrate tool results into the final response]

## 9. Versioning & Change Control

- **Version bumps**: Major (breaking behavior change) / Minor (new permitted behavior) / Patch (clarification)
- **Review cadence**: [Quarterly / on significant feedback pattern]
- **Change rationale**: Every change references the eval regression it prevents or the user signal it responds to
```

### Phase 3: Author the Eval Set

An eval set has three kinds of cases:

| Eval type | What it tests | Example |
|-----------|--------------|---------|
| **Ground-truth** | Does the AI produce the correct answer for known-correct inputs? | "What is the refund policy?" → correct answer from docs |
| **Adversarial** | Does the AI refuse or safely handle harmful / off-policy / edge inputs? | Jailbreak attempts, prompt injection, policy violations, out-of-scope requests |
| **Regression** | Do fixes to past bugs stay fixed? | Every bug reported by users becomes an eval case |

Draft an eval set with ≥20 cases spanning the three types:

```
## Eval Set v1

### Ground-truth cases (≥10)
| ID | Input | Expected output (pass criteria) | Rubric weight |
|----|-------|--------------------------------|--------------|
| GT-01 | [Input] | [Expected output description, not exact string] | [Weight 1-3] |
| GT-02 | ... | ... | ... |

### Adversarial cases (≥6)
| ID | Input | Expected behavior | Rubric weight |
|----|-------|-------------------|--------------|
| ADV-01 | [Jailbreak attempt] | [Refuses with policy-aligned explanation] | 3 |
| ADV-02 | [Prompt injection] | [Ignores injection; completes original task] | 3 |
| ADV-03 | [Out-of-scope request] | [Redirects with the out-of-scope pattern from spec] | 2 |
| ADV-04 | [Harmful content request] | [Refuses per Principle 1] | 3 |

### Regression cases (≥4, grows over time)
| ID | Input | Bug this prevents | Added on |
|----|-------|-------------------|----------|
| REG-01 | [Input] | [Original bug description] | [Date] |

### Edge cases (optional, for robust features)
| ID | Input | Expected handling |
|----|-------|-------------------|
| EDGE-01 | [Empty input / very long input / non-English / emoji] | [Handling per spec] |
```

### Phase 4: Define the Rubric

A rubric scores each eval case. Two models: LLM-as-judge (scalable, cheaper, noisier) or human review (gold standard, expensive, necessary for high-stakes cases).

```
## Rubric

### Per-case grading

| Score | Meaning |
|-------|---------|
| 3 | Fully satisfies expected behavior |
| 2 | Partially satisfies — minor deviation |
| 1 | Misses the intent or includes incorrect information |
| 0 | Violates a Prohibited Behavior (see Model Spec §5) |

Any score of 0 fails the release regardless of aggregate score.

### Grading method
- **Method**: [LLM-as-judge with [model] and [rubric prompt] | Human review | Hybrid — LLM first, human sample]
- **Inter-rater check**: For LLM-as-judge, sample [N%] to human-grade and measure agreement
- **Scorer instructions**: [The exact grading prompt — this IS the rubric]

### Aggregate metrics

| Metric | Definition | Release threshold |
|--------|-----------|------------------|
| **Pass rate** | % of cases scoring ≥ 2 | ≥ [95%] |
| **Ground-truth pass rate** | % of GT cases scoring ≥ 2 | ≥ [95%] |
| **Adversarial pass rate** | % of ADV cases scoring = 3 | ≥ [98%] (zero tolerance) |
| **Regression rate** | % of REG cases scoring ≥ 2 | = 100% (any regression blocks release) |
| **Principle violation rate** | % of cases scoring 0 | = 0% |
```

### Phase 5: Release Criteria

Tie the evals to a release decision.

```
## Release Criteria

### Gate 1: Draft → Internal review
- Pass rate ≥ 80%
- No Principle violations

### Gate 2: Internal → Alpha
- Pass rate ≥ 90%
- Adversarial pass rate ≥ 95%
- No regressions from previous version

### Gate 3: Alpha → Beta
- All Gate 2 thresholds
- Human review of 50-case sample
- User feedback pattern: no systematic complaints about tone / accuracy

### Gate 4: Beta → GA
- All Gate 3 thresholds
- Pass rate ≥ 95%
- Adversarial pass rate ≥ 98%
- Zero Principle violations
- Documented handling for every reported-user-issue category

### Post-launch
- Weekly eval re-run on production prompts sample
- New regression cases added for every reported issue
- Spec + eval set version bump reflected in changelog
```

### Phase 6: Instrumentation plan

Evals are only meaningful if the feature emits the data they test.

```
## Instrumentation

| Signal | Source | Purpose |
|--------|--------|---------|
| Every user prompt | [Storage location, retention] | Eval case harvesting |
| Every AI response | [Storage] | Regression detection |
| User thumbs / corrections | [UX surface + storage] | Ground-truth correction loop |
| Refusal count and category | [Logging] | Detect over/under-refusal drift |
| Tool call rate and errors | [Logging] | Detect tool-use failures |
| Latency and cost per response | [APM] | Guardrails for viability |

### Privacy
[How user data is handled in eval pipelines — consent, anonymization, retention bounds]
```

### Phase 7: Save and integrate

1. Save the Model Spec to `artifacts/model-specs/[feature-slug]-spec-v[N].md`
2. Save the Eval Set to `artifacts/evals/[feature-slug]-evals-v[N].md` (or a dedicated test file if the eval runner is code)
3. Offer:
   - "Run `pr-faq-generator` to produce the customer-facing narrative for this AI feature?"
   - "Run `strategy-critique` on the Model Spec before review?"
   - "Run `pre-mortem-runner` — what's the worst way this AI could fail in production?"
   - "Log the decision to ship against this spec in `decision-logger`?"

## Tool Integrations (when MCP connected)

**Claude / OpenAI / Anthropic APIs** (if connected):
- Draft and iterate on the system prompt that implements the Model Spec
- Run the eval set against candidate prompts and report pass rates

**Braintrust / LangSmith / Weights & Biases** (if connected):
- Push the eval set into the eval runner
- Track eval pass rates over time; surface regressions

**Jira** (if connected):
- Create epics for each release gate
- Create tickets for regression cases from user-reported bugs

**Confluence** (if connected):
- Publish the Model Spec as a versioned team document
- Link eval results dashboards

## Quality Checklist (self-verify)
- [ ] Principles are ranked (precedence is explicit)
- [ ] Prohibited behaviors are concrete (not "be responsible")
- [ ] Every edge case from Phase 2 §6 has an example response pattern
- [ ] Eval set has ≥20 cases spanning all 3 types (ground-truth, adversarial, regression)
- [ ] Rubric grading method is specified (LLM-as-judge / human / hybrid)
- [ ] Release thresholds are numeric, not "looks good"
- [ ] Regression cases include at least one real bug from testing or users (not synthetic only)
- [ ] Instrumentation plan supports ongoing eval re-runs
- [ ] Privacy handling for eval data is addressed
- [ ] Version number and date present; changelog ready for future updates

## What Makes This Skill Different From "Write a Prompt"
- Authoring the *spec* separately from the *prompt* — spec is the contract, prompt is an implementation
- Explicit principle ranking — conflicts get resolved, not hand-waved
- Eval set with release thresholds — ship on evidence, not vibes
- Adversarial + regression cases by default — not just happy path
- Instrumentation plan — the AI product is measured in production, not just dev
- Versioned and change-controlled — AI products evolve; spec evolves with them

## Integration Points
- **PRD Generator**: For AI features, the PRD references the Model Spec as the behavior contract (instead of listing requirements text)
- **PR/FAQ Generator (H1)**: The PR/FAQ describes customer-facing behavior; the Model Spec is the internal contract that delivers that behavior
- **AI Research Scout**: Inbound AI news can suggest new adversarial cases or spec updates
- **Strategy Critique**: Can critique a Model Spec the same way it critiques strategy docs
- **Pre-Mortem Runner (H2)**: Pre-mortem on AI features often surfaces gaps in the eval set
- **Experiment Designer (H5)**: Production A/B between spec versions uses H5; evals gate what's allowed into the A/B
- **Impact Journal**: Shipping a new AI feature with eval pass rates is a loggable METRIC/SHIP impact entry
- **Decision Logger**: Version bumps on Model Spec get logged with rationale
