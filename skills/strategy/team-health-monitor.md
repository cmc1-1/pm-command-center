# Skill: Team Health Monitor (Quarterly)

## Metadata
- name: team-health-monitor
- trigger: "team health check", "team health monitor", "quarterly team review", "how is the team", "team playbook health"
- version: 1.0
- author: PM Command Center Team
- category: strategy

## Purpose
Run a structured 8-attribute self-assessment on the product team's functioning per Atlassian's Team Playbook Health Monitor. Identifies where the team is weakest, forces one committed fix for the next 90 days, and tracks trend across quarters.

The discipline: most team problems are invisible until they cascade into execution issues. This check makes them visible quarterly, before they cause damage.

**Cadence**: Quarterly (default). Can also be run ad-hoc after a major team change, a botched launch, or a perceived morale shift.

## Inputs
- **Required**: None (or named trio / team to focus on)
- **Optional**:
  - Comparison to last quarter's scores (if prior reports exist)
  - Include peer input (asks the user if they want to solicit 1-2 teammates for triangulation)
- **Auto-loaded context** (read silently):
  - `context/team/directory.md` — who's on the team
  - `context/team/stakeholder-map.md` — cross-functional partners
  - `context/decisions/decision-log.md` — recent decisions (coherence signal)
  - `tracking/action-items.md` — completion trend (execution signal)
  - `tracking/risks-and-blockers.md` — blocker patterns
  - `context/my/lessons-learned.md` — prior reflection signals
  - `artifacts/reports/*team-health*` — previous health monitor reports for trend

## Process

### Step 1: Brief the user on the 8 attributes

Display the framework before scoring:

| # | Attribute | What it measures |
|---|-----------|------------------|
| 1 | **Shared Understanding** | Does the team have a shared view of what we're doing and why? |
| 2 | **Clarity of Roles** | Does each person know what they own and what they don't? |
| 3 | **Balanced Team** | Do we have the skills / seniority / diversity needed for the work? |
| 4 | **Value & Metrics** | Is there a clear line between our work and measurable business value? |
| 5 | **Managed Dependencies** | Are dependencies with other teams / vendors identified and actively managed? |
| 6 | **Collaborative Pulse** | Do we communicate well? Do meetings work? Is async functioning? |
| 7 | **Proof of Progress** | Are we shipping? Is momentum visible? Does work ladder to outcomes? |
| 8 | **One Thing** | Is everyone aligned on the single most important thing this quarter? |

### Step 2: Score each attribute (1-5 scale)

For each attribute, ask the user **3 diagnostic questions** and then score.

```
## 1. Shared Understanding

Q1: If I asked each team member "what are we building this quarter and why", how similar would the answers be?
Q2: When priorities shift, does everyone hear the same update at the same time?
Q3: Is there a written "north star" document everyone can point to?

Current score: [1-5]
  1 = Everyone has a different mental model
  2 = Major gaps between people
  3 = Mostly aligned with occasional drift
  4 = Well aligned; minor variations
  5 = Fully shared mental model

Evidence for score: [What specific observations support this?]
Trend vs. last quarter: [↑ / → / ↓ / N/A]
```

Repeat the 3-question structure for each of the 8 attributes. Examples of diagnostic questions:

- **Clarity of Roles**: "Is there overlap where two people think they own the same thing? Or gap where nobody does? Can a new hire find a 'who owns X?' answer in under 2 min?"
- **Balanced Team**: "If a key person left tomorrow, is there coverage? Are we missing a critical skill we keep hiring consultants for?"
- **Value & Metrics**: "For each major initiative, can you state the metric it moves and the current baseline? Are we measuring outcomes or outputs?"
- **Managed Dependencies**: "What's the longest-open blocker tied to another team? Are dependencies surfaced in review or do they ambush us at deadline?"
- **Collaborative Pulse**: "Are meetings net-energizing or net-draining? Are async channels used for decisions or just announcements? Do people raise hard things or sit on them?"
- **Proof of Progress**: "What's been shipped this quarter that a customer would recognize? Are we moving the north star? Or moving only output metrics?"
- **One Thing**: "If I asked 'what matters most this quarter?' — would I get the same answer from everyone?"

### Step 3: Aggregate the scorecard

