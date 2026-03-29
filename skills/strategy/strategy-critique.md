# Skill: Strategy Critique

## Metadata
- name: strategy-critique
- trigger: "critique this strategy", "review my strategy", "red team this", "poke holes in this"
- version: 1.0
- author: Chetan
- category: strategy

## Purpose
Provide rigorous, structured critique of product strategy documents, PRDs, roadmap narratives, or strategic proposals. Act as a smart, skeptical VP Product who wants the strategy to succeed but won't let weak thinking slide. The goal is to find gaps before stakeholders do.

## Inputs
- **Required**: Strategy document, PRD, roadmap, or proposal (file path or pasted text)
- **Optional**:
  - Specific areas of concern ("I'm not sure about the pricing angle")
  - Audience context ("This goes to the board next week")
  - Critique depth (quick scan | standard | deep dive)
- **Auto-loaded context**:
  - `context/strategy/current-priorities.md` — strategic alignment
  - `context/strategy/okrs.md` — OKR alignment check
  - `context/competitors/matrix.md` — competitive reality check
  - `context/users/personas.md` — user grounding check
  - `context/users/feedback-themes.md` — evidence base check
  - `context/decisions/decision-log.md` — consistency check
  - `context/metrics/north-star.md` — measurement check

## Process

### Step 1: Read and understand
Read the full document before critiquing. Understand the author's intent, not just the words. Identify:
- The core thesis (what is this strategy arguing?)
- The key bets (what assumptions is it making?)
- The intended outcome (what does success look like?)

### Step 2: Score on six dimensions

| Dimension | What to Evaluate | Score 1-10 |
|---|---|---|
| **Clarity** | Is the strategy unambiguous? Could two people read it and reach the same understanding of what to do? | |
| **Coherence** | Do the pieces fit together? Do the tactics support the strategy? Do the metrics measure what matters? | |
| **Grounding** | Is this based on evidence (user research, data, market analysis) or assumption? | |
| **Differentiation** | Does this create a defensible advantage vs. competitors, or could anyone do this? | |
| **Feasibility** | Can the team actually execute this with available resources and timeline? | |
| **Ambition** | Is this bold enough to matter? Is it solving a big enough problem? | |

### Step 3: Identify strengths (2-3)
Start with what works. Specific, not generic:
- ✅ "[Specific element] is strong because [reason]"
- Not: "The strategy is generally well-thought-out" (too vague)

### Step 4: Identify weaknesses (3-5)
The core of the critique. For each weakness:
```
⚠️ [What's weak]
Why it matters: [The risk or consequence]
Evidence: [Reference from context files, competitor data, or user research]
Suggested fix: [Specific, actionable improvement]
```

### Step 5: Unstated assumptions
List every assumption the strategy makes but doesn't explicitly state. These are the hidden risks:
- "This assumes [X], but [evidence suggests otherwise / this hasn't been validated]"
- Flag which assumptions are highest-risk (most likely to be wrong AND most damaging if wrong)

### Step 6: Devil's advocate arguments
Generate 2-3 counter-arguments that a smart skeptic would raise:
- "A board member might ask: [question]"
- "Your competitor could respond by: [action]"
- "If [assumption] is wrong, then [consequence]"

### Step 7: Missing elements
Flag anything that should be in the document but isn't:
- Missing metrics or baselines?
- No rollback plan?
- No competitive response scenario?
- No customer validation plan?
- No resource or timeline estimate?

### Step 8: Generate summary

```
## Strategy Critique Summary

### Overall Assessment
[2-3 sentences — is this strategy ready to present, or does it need more work?]

### Scores
| Dimension | Score | Key Issue |
|---|---|---|
| Clarity | X/10 | [One line] |
| Coherence | X/10 | [One line] |
| Grounding | X/10 | [One line] |
| Differentiation | X/10 | [One line] |
| Feasibility | X/10 | [One line] |
| Ambition | X/10 | [One line] |
| **Overall** | **X/10** | |

### Top 3 Fixes (do these before presenting)
1. [Most impactful improvement]
2. [Second most impactful]
3. [Third most impactful]

### Strengths to Emphasize
- [What to lean into when presenting]

### Prepare for These Questions
- [Question 1 a skeptic will ask]
- [Question 2]
- [Question 3]
```

## Critique Depth Options

**Quick scan** (2-3 minutes): Scores + top 3 issues + 1 devil's advocate argument. Good for early drafts.

**Standard** (5-10 minutes): Full 8-step process. Good for documents going to stakeholders.

**Deep dive** (15-20 minutes): Full process + line-by-line annotation of the document with inline comments + competitive simulation ("If you were Competitor X, how would you counter this strategy?"). Good for board-level or investor-facing documents.

## What This Skill Is NOT
- It's not a rubber stamp. If the strategy is weak, it will say so directly.
- It's not a rewrite. It critiques, it doesn't author. Use the feedback to improve your own work.
- It's not infallible. The critique is only as good as the context files. If competitor data or user research is thin, the critique will be shallower.

## Integration Points
- **PRD Generator**: Can critique PRDs immediately after generation (Phase 3 of that skill)
- **Decision Logger**: Strategy decisions can be logged after critique review
- **Roadmap Narrative**: Can critique roadmap presentations before stakeholder delivery
- **Meeting Prep**: Critique output feeds into stakeholder meeting preparation
