# Skill: PRD Generator (Socratic)

## Metadata
- name: prd-generator
- trigger: "create a PRD", "write a PRD for", "help me spec out"
- version: 1.0
- author: PM Command Center Team
- category: definition

## Purpose
Generate comprehensive, context-aware Product Requirements Documents through a Socratic questioning process. The AI asks smart questions before writing — drawing on accumulated product knowledge, user research, competitive data, and prior decisions to produce PRDs that are grounded in reality, not generic.

## Inputs
- **Required**: Feature name or problem description (even a rough idea is fine)
- **Optional**:
  - Target persona
  - Related user research
  - Urgency / strategic context
  - Known constraints
- **Auto-loaded context** (read silently before starting):
  - `context/company/product-overview.md` — product scope and business model
  - `context/users/personas.md` — existing personas and JTBD
  - `context/users/feedback-themes.md` — recurring user pain points
  - `context/strategy/current-priorities.md` — current quarter focus
  - `context/strategy/okrs.md` — OKR alignment
  - `context/competitors/matrix.md` — competitive landscape
  - `context/decisions/decision-log.md` — prior decisions that may affect scope
  - `context/metrics/north-star.md` — what metrics matter
  - `templates/prd-template.md` — output format

## Process

### Phase 0: PR/FAQ Gate (narrative-first check)

Before asking PRD-scoping questions, check whether a PR/FAQ exists for this feature. Look in `artifacts/prfaqs/` for a file matching the feature name.

- **If a PR/FAQ exists**: Read it. Use it as the authoritative statement of customer benefit, positioning, and out-of-scope. The PRD then becomes the *how*, with the PR/FAQ as the *why*. Skip customer-framing questions already answered in the PR/FAQ.
- **If no PR/FAQ exists**: Before proceeding, offer:
  > "No PR/FAQ found for this feature. Amazon's Working Backwards method recommends drafting the press release + customer FAQ *before* the PRD — it's the cheapest way to test whether the idea deserves to be built. Want to run `pr-faq-generator` first? (You can also proceed directly to PRD if this is a small feature, internal tool, or follow-on work where the customer narrative is already clear.)"

If the user chooses to skip the PR/FAQ, proceed to Phase 1. If they choose to run it first, hand off to `pr-faq-generator` and return here with its output as input to Phase 1.

### Phase 1: Socratic Questioning (interactive — 3-4 rounds)

Do NOT generate the PRD immediately. First, ask questions to scope the feature properly. Questions should demonstrate that you've read the context — reference specific personas, feedback themes, competitors, or prior decisions.

**Round 1 — Problem & scope (ask 3-5 questions)**

Draw from context to make questions specific, not generic. Examples:
- "Your feedback themes show [theme X] is mentioned in [N] of the last [M] interviews. Is this PRD addressing that, or a different angle?"
- "Is this solving the problem for [Persona A] specifically, or does it also need to work for [Persona B]?"
- "Competitor [Name] already offers [similar feature]. Are we differentiating on [approach A] or [approach B]?"
- "Decision D-[NNN] committed us to [constraint]. Does that affect the scope here?"
- "Is this a full solution or an MVP? What would you cut if you had to ship in half the time?"

**Round 2 — Success criteria & constraints (ask 2-3 questions)**

- "What does success look like in numbers? Which metric from your north star set does this move?"
- "Which HEART category does this feature target most — Happiness, Engagement, Adoption, Retention, or Task Success? (If unclear, we'll run `hearts-gsm-builder` after the PRD to formalize the measurement plan.)"
- "Are there technical dependencies or infrastructure constraints I should know about?"
- "Who needs to approve this before development starts?"

**Round 3 — Edge cases & risks (ask 2-3 questions)**

- "What's the biggest risk to this feature? What would make it fail?"
- "Are there user segments where this could make things worse?"
- "What's explicitly out of scope? What will people ask for that we should say no to?"

**Round 4 (optional) — Clarifications based on answers**

If answers reveal ambiguity, ask targeted follow-ups. Don't exceed 4 rounds total — bias toward writing and iterating.

### Phase 2: PRD Generation

Using the Socratic answers + all auto-loaded context, generate a complete PRD following `templates/prd-template.md`.

**Section 0: Business Case Summary** — Before the Problem Statement, generate a 3-sentence executive framing: (1) What problem costs the business and how much, (2) What investment is needed, (3) What return is expected. This section should survive a VP's 30-second scan.

**Key generation rules:**
- **User stories must follow INVEST**: Independent, Negotiable, Valuable, Estimable, Small, Testable
- **Acceptance criteria must be testable**: Use Given/When/Then format
- **Metrics must have baselines**: If baseline is unknown, flag it as "Baseline TBD — measure before launch"
- **Success metrics section uses HEART/GSM structure**: Organize metrics into a HEART category (Happiness / Engagement / Adoption / Retention / Task Success), state the Goal → Signal → Metric chain for each, and name at least one counter-metric. If the mapping is non-obvious, note "See `hearts-gsm-builder` for full measurement plan" and link to the HEART/GSM artifact when authored.
- **Out of scope must be explicit**: Better to over-exclude than under-exclude
- **Assumptions must be listed**: Every unstated belief that could invalidate the approach
- **Reference prior decisions**: Link to relevant D-[NNN] entries when they constrain or inform the feature
- **Reference user research**: Cite specific feedback themes or interview quotes when grounding requirements

