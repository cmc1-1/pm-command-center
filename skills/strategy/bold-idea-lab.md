# Skill: Bold Idea Lab

## Metadata
- name: bold-idea-lab
- trigger: "bold idea lab", "brainstorm product ideas", "what if we...", "let's think big about...", "blue sky session", "innovation brainstorm"
- version: 1.0
- author: Chetan
- category: strategy

## Purpose
Creative brainstorming engine that generates bold, grounded product ideas through structured divergent-then-convergent thinking. This is the upstream creative skill — it generates the "what" that downstream skills (PRD Generator, Strategy Critique, Opportunity Assessment) refine and validate. Designed to push past incremental thinking while staying connected to real user needs, market gaps, and technical possibilities.

## Inputs
- **Required**: None for open exploration; topic or problem statement for focused sessions
- **Optional**:
  - Brainstorm mode (see Step 1 for the five modes)
  - Constraints ("must work with current architecture", "needs to ship in Q3", "enterprise-only")
  - Inspiration sources ("I saw [competitor] launch X", "a customer asked about Y")
- **Auto-loaded context** (read ALL before processing):
  - `context/product-overview.md` — current product capabilities and architecture
  - `context/users/personas.md` — user segments, needs, and pain points
  - `context/users/feedback-themes.md` — aggregated user feedback and request patterns
  - `context/competitors/matrix.md` — competitive landscape and positioning gaps
  - `context/strategy/current-priorities.md` — strategic direction and focus areas
  - `context/strategy/okrs.md` — objectives and measurable targets
  - `context/metrics/north-star.md` — what success looks like quantitatively
  - `context/strategy/domain-expertise.md` — industry knowledge and technology trends
  - `context/strategy/innovation-pipeline.md` — existing ideas in various stages
  - `context/strategy/pm-frameworks.md` — mental models and evaluation frameworks
  - `context/decisions/decision-log.md` — prior decisions and their rationale

## Process

### Step 1: Set the canvas
Determine which brainstorm mode to use. If the user doesn't specify, default to Open Exploration seeded from feedback themes, competitive gaps, and recent AI developments.

| Mode | When to Use | Seed Inputs |
|------|------------|-------------|
| **Open Exploration** | No specific problem — generate fresh ideas | Feedback themes + competitive gaps + AI developments + market trends |
| **Problem-Focused** | Specific user pain or business problem to solve | Problem statement + persona context + current solutions and their gaps |
| **Trend-Riding** | Capitalize on an emerging technology or market shift | Trend description + domain expertise + product capabilities |
| **Competitive Flanking** | Respond to or preempt competitor moves | Competitor matrix + their recent moves + our differentiators |
| **Customer Moonshot** | Reimagine the customer experience from scratch | Personas + feedback themes + "if we could do anything" framing |

State the chosen mode and seed inputs before generating ideas.

### Step 2: Generate 5-8 bold ideas
Each idea must pass three bars:
- **Bold**: Represents a step-change, not an incremental improvement. Would make someone say "that's ambitious."
- **Grounded**: Connected to a real user need, market gap, or technical enabler. Not fantasy.
- **Articulable**: Can be explained in one sentence. If it takes a paragraph, it's not clear enough.

For each idea, provide:

```
#### [Idea Name]
**One-liner**: [Single sentence description]
**Insight**: [User pain] + [Technology enabler] + [Market timing] = [Why now]
**Inspired by**: [Which context file or input sparked this idea]
```

Push for diversity across the idea set — different user segments, different technical approaches, different value propositions. Avoid generating 5 variations of the same idea.

### Step 3: First-pass filtering
Score each idea on three axes:

| Axis | Question | Score |
|------|----------|-------|
| **Desirability** | Is there evidence that users want or need this? (feedback data, research, market signals) | 0-3 |
| **Feasibility** | Can we realistically build this? (technical capability, team skills, timeline) | 0-3 |
| **Viability** | Does this make business sense? (revenue potential, strategic alignment, defensibility) | 0-3 |

**Kill zero-scorers**: Any idea scoring 0 on any axis is eliminated with a brief explanation.
**Keep 3-5 survivors** for deeper evaluation.

### Step 4: Stress-test survivors
For each surviving idea, apply these lenses:

**Devil's Advocate**: What is the strongest argument against this idea? What would a skeptical VP of Engineering or CFO say?

**Pre-Mortem**: It's 12 months from now and this initiative failed. What went wrong? What was the most likely cause of failure?

**Competitive Response**: If we announced this, what would our top 2 competitors do within 90 days? Can they copy it easily?

**Second-Order Effects**: What does this change about our product, team, or market position beyond the obvious? Does it create new dependencies or risks?

**Decision Log Check**: Does this idea conflict with any prior strategic decisions? Does it build on or extend a previous decision?

