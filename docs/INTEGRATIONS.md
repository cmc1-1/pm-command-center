# Tool Integrations Guide — Evisort Product Team Stack
Last updated: 2026-04-13

---

## Overview

The PM Command Center integrates with Evisort's product team tools via MCP (Model Context Protocol) servers. When connected, skills automatically upgrade — pulling live data, pushing outputs to shared tools, and auto-populating context files that would otherwise require manual entry.

**Key principle**: Every skill works without MCPs (local-only mode). MCPs add superpowers but are never required. Connect them progressively as you onboard.

**Evisort advantage**: The team already uses Claude Code. MCP integrations are a natural extension of an AI-forward culture.

---

## Evisort Tool Stack

### Business Context
| Tool | Purpose | MCP Available |
|------|---------|--------------|
| Workday Salesforce | CRM — customer data | Yes (Official) |
| Sigma (Evisort) | BI tool — combining data sources | No |
| Sigma (Workday) | BI tool — migration pending | No |

### Daily Tools
| Tool | Purpose | MCP Available |
|------|---------|--------------|
| Productboard | Feature ideation & roadmap | Yes (Community) |
| Jira2 (Workday hosted) | Eng task management | Yes (Atlassian Official) |
| PT Planner | Workday global planning tool | Unknown |
| LaunchDarkly | Feature flag configuration | Yes (Official) |
| Figma | Design platform | Yes (Official) |
| Miro | Whiteboarding & dot voting | Yes (Official, Beta) |
| Confluence | Workday documentation (primary) | Yes (Atlassian Official) |
| Notion | Historical documentation (eng mainly) | Yes (Official) |
| Camtasia | Video recording & annotation | No |
| Amplitude | Feature & analytics tracking | Yes (Official) |
| Slack - Dev | Main P&T workspace | Yes (Official) |
| Slack - Evisort | Historical workspace | Yes (Official) |

### Eng Context
| Tool | Purpose | MCP Available |
|------|---------|--------------|
| Sentry | Error tracking & analytics | Yes (Official) |
| Grafana | Eng dashboards & monitoring | Yes (Official) |
| Mailgun | Email tracking & notifications | No |
| Evisort GitHub | Source control | Yes (Official) |
| Workday GitHub | Workday MCPs access | Yes (Official) |

### SSO / Access
| Tool | Purpose |
|------|---------|
| Evisort Okta | Evisort systems SSO |
| Workday Okta | Workday gated apps |
| Evisort Zscaler | Prod/main environment access |

**Score: 13 of 14 daily/eng tools have MCP servers.** Only Sigma lacks one (use Amplitude for analytics instead).

---

## Connection Priority

### Tier 1 — Connect Day 1-3 (biggest daily impact)

#### Slack (Dev workspace)
**MCP**: Official Slack MCP Server
**Setup**: Install from `@anthropic-ai/slack-mcp-server` or configure via Slack developer portal
**What it enables**:
- Morning briefing scans key channels for overnight @mentions and threads
- Meeting summaries auto-post to relevant channels after processing
- Action item nudges sent as DMs for overdue items
- Cross-org signal detection monitors other teams' channels
- Email drafter can send as Slack DM when more appropriate
**Skills enhanced**: morning-briefing, meeting-summarizer, action-item-extractor, email-drafter, end-of-day-rollup

#### Jira (Atlassian MCP — covers both Jira and Confluence)
**MCP**: Official Atlassian MCP Server (51+ tools)
**Setup**: Install from `@atlassian/atlassian-mcp-server` — one server covers both Jira and Confluence
**What it enables**:
- Action items from meetings become Jira tickets automatically
- Sprint context auto-populates `tracking/current-sprint.md` — no manual entry
- Morning briefing shows sprint burndown, assigned tickets, approaching deadlines
- Blocker detection from Jira blocked ticket status
- End of day rollup includes ticket movement summary
- Decision logger creates follow-up Jira tickets when decisions generate action items
**Skills enhanced**: meeting-summarizer, action-item-extractor, morning-briefing, end-of-day-rollup, decision-logger, prd-generator
**Context auto-populated**: `tracking/current-sprint.md`, `tracking/risks-and-blockers.md` (blocked items)

