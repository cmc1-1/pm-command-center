# Skill: Discovery Cadence (Weekly)

## Metadata
- name: discovery-cadence
- trigger: "weekly discovery", "discovery cadence", "continuous discovery", "interview week", "update OST"
- version: 1.0
- author: PM Command Center Team
- category: discovery

## Purpose
Run a weekly continuous-discovery rhythm per Teresa Torres's *Continuous Discovery Habits*: 3 customer interviews per week, each feeding an evolving Opportunity Solution Tree (OST). This replaces project-based research with habitual, tree-mapped learning that compounds. The PM trio (PM + Design + Tech Lead) ideally runs this together, but one PM running it solo still beats no cadence.

The skill has **three modes**:
1. **Plan** — start of week: who to interview, what to learn, what assumption to test
2. **Synthesize** — mid-week or end-of-week: interviews done; extract insights, update OST
3. **Reflect** — weekly rollup: what did we learn? what changed on the tree? what's next week's focus?

## Inputs
- **Required**: Mode ("plan", "synthesize", or "reflect") — if not specified, infer from context (e.g., if OST has interviews this week without synthesis, default to synthesize)
- **Optional**:
  - Interview transcripts or notes (for synthesize mode)
  - Focus outcome (if doing focused discovery on a specific problem)
- **Auto-loaded context** (read silently before running):
  - `context/my/opportunity-solution-tree.md` — the living OST (central artifact)
  - `context/users/personas.md` — who exists as a valid interview target
  - `context/users/feedback-themes.md` — accumulated insights to avoid re-learning
  - `context/metrics/north-star.md` — desired outcome that roots the tree
  - `context/strategy/current-priorities.md` — focus filter
  - `tracking/current-sprint.md` — what delivery is in flight (dual-track awareness)
  - `templates/interview-guide-template.md` — for plan mode

## Process

### Mode 1: PLAN (Monday morning, 10-15 min)

**Step 1 — Read the OST**
- What's the current desired outcome?
- Which opportunity branch has the thinnest evidence?
- Which assumption test is overdue?

**Step 2 — Propose the week's 3 interviews**
Generate a recruit list with rationale:

```
## Week of [Date] — Discovery Plan

### Desired outcome in focus
[From OST root or chosen branch]

### Interviews to run (3)
| # | Persona | Specific recruit source | What we want to learn | OST branch |
|---|---------|------------------------|----------------------|-----------|
| 1 | [Name] | [Support ticket, NPS detractor, sales-call list, CAB member] | [Specific learning goal] | [Opportunity node ID] |
| 2 | ... | ... | ... | ... |
| 3 | ... | ... | ... | ... |

### Assumption tests to design or run this week
[From assumption-test-designer backlog]

### This week's focus question
One sentence: by Friday, I want to be able to answer __________.
```

**Step 3 — For each interview, draft a 5-question skeleton**
Use `templates/interview-guide-template.md`. Bias toward *story-based* questions ("Tell me about the last time you…") over *hypothetical* questions.

**Step 4 — Save the plan**
- Append to `context/my/opportunity-solution-tree.md` under "This Week" section
- Offer: "Create calendar blocks for the interviews?"

### Mode 2: SYNTHESIZE (after each interview, ~20 min)

**Step 1 — Ingest the interview**
Either paste the transcript or reference a meeting artifact from `artifacts/meetings/`. If coming from `meeting-summarizer`, the structured notes are already available.

**Step 2 — Extract three kinds of signal**

| Signal type | Definition | Where it goes on the OST |
|-------------|------------|--------------------------|
| **Opportunity** | A customer pain, desire, or unmet need | Opportunity node (new or existing) |
| **Solution idea** | A specific thing we or the customer imagined | Solution node under the relevant opportunity |
| **Assumption** | A belief we're making that this interview weakened or strengthened | Assumption test node + evidence entry |

**Step 3 — Update the OST**
For each signal:
- If it matches an existing node → add evidence reference (date + customer + 1-line quote)
- If new → create a new node with ID `OST-[NNN]`
- If it *contradicts* an existing node → flag the node with `⚠️` and a reconciliation prompt

