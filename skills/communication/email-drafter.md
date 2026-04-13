# Skill: Email Drafter

## Metadata
- name: email-drafter
- trigger: "draft an email", "write an email to", "send a follow-up"
- version: 1.0
- author: Chetan
- category: communication

## Purpose
Draft context-aware emails calibrated to the audience, purpose, and tone. Draw on stakeholder relationship context, meeting history, and action items to produce emails that sound like Chetan wrote them — direct, structured, confident.

## Inputs
- **Required**: Who the email is to, and what it's about (can be brief)
- **Optional**:
  - Tone guidance (formal, casual, urgent, diplomatic)
  - Specific points to include or emphasize
  - Source material (meeting notes, action items, data)
- **Auto-loaded context**:
  - `context/team/directory.md` — recipient role and context
  - `context/team/stakeholder-map.md` — relationship notes, communication preferences
  - `CLAUDE.md` — Chetan's writing style preferences
  - Recent `artifacts/meetings/` — if email is a meeting follow-up

## Process

### Step 1: Determine email type and calibrate

| Email Type | Tone | Length | Structure |
|---|---|---|---|
| Meeting follow-up | Warm, professional | Short (5-10 lines) | Summary → decisions → action items → next steps |
| Stakeholder update | Confident, concise | Medium (10-20 lines) | TL;DR → key metrics → progress → risks → next period |
| Request / ask | Direct, respectful | Short (5-8 lines) | Context → specific ask → deadline → why it matters |
| Nudge / follow-up | Friendly, firm | Very short (3-5 lines) | Reference original → gentle reminder → specific ask |
| Bad news / delay | Honest, solution-oriented | Medium (10-15 lines) | Situation → impact → what we're doing about it → timeline |
| Escalation | Factual, neutral | Medium (10-15 lines) | Context → issue → what's been tried → what's needed |
| FYI / sharing info | Brief, helpful | Short (5-8 lines) | Here's what → why it matters to you → action if any |
| Executive narrative | Strategic, confident | Medium-long (15-25 lines) | Strategic context → key insight → business implication → recommended action → what I need from you |

**For executive narrative type**: Write at business strategy altitude. Include one concrete data point early. Demonstrate second-order thinking — show you've considered implications beyond the immediate topic. Frame asks in terms of business impact, not task completion.

### Step 2: Check stakeholder context
Read `context/team/stakeholder-map.md` for the recipient:
- Do they prefer detail or brevity?
- Are they a decision-maker or an influencer?
- What's the current relationship temperature?
- Any sensitivities to be aware of?

Adjust tone and level of detail accordingly.

### Step 3: Draft the email
Follow Chetan's writing style (from CLAUDE.md):
- Lead with the "so what" — never bury the lead
- Be direct but not blunt
- Use structure (brief bullets for action items, not walls of text)
- End with a clear next step or ask
- Avoid: corporate jargon, excessive hedging, apologetic language for things that don't warrant apology

### Step 4: Generate subject line
Subject line rules:
- Specific, not generic ("API v2 timeline update — action needed by Thursday" not "Quick update")
- Include urgency signals if applicable ("[Action needed]", "[Decision required]", "[FYI]")
- Under 60 characters when possible

### Step 5: Present and offer delivery options
Show the draft and ask:
- "Create as Gmail draft?" (if Gmail MCP connected)
- "Post a shorter version to Slack?" (if Slack MCP connected)
- "Save to artifacts/emails/ for your records?"

### Tool Integrations (when MCP connected)

**Slack** (if connected):
- Offer: "Send as Slack DM instead?" (for internal recipients where Slack is more appropriate)
- For team-wide communications: "Post to [#channel] instead?"
- Auto-adjust format: Slack messages should be shorter, use emoji reactions for quick acknowledgment asks

**Confluence** (if connected):
- For longer updates or FYI-type content: "Publish as Confluence page and share the link instead?"

## Output Format

```
**To**: [recipient(s)]
**Subject**: [subject line]

[Email body]

---
Options:
- Create Gmail draft
- Edit before sending
- Save to artifacts/emails/
```

## Integration Points
- **Meeting Summarizer**: Calls this skill to draft follow-up emails after meetings
- **Action Item Extractor**: Can generate nudge emails for overdue items owned by others
- **Status Report**: Can format the weekly update as a stakeholder email
- **Morning Briefing**: Can suggest draft responses for urgent emails flagged in triage
