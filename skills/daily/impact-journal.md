# Skill: Impact Journal

## Metadata
- name: impact-journal
- trigger: "log impact", "record win", "impact entry", "I accomplished"
- version: 1.0
- author: PM Command Center Team
- category: daily

## Purpose
Capture wins, outcomes, and accomplishments in a structured format that builds a promotion-ready evidence base over time. Each entry is tagged with an impact taxonomy and mapped to Principal PM competencies, making it easy to assemble a promotion packet or performance review narrative.

## Inputs
- **Required**: Description of the accomplishment or outcome (can be a quick sentence or detailed account)
- **Optional**:
  - Impact taxonomy tag (if known — otherwise the skill infers it)
  - Quantification or metric movement
  - Stakeholders involved or audience
  - Link to related artifact (PRD, meeting notes, email thread)
- **Auto-loaded context** (read before processing):
  - `context/my/impact-journal.md` — existing entries for deduplication and pattern detection
  - `context/my/career-goals.md` — current career objectives and target role
  - `context/my/promotion-packet.md` — competency evidence inventory

## Process

### Step 1: Structure the entry (STAR-framed)
Take the user's input and structure it into a complete impact entry using a STAR frame (Situation / Task / Action / Result) — this produces promotion-grade evidence, not just a log.

| Field | How to Determine |
|-------|-----------------|
| **Date** | Today's date unless user specifies otherwise |
| **Short title** | Active-voice, outcome-led. "Led API v2 launch coordination" — not "API v2 launch" |
| **Situation** | 1 sentence — the context or problem. "Q3 API v2 launch was at risk due to engineering / GTM timeline mismatch" |
| **Task** | 1 sentence — what you were responsible for. "As PM, owned the cross-functional plan to compress timeline without dropping scope" |
| **Action** | 2-3 sentences — what YOU specifically did. Emphasis on your decisions, your framing, your leverage. Not "we did X" — "I did X" |
| **Result** | 1-2 sentences — the outcome, ideally quantified. Distinguish shipped output from measurable impact |
| **Impact Taxonomy** | Assign one or more tags from: SHIP (launched something), METRIC (moved a number), INFLUENCE (changed minds or direction), STRATEGY (shaped long-term direction), PROCESS (improved how the team works), MENTORSHIP (grew someone else), CROSS-ORG (drove alignment across teams), INNOVATION (introduced something new), TRUST (deepened stakeholder or customer trust), RESCUE (saved a project or prevented failure) |
| **Quantification** | If possible, attach a number: revenue impact, time saved, adoption rate, user count, velocity improvement, risk mitigated. Ask the user if they have a number but didn't mention one. If the number won't be known for weeks, mark as "Pending — check [date]" |
| **Stakeholders** | Who witnessed or benefited from this impact — important for corroboration later. For each, note their role relative to the impact (e.g., "Director of Eng — approved approach", "VP Sales — named beneficiary"). Corroboration quality > quantity |
| **Artifact link** | **Required whenever possible.** Reference the specific file(s) in the knowledge base that evidence this impact: PRD in `artifacts/prd/`, strategy memo in `artifacts/strategy-memos/`, launch brief in `artifacts/launches/`, meeting notes in `artifacts/meetings/`, pre-mortem in `artifacts/pre-mortems/`, decision log entry in `context/decisions/decision-log.md`, etc. Entries without an artifact link are "thin" evidence — flag this and push the user to produce one if feasible |

### Step 2: Map to Principal PM competency
Based on the entry content and taxonomy tags, map to one or more competencies:

| Competency | Signals |
|-----------|---------|
| **Strategic Thinking** | STRATEGY, INNOVATION — shaped direction, identified opportunity, made a non-obvious bet |
| **Cross-Org Influence** | CROSS-ORG, INFLUENCE — aligned multiple teams, changed stakeholder position, navigated politics |
| **Business Impact** | METRIC, SHIP — moved a number, launched a product, drove revenue or adoption |
| **Technical Depth** | SHIP, INNOVATION, PROCESS — made sound technical tradeoffs, understood system constraints |
| **Team Leadership** | MENTORSHIP, PROCESS, TRUST — grew people, improved team effectiveness, built culture |
| **Executive Communication** | INFLUENCE, TRUST — presented to leadership, framed complex topics clearly, built exec confidence |
| **Innovation** | INNOVATION, STRATEGY — introduced new approaches, challenged assumptions, created new value |

### Step 3: Append to impact journal
Add the structured entry to `context/my/impact-journal.md` in this format:

