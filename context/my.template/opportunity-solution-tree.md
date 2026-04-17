# Opportunity Solution Tree (OST)
Last updated: [auto-update timestamp]

---

## How to Use This File
This is your **living discovery artifact** per Teresa Torres's *Continuous Discovery Habits*. It's a tree — not a list — that connects what you want to achieve (outcome) to what's blocking customers (opportunities) to what you might build (solutions) to what you don't yet know (assumption tests).

The `discovery-cadence` skill writes to this file every week:
- **Plan mode** (Monday): adds the week's 3 interview plans
- **Synthesize mode** (per interview): adds new opportunity/solution/assumption nodes with evidence
- **Reflect mode** (Friday): appends to the Weekly History log

The `assumption-test-designer` skill adds test designs under assumption nodes.

**Rules**:
- Every node has an ID: `OST-[NNN]` (sequential, never reused)
- Every evidence entry has a date + customer identifier + 1-line quote
- Contradictions get flagged with `⚠️` — don't silently reconcile them
- If nothing changes on the tree in a week, something's wrong (flag it in reflection)

---

## Root: Desired Outcome

**Outcome**: [The one measurable outcome from `context/metrics/north-star.md` this discovery serves]
**Target**: [Baseline → target, by when]
**Why this outcome**: [2-3 lines grounding why this is the right outcome per current strategy]

---

## Opportunity Space

Opportunities are **customer problems, desires, or unmet needs** — NOT solutions. Phrase each as a customer would state it. Evidence accumulates under each node as interviews happen.

### OST-001: [Short name of opportunity]
- **Customer statement**: "I want to / I can't / I struggle when ___________"
- **Persona(s)**: [From `context/users/personas.md`]
- **Frequency**: [How often this surfaces in interviews — X of Y interviews mentioned this]
- **Importance**: [Customer rating 1-5 or qualitative framing]
- **Evidence**:
  - [YYYY-MM-DD] [Customer ID/name] — "[1-line quote]"
  - [YYYY-MM-DD] [Customer ID/name] — "[1-line quote]"
- **Contradicting evidence** (if any): ⚠️ [YYYY-MM-DD] [Customer ID] — "[quote]"
- **Sub-opportunities** (if this is a parent):
  - → OST-00X
  - → OST-00Y

### OST-002: [Next opportunity]
...

---

## Solution Space

Solutions are specific **things we could build or do** to address an opportunity. Multiple solutions per opportunity is healthy — it means you haven't locked in yet.

### OST-101: [Solution name]
- **Addresses opportunity**: OST-00X
- **What it is**: [1-2 sentences]
- **Key assumptions**:
  - → Assumption test OST-201 (desirability)
  - → Assumption test OST-202 (feasibility)
- **Status**: [Idea / Testing / Validated / Killed / Shipped]

### OST-102: [Next solution]
...

---

## Assumption Test Space

For each proposed solution, list the assumptions and how you'd cheaply test them. (Full test designs live in the `assumption-test-designer` skill's output — summarize here.)

### OST-201: [Assumption being tested]
- **Tied to solution**: OST-10X
- **Risk category**: Desirability / Viability / Feasibility / Usability / Ethical
- **Test method**: [Fake door / Concierge MVP / Wizard-of-Oz / Prototype test / Landing page / Survey / Interview]
- **Test design**: [Link to `artifacts/assumption-tests/` file or 1-line description]
- **Status**: [Not started / Running / Complete]
- **Result**: [Once complete: Validated / Invalidated / Inconclusive — with 1-line evidence]

### OST-202: [Next assumption]
...

---

## This Week

_Populated by `discovery-cadence` in plan mode every Monday. Archived to Weekly History on Friday._

**Week of**: [Date]

**Focus question**: By Friday, I want to be able to answer __________.

**Interviews scheduled**:
| # | Persona | Recruit source | Learning goal | Tied to OST node |
|---|---------|---------------|--------------|-----------------|
| 1 | ... | ... | ... | ... |
| 2 | ... | ... | ... | ... |
| 3 | ... | ... | ... | ... |

**Assumption tests active**:
- OST-20X (status)

---

## Weekly History

_Append-only log of weekly reflections. One entry per week. Built by `discovery-cadence` reflect mode._

### Week of [YYYY-MM-DD]
- Interviews completed: N of 3
- New opportunity nodes: [list IDs]
- Evidence added: [count]
- Assumptions validated: [IDs]
- Assumptions invalidated: [IDs]
- Contradictions flagged: [count]
- What I changed my mind about: [one sentence, or "nothing — flag" if so]
- Next week's focus: [one line]

---

## ID Convention
- Opportunities: OST-001 through OST-099
- Solutions: OST-100 through OST-199
- Assumption tests: OST-200 through OST-299
- Sequential within each range; never reused.

**Next available IDs**:
- Opportunity: OST-001
- Solution: OST-101
- Assumption test: OST-201

---

## Monthly OST Review Prompt

Once a month, sweep the tree:
- **Prune**: Which opportunities haven't received new evidence in 60+ days? Park or kill.
- **Promote**: Which solutions now have enough validated assumptions to move to a PR/FAQ + PRD?
- **Rebalance**: Is evidence concentrated on one branch? If yes, are we missing signal elsewhere?
- **Reconcile**: Any lingering `⚠️` contradictions? Resolve or mark as open tension.
- **Reset outcome**: Does the root outcome still reflect what we're trying to move? Update if strategy shifted.
