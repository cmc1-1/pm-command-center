# Skill: Onboarding Accelerator

## Metadata
- name: onboarding-accelerator
- trigger: "onboarding accelerator", "pull company context", "bootstrap context", "auto-populate context"
- version: 1.0
- author: PM Command Center Team
- category: daily

## Purpose
Turbocharge Week 1 onboarding by pulling existing documentation and data from connected tools (Confluence, Jira, Productboard, Slack, Amplitude) into the PM Command Center's context files. What normally takes 2 weeks of manual population can be done in 2-3 days with this skill.

**Run this once** after connecting Tier 1 and Tier 2 MCPs. It's a one-time bootstrap, not a recurring skill.

## Inputs
- **Required**: At least one MCP connected (Tier 1: Slack, Jira, Confluence recommended)
- **Optional**:
  - Specific focus area ("just pull team info" or "focus on strategy docs")
  - Confluence space names to prioritize
  - Jira project keys to scan
- **Auto-loaded context**:
  - `INDEX.md` — to know which files need population and their current status
  - All `context/` files — to check what's already populated vs. empty

## Process

### Step 1: Check connected tools
Detect which MCPs are available and report:
```
Connected tools detected:
- [x] Confluence — ready to pull docs
- [x] Jira — ready to pull sprint/team data
- [ ] Productboard — not connected (skip roadmap pull)
- [x] Slack — ready to pull team info
- [ ] Amplitude — not connected (skip metrics pull)
```

Proceed with whatever is available. More MCPs = more auto-population.

### Step 2: Pull from Confluence (if connected)
Search for and extract key documents:

| Search For | Target Context File | Search Strategy |
|-----------|-------------------|----------------|
| Product overview, vision, mission docs | `context/product-overview.md` | Search: "product overview", "product vision", "about [product name]" |
| Strategic priorities, quarterly plans | `context/strategy/current-priorities.md` | Search: "priorities", "Q[N] plan", "strategic plan", "roadmap" |
| OKRs, goals, objectives | `context/strategy/okrs.md` | Search: "OKR", "objectives", "key results", "goals" |
| Org structure, team pages | `context/team/org-context.md` | Search: "org chart", "team structure", "org context" |
| Onboarding docs | General understanding | Search: "onboarding", "new hire", "getting started" |
| Architecture docs | Technical understanding | Search: "architecture", "system design", "tech stack" |

For each document found:
- Summarize key information (don't copy verbatim — these are internal docs)
- Extract relevant facts into the appropriate context file format
- Note the Confluence page title and URL as source reference
- Flag anything that looks outdated (check "last modified" date)

### Step 3: Pull from Jira (if connected)
Extract operational context:

| Pull | Target Context File | How |
|------|-------------------|-----|
| Current sprint board | `tracking/current-sprint.md` | Read active sprint: committed stories, assignees, status, sprint goal |
| Team members | `context/team/directory.md` | Extract unique assignees across recent sprints: name, role (infer from ticket types) |
| Blocked tickets | `tracking/risks-and-blockers.md` | Query tickets with "Blocked" status or "blocker" labels |
| Recent epics | Understanding of active work streams | Read epic summaries for the last 2 sprints |

### Step 4: Pull from Productboard (if connected)
Extract product context:

| Pull | Target Context File | How |
|------|-------------------|-----|
| Current roadmap items | `context/strategy/current-priorities.md` (supplement) | Read "Now" and "Next" columns |
| Top feature requests | `context/users/feedback-themes.md` (seed) | Read highest-voted features with request counts |
| Company/product info | `context/product-overview.md` (supplement) | Read product descriptions and positioning |

### Step 5: Pull from Slack (if connected)
Extract team and org context:

| Pull | Target Context File | How |
|------|-------------------|-----|
| Channel list + descriptions | Understanding of team structure | Read channel names and purposes — infer team org |
| User profiles (team members) | `context/team/directory.md` (supplement) | Read profiles: name, title, timezone, status |
| Key pinned messages | General context | Check pinned messages in main product channels for important standing context |

### Step 6: Pull from Amplitude (if connected)
Extract metrics context:

| Pull | Target Context File | How |
|------|-------------------|-----|
| Key dashboards | `context/metrics/north-star.md` | Read dashboard names and primary metrics — identify north star |
| Metric values | `context/metrics/baselines.md` | Pull current values for key metrics as baselines |

### Step 7: Present summary and update INDEX.md
After all pulls complete, present:

```
## Onboarding Accelerator — Results

### Files Populated
| Context File | Source | Confidence | Needs Review? |
|-------------|--------|-----------|---------------|
| product-overview.md | Confluence: "Product Vision 2026" | High | Skim for accuracy |
| current-priorities.md | Confluence + Productboard | Medium | Verify with manager |
| current-sprint.md | Jira: Sprint 42 | High | Accurate as of now |
| team/directory.md | Slack + Jira | Medium | Add missing roles |
| ... | ... | ... | ... |

### Still Needs Manual Population
- [ ] context/team/stakeholder-map.md — no automated source (build from 1:1s)
- [ ] context/users/personas.md — needs user research review
- [ ] context/competitors/matrix.md — partially seeded from domain-expertise.md
- [ ] ... 

### Recommended Next Steps
1. Review each populated file for accuracy (30 min)
2. Have your first 1:1 with manager — fill gaps in priorities and OKRs
3. Start processing meetings to build institutional memory
4. Run "morning briefing" tomorrow to see the system with real context
```

Update INDEX.md status flags:
- Change ⬜ to ✅ for files that were successfully populated
- Keep ⬜ for files that still need manual input

## Output Format
Displayed directly in conversation. Populated context files are written in place.

## Quality Checklist (self-verify before presenting)
- [ ] Only populated files where source data was found (no guessing)
- [ ] Each populated file notes its source for traceability
- [ ] Confidence levels are honest (High = directly from authoritative doc, Medium = inferred, Low = partial)
- [ ] INDEX.md status flags are updated
- [ ] Files that need manual review are clearly flagged
- [ ] No sensitive data (credentials, PII) was pulled into context files

## Error Handling
- If a tool is connected but returns no results for a search: skip that file, note "No relevant docs found — populate manually"
- If Confluence has too many results: prioritize by "last modified" date (most recent = most relevant)
- If Jira project key is unknown: list available projects and ask user to pick
- If any pull fails: continue with remaining tools, report failures at end

## Integration Points
- **Morning Briefing**: Immediately more useful after onboarding accelerator runs (real sprint data, real metrics)
- **Meeting Summarizer**: Can map speakers to roles using populated team directory
- **PRD Generator**: References real personas, priorities, OKRs after population
- **All Skills**: Benefit from richer context — this skill is the bootstrap that makes everything else smarter
