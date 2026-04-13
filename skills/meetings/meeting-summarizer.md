# Skill: Meeting Summarizer

## Metadata
- name: meeting-summarizer
- trigger: "summarize this meeting", "process meeting notes", "meeting summary"
- version: 1.0
- author: PM Command Center Team
- category: meetings

## Purpose
Transform raw meeting transcripts (primarily Zoom auto-transcripts) into structured, actionable meeting notes. Automatically extract decisions, action items, stakeholder sentiment, and key quotes. Update the knowledge base with new information.

## Inputs
- **Required**: Meeting transcript (text file, pasted text, or file path)
- **Optional but recommended**:
  - Meeting type (standup | 1:1 | sprint-planning | sprint-retro | stakeholder-review | customer-interview | design-review)
  - Attendees and their roles (if not obvious from transcript)
  - Related PRD or project name
- **Auto-loaded context** (read before processing):
  - `context/team/directory.md` — to map speaker names to roles
  - `context/strategy/current-priorities.md` — to flag relevance
  - `tracking/action-items.md` — to check for carryover items
  - `context/decisions/decision-log.md` — to detect conflicts with prior decisions
  - `CLAUDE.md` — for output preferences

## Process

### Step 1: Classify the meeting type
If the user didn't specify the type, infer it from the transcript content:
- Multiple short status updates from different people → **standup**
- Two people, career/feedback/relationship topics → **1:1**
- Story estimation, capacity, backlog grooming → **sprint-planning**
- What went well / what didn't / improvements → **sprint-retro**
- Status updates to leadership, approvals, budget → **stakeholder-review**
- User pain points, workflow descriptions, feature requests → **customer-interview**
- UI/UX discussion, mockup feedback, accessibility → **design-review**

### Step 2: Clean the transcript
Zoom auto-transcripts have specific quirks to handle:
- Speaker labels may be inconsistent (sometimes full name, sometimes first name only). Normalize to consistent names using `context/team/directory.md` if available.
- Timestamps may be present — strip them from the summary but preserve for quote attribution if needed.
- Filler words, false starts, and crosstalk are common — ignore these in the summary.
- "You're on mute" / "Can you hear me" / "Let me share my screen" — skip entirely.
- Auto-transcription errors are common with technical terms — use product context to correct obvious errors (e.g., "jeer-uh" → "Jira").

