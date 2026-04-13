# Skill: Morning Briefing

## Metadata
- name: morning-briefing
- trigger: "morning briefing", "start my day", "what's on today"
- version: 1.0
- author: PM Command Center Team
- category: daily

## Purpose
Generate a daily situational awareness digest that surfaces what needs attention, highlights strategic signals, and sets focus for the day. Acts as a Principal PM's morning radar — operational state, cross-org signals, and impact opportunities in one structured view.

## Inputs
- **Required**: None (runs from current knowledge base state)
- **Optional**:
  - Specific focus area ("focus on the API launch" or "heavy on stakeholder items")
  - Date override (defaults to today)
- **Auto-loaded context** (read before processing):
  - `tracking/action-items.md` — overdue, due today, due this week
  - `context/decisions/decision-log.md` — recent decisions and pending decisions
  - `context/strategy/current-priorities.md` — current strategic priorities
  - `tracking/current-sprint.md` — sprint commitments and status
  - `tracking/risks-and-blockers.md` — active risks and blockers
  - `context/metrics/north-star.md` — metric targets and recent performance
  - `context/my/impact-journal.md` — recent entries and logging gaps

## Process

### Step 1: Scan operational state
Review the auto-loaded context files and build a picture of current state:
- **Overdue items**: Any action items past their deadline in `tracking/action-items.md`
- **Due today**: Items with today's date as deadline
- **Due this week**: Items due within the next 5 business days
- **Recent decisions**: Decisions logged in the last 3 days that may have downstream action
- **Metric alerts**: Any north-star or supporting metrics that are off-track or trending negatively
- **Sprint status**: Current sprint health — are committed items on track?
- **Active blockers**: Anything in `tracking/risks-and-blockers.md` that is unresolved

### Step 1b: Pull live data from connected tools (if MCP connected)

**Slack** (if connected):
- Scan for unread @mentions and DMs since yesterday's EOD
- Check monitored channels (ask user to configure on first use) for overnight activity
- Surface any threads where the user was mentioned but hasn't responded

**Jira** (if connected):
- Pull current sprint status: stories in progress, completed, blocked
- Surface tickets assigned to the user with approaching deadlines
- Check for newly assigned tickets since yesterday
- Auto-update `tracking/current-sprint.md` with latest sprint data

**Amplitude** (if connected):
- Pull north star metric current value and trend (vs. last week, vs. target)
- Surface any significant metric changes (>10% swing) or anomalies
- Auto-update `context/metrics/north-star.md` with latest data

**Grafana/Sentry** (if connected):
- Check for critical alerts or new error spikes overnight
- Surface any production incidents that may affect today's priorities

### Step 2: Identify attention items by priority hierarchy
Categorize everything surfaced in Step 1 into a priority-ordered list:
- **Red — Overdue**: Action items past deadline, unresolved blockers persisting 3+ days, metrics significantly off-track
- **Yellow — Due today**: Items due today, decisions needed today, meetings requiring prep
- **Blue — Decisions needed**: Pending decisions without a clear timeline, items waiting on input from others
- **White — Awareness**: Sprint progress updates, upcoming milestones this week, FYI items from recent meetings

Within each tier, order by impact — items tied to current priorities or north-star metric rank higher.

### Step 3: Apply Principal PM lens
Go beyond operational status and add strategic context:
- **Cross-org signals**: Review recent meeting notes and decision log for anything that affects other teams or requires cross-functional coordination. Flag upcoming meetings where cross-org dynamics are in play.
- **Strategic implications**: Does anything on today's schedule connect to a larger strategic bet? Are there decisions being made elsewhere that affect our roadmap?
- **Impact logging opportunities**: Check if yesterday had accomplishments worth logging. Review today's schedule for potential impact moments (launches, key meetings, stakeholder presentations, decisions that demonstrate competency).

### Step 4: Generate structured briefing
Assemble the briefing in the following sections:

```
## Good Morning, [name]

**[Day of week], [Date]** | Sprint [X] Day [Y] | [N] items need attention

---

### Attention Items

#### Red — Overdue
- [Item with owner, original deadline, and days overdue]

#### Yellow — Due Today
- [Item with owner and context]

#### Blue — Decisions Needed
- [Decision with context and who is waiting on it]

#### White — Awareness
- [FYI items, upcoming milestones]

---

### Today's Focus
Based on priorities and calendar, the top 3 things to focus on today:
1. [Focus item with rationale]
2. [Focus item with rationale]
3. [Focus item with rationale]

---

### Cross-Org Radar
- [Cross-functional signal or coordination item]
- [Stakeholder dynamic to watch]

---

### Impact Opportunities
- [Opportunity to demonstrate competency or log a win today]
- [Yesterday's unlogged impact, if any]

---

### Quick Stats
| Metric | Status |
|--------|--------|
| Open action items | [N] |
| Overdue items | [N] |
| Sprint progress | [X/Y stories complete] |
| Days until [next milestone] | [N] |
| Impact entries this week | [N] |
```

### Step 5: Offer follow-ups
After presenting the briefing, ask if the user wants to:
- Draft prep notes for any of today's meetings
- Resolve or update any overdue items right now
- Log yesterday's impact if none was captured
- Deep-dive on any specific attention item

## Output Format
Displayed directly in conversation (not saved to file unless requested). If the user asks to save, use: `artifacts/reports/YYYY-MM-DD-morning-briefing.md`

## Quality Checklist (self-verify before presenting)
- [ ] All overdue items from `tracking/action-items.md` are surfaced
- [ ] Priority hierarchy is correctly applied (Red > Yellow > Blue > White)
- [ ] Today's Focus is limited to 3 items and tied to actual priorities
- [ ] Cross-org signals are specific, not generic filler
- [ ] Impact opportunities reference actual calendar or recent activity
- [ ] Quick Stats numbers are accurate to current tracker state
- [ ] No stale information — all data reflects the latest file state

## Integration Points
- **Action Item Extractor**: Reads tracker state for overdue and due-today items
- **Impact Journal**: Checks for logging gaps and surfaces opportunities
- **Meeting Summarizer**: References recent meeting outputs for cross-org signals
- **End of Day Rollup**: Morning briefing sets up what EOD rollup will close out
- **Strategy Critique**: Flags strategic items that may need deeper review
