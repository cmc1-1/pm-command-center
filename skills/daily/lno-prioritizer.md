# Skill: LNO Prioritizer (Weekly / Daily)

## Metadata
- name: lno-prioritizer
- trigger: "LNO prioritize", "prioritize my week", "LNO tiering", "what to focus on", "leverage check"
- version: 1.0
- author: PM Command Center Team
- category: daily

## Purpose
Categorize tasks into **Leverage / Neutral / Overhead** tiers per Shreyas Doshi's LNO framework. Warn when perfectionism is being applied to O-tasks and recommend where to cut corners. The goal is to stop the most common PM productivity failure: spending weekend-grade effort on tasks that don't compound.

**The rule**: bring perfection only to L-tasks. N-tasks get done well. O-tasks get done *well enough* — the cost of O-perfection is L-starvation.

Runs in two modes:
1. **Weekly plan** (Monday) — tier the week's anticipated work
2. **Daily retro** (end of day or at EOD-rollup time) — tier what actually happened; surface leverage drift

## Inputs
- **Required**: Mode ("weekly" or "daily"); list of tasks (auto-pulled from tracking files if not provided)
- **Optional**:
  - Specific OKR / priority to filter by
  - Time budget (hours available this week — forces explicit trade-offs)
- **Auto-loaded context** (read silently):
  - `tracking/action-items.md` — all tracked commitments with deadlines
  - `tracking/current-sprint.md` — sprint-committed work
  - `context/strategy/current-priorities.md` — the priorities that define "leverage"
  - `context/strategy/okrs.md` — OKRs that inform leverage
  - `context/my/career-goals.md` — personal growth goals (factor into L-task detection)
  - `context/my/impact-journal.md` — recent entries (what the user has been spending time on)

## Process

### Step 1: Collect the task list

**Weekly mode**: Pull all tasks due this week from `tracking/action-items.md` + sprint commitments from `tracking/current-sprint.md` + any calendar blocks the user mentions.

**Daily mode**: Pull tasks the user mentioned doing today from `impact-journal.md` (if logged) + completed items from `action-items.md` + any tasks the user adds verbally.

Display the full list before tiering. If the list is empty, ask the user to list what they're thinking of doing / did.

### Step 2: Tier the tasks (LNO)

For each task, apply the LNO test:

| Tier | Test | Effort treatment |
|------|------|------------------|
| **L (Leverage)** | Would a 20% improvement on this task produce a 10× outcome? Does this compound? Does it move a priority or OKR? Is this where my unique value as a PM shows up? | Bring the best effort. Perfectionism here is ROI-positive. |
| **N (Neutral)** | This is important but linear — good execution produces good outcome, bad execution produces bad outcome. Doesn't compound, but can't be skipped. | Execute cleanly and move on. No polish beyond "done well." |
| **O (Overhead)** | This must happen but nobody cares if it's excellent. Status updates, routine admin, housekeeping, formatting. | Do it "well enough." Cut corners deliberately. Automate or delegate when possible. |

**Classification heuristics**:
- 🟢 L signs: strategic narrative, big-bet PRD, ambiguous high-stakes decision, high-leverage 1:1, cross-org alignment on contested topic, major customer conversation, authoring strategy memo, designing an experiment on the north star
- 🟡 N signs: standard PRD for a known problem, routine meeting prep, sprint planning, standard 1:1, known-pattern design review
- 🔴 O signs: status reports on tracked work, formatting a doc after it's written, responding to low-stakes messages, polishing slides that are already good-enough, administrative logistics

**Push back when**:
- More than 40% of the list is labeled L → "Too many L-tasks in a week means the bar for L is set too low. Let's re-tier the borderline ones."
- Less than 1 L-task exists → "A week with no L-tasks means a week of motion without leverage. What L-work is being avoided?"

### Step 3: Leverage-drift detection

For each O-task, ask: "Are you planning to do this to an L-task standard?" Common signs:
- Spending 3+ hours polishing a status report (O) = drift
- Rewriting meeting notes for the 4th time (usually O) = drift
- Adding animations / visual polish to a slide reviewed internally (O) = drift

Flag these explicitly:

```
⚠️ Leverage drift risk:
- [Task] is tiered O but is budgeted [N hours]
- At O-standard this should take [lower estimate]
- The [time delta] is being taken from [L-task at risk]
- Suggestion: [cut specific corner]
```

### Step 4: Output format

