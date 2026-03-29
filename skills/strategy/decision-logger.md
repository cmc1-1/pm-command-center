# Skill: Decision Logger

## Metadata
- name: decision-logger
- trigger: "log this decision", "record decision", "we decided"
- version: 1.0
- author: Chetan
- category: strategy

## Purpose
Capture product decisions with full context — rationale, alternatives considered, who decided, and whether it's reversible. Detect conflicts with prior decisions. Maintain a searchable institutional memory that answers "why did we do X?"

## Inputs
- **Required**: The decision (stated by user or extracted from meeting/email)
- **Optional**:
  - Context / problem that prompted the decision
  - Alternatives that were considered
  - Who decided
  - Source (meeting, email, Slack)
- **Auto-loaded context**:
  - `context/decisions/decision-log.md` — existing decisions (for conflict detection and ID sequencing)
  - `context/strategy/current-priorities.md` — to assess relevance

## Process

### Step 1: Structure the decision
If the user provides a casual statement ("We decided to push the launch to May 15"), expand it into a full decision record by asking clarifying questions:
- What prompted this decision? (context)
- What other options were considered? (alternatives)
- Why was this option chosen? (rationale)
- Who made or approved this? (decided by)
- Can this be reversed, and at what cost? (reversibility)
- Should this be revisited at a specific date? (review date)

If the decision was extracted by the Meeting Summarizer, most of this context will already be available from the meeting notes — don't re-ask what's already known.

### Step 2: Conflict detection
Scan `context/decisions/decision-log.md` for potential conflicts:
- **Direct contradiction**: New decision reverses a prior one (e.g., D-012 said "launch April 1" and new decision says "launch May 15")
- **Tension**: New decision creates pressure on a prior commitment (e.g., extending a timeline while a customer commitment remains unchanged)
- **Dependency**: New decision depends on a prior one that may no longer hold

If conflicts are found:
- Flag them clearly in the decision record (Related decisions field)
- Ask the user: "This appears to conflict with D-[NNN]. Should I mark D-[NNN] as superseded?"
- If confirmed, update the prior decision with a note: "Superseded by D-[NNN] on [date]"

### Step 3: Assign ID and categorize
- Read the highest existing ID from the decision log
- Assign the next sequential ID (D-001, D-002, etc.)
- Tag with relevant categories: scope, timeline, technical, design, resource, process, strategy, customer

### Step 4: Append to decision log
- Add a new row to the "Recent Decisions" summary table
- Add the full decision record below existing records
- Update the "Last updated" timestamp

### Step 5: Cross-update related files
- If the decision changes priorities → update `context/strategy/current-priorities.md`
- If the decision involves a timeline commitment → add to `tracking/action-items.md` if there's a follow-up action
- If the decision affects a specific PRD → note in the relevant PRD file

### Step 6: Present confirmation
Show the user:
1. The formatted decision record
2. Any conflicts detected (with resolution options)
3. Files updated
4. Suggestion: "Should I inform any stakeholders about this decision?"

## Integration Points
- **Meeting Summarizer**: Calls this skill automatically when decisions are extracted
- **Strategy Critique**: References the decision log when evaluating strategy coherence
- **Status Report**: Pulls recent decisions for the weekly update
- **PRD Generator**: References relevant past decisions when drafting requirements
