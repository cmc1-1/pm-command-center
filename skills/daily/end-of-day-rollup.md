# Skill: End of Day Rollup

## Metadata
- name: end-of-day-rollup
- trigger: "end of day", "EOD", "wrap up my day", "daily rollup"
- version: 1.0
- author: Chetan
- category: daily

## Purpose
Generate an end-of-day summary that reconstructs what was accomplished, identifies gaps in documentation or follow-through, and sets up tomorrow's priorities. Serves as both a personal accountability tool and a forcing function for keeping the knowledge base current.

## Inputs
- **Required**: None (reconstructs from current knowledge base state and today's artifacts)
- **Optional**:
  - Manual additions ("I also had an ad-hoc call with the VP of Engineering about resourcing")
  - Tomorrow's known commitments or calendar highlights
- **Auto-loaded context** (read before processing):
  - `tracking/action-items.md` — items created, completed, or updated today
  - `context/personal/impact-journal.md` — today's entries (filter by today's date)
  - `artifacts/meetings/` — any meeting summaries from today (files matching today's date)
  - `context/strategy/current-priorities.md` — to anchor tomorrow's priorities

## Process

### Step 1: Reconstruct the day
Scan the knowledge base for all activity from today:

| Activity Type | Where to Look | What to Capture |
|--------------|---------------|-----------------|
| **Meetings processed** | `artifacts/meetings/YYYY-MM-DD-*` | Count and list meeting summaries generated today |
| **Action items created** | `tracking/action-items.md` — items with today's date as source | New items added to tracker |
| **Action items completed** | `tracking/action-items.md` — items marked done today | Closed items with completion context |
| **Action items updated** | `tracking/action-items.md` — items with status changes today | Progress updates, reassignments, deadline changes |
| **Decisions made** | `context/decisions/decision-log.md` — entries from today | New decisions logged |
| **Artifacts generated** | `artifacts/` — files created or modified today | PRDs, reports, emails, or other outputs |
| **Impact logged** | `context/personal/impact-journal.md` — today's entries | Wins and outcomes recorded |

### Step 1b: Pull today's activity from connected tools (if MCP connected)

**Slack** (if connected):
- Count messages sent/received today
- List Slack threads Chetan started or actively participated in
- Check for unanswered threads or DMs

**Jira** (if connected):
- List tickets with status changes today
- List tickets commented on today
- Check sprint burndown progress vs. yesterday

**GitHub** (if connected):
- List PRs reviewed or commented on today
- List any deployments or merges today

### Step 2: Identify gaps
Compare what happened today against what a complete day looks like:

- **Meetings not summarized**: Were there meetings today (check references in action items or decisions) that don't have a corresponding summary in `artifacts/meetings/`? Flag them.
- **Impact not logged**: Did today include any accomplishments, launches, key decisions, or stakeholder wins that aren't in the impact journal? Flag them with a suggestion.
- **Action items stale**: Are there items that should have progressed today but didn't? Items assigned to the user that are aging without updates?
- **Follow-ups not sent**: Were there action items or decisions from today's meetings that require follow-up communication? Check if email drafts or messages were generated.

### Step 3: Generate rollup
Assemble the end-of-day summary:

```
## End of Day Rollup — [Date]

---

### Today's Accomplishments
- [Accomplishment 1 — tied to a priority or deliverable]
- [Accomplishment 2]
- [Accomplishment 3]

---

### Action Items Status

| Category | Count | Details |
|----------|-------|---------|
| Created today | [N] | [Brief list of new items] |
| Completed today | [N] | [Brief list of closed items] |
| Progressed | [N] | [Items with status updates] |
| Stale (no update) | [N] | [Items that should have moved but didn't] |

**Net change**: [+N new] / [-N closed] = [N total open]

---

### Decisions Made
- [Decision 1 — with reference to decision log ID]
- [Decision 2]
- (none today)

---

### Impact Logged
- [Impact entry summary]
- (none today — consider logging: [suggested entry based on activity])

---

### Tomorrow's Top 3 Priorities
Based on current priorities, overdue items, and upcoming deadlines:
1. [Priority 1 — with rationale]
2. [Priority 2 — with rationale]
3. [Priority 3 — with rationale]
```

### Step 4: Prompt cleanup
After presenting the rollup, offer to take immediate action on gaps:
- **Update action items**: "You have [N] stale items — want to update their status or deadlines?"
- **Log missing impact**: "Today's [meeting/launch/decision] looks like it could be an impact entry. Want to log it?"
- **Draft follow-ups**: "There are [N] action items from today's meetings that may need follow-up emails. Want to draft them?"
- **Summarize meetings**: "I see references to [meeting name] but no summary was processed. Have the transcript?"

## Output Format
Displayed directly in conversation (not saved to file unless requested). If the user asks to save, use: `artifacts/reports/YYYY-MM-DD-eod-rollup.md`

## Quality Checklist (self-verify before presenting)
- [ ] All meeting summaries from today are accounted for
- [ ] Action item counts are accurate to current tracker state
- [ ] Completed items are actually marked done, not just referenced
- [ ] Stale items are genuinely stale (assigned to user, no recent update, reasonable expectation of progress)
- [ ] Tomorrow's priorities are grounded in actual deadlines and current priorities, not generic
- [ ] Impact gap detection is specific (suggests what to log, not just "log something")
- [ ] The rollup is concise — aim for scannable in under 60 seconds

## Integration Points
- **Morning Briefing**: Tomorrow's Top 3 from EOD rollup feeds into the next morning's briefing focus
- **Action Item Extractor**: Reads tracker for today's item activity
- **Impact Journal**: Detects logging gaps and offers to create entries
- **Meeting Summarizer**: Identifies unprocessed meetings from today
- **Email Drafter**: Can generate follow-up communications for outstanding items
