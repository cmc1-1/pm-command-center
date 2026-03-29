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
- `templates/` — 13 PM document templates
- `skills/` — 6 automated workflow definitions
- `context/personal/` — Portable PM frameworks and methodology

## What's local-only (gitignored)
- Company-specific context (team, strategy, users, metrics)
- Operational tracking (action items, sprint data)
- Generated artifacts (meeting notes, PRDs, reports)
- Research data (interviews, surveys)
- Raw inputs (recordings, screenshots)

## First session at a new role
Say: "I'm starting a new role. Help me populate the onboarding checklist in INDEX.md."
Claude will guide you through filling in the company-specific context files.

## Daily usage
- "morning briefing" — Get daily situational awareness
- "summarize this meeting" — Process any meeting transcript
- "create a PRD for [feature]" — Generate context-aware PRDs
- "critique this strategy" — Red-team any strategy document
- "weekly status" — Generate stakeholder update
- "check action items" — Review tracker status