#### Confluence (same Atlassian MCP)
**What it enables**:
- Onboarding accelerator reads existing Confluence docs to auto-populate context files — cuts onboarding from 2 weeks to 2-3 days
- PRDs publish directly to Confluence for team visibility
- Meeting summaries publish to Confluence meeting notes space
- Decision log syncs to shared Confluence decision log page
- Knowledge search before generating output (check if something already exists)
**Skills enhanced**: onboarding-accelerator, prd-generator, meeting-summarizer, decision-logger
**Context auto-populated**: `context/product-overview.md`, `context/strategy/current-priorities.md`, `context/strategy/okrs.md`, `context/team/org-context.md`

---

### Tier 2 — Connect Week 2-3 (strategic depth)

#### Amplitude
**MCP**: Official Amplitude MCP Server
**Setup**: Configure via Amplitude developer settings
**What it enables**:
- Metrics auto-populate: north star metric, key funnels, baselines
- Morning briefing shows metric trends, anomalies, significant changes
- PRD generator pulls real metric values for business cases ("Current conversion: 12%, target: 18%")
- Strategy critique grounds feedback in actual data
- QBR generation pulls quarterly metric trends automatically
**Skills enhanced**: morning-briefing, prd-generator, strategy-critique, bold-idea-lab
**Context auto-populated**: `context/metrics/north-star.md`, `context/metrics/baselines.md`

#### Productboard
**MCP**: Community MCP server (stable, 40-49 tools)
**What it enables**:
- Innovation pipeline syncs with feature request data
- Roadmap context auto-populates current priorities
- Bold idea lab checks existing ideas before brainstorming new ones
- PRD generator pulls customer request counts for feature context
**Skills enhanced**: bold-idea-lab, prd-generator, onboarding-accelerator
**Context auto-populated**: `context/strategy/current-priorities.md` (supplement), `context/users/feedback-themes.md` (seed)

