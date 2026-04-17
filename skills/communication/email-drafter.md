# Skill: Email Drafter

## Metadata
- name: email-drafter
- trigger: "draft an email", "write an email to", "send a follow-up"
- version: 1.1
- author: PM Command Center Team
- category: communication

## Purpose
Draft context-aware emails calibrated to the audience, purpose, and tone. Draw on stakeholder relationship context, meeting history, and action items to produce emails that sound like the user wrote them (match voice from MY_PROFILE.md and writing-samples.md) — direct, structured, confident, no hedge words, lead never buried.

## Inputs
- **Required**: Who the email is to, and what it's about (can be brief)
- **Optional**:
  - Tone guidance (formal, casual, urgent, diplomatic)
  - Specific points to include or emphasize
  - Source material (meeting notes, action items, data)
  - Desired length target (ultra-short / short / medium / long)
- **Auto-loaded context**:
  - `context/team/directory.md` — recipient role and context
  - `context/team/stakeholder-map.md` — relationship notes, communication preferences, power/interest position
  - `context/my/writing-samples.md` — user's voice, phrasing patterns, and signature closers
  - `CLAUDE.md` + `MY_PROFILE.md` — style preferences, brand pillars
  - Recent `artifacts/meetings/` — if email is a meeting follow-up
  - `tracking/action-items.md` — if email references pending commitments

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
| CAB pre-read | Warm, specific | Medium (12-18 lines) | Session purpose → themes to discuss → specific ask → logistics (see `cab-runner` for full pattern) |
| CAB commitments memo | Appreciative, honest | Medium-long (15-25 lines) | Thank-you → what we heard → what we'll act on → what we won't (with reason) → timeline for next update |
| Launch announcement (customer-facing) | Confident, value-led | Medium (10-15 lines) | Customer benefit headline → what changes → how to use it → support resources |
| Pre-mortem summary (exec share) | Direct, neutral | Medium (10-15 lines) | Failed-future anchor → top 2 clusters → top 2 mitigations → kill conditions → verdict |

**For executive narrative type**: Write at business strategy altitude. Include one concrete data point early. Demonstrate second-order thinking — show you've considered implications beyond the immediate topic. Frame asks in terms of business impact, not task completion.

### Step 2: Determine audience tier and altitude
Before drafting, classify the recipient to pick the right altitude:

| Tier | Recipients | Altitude | Length guide |
|------|------------|----------|--------------|
| IC | Engineers, designers, analysts, peers at same level | Tactical, specific, artifact-linked | Short — 5-10 lines |
| Manager | Direct manager, skip-level peer managers | Operational + outcome-framed | Short-medium — 8-15 lines |
| Director | Cross-functional directors, your director's peers | Outcome-first, strategic implication called out | Medium — 10-20 lines |
| Exec | VPs, C-suite, board-adjacent | Strategic, business-impact-first, second-order thinking visible | Medium-long — 15-25 lines |

Rules of thumb by altitude:
- **IC**: Can include JIRA ticket IDs, code paths, specific file names. Use domain jargon freely.
- **Manager**: Summarize tactical detail; link to artifacts rather than embed them. Call out what you need from them.
- **Director**: Lead with outcome and business lens. Avoid per-ticket detail; roll up to theme.
- **Exec**: Lead with business impact in one sentence. Include one concrete data point. Name the decision you need. No jargon without gloss.

### Step 3: Check stakeholder context
Read `context/team/stakeholder-map.md` for the recipient:
- Where are they on the power/interest grid? (dictates how much context to provide)
- Do they prefer detail or brevity?
- Are they a decision-maker or an influencer?
- What's the current relationship temperature?
- Any sensitivities to be aware of (recent escalations, past disagreements)?

Adjust tone and level of detail accordingly. If the recipient isn't in the stakeholder map, flag this and suggest adding them.

### Step 4: Calibrate voice from writing samples
Load `context/my/writing-samples.md` and scan for:
- Signature openings the user favors (e.g., "Quick one —", "Wanted to flag —", or none at all)
- Phrasing patterns (short sentences vs. compound; bullets vs. prose)
- Closers the user uses (e.g., "— [Name]", "Thanks,", no signoff)
- Words the user avoids (corporate jargon, hedging like "just", "maybe", "I think")

Match this voice. If writing-samples.md is empty (new PM, pre-onboarding), default to: direct, structured, confident; short sentences; bulleted action items; clean closer.

### Step 5: Draft the email body
Apply the voice and altitude calibrations from Steps 2-4:
- Lead with the "so what" — never bury the lead
- Be direct but not blunt
- Use structure (brief bullets for action items, not walls of text)
- End with a clear next step or ask
- Avoid: corporate jargon, excessive hedging, apologetic language for things that don't warrant apology

### Step 6: Self-critique pass
Before presenting, run the draft through a critique filter. Flag and rewrite if any of these fire:

| Check | Red flag | Fix |
|-------|----------|-----|
| Buried lead | "Just checking in" / weather preamble before the ask | Move the ask/outcome to line 1-2 |
| Hedge words | "just", "maybe", "I think", "sort of", "kind of", "a bit" | Delete or replace with direct statement |
| Corporate jargon | "synergy", "leverage" (as verb), "circle back", "touch base", "reach out" | Replace with plain English |
| Weak asks | "Let me know your thoughts" / "Happy to discuss" with no specifics | Name the decision, deadline, and who owns next step |
| Apologetic opening | "Sorry to bother you" / "I know you're busy" | Delete unless actually apologizing for something concrete |
| Wall of text | Any paragraph > 4 lines | Break into bullets or split paragraph |
| Missing CTA | No clear next step at end | Add one line: what happens next, by when, by whom |
| Altitude mismatch | IC-level detail to an exec, or strategic fluff to an IC | Rewrite at correct altitude from Step 2 |

Keep the critique internal — don't show the checklist output to the user, just apply fixes.

### Step 7: Generate subject line
Subject line rules:
- Specific, not generic ("API v2 timeline update — action needed by Thursday" not "Quick update")
- Include urgency signals if applicable ("[Action needed]", "[Decision required]", "[FYI]")
- Under 60 characters when possible
- For exec emails: lead subject with outcome, not topic ("Approved H2 hiring plan" beats "H2 hiring discussion")

### Step 8: Present and offer delivery options
Show the draft and ask:
- "Create as Gmail draft?" (if Gmail MCP connected)
- "Post a shorter version to Slack?" (if Slack MCP connected)
- "Save to artifacts/emails/ for your records?"

### Step 9: Optional follow-up scheduling
If the email contains an ask with a deadline, offer:
- "Add a follow-up nudge to `tracking/action-items.md`?" — creates an entry so you remember to chase if no reply
- "Schedule a 'check in on this' reminder for [date]?" (if calendar MCP connected)
- For stakeholder-sensitive threads: "Want me to log this exchange in `context/team/stakeholder-map.md` under their relationship notes?"

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
- **CAB Runner (M6)**: Pre-read email and post-session commitments memo each have a template here
- **Launch Orchestrator (M7)**: Customer announcement, sales enablement, exec pre-launch briefing each map to a template here
- **Pre-Mortem Runner (H2)**: Exec-share of pre-mortem TL;DR uses the pre-mortem summary template
- **Product Strategy Memo (H7)**: Strategy memo distribution to leadership uses executive narrative template
- **PR/FAQ Generator (H1)**: Customer-facing narrative can be adapted into a launch announcement
- **Status Report**: Can format the weekly update as a stakeholder email
- **Morning Briefing**: Can suggest draft responses for urgent emails flagged in triage
