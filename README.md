# PM Command Center

Personal AI-powered product management productivity system.

## Setup on a new machine

1. Clone this repo: `git clone [repo-url]`
2. Install Claude Code: `curl -fsSL https://claude.ai/install.sh | bash`
3. Navigate to project: `cd pm-command-center`
4. Start Claude Code: `claude`
5. Claude reads CLAUDE.md automatically and is ready to work

## What's included (committed to Git)
- `CLAUDE.md` — Master context file (personal section)
- `INDEX.md` — Knowledge base router
- `templates/` — 19 PM document templates
- `skills/` — 13 automated workflow definitions
- `context/personal/` — Portable PM frameworks and methodology
- `GUIDE.md` — Complete user manual and capability reference
- `docs/INTEGRATIONS.md` — Tool integration guide (Evisort stack)

## What's local-only (gitignored)
- Company-specific context (team, strategy, users, metrics)
- Operational tracking (action items, sprint data)
- Generated artifacts (meeting notes, PRDs, reports)
- Research data (interviews, surveys)
- Raw inputs (recordings, screenshots)

## Tool Integrations (Evisort Stack)
13 of 14 Evisort team tools have MCP servers. Connect them progressively:
- **Day 1-3**: Slack, Jira, Confluence → auto-post summaries, create tickets, pull onboarding docs
- **Week 2-3**: Amplitude, Productboard, GitHub → live metrics, roadmap sync, PR context
- **Month 1+**: Salesforce, Figma, LaunchDarkly, Grafana, Sentry → specialized workflows

See `docs/INTEGRATIONS.md` for full setup guide.

## First session at a new role
1. Say: "I'm starting a new role. Help me populate the onboarding checklist in INDEX.md."
2. Connect Tier 1 MCPs (Slack, Jira, Confluence)
3. Say: "onboarding accelerator" → auto-populate context files from connected tools

## Daily usage
- "morning briefing" — Get daily situational awareness
- "summarize this meeting" — Process any meeting transcript
- "create a PRD for [feature]" — Generate context-aware PRDs
- "critique this strategy" — Red-team any strategy document
- "weekly status" — Generate stakeholder update
- "check action items" — Review tracker status
- "log impact: [what you accomplished]" — Build promotion evidence
- "end of day" — EOD summary and tomorrow prep
- "AI research scan" — Stay on top of AI developments
- "market intel" — Legal tech landscape intelligence
- "bold idea lab" — Generate and test bold product ideas