#### GitHub (Evisort + Workday)
**MCP**: Official GitHub MCP Server
**Setup**: Configure via GitHub developer settings or personal access token
**What it enables**:
- Technical context from repo structure, recent PRs, code changes
- PRD generator references actual API structure and data models
- Meeting prep before eng meetings: scan recent commits and PRs
- Launch checklist verifies feature branches merged, CI passing
- End of day rollup includes PRs reviewed or merged
**Skills enhanced**: prd-generator, morning-briefing, end-of-day-rollup
**Builds**: Technical Depth competency (Principal PM competency #4)

---

### Tier 3 — Connect Month 1+ (specialized value)

#### Salesforce
**MCP**: Official Salesforce MCP Server
**What it enables**: Customer data for personas, deal context for business cases, customer health signals
**Skills enhanced**: prd-generator, bold-idea-lab, market-intelligence

#### Figma
**MCP**: Official Figma MCP Server
**What it enables**: Pull latest designs before design reviews, reference mockups in PRDs, link design decisions to frames
**Skills enhanced**: prd-generator, meeting-summarizer (design reviews)

#### LaunchDarkly
**MCP**: Official LaunchDarkly MCP Server (3 hosted servers)
**What it enables**: Feature flag status for launch checklists, rollout monitoring, experiment results
**Skills enhanced**: morning-briefing, launch readiness workflows

#### Grafana + Sentry
**MCP**: Both have official MCP servers
**What they enable**: System health in morning briefing, error spike alerts, production incident awareness
**Skills enhanced**: morning-briefing
**Builds**: Technical credibility with eng team

#### Notion
**MCP**: Official Notion MCP Server
**What it enables**: Access to legacy Evisort documentation (historical context before Confluence)
**Skills enhanced**: onboarding-accelerator (one-time historical pull)

#### Miro
**MCP**: Official Miro MCP Server (Beta, 80+ tools)
**What it enables**: Read boards from ideation sessions, capture workshop outputs into innovation pipeline
**Skills enhanced**: bold-idea-lab (post-workshop capture)

---

## Context Auto-Population Map

With MCPs connected, these context files populate automatically instead of requiring manual entry:

| Context File | Manual Today | Auto Source | When |
|-------------|-------------|------------|------|
| `tracking/current-sprint.md` | You type it | Jira sprint board | Daily via morning briefing |
| `context/metrics/north-star.md` | You type it | Amplitude dashboards | Weekly or on morning briefing |
| `context/metrics/baselines.md` | You type it | Amplitude metrics | On first connection + weekly |
| `context/strategy/current-priorities.md` | You type it | Productboard roadmap + Confluence | On onboarding + monthly |
| `tracking/risks-and-blockers.md` | You type it | Jira blocked items + Sentry alerts | Daily via morning briefing |
| `context/team/directory.md` | You type it | Slack profiles + Jira assignees | On onboarding accelerator |
| `context/product-overview.md` | You type it | Confluence product docs | On onboarding accelerator |
| `context/strategy/okrs.md` | You type it | Confluence OKR pages | On onboarding accelerator |
| `context/users/feedback-themes.md` | You type it | Productboard feature requests | On onboarding + monthly |

---

## Automation Reference

Workflows that become fully or partially automatic with MCPs:

| Workflow | Before MCPs | After MCPs |
|----------|------------|-----------|
| Process meeting → track actions | Manually copy to Jira | Auto-create Jira tickets with assignees |
| Process meeting → share summary | Copy/paste to Slack | Auto-post formatted summary to channel |
| Process meeting → team docs | Manual Confluence page | Auto-publish to Confluence space |
| Morning briefing → sprint status | Read stale local file | Pull live Jira sprint data |
| Morning briefing → metrics | Read stale local file | Pull live Amplitude data |
| Morning briefing → messages | Manually check Slack | Auto-scan channels and @mentions |
| Overdue items → follow-up | Manual email/Slack | Auto-send Slack DM nudges |
| PRD → team visibility | Manual Confluence copy | Auto-publish to Confluence + create Jira epic |
| Onboarding → context setup | 2 weeks manual population | 2-3 days via onboarding accelerator |
| Launch readiness → checks | Manual verification | Auto-check Jira + GitHub CI + LaunchDarkly flags |

---

## MCP Setup in Claude Code

To connect an MCP server, add it to your Claude Code settings:

```
claude mcp add <server-name> <command>
```

Or edit `.claude/settings.json` directly. See Claude Code documentation for detailed MCP configuration.

### Recommended Connection Order

1. **Atlassian (Jira + Confluence)**: `@atlassian/atlassian-mcp-server` — one install, two tools
2. **Slack**: `@anthropic-ai/slack-mcp-server` — requires Slack app creation or API token
3. **Amplitude**: Official Amplitude MCP — requires API key
4. **GitHub**: `@github/github-mcp-server` — requires personal access token
5. **Productboard**: Community server — check registry for latest
6. **Remaining Tier 3**: Connect as needed

### Verification After Connection

After connecting each MCP:
1. Run a simple test command to verify the connection works
2. Run the relevant skill to verify integration steps activate
3. Check that context auto-population works (e.g., morning briefing shows Jira data)

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| MCP server won't connect | Check auth token, verify network access (Zscaler may need to be active for Evisort tools) |
| Skill output doesn't include MCP data | Verify the MCP is listed in `claude mcp list`. Skills check for connection before attempting MCP steps |
| Jira ticket creation fails | Verify Jira project key and permissions. Check if Workday hosted Jira has API restrictions |
| Slack posting to wrong channel | Configure preferred channels in the skill's first run. System will remember the mapping |
| Amplitude returns no data | Verify dashboard IDs and metric names in the MCP configuration |
| Skills feel slower with MCPs | MCP calls add latency. Morning briefing may take 15-20 seconds instead of 5 with all MCPs active |

---

*Connect progressively. Each MCP makes the system smarter. By Week 3, you'll wonder how you worked without them.*
