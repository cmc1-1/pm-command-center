# Skill: Action Item Extractor

## Metadata
- name: action-item-extractor
- trigger: "extract action items", "what are the action items", "update action tracker"
- version: 1.0
- author: PM Command Center Team
- category: execution

## Purpose
Extract action items from any text source (meeting notes, emails, Slack threads, documents) and append them to the centralized action items tracker. Detect duplicates, update existing items, and maintain a clean single source of truth.

## Inputs
- **Required**: Source text containing potential action items (transcript, email, notes, or meeting summary)
- **Optional**:
  - Source label (e.g., "Stakeholder Review 04/15")
  - Default owner (if most items will belong to one person)
- **Auto-loaded context**:
  - `tracking/action-items.md` — current tracker state (for deduplication and ID sequencing)
  - `context/team/directory.md` — to resolve names to roles

## Process

### Step 1: Scan for commitment signals
Look for these patterns in the source text:

**Explicit commitments:**
- "I'll [verb]..." / "I will [verb]..."
- "Let me [verb]..."
- "I need to [verb]..."
- "I'm going to [verb]..."
- "Action item: [description]"
- "[Name] to [verb]..."
- "[Name] will [verb]..."

**Assigned tasks:**
- "Can you [verb]...?" (followed by agreement or not contested)
- "[Name], please [verb]..."
- "We need [Name] to [verb]..."
- "[Name] should [verb]..."
- "Who's going to [verb]...?" → "[Name] volunteers or is assigned"

**Implicit commitments:**
- "We should probably [verb]..." (only if someone agrees or no one objects)
- "It would be good to [verb]..." (only if there's a clear owner)
- "Somebody needs to [verb]..." (flag as needing owner assignment)

**NOT action items (exclude these):**
- Hypothetical discussions ("We could eventually...")
- Questions without resolution ("Should we consider...?")
- General observations ("It would be nice if...")
- Past tense reports ("I already did X")

### Step 2: Structure each action item

For each extracted item, determine:

| Field | How to Determine |
|---|---|
| **Owner** | Named person, or inferred from context ("I'll" = the speaker). If unclear, mark as "TBD — assign owner" |
| **Action** | Rewrite as a clear, specific, actionable task. Start with a verb. Short enough to scan in a table (aim for <15 words) |
| **Deadline** | Use explicit deadline if stated ("by Friday", "end of sprint", "before the board meeting"). If none stated, mark "TBD — confirm deadline" |
| **Priority** | P0 = blocking others or time-critical; P1 = important, this sprint; P2 = should do, flexible timing. Infer from urgency language and context |
| **Source** | Meeting name and date, email subject and date, or other source identifier |
| **Status** | Default: 🔵 Open. Use ⏳ Waiting if it depends on someone else's action first |
| **Notes** | Brief context: why this matters or what discussion led to it (one line) |

### Step 3: Deduplicate against existing tracker
Before adding, check `tracking/action-items.md` for:
- **Exact duplicates**: Same owner + very similar action text → skip, note "Already tracked as AI-[NNN]"
- **Carryover updates**: Same action exists but status should change → update the existing item's status/notes
- **Related items**: Similar but distinct actions → add as new but note the relationship

### Step 4: Assign IDs
- Read the current highest ID from `tracking/action-items.md`
- Assign sequential IDs starting from the next available number
- Never reuse IDs, even for items that were later deleted

### Step 5: Append to tracker
Add new items to the appropriate section of `tracking/action-items.md`:
- Items with deadlines this week → "Due This Week" section
- Items with past deadlines → "Overdue" section (shouldn't happen for new items, but handle edge case)
- Items waiting on others → "Waiting on Others" section
- All other open items → "Open Items" section

Update the Dashboard counts after appending.

### Step 6: Present results
Show the user:
1. Summary: "Extracted [N] action items from [source]"
2. Table of new items with IDs assigned
3. Any duplicates skipped (with reference to existing ID)
4. Any items that need owner or deadline confirmation
5. Any existing items whose status was updated

## Output Format

```
## Action Items Extracted from [Source]

### New Items Added
| ID | Owner | Action | Deadline | Priority |
|----|-------|--------|----------|----------|
| AI-042 | PM Name | Draft customer impact analysis for API v2 delay | Apr 17 | P0 |
| AI-043 | Mike | Share contractor onboarding requirements | Apr 16 | P1 |

### Duplicates Skipped
- "Update timeline for leadership" — already tracked as AI-034

### Status Updates to Existing Items
- AI-034: Status updated from 🔵 Open to 🔴 Overdue (deadline was Apr 12)

### Items Needing Confirmation
- AI-044: Owner unclear — "Someone should check with Finance" → needs owner
- AI-045: No deadline stated — "Look into the auth issue" → needs deadline

Tracker updated: tracking/action-items.md
```

### Tool Integrations (when MCP connected)

**Jira** (if connected):
- After extracting items, offer: "Create Jira tickets for these [N] items?"
- Auto-populate: Summary (action text), Assignee (owner), Priority, Due date, Description (source context + meeting link)
- Store Jira ticket key (e.g., PROJ-1234) alongside the AI-NNN ID in the tracker
- When updating existing items, sync status back to Jira

**Slack** (if connected):
- For items assigned to others, offer to send a Slack DM: "[Name], FYI — action item from [meeting]: [action]. Due: [date]. Jira: [link]"
- For overdue items during weekly maintenance, offer nudge DMs

## Weekly Maintenance Routine

When triggered by "action item cleanup" or "weekly tracker maintenance":

1. Move items completed >2 weeks ago to `tracking/archive/action-items-YYYY-QN.md`
2. Recalculate dashboard counts
3. Flag items that have been open >2 weeks without status change
4. Flag items in "Waiting on Others" >1 week without a nudge
5. Generate a summary of tracker health:
   - Total open items
   - Completion rate this week
   - Average age of open items
   - Items needing attention

## Integration Points
- **Meeting Summarizer**: Calls this skill automatically in Step 6 (auto-update)
- **Morning Briefing**: Reads the tracker to surface overdue and due-today items
- **Status Report**: Pulls completion data for the weekly update
- **Email Drafter**: Can generate nudge emails for overdue items owned by others