```
## Team Health Scorecard — [Quarter]

| # | Attribute | Score | Trend | Key observation |
|---|-----------|-------|-------|-----------------|
| 1 | Shared Understanding | X/5 | [↑/→/↓] | [1-line] |
| 2 | Clarity of Roles | X/5 | [↑/→/↓] | [1-line] |
| 3 | Balanced Team | X/5 | [↑/→/↓] | [1-line] |
| 4 | Value & Metrics | X/5 | [↑/→/↓] | [1-line] |
| 5 | Managed Dependencies | X/5 | [↑/→/↓] | [1-line] |
| 6 | Collaborative Pulse | X/5 | [↑/→/↓] | [1-line] |
| 7 | Proof of Progress | X/5 | [↑/→/↓] | [1-line] |
| 8 | One Thing | X/5 | [↑/→/↓] | [1-line] |
| | **Overall** | **X.X/5** | [↑/→/↓] | *8 attributes* |

### Strengths (scored ≥ 4)
- [Attribute] — [what's working well, name the behavior]

### Weak spots (scored ≤ 3)
- [Attribute] — [what's breaking, name the behavior]

### Biggest regression vs. last quarter
[Attribute that dropped the most, with hypothesis on why]

### Biggest improvement vs. last quarter
[Attribute that rose the most, with hypothesis on what worked]
```

### Step 4: Pick ONE thing to fix in the next 90 days

The Atlassian rule: a team health monitor that produces a long action list produces zero action. One committed fix per quarter.

Ask:
- "Of the weak spots, which one — if fixed — would most unlock the others?"
- "What's a 90-day intervention that would move this score from [current] to [+1]?"

Output:

```
## 90-Day Commitment

### The one thing
**Attribute**: [Name]
**Current score**: [X/5]
**Target score at next check**: [X+1/5]

### Intervention
[Specific practice change, structural change, or ritual to introduce]

### Success criteria (how we'll know in 90 days)
- [Observable behavior 1 — e.g., "Every PRD starts with the north-star metric it moves"]
- [Observable behavior 2]
- [Observable behavior 3]

### Owner
[Named person — usually the PM running this check]

### Review cadence
Mid-quarter check: [Date, 45 days out]
Next full health monitor: [Date, 90 days out]
```

**Rule**: If the intervention is "communicate more" or "be more aligned", push back — those aren't interventions, they're aspirations. Force specificity.

### Step 5: Save and integrate

1. Save to `artifacts/reports/YYYY-QN-team-health-monitor.md`
2. Add a summary entry to `context/my/lessons-learned.md`
3. If the intervention has team-wide implications, log a decision in `context/decisions/decision-log.md`
4. Create a calendar reminder for the mid-quarter check and the next full health monitor
5. Offer:
   - "Share a 1-page summary with the team via `email-drafter`?"
   - "If the 'Value & Metrics' score is low, run `north-star-metric-tree` to sharpen the metric side?"
   - "If the 'Managed Dependencies' score is low, refresh `context/team/stakeholder-map.md`?"
   - "Impact journal this? (Running the check itself is a PROCESS / MENTORSHIP impact)"

## Tool Integrations (when MCP connected)

**Slack** (if connected):
- Offer to run a micro-survey via DM (2 attributes at a time) to 3-5 team members for triangulation
- Post the 1-page summary to the team channel

**Jira** (if connected):
- For the 90-day intervention, create a parent ticket with sub-tickets for specific behaviors

**Calendar** (if connected):
- Create the mid-quarter check and next full check calendar events

## Quality Checklist (self-verify)
- [ ] All 8 attributes are scored, with evidence for each score
- [ ] Trend vs. last quarter is shown (or "N/A — first run" marked)
- [ ] Weak spots are specific behaviors, not abstract adjectives
- [ ] The 90-day commitment is singular (one thing, not three)
- [ ] Success criteria are observable, not aspirational
- [ ] The intervention is concrete (not "communicate more")
- [ ] An owner is named
- [ ] Mid-quarter and next-check dates are set

## What Makes This Skill Different From a Generic Retro
- Named 8-attribute framework — every team compared on the same yardstick
- Scored on 1-5 with evidence, not emoji voting
- Trend-tracked across quarters
- Forces ONE 90-day intervention, not a retro action list
- Connects team health to execution: weak "Value & Metrics" loops back to `north-star-metric-tree`; weak "Dependencies" loops back to stakeholder map

## Integration Points
- **Onboarding Accelerator**: New PMs run an initial team health monitor as part of onboarding to establish baseline
- **Product Trio Charter (M8)**: If "Clarity of Roles" is weak, use M8 to explicitly charter the PM/Design/TechLead decision rights
- **North Star Metric Tree (M1)**: If "Value & Metrics" is weak, M1 is the downstream fix
- **Stakeholder Map**: If "Managed Dependencies" is weak, refresh the map
- **Discovery Cadence (H3)**: If "Shared Understanding" is weak, weekly discovery rollups are a remedy
- **Decision Logger**: Quarterly team-health decision entries
- **Impact Journal**: Running the monitor quarterly is itself a PROCESS impact entry
- **Lessons Learned**: Observations feed the lessons-learned context file
