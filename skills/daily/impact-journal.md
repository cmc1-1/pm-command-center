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

### Step 1: Structure the entry
Take the user's input and structure it into a complete impact entry:

| Field | How to Determine |
|-------|-----------------|
| **Date** | Today's date unless user specifies otherwise |
| **Description** | Clear, specific account of what happened. Rewrite vague inputs into concrete statements. "Helped with the launch" becomes "Led cross-functional coordination for API v2 launch, aligning engineering, design, and GTM on a compressed 3-week timeline" |
| **Impact Taxonomy** | Assign one or more tags from: SHIP (launched something), METRIC (moved a number), INFLUENCE (changed minds or direction), STRATEGY (shaped long-term direction), PROCESS (improved how the team works), MENTORSHIP (grew someone else), CROSS-ORG (drove alignment across teams), INNOVATION (introduced something new), TRUST (deepened stakeholder or customer trust), RESCUE (saved a project or prevented failure) |
| **Quantification** | If possible, attach a number: revenue impact, time saved, adoption rate, user count, velocity improvement, risk mitigated. Ask the user if they have a number but didn't mention one |
| **Stakeholders** | Who witnessed or benefited from this impact — important for corroboration later |
| **Artifact link** | Reference to any related file in the knowledge base (meeting notes, PRD, report) |

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
**Quantification**: [Number or "qualitative"]

[Full description — 2-4 sentences capturing what happened, why it mattered, and the outcome]

**Stakeholders**: [Names/roles who witnessed this]
**Artifact**: [Link to related file, if any]

---
```

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
- [ ] Entry description is specific and concrete, not vague
- [ ] At least one impact taxonomy tag is assigned
- [ ] Competency mapping is accurate (tag-to-competency logic is sound)
- [ ] Quantification is included or user was asked about it
- [ ] Entry is appended to the correct file with consistent formatting
- [ ] No duplicate entries — checked against existing journal
- [ ] Pattern detection only runs when 10+ entries exist

## Integration Points
- **Morning Briefing**: Checks impact journal for logging gaps and surfaces opportunities
- **End of Day Rollup**: Reminds user if no impact was logged today
- **Meeting Summarizer**: Meeting outcomes can be logged as impact entries
- **PRD Generator**: Shipping a PRD to development is a loggable SHIP event
- **Strategy Critique**: Strategic recommendations adopted are loggable INFLUENCE/STRATEGY events
