# PM Command Center

AI-powered product management productivity system — built for teams, personalized per PM.

## For PMs: Getting Started (5 minutes)

### 1. Clone the repo
```bash
git clone <repo-url> pm-command-center
cd pm-command-center
```

### 2. Run setup
```bash
# Mac/Linux
chmod +x setup.sh && ./setup.sh

# Windows (PowerShell)
.\setup.ps1
```

This copies templates to create your personal files — no merge conflicts on future updates.

### 3. Fill in your profile
Open `MY_PROFILE.md` and fill in your details: name, background, working style, tool stack. This is how the system personalizes all output for you.

### 4. Install Claude Code and start
```bash
curl -fsSL https://claude.ai/install.sh | bash
claude
```

### 5. First commands
- `"morning briefing"` — daily situational awareness
- `"summarize this meeting"` — paste any transcript
- `"log impact: [what you did]"` — build promotion evidence
- `"onboarding accelerator"` — auto-populate context from connected tools

### 6. Connect your tools (MCP)
See `docs/INTEGRATIONS.md` for setup. Priority order:
- **Day 1-3**: Slack, Jira, Confluence
- **Week 2-3**: Amplitude, Productboard, GitHub
- **Month 1+**: Salesforce, Figma, LaunchDarkly, Grafana, Sentry

## For Admins: Maintaining the System

### Pushing updates
When you update skills, templates, or shared context:
```bash
git add skills/ templates/ context/company.template/ context/my.template/ CLAUDE.md GUIDE.md INDEX.md
git commit -m "Update: [description]"
git push origin main
```

PMs pull updates with zero conflicts — all personal files are gitignored.

### What's shared (committed to git)
- `CLAUDE.md` — Team framework + AI instructions
- `MY_PROFILE.template.md` — Blank profile for new PMs
- `INDEX.md` — Knowledge base router
- `GUIDE.md` — Complete user manual
- `skills/` — 13 automated workflow definitions
- `templates/` — 19 PM document templates
- `context/company.template/` — Blank company context templates
- `context/my.template/` — Blank personal context templates
- `docs/` — Integration guide, architecture, patterns

### What's personal (gitignored, per-PM)
- `MY_PROFILE.md` — Each PM's identity, style, preferences
- `context/my/` — Personal context (career goals, impact journal, promotion packet)
- `context/company/` — Company context (product overview, tool stack, team norms)
- Company-specific context (team, strategy, users, metrics, competitors)
- Operational tracking (action items, sprint, risks)
- Generated artifacts (meeting notes, PRDs, reports)

## Getting Updates
```bash
git pull origin main
```
Only shared files update. Your `MY_PROFILE.md` and `context/my/` are untouched.

## What's Included

| Layer | Contents | Count |
|-------|----------|-------|
| Skills | Automated PM workflows | 13 |
| Templates | Document structures | 19 |
| Personal context templates | Career, frameworks, methodology | 11 |
| Company context templates | Product overview, tool stack, norms | 3 |

## Daily Usage
- `"morning briefing"` — Situational awareness digest
- `"summarize this meeting"` — Process any transcript
- `"create a PRD for [feature]"` — Context-aware PRD generation
- `"critique this strategy"` — 7-dimension strategy scoring
- `"log impact: [outcome]"` — Promotion evidence pipeline
- `"end of day"` — EOD summary + tomorrow prep
- `"AI research scan"` — Stay on top of AI developments
- `"market intel"` — Competitive landscape intelligence
- `"bold idea lab"` — Generate and stress-test product ideas
- `"onboarding accelerator"` — Bootstrap context from connected tools

Full guide: [GUIDE.md](GUIDE.md)