### Step 5: Evaluate and rank
Score each surviving idea on five dimensions:

| Dimension | Scale | Description |
|-----------|-------|-------------|
| **Strategic alignment** | 1-5 | How well does this fit our stated strategy, OKRs, and north-star metric? |
| **Market timing** | 1-5 | Is the market ready for this? Are buyers asking for it? Is the technology mature enough? |
| **Defensibility** | 1-5 | Can competitors easily replicate this? Does it leverage our unique strengths? |
| **Effort to validate** | S / M / L / XL | How much work to test the hypothesis before committing to build? |
| **Confidence** | High / Med / Low | How confident are we in the underlying assumptions? |

Rank ideas by total strategic alignment + market timing + defensibility score, with effort and confidence as tiebreakers.

### Step 6: Generate output
Assemble the session report:

```
# Bold Idea Lab — [Date]
**Mode**: [Selected mode] | **Topic**: [Topic or "Open Exploration"]

---

## Session Summary
[2-3 sentences: what mode was used, how many ideas were generated, how many survived, what the strongest direction is]

---

## Top Ideas (Ranked)

### #1: [Idea Name]
**One-liner**: [Description]
**Insight**: [Pain + Enabler + Timing]
**Scores**: Strategic [X/5] | Timing [X/5] | Defensibility [X/5] | Effort [S/M/L/XL] | Confidence [H/M/L]

**Stress Test Results**:
- Devil's advocate: [Strongest counter-argument]
- Pre-mortem: [Most likely failure mode]
- Competitive response: [What competitors would do]
- Second-order effects: [Non-obvious implications]

**Validation Plan** (3 steps to test this before committing):
1. [First validation step — e.g., customer interviews, prototype, data analysis]
2. [Second validation step]
3. [Third validation step — decision gate: build or kill]

### #2: [Idea Name]
[Same structure as #1]

### #3: [Idea Name]
[Same structure as #1]

---

## Killed Ideas
| Idea | Reason Killed |
|------|--------------|
| [Name] | [Why it didn't survive — which axis scored 0 or which stress test broke it] |

---

## Connections to Existing Work
- [How idea #1 relates to current sprint / roadmap / innovation pipeline]
- [How idea #2 builds on a prior decision or existing capability]

---

## Session Metadata
- Ideas generated: [N]
- Survived first filter: [N]
- Context files referenced: [List]
```

### Step 7: Update knowledge base
After generating the report:
- **Add to innovation pipeline**: Add surviving ideas to `context/strategy/innovation-pipeline.md` as "Raw Signal" (unvalidated) or "Hypothesis" (partially validated through stress testing)
- **Offer downstream skills**: For the top-ranked idea, offer to run an Opportunity Assessment or draft a lean PRD
- **Log the session**: Note the brainstorm in the decision log if any strategic direction emerges

## Output Format
Save to: `artifacts/reports/YYYY-MM-DD-bold-idea-lab-{topic}.md`

Where `{topic}` is a kebab-case summary of the session focus (e.g., `open-exploration`, `ai-contract-review`, `competitive-response-icertis`).

## What Makes This Skill Different
This is the **upstream creative engine** in the skill ecosystem. While other skills refine, validate, and execute ideas, Bold Idea Lab generates them. It uses divergent thinking (Step 2: generate many) followed by convergent thinking (Steps 3-5: filter and rank). The output feeds into:
- **PRD Generator** — to define the winning idea in detail
- **Strategy Critique** — to stress-test the strategic narrative
- **Opportunity Assessment** — to size the opportunity formally

It is not a substitute for those downstream skills. Its job is to produce the raw creative material they work with.

## Quality Checklist (self-verify before presenting)
- [ ] Ideas are genuinely bold — not incremental features dressed up with ambitious language
- [ ] Every idea is grounded in at least one context file (user need, competitive gap, or technology trend)
- [ ] Idea diversity exists — not 5 variations of the same concept
- [ ] First-pass filtering was rigorous — zero-scorers are actually killed, not kept as "maybe"
- [ ] Stress tests are honest — devil's advocate arguments are strong, not strawmen
- [ ] Validation plans are specific and achievable, not "do more research"
- [ ] Killed ideas have clear, defensible reasons
- [ ] The top idea's insight (pain + enabler + timing) is compelling and non-obvious

## Integration Points
- **PRD Generator**: Top ideas from Bold Idea Lab flow into PRD definition as validated concepts
- **Strategy Critique**: Ideas with strategic narratives can be stress-tested further
- **AI Research Scout**: AI developments and technology trends seed the Trend-Riding mode
- **Market Intelligence**: Competitive landscape gaps seed the Competitive Flanking mode
- **Impact Journal**: Running a Bold Idea Lab session and having ideas adopted is a loggable INNOVATION/STRATEGY event
- **Decision Logger**: If the session produces a strategic direction decision, log it
