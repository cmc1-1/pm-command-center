# Skill: PRD Generator (Socratic)

## Metadata
- name: prd-generator
- trigger: "create a PRD", "write a PRD for", "help me spec out"
- version: 1.0
- author: Chetan
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
  - `context/product-overview.md` — product scope and business model
  - `context/users/personas.md` — existing personas and JTBD
  - `context/users/feedback-themes.md` — recurring user pain points
  - `context/strategy/current-priorities.md` — current quarter focus
  - `context/strategy/okrs.md` — OKR alignment
  - `context/competitors/matrix.md` — competitive landscape
  - `context/decisions/decision-log.md` — prior decisions that may affect scope
  - `context/metrics/north-star.md` — what metrics matter
  - `templates/prd-template.md` — output format

## Process

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

**Key generation rules:**
- **User stories must follow INVEST**: Independent, Negotiable, Valuable, Estimable, Small, Testable
- **Acceptance criteria must be testable**: Use Given/When/Then format
- **Metrics must have baselines**: If baseline is unknown, flag it as "Baseline TBD — measure before launch"
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
   - "Create a stakeholder FAQ for this feature?"
   - "Draft a one-pager summary for leadership?"
   - "Build a prototype from the P0 requirements?"

## Quality Checklist (self-verify before presenting)
- [ ] Problem statement is grounded in data or research, not assumption
- [ ] Every P0 user story has testable acceptance criteria
- [ ] Success metrics have baselines (or baselines are flagged as TBD)
- [ ] Out of scope section is populated (not empty)
- [ ] At least 2 assumptions are listed for validation
- [ ] Technical dependencies are identified
- [ ] Rollout strategy is defined (not just "launch it")
- [ ] Open questions have owners assigned
- [ ] Engineering critique has been run
- [ ] User research critique has been run

## What Makes This Skill Different From Generic PRD Writing
- It reads your actual user research before asking questions
- It references your competitors by name with specific feature gaps
- It checks your decision log for constraints and conflicts
- It knows your OKRs and asks how the feature aligns
- It critiques its own output from two perspectives before presenting
- It gets better over time as your context files grow richer

## Integration Points
- **Interview Synthesis**: Feeds user research that grounds the PRD
- **Strategy Critique**: Can review the PRD's strategic alignment
- **Decision Logger**: PRD decisions get logged automatically
- **Ticket Generator**: Can break P0 requirements into Jira/Linear stories
- **Prototype Builder**: Can generate functional HTML from P0 user flows