**Step 4 — Update feedback-themes**
- Append to `context/users/feedback-themes.md` under the relevant theme
- If the insight is a new theme, create the entry

**Step 5 — Flag downstream actions**
Detect and surface:
- "This assumption is now validated — ready for a PRD?" → offer `prd-generator`
- "This assumption is now invalidated — want to kill the idea?" → offer to update `context/my/innovation-pipeline.md` (Killed)
- "This opportunity is new and high-frequency — worth designing an assumption test?" → offer `assumption-test-designer`

### Mode 3: REFLECT (Friday afternoon, 10 min)

**Step 1 — Summarize the week**
```
## Discovery Rollup — Week of [Date]

### Interviews completed
[N of 3] | [List with dates and personas]

### What moved on the OST
- New opportunity nodes: [count and names]
- Evidence added to existing nodes: [count]
- Assumptions validated: [count — list IDs]
- Assumptions invalidated: [count — list IDs]
- Contradictions flagged: [count]

### The focus question, answered
[Restate Monday's question + the answer based on this week's learning]

### What I changed my mind about this week
[One sentence — if nothing, explicitly say so and ask if we're talking to the wrong people]

### Biggest unresolved assumption
[Highest-risk assumption still untested]

### Next week's focus
[One-line priority for Monday's plan session]
```

**Step 2 — Save the rollup**
- Save to `artifacts/reports/YYYY-MM-DD-discovery-rollup.md`
- Append summary to `context/my/opportunity-solution-tree.md` under "Weekly History"
- Offer: "Draft an exec-update mentioning the key insight?" → hands off to `exec-update-writer` or `email-drafter`
- Offer: "Log any decisions from this week's discovery?" → hands off to `decision-logger`

## Tool Integrations (when MCP connected)

**Gong / Chorus / Fireflies** (if connected):
- Pull call recordings for customer interviews
- Transcribe and feed directly into synthesize mode

**Slack** (if connected):
- Post the Friday rollup to the discovery channel
- DM the trio partners (designer + tech lead) the week's learning

**Productboard** (if connected):
- Cross-reference opportunities against tracked feature requests
- Auto-link OST nodes to Productboard feature-request clusters

**Jira** (if connected):
- When an assumption is validated and ready for build, offer to create an epic linked to the OST node

## Quality Checklist (self-verify)
- [ ] Every week has a named focus question answered on Friday (or explicitly marked unresolved)
- [ ] OST has at least one change per week (no changes = stale cadence; flag it)
- [ ] Assumption tests are overdue for < 2 weeks
- [ ] Interviews are mostly story-based, not hypothetical
- [ ] Every interview leaves an evidence trail on the OST (date + quote)
- [ ] Contradictions are flagged, not quietly reconciled
- [ ] Trio partners (designer + tech lead) see the weekly rollup — discovery is not solo
- [ ] "What I changed my mind about" section is populated (honest; "nothing" triggers a why-not)

## What Makes This Skill Different From Ad-Hoc Research
- It's a habit, not a project — weekly, every week
- The OST persists across weeks — evidence compounds
- It enforces dual-track: discovery runs parallel to delivery, never "done"
- It flags stale nodes (learning without movement = talking to the wrong people)
- It honors Torres's rule: if you don't change your mind this week, you weren't listening

## Integration Points
- **Opportunity Solution Tree**: `context/my/opportunity-solution-tree.md` is the living artifact this skill reads and writes every week
- **Assumption Test Designer (H4)**: When an assumption needs testing, handoff to that skill
- **PR/FAQ Generator (H1)**: When an opportunity is well-validated, run PR/FAQ as the narrative gate
- **PRD Generator**: Validated opportunities + passing PR/FAQ → PRD
- **Meeting Summarizer**: Interview transcripts flow through meeting-summarizer first, then into synthesize mode
- **Market Intelligence**: Market findings inform which branches of the OST matter most
- **Strategy Critique**: Can validate whether the OST's desired outcome aligns with strategy
- **Interview Guide template**: `templates/interview-guide-template.md` provides the question skeleton