### Step 3: Extract structured content
Process the transcript in this priority order (matching the user's priorities):

**Priority 1 — Decisions & rationale**
Scan for decision signals:
- Explicit: "Let's go with...", "We've decided...", "Approved", "Let's do X"
- Implicit: "So we're aligned on...", "I think everyone agrees...", "Moving forward with..."
- Capture: What was decided, why (rationale), who made/approved the decision, and whether it's reversible
- Cross-reference with `context/decisions/decision-log.md` — flag if any new decision contradicts a previous one

**Priority 2 — Action items with owners**
Scan for commitment signals:
- Explicit: "I'll do X", "Can you handle Y?", "Action item: Z"
- Implicit: "Let me look into...", "I need to check on...", "We should probably..."
- Assigned: "Mike, can you...", "Sarah will take care of..."
- For each action item extract: Owner, Action, Deadline (explicit or inferred), Source context (the discussion that led to it)
- If deadline is not stated, mark as "TBD — needs confirmation"
- Cross-reference with `tracking/action-items.md` — check for duplicates or carryovers
- Generate unique ID in format AI-[NNN] continuing from highest existing ID

**Priority 3 — Stakeholder sentiment**
For each attendee, assess:
- Overall tone: Supportive / Concerned / Neutral / Frustrated / Excited
- Key concern or interest (one line)
- Shift from previous meetings (if prior sentiment data exists in `context/team/stakeholder-map.md`)
- Flag if someone raised the same concern in consecutive meetings (pattern detection)

**Priority 4 — Key quotes**
Preserve verbatim quotes that are:
- Strategically significant ("If we don't do X, we'll lose the account")
- Revealing of stakeholder position ("I'll approve the extension but I need data first")
- Useful for future reference (customer pain point descriptions, technical constraints)
- Limit to 3-5 quotes maximum — only the ones that genuinely matter

**Priority 5 — Cross-Org Signal Detection**
Scan for mentions of other teams' projects, shared platform dependencies, parallel initiatives, or synergy opportunities. For each signal detected:
- What team is involved
- What initiative or project was mentioned
- Potential relevance to our work
- Suggested action (reach out, track, align, no action needed)

### Step 4: Apply meeting-type-specific processing

**Standup:**
- Keep it minimal — focus only on blockers and status changes
- No sentiment tracking needed
- Output should be compact (aim for <15 lines)
- Flag any blocker that has persisted for 2+ days

**1:1 with manager or reports:**
- Track career discussion themes (feedback given, feedback received, growth areas)
- Note relationship dynamics and trust signals
- Flag any commitments about promotions, projects, or development opportunities
- Append to the running 1:1 history for this person

**Sprint planning / retro:**
- Extract committed stories and estimated velocity
- For retros: capture what went well, what didn't, and improvement actions
- Link to relevant PRDs or epics

**Stakeholder / exec review:**
- Heighten decision and approval tracking
- Capture political dynamics and power signals
- Note any budget, timeline, or scope changes
- Flag items that need escalation or follow-up

**Customer / user interview:**
- Switch to interview synthesis mode:
  - Extract pain points with verbatim quotes
  - Capture current workflow description
  - Note feature requests (explicit and implied)
  - Assess emotional intensity (frustration level)
  - Tag willingness-to-pay or switching signals
- Update `context/users/feedback-themes.md` with new patterns

**Design review:**
- Capture design decisions and their rationale
- Note open UX questions
- Flag accessibility concerns raised
- Track design iteration status (which version, what changed)

### Step 5: Generate output
Use the meeting summary template (`templates/meeting-summary-template.md`).
Save to: `artifacts/meetings/YYYY-MM-DD-{meeting-type}-{brief-topic}.md`

### Step 6: Auto-update knowledge base
After generating the summary, automatically update these files:

| Condition | Update Target | What to Append |
|---|---|---|
| Any decisions made | `context/decisions/decision-log.md` | Decision record with ID, date, rationale |
| Any action items found | `tracking/action-items.md` | New items with IDs in the Open section |
| Discussed carryover items | `tracking/action-items.md` | Status updates on existing items |
| Stakeholder sentiment captured | `context/team/stakeholder-map.md` | Updated sentiment + date |
| Customer feedback discussed | `context/users/feedback-themes.md` | New or reinforced themes |
| Strategy/priority changes | `context/strategy/current-priorities.md` | Updated priorities if changed |
| New information about product | `context/product-overview.md` | Only if significant new context |
| Cross-org signals detected | `context/cross-org/initiative-tracker.md` | New initiative entries or updates to existing ones |

### Step 7: Offer follow-up actions
After presenting the summary, ask if the user wants to:
- Draft a follow-up email to attendees
- Create Jira/Linear tickets from action items (if MCP connected)
- Post a summary to a Slack channel (if MCP connected)
- Generate prep notes for the next occurrence of this recurring meeting
- Log impact from this meeting? (if decisions influenced or outcomes achieved)

## Output Format
See `templates/meeting-summary-template.md` for the complete output structure.

### Tool Integrations (when MCP connected)
After generating the summary and updating the knowledge base:

**Slack** (if connected):
- Post a formatted summary to the relevant Slack channel (ask which channel on first use, remember the mapping)
- Thread replies with the action items list for easy reference

**Jira** (if connected):
- For each new action item, offer to create a Jira ticket with: summary, assignee, priority, due date, and link back to meeting summary
- If a Jira ticket is referenced in the transcript, update its comments with the meeting context

**Confluence** (if connected):
- Publish the meeting summary as a Confluence page under the team's meeting notes space
- Link related Jira tickets in the Confluence page

## Quality Checklist (self-verify before presenting)
- [ ] Every decision has a rationale and a "decided by" attribution
- [ ] Every action item has an owner (no orphaned items)
- [ ] No action items are duplicates of existing items in tracking/
- [ ] Decision conflicts with prior decisions are flagged
- [ ] Stakeholder sentiment is tracked for all key participants
- [ ] Meeting type-specific processing was applied
- [ ] Output is saved to the correct file path
- [ ] Knowledge base updates are identified and listed

## Error Handling
- If transcript quality is too poor to extract reliable information, flag sections as "[unclear — verify with attendees]"
- If speaker names can't be resolved, use the names as they appear in the transcript and note "Speaker identification uncertain"
- If meeting type can't be determined, default to a general format and ask the user to confirm