### Phase 3: Multi-Perspective Critique (automatic)

After generating the PRD, immediately run two sub-agent critiques:

**Engineering perspective:**
Prompt: "Review this PRD as a senior engineer. Identify: technical feasibility concerns, missing edge cases, infrastructure dependencies not mentioned, performance implications, and any requirements that are ambiguous from an implementation standpoint."

**User research perspective:**
Prompt: "Review this PRD as a senior UX researcher. Identify: assumptions about user behavior that aren't validated, gaps in the user flow, accessibility considerations, edge cases from real user workflows, and whether the success metrics actually capture user value."

Present critiques as actionable feedback, not a wall of text. Format:
```
⚠️ [Specific concern] — [Why it matters] — [Suggested fix]
✅ [Thing that's well done] — [Why it works]
```

### Phase 4: Save and integrate

1. Save PRD to `artifacts/prds/[feature-name]-prd.md`
2. Add a summary entry to `context/strategy/active-prds/` directory
3. Offer follow-up actions:
   - "Generate user stories as Jira/Linear tickets?"
   - "Formalize the measurement plan via `hearts-gsm-builder`?"
   - "Run `pre-mortem-runner` on this PRD before engineering investment?"
   - "Design assumption tests via `assumption-test-designer` for risky requirements?"
   - "Create a storyboard via `storyboard-generator` to visualize the journey this PRD enables?"
   - "Create a stakeholder FAQ for this feature?"
   - "Draft a one-pager summary for leadership?"
   - "Build a prototype from the P0 requirements?"

### Tool Integrations (when MCP connected)

**Confluence** (if connected):
- Publish final PRD to Confluence under the team's PRD space
- Auto-link to related Jira epic if one exists

**Jira** (if connected):
- Offer to create a Jira epic from the PRD
- Generate Jira stories from P0 user stories with acceptance criteria as subtasks

**Amplitude** (if connected):
- Pull current metric baselines when writing success metrics
- Auto-populate "Baseline TBD" fields with actual Amplitude data

**Productboard** (if connected):
- Check Productboard for existing feature requests related to the PRD
- Link the PRD to the corresponding Productboard feature
- Pull customer request count and top requesters for context

## Quality Checklist (self-verify before presenting)
- [ ] Problem statement is grounded in data or research, not assumption
- [ ] Every P0 user story has testable acceptance criteria
- [ ] Success metrics have baselines (or baselines are flagged as TBD)
- [ ] Success metrics are structured by HEART category with Goal → Signal → Metric chain
- [ ] At least one counter-metric is named (what should NOT move in the wrong direction)
- [ ] Out of scope section is populated (not empty)
- [ ] At least 2 assumptions are listed for validation
- [ ] Technical dependencies are identified
- [ ] Rollout strategy is defined (not just "launch it")
- [ ] Open questions have owners assigned
- [ ] Engineering critique has been run
- [ ] User research critique has been run
- [ ] Business case summary would survive a VP's 30-second scan

## What Makes This Skill Different From Generic PRD Writing
- It reads your actual user research before asking questions
- It references your competitors by name with specific feature gaps
- It checks your decision log for constraints and conflicts
- It knows your OKRs and asks how the feature aligns
- It critiques its own output from two perspectives before presenting
- It gets better over time as your context files grow richer

## Integration Points
- **PR/FAQ Generator (H1)**: Runs upstream — the PR/FAQ is the customer-facing narrative; this PRD is the implementation spec
- **Discovery Cadence (H3)**: Validated OST opportunities become PRD candidates
- **Assumption Test Designer (H4)**: Pre-build validation reduces PRD risk — link test outcomes to PRD assumptions
- **Pre-Mortem Runner (H2)**: Pre-mortem the PRD before engineering mobilizes
- **Storyboard Generator (M5)**: Visualizes the journey the PRD enables; capability map bridges storyboard → PRD
- **HEART/GSM Builder (M9)**: Formalizes the success-metrics section's measurement structure
- **Eval & Model Spec Author (H8)**: For AI features, the PRD references a Model Spec + Eval Set instead of feature requirements text
- **Experiment Designer (H5)**: If rollout is behind an A/B, experiment-designer operationalizes the PRD's success metrics
- **Launch Orchestrator (M7)**: PRD feeds the launch brief's scope and readiness tracks
- **Strategy Critique**: Can review the PRD's strategic alignment
- **Decision Logger**: PRD decisions get logged automatically
- **Product Strategy Memo (H7)**: PRDs reference the parent strategy memo's guiding policy
- **Ticket Generator**: Can break P0 requirements into Jira/Linear stories
- **Prototype Builder**: Can generate functional HTML from P0 user flows
