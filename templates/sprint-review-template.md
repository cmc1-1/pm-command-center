# Sprint Review: Sprint [N] — [Sprint Name/Theme]

> **Purpose**: End-of-sprint snapshot — what shipped vs. committed, demos, metrics, and carryover with reasons.
> **When to use**: Every sprint close. Fed by `tracking/current-sprint.md` and Jira; archived to `tracking/archive/`.
> **Audience**: Team (primary), stakeholders watching progress, and leadership sampling team health.

## Sprint Metadata
- **Sprint**: [Number]
- **Dates**: YYYY-MM-DD to YYYY-MM-DD
- **Sprint goal**: [One sentence — what we committed to achieving]
- **Team capacity**: [X] developer-days (accounting for PTO, holidays, on-call)

---

## Sprint Goal Assessment

**Goal achieved?** ✅ Yes | ⚠️ Partially | ❌ No

[One paragraph: Did we achieve what we set out to do? If partially or no, what fell short and why? Be honest — the retro section is for improvement, this section is for accountability.]

---

## Delivery Summary

### Completed

| Story | Points | Owner | Acceptance | Demo? |
|-------|--------|-------|-----------|-------|
| [Story title + ID] | [X] | [Dev] | ✅ PM accepted | Yes/No |
| [Story title + ID] | [X] | [Dev] | ✅ PM accepted | Yes/No |

**Total completed**: [X] stories, [Y] points

### Not completed (carryover)

| Story | Points | Owner | Status | Reason | Carryover to |
|-------|--------|-------|--------|--------|-------------|
| [Story title + ID] | [X] | [Dev] | In progress — 70% | [Blocked by X / underestimated / scope grew] | Sprint [N+1] |

**Total carryover**: [X] stories, [Y] points

### Unplanned work

| Item | Points | Why Unplanned | Impact on Sprint |
|------|--------|--------------|-----------------|
| [Bug fix / hotfix / incident] | [X] | [Production issue / customer escalation] | [Displaced story X] |

**Total unplanned**: [X] stories, [Y] points

---

## Velocity & Health

| Metric | This Sprint | Last Sprint | 3-Sprint Avg | Trend |
|--------|------------|------------|-------------|-------|
| Points committed | [X] | [X] | [X] | |
| Points completed | [X] | [X] | [X] | ↑↓→ |
| Completion rate | [X%] | [X%] | [X%] | ↑↓→ |
| Carryover stories | [X] | [X] | [X] | ↑↓→ |
| Unplanned work (%) | [X%] | [X%] | [X%] | ↑↓→ |
| Bugs found in sprint | [X] | [X] | [X] | ↑↓→ |

**Velocity commentary**: [If velocity is trending down or up, explain why. Is it a team change, technical debt, better estimation, or scope creep?]

---

## Demo Highlights
[For stakeholders — what can we show?]

1. **[Feature/story]**: [One line description of what it does and why it matters to users]
2. **[Feature/story]**: [One line]

---

## Retrospective

### What went well (keep doing)
- [Item] — [Why it worked]
- [Item] — [Why it worked]

### What didn't go well (stop or change)
- [Item] — [Impact it had]
- [Item] — [Impact it had]

### Improvement actions

| Action | Owner | Try in Sprint | Success Measure |
|--------|-------|--------------|-----------------|
| [Specific improvement to try] | [Name] | Sprint [N+1] | [How we'll know it worked] |
| [Specific improvement] | [Name] | Sprint [N+1] | [Measure] |

### Previous improvement actions — did they work?

| Action (from Sprint [N-1]) | Result |
|---------------------------|--------|
| [What we tried] | ✅ Worked — adopting permanently / ⚠️ Partially — adjusting / ❌ Didn't help — dropping |

---

## Product Impact

### Metrics moved this sprint

| Metric | Before Sprint | After Sprint | Δ | Related Stories |
|--------|--------------|-------------|---|-----------------|
| [Metric] | [Value] | [Value] | [+/-X%] | [Story IDs] |

### User feedback on shipped features
[Any early feedback, support tickets, or customer reactions to what we shipped]

---

## Next Sprint Preview

### Proposed sprint goal
[One sentence — what Sprint N+1 should achieve]

### Candidate stories (pre-planning)

| Story | Points (est.) | Priority | Dependencies |
|-------|--------------|----------|--------------|
| [Story] | [X] | P0/P1/P2 | [Blocked by / none] |
| [Carryover story] | [X] | P0 | [From this sprint] |

### Capacity for next sprint
- Available developer-days: [X] (flag PTO, holidays, on-call rotation)
- Recommended commitment: [X] points (based on 3-sprint velocity avg)

### Risks for next sprint
- [Risk 1 — and mitigation]
- [Risk 2 — and mitigation]