```
### [Date] — [Short title]

**Tags**: [TAXONOMY_TAG_1] [TAXONOMY_TAG_2]
**Competency**: [Competency mapping]
**Quantification**: [Number or "qualitative" or "Pending — check [date]"]

**Situation**: [1 sentence — context / problem]
**Task**: [1 sentence — what I owned]
**Action**: [2-3 sentences — what I specifically did]
**Result**: [1-2 sentences — measurable outcome]

**Stakeholders**: [Names/roles who witnessed this + their role relative to the impact]
**Artifact**: [Specific path to supporting file in knowledge base — e.g., artifacts/prd/2026-Q2-api-v2.md]
**Evidence strength**: [Strong (artifact + metric + corroborator) / Moderate (2 of 3) / Thin (1 of 3) / Anecdotal (0 of 3)]

---
```

**Evidence strength heuristic**: Promotion committees trust artifacts + metrics + corroboration. An entry with all three is "Strong" — this is the tier that survives a promotion review. Entries marked "Thin" or "Anecdotal" should trigger a follow-up: "Can we add an artifact link or ask [stakeholder] to confirm?"

### Step 4: Offer promotion packet update
After logging the entry, evaluate whether it is a strong example for any competency in `context/my/promotion-packet.md`:
- If the entry is a clear, compelling example — offer to add it to the relevant competency section in the promotion packet
- If the entry reinforces an existing example — offer to strengthen that section with the new data point
- If the entry represents a new competency area not yet covered — flag it as a gap-filler and recommend adding it

### Step 5: Pattern detection
After 10+ entries exist in the impact journal, provide a brief competency coverage analysis:
- Which competencies have strong evidence (3+ entries)?
- Which competencies are underrepresented (0-1 entries)?
- Are there patterns in the type of impact being logged (e.g., heavy on SHIP but light on INFLUENCE)?
- Suggest specific actions to build evidence in weak areas: "You have strong delivery evidence but limited cross-org influence examples. Look for opportunities to lead cross-team alignment in the next sprint."

Only run this analysis when a new entry is logged, not every time the file is read.

## Output Format

```
## Impact Logged

**[Short title]** — [Date]

| Field | Value |
|-------|-------|
| Tags | [TAXONOMY_TAGS] |
| Competency | [Mapped competencies] |
| Quantification | [Number or qualitative] |

> [Full description]

**Saved to**: context/my/impact-journal.md

### Promotion Packet
[Recommendation: add to packet / strengthens existing entry / not strong enough yet]

### Competency Coverage (if 10+ entries)
| Competency | Entries | Strength |
|-----------|---------|----------|
| Strategic Thinking | [N] | [Strong/Moderate/Gap] |
| Cross-Org Influence | [N] | [Strong/Moderate/Gap] |
| Business Impact | [N] | [Strong/Moderate/Gap] |
| Technical Depth | [N] | [Strong/Moderate/Gap] |
| Team Leadership | [N] | [Strong/Moderate/Gap] |
| Executive Communication | [N] | [Strong/Moderate/Gap] |
| Innovation | [N] | [Strong/Moderate/Gap] |

**Recommendation**: [One specific suggestion for building evidence in a weak area]
```

## Quality Checklist (self-verify before presenting)
- [ ] Entry uses STAR framing (Situation / Task / Action / Result) — not a vague paragraph
- [ ] At least one impact taxonomy tag is assigned
- [ ] Competency mapping is accurate (tag-to-competency logic is sound)
- [ ] Quantification is included, pending-with-date, or user was asked about it
- [ ] Artifact link points to a specific path in the knowledge base — not "see the doc"
- [ ] Evidence strength is rated (Strong / Moderate / Thin / Anecdotal)
- [ ] Entry is appended to the correct file with consistent formatting
- [ ] No duplicate entries — checked against existing journal
- [ ] Pattern detection only runs when 10+ entries exist

## Integration Points
- **Morning Briefing**: Checks impact journal for logging gaps and surfaces opportunities
- **End of Day Rollup**: Reminds user if no impact was logged today; flags days with no "Strong" evidence
- **Meeting Summarizer**: Meeting outcomes can be logged as impact entries (meeting notes path becomes the artifact link)
- **PRD Generator**: Shipping a PRD to development is a loggable SHIP event (PRD path becomes the artifact link)
- **PR/FAQ Generator (H1)**: Published PR/FAQ is a loggable STRATEGY / INFLUENCE event
- **Product Strategy Memo (H7)**: Adopted strategy memo is a STRATEGY / EXECUTIVE COMMUNICATION event
- **Pre-Mortem Runner (H2)**: Pre-mortem that prevented a failure is a RESCUE / PROCESS entry
- **Launch Orchestrator (M7)**: GA + Launch is the highest-leverage SHIP / METRIC entry — log at GA and again at T+30 with measured impact
- **Experiment Designer (H5)**: Shipped winning experiment is a METRIC entry with clean quantification
- **Team Health Monitor (M3)**: Running the quarterly monitor is itself a PROCESS / MENTORSHIP entry
- **LNO Prioritizer (M2)**: A week with strong L-task completion produces at least one Strong impact entry
- **Strategy Critique**: Strategic recommendations adopted are loggable INFLUENCE/STRATEGY events