**Weekly mode:**
```
# LNO Plan — Week of [Date]

## Summary
- L-tasks: [N] — [X% of list]
- N-tasks: [N]
- O-tasks: [N]
- **This week's one L-task to protect**: [The single highest-leverage item]

## L Tier (bring best effort)
| Task | Due | Why L | Estimated hours |
|------|-----|-------|-----------------|
| [...] | [...] | [Laddered to priority / OKR / strategy] | [...] |

## N Tier (clean execution)
| Task | Due | Estimated hours |
|------|-----|-----------------|
| [...] | [...] | [...] |

## O Tier (do well enough)
| Task | Due | Max budget | Suggested corner-cut |
|------|-----|-----------|---------------------|
| [...] | [...] | [Hours] | [Specific shortcut] |

## Leverage-Drift Warnings
[Any tasks flagged in Step 3]

## Suggested Cuts / Automations / Delegations
- [Suggestion 1 — specific task + specific alternative handler or tool]
- [Suggestion 2]

## Focus Question for the Week
If I can only protect one task's quality, it is: [The L-task named in Summary]
```

**Daily mode:**
```
# LNO Retro — [Date]

## What I did today (tiered)
### L (Did I bring my best?)
- [Task] — [Honest assessment: L-quality effort? Y / N]

### N
- [Task] — [Clean execution? Y / N]

### O
- [Task] — [Done well enough? Or over-invested?]

## Time distribution
- L: [hours, %]
- N: [hours, %]
- O: [hours, %]
- **Target**: L ≥ 40% | O ≤ 25% (rough heuristic, adjust to context)
- **Actual vs target**: [gap analysis]

## Leverage-drift audit
Was any O-task treated as L today? [Yes/No]
- [If yes: which one, and what leverage did it cost?]

## Tomorrow's correction
- If today was O-heavy: [specific protected block for L-work tomorrow]
- If today was L-heavy: [good — name what to protect]
```

### Step 5: Update tracking + integrate

- In weekly mode: save plan to `artifacts/reports/YYYY-MM-DD-lno-week.md`; optionally annotate `tracking/action-items.md` with `[L]`, `[N]`, `[O]` tags
- In daily mode: append to the day's entry in `context/my/impact-journal.md` as a reflection signal
- Offer follow-ups:
  - "Add the leverage-drift warnings to today's `end-of-day-rollup`?"
  - "Archive an O-task that's been sitting for 2+ weeks? (Old O is usually not worth doing at all.)"

## Tool Integrations (when MCP connected)

**Calendar** (if connected):
- Audit calendar for L-task protected blocks; flag when an O-meeting steals an L-block
- Suggest consolidating O-meetings into a single block to leave uninterrupted L-time

**Slack** (if connected):
- Detect if Slack-time is trending toward O-heavy responsiveness at L-time cost

**Jira** (if connected):
- Tag Jira items with L/N/O; report on time-tracked split by tier

## Quality Checklist (self-verify)
- [ ] Every task has a tier; no "uncategorized" left
- [ ] L-tier share is honest (not inflated by wishful thinking — 2-4 L-tasks per week is realistic for a PM)
- [ ] O-tasks have explicit max-time budgets and corner-cut suggestions
- [ ] Leverage-drift warnings are specific (not "watch for over-polishing")
- [ ] The single L-task to protect is named — not left implicit
- [ ] Daily-mode retros include the time-distribution math

## What Makes This Skill Different From "Prioritize My List"
- Named framework (LNO) with explicit effort-treatment rules per tier
- Active detection of leverage drift (O treated as L)
- Target time distribution — L ≥ 40%, O ≤ 25% as heuristic
- Pushes back when L-count is inflated or zero
- Daily retro mode catches drift in retrospect, not just plan in advance

## Integration Points
- **Morning Briefing**: Pulls today's LNO tier assignment into the daily view (Sprint 6 enhancement)
- **End-of-Day Rollup**: Runs the daily-retro LNO pass automatically if not already done (Sprint 6 enhancement)
- **Action Item Extractor**: Optionally tags new action items with LNO on extraction (Sprint 6 enhancement)
- **Impact Journal**: L-tasks that shipped become entries; leverage-drift weeks become lessons-learned
- **Meeting Summarizer**: Commitments extracted from meetings get implicit LNO tags when the skill is invoked together
- **Strategy Critique**: A strategy that generates only O-tasks in execution is a planning failure — flag this as a coherent-actions red flag
