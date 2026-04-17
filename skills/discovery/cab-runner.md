# Skill: Customer Advisory Board (CAB) Runner

## Metadata
- name: cab-runner
- trigger: "plan a CAB", "customer advisory board", "CAB meeting", "CAB agenda", "customer council", "enterprise advisory"
- version: 1.0
- author: PM Command Center Team
- category: discovery

## Purpose
Plan and run a **Customer Advisory Board** (CAB) — the structured quarterly or semi-annual forum where a small group of high-value customers (typically enterprise or strategic) give product input, hear the roadmap, and feel heard. Inspired by Pragmatic Institute CAB guidance and SaaS CAB playbooks from companies like Gainsight, HubSpot, and Slack.

**The principle**: a CAB is **not** a sales event and **not** a "show them the roadmap and ask if they like it." It's a structured discovery forum where strategic customers shape product direction *before* commitments are made. The 80/20 rule applies: **80% listening, 20% telling**. A CAB where the PM talked more than the customers failed.

**Who this is for**: PMs in enterprise, B2B, or high-ACV SaaS contexts where strategic customer relationships exist. Less applicable to pure consumer products, though a "power user council" variant works.

## Inputs
- **Required**: Purpose of this CAB session (strategic theme, e.g., "Platform direction 2026", "AI feature rollout", "Post-acquisition roadmap")
- **Optional**:
  - Target date and format (in-person / virtual / hybrid)
  - Member list (if a CAB already exists) or member-selection criteria (if forming)
  - Length of session (default: half-day)
  - Prior CAB notes and action items (for continuity)
- **Auto-loaded context** (read silently):
  - `context/company/product-overview.md` — product scope and positioning
  - `context/strategy/current-priorities.md` — strategic direction to validate or shape
  - `context/users/personas.md` — especially enterprise personas
  - `context/users/feedback-themes.md` — recurring themes to surface
  - `context/competitors/matrix.md` — competitive context customers will raise
  - `context/team/stakeholder-map.md` — internal attendees by role
  - `tracking/risks-and-blockers.md` — issues CAB could help resolve
  - `artifacts/cab/` — prior CAB agendas, notes, and action items
  - `context/my/opportunity-solution-tree.md` — opportunities CAB can validate

## Process

### Step 1: Define the CAB's job-to-be-done for *this* session

Every CAB session should answer 1-2 specific strategic questions — not "general product input". Force specificity up front.

Ask:
- **What decision or direction do we need input on?** (e.g., "Should we prioritize depth in existing features or breadth into adjacent workflows for 2026?")
- **What would 'this CAB was worth it' look like?** (Specific, measurable — "3 members commit to beta", "clear signal on build vs. buy for X", "validated / invalidated the AI agent direction")
- **What's the risk of NOT running this CAB?** (If nothing, skip it — a CAB you don't need is a CAB that damages the charter)

Record as session-purpose block before agenda drafting.

### Step 2: Member selection / review (if forming or rotating)

A strong CAB has **8-12 members**, selected for strategic value and willingness to speak frankly — not for deal size alone.

Selection criteria:

| Dimension | What to look for | Avoid |
|-----------|-----------------|-------|
| **Segment representation** | Cover 2-3 strategic segments (by industry, size, use case) | Over-indexing on a single segment |
| **Usage depth** | Active power users who push the product | Customers who don't use the product much |
| **Voice / candor** | Customers who say hard things | Customers who only praise |
| **Influence** | Practitioners + executive sponsors | Only C-suite (they rarely know product details) |
| **Relationship** | Mix of long-term and newer customers | Only long-term (echo chamber) |
| **Deal status** | Include renewal-risk customers — they have the most to tell | Only at-peak-satisfaction customers |

**Rotation**: Rotate ~20% of members per year. A CAB with the same 10 people for 5 years has calcified.

### Step 3: Design the agenda (80/20 rule)

**The math**: in a 4-hour session, the product team talks for ~45 minutes total. Customers talk for ~3 hours. If the agenda doesn't enforce this, it will collapse.

Template half-day agenda:

| Time | Segment | Format | Who talks | Purpose |
|------|---------|--------|-----------|---------|
| 0:00–0:15 | Welcome + framing | Presentation | PM + exec sponsor | State the session question (Step 1), the 80/20 rule, and outcomes we want |
| 0:15–0:30 | Customer intros | Round-robin | Customers (2 min each) | Set expectation that *they* are the primary voices |
| 0:30–1:00 | Theme 1 — guided discussion | Semi-structured | Customers | Surface input on the first strategic question |
| 1:00–1:15 | Break | — | — | Re-energize; informal side conversations |
| 1:15–1:45 | Theme 2 — guided discussion | Semi-structured | Customers | Surface input on the second strategic question |
| 1:45–2:15 | Roadmap & direction preview | Short presentation + Q&A | PM (15 min) + Customers (15 min) | *Show minimum viable roadmap*, then *listen* for reactions |
| 2:15–2:45 | Breakout: small-group deep dives | 3 parallel groups of 3-4 | Customers | Deeper discussion on specific topics |
| 2:45–3:15 | Breakout readouts | Per-group summaries | Group reps | Each group reports top 3 themes |
| 3:15–3:45 | "If you were running product, what would you do differently?" | Round-robin | Customers | Direct candor — the highest-leverage 30 minutes |
| 3:45–4:00 | Commitments & close | PM + exec sponsor | Both | State what we heard, what we'll act on, what we won't, and when we'll report back |

**Rules**:
- No more than 20% of the agenda is product-team talking
- No sales pitches — the account team is not in the room for selling
- Every strategic question gets at least 30 minutes of customer-led discussion
- The "if you were running product" segment is non-negotiable — this is where CABs earn their keep

### Step 4: Design the discussion prompts

For each theme segment, design **3 layered prompts** — opening (broad), probing (specific), synthesis (directional):

```
### Theme: [Name]

**Session question**: [The strategic question from Step 1]

**Opening prompt** (invite broad input):
"[Prompt that gets everyone sharing — e.g., 'What's the biggest shift in how your team works this year that the product hasn't caught up to?']"

**Probing prompts** (drill into tensions):
- "[Follow-up that surfaces disagreement]"
- "[Follow-up that asks for evidence — 'give me a specific example from last quarter']"
- "[Follow-up that surfaces what people are NOT saying]"

**Synthesis prompt** (get to a directional signal):
"If you had to rank these three directions for us — [Option A], [Option B], [Option C] — how would you rank them, and what would change your mind?"
```

**Avoid**:
- Leading questions ("Don't you agree that X is important?")
- Yes/no questions (low information density)
- Feature-request prompts ("What features do you want?") — CABs shouldn't devolve into a wish list

### Step 5: Pre-work for members

Members should arrive ready to talk, not cold. Send 1 week ahead:

```
## CAB Pre-Read — [Session Date]

### Session purpose
[2-3 sentences — what we want to decide / validate]

### Discussion themes (please come ready to discuss)
1. [Theme 1 — with 2-3 pointer questions]
2. [Theme 2 — with 2-3 pointer questions]

### A specific ask from you
Please come prepared to share **one story** from the last 90 days that illustrates [specific topic].

### Logistics
[Date, time, location / virtual link, what to expect]

### Roster
[Member names + companies — helps members prepare and see who they'll be with]
```

**Rule**: No surprise pre-work at the session itself. Anything we need from members, ask in advance.

### Step 6: Define the internal team and their roles

The PM runs the session. But other internal roles are critical:

| Role | Responsibility | Who |
|------|---------------|-----|
| **Facilitator** | Runs agenda; enforces 80/20 rule; calls on quiet members | PM (this skill's user) |
| **Exec sponsor** | Opens the session; shows company commitment; occasional validator | VP Product or CEO |
| **Scribe** | Captures every customer quote verbatim (or near-verbatim); not a summarizer | Dedicated PM, APM, or Chief of Staff |
| **Subject-matter experts** | Available for 1-2 specific moments; otherwise silent | TL, Design Lead, Research |
| **Account team** | Greets members; handles logistics; silent in discussions | CSM / AE (usually in the room but non-speaking) |
| **Observer (optional)** | Silent; takes pattern notes | Other PMs, research, or exec |

**Rule**: The account team is not in the meeting to sell. If a customer raises a pricing or renewal question, the PM redirects — not the AE.

### Step 7: Synthesis plan (done within 48 hours after the session)

This is the step most teams skip and most why CABs fail to deliver value. Plan it *before* the session.

```
## Post-CAB Synthesis Plan

### Within 24 hours
- Scribe produces raw-quote doc, organized by theme
- PM drafts "what we heard" — top 5-7 themes with supporting quotes

### Within 48 hours
- Send members a "thank-you + top themes" email
- Share raw synthesis internally with product leadership

### Within 1 week
- PM publishes the "Commitments" memo: what we heard, what we'll act on, what we won't (and why), timeline for action
- Updates to:
  - `artifacts/cab/YYYY-QN-cab-notes.md`
  - `context/users/feedback-themes.md` — new themes added
  - `context/my/opportunity-solution-tree.md` — opportunities surfaced as OST nodes
  - `context/strategy/current-priorities.md` — if CAB shifted direction
  - `context/decisions/decision-log.md` — decisions influenced by CAB

### Within 90 days (before next CAB)
- Ship / advance at least 2-3 items CAB explicitly influenced
- Prepare "what we did based on your input" for next session — this is the trust loop
```

**Rule**: If a CAB produces nothing visible to members within 90 days, the next CAB has wasted goodwill. Members should see their input shape direction, or they stop engaging.

### Step 8: Generate the CAB plan artifact

```
# CAB Plan: [Quarter / Theme]
**Date**: [Session date]
**Format**: [In-person / virtual / hybrid]
**PM owner**: [From MY_PROFILE.md]
**Exec sponsor**: [Name]
**Members attending**: [List with companies]

---

## Session Purpose
[From Step 1]

## Session Question(s)
1. [Primary strategic question]
2. [Secondary, if any]

## Agenda
[Table from Step 3]

## Discussion Prompts per Theme
[From Step 4]

## Pre-Read Sent to Members
[From Step 5 — link to sent doc]

## Internal Team Roles
[From Step 6]

## Synthesis Plan
[From Step 7]

## Success Criteria
[Specific measurables — e.g., "3 members commit to beta", "clear directional signal on X"]

## Risks for This Session
[E.g., "Member A tends to dominate — we'll use the round-robin more aggressively"; "Topic X is contentious — we'll address it early while energy is high"]
```

### Step 9: Save and integrate

1. Save plan to `artifacts/cab/YYYY-QN-cab-plan.md`
2. After the session, save notes to `artifacts/cab/YYYY-QN-cab-notes.md`
3. Update `context/users/feedback-themes.md` with new themes
4. Create OST opportunity nodes for any new opportunities surfaced
5. Log to `context/decisions/decision-log.md` if direction shifted
6. Create calendar reminders: 48-hour synthesis, 1-week commitments memo, 90-day retrospective before next CAB
7. Offer follow-ups:
   - "Draft the pre-read email for members via `email-drafter`?"
   - "Draft the commitments memo after synthesis via `exec-update-writer`?"
   - "Log this CAB as a loggable impact entry? (Running a CAB = CROSS-ORG / TRUST / INFLUENCE)"
   - "Update `context/strategy/current-priorities.md` if direction shifted?"

## Tool Integrations (when MCP connected)

**Gong / Chorus** (if connected):
- Transcribe the session (with member consent)
- Extract direct quotes for the post-session synthesis doc

**Salesforce / CRM** (if connected):
- Pull member metadata (ACV, tenure, renewal date, product usage depth) for selection + prep
- Flag members whose renewal is at risk — CAB is a strategic touchpoint

**Slack** (if connected):
- Create `#cab-[date]` channel for members + internal team (post-session follow-up channel)

**Zoom / Teams** (if connected for virtual):
- Pre-stage breakout rooms matching the agenda breakout segment
- Record for the scribe (with member consent)

**Airtable / Notion** (if connected):
- Maintain the member roster database with attendance, topic interests, quote history
- Track commitments-to-act across sessions

## Quality Checklist (self-verify)
- [ ] Session has 1-2 specific strategic questions, not "general input"
- [ ] Agenda enforces 80/20 (customers talk ≥ 75% of the time)
- [ ] "If you were running product" segment is included
- [ ] Discussion prompts are layered (opening / probing / synthesis) — no leading questions
- [ ] Pre-read was sent 1 week ahead with a specific ask
- [ ] Internal roles are assigned (especially scribe, separate from facilitator)
- [ ] Synthesis plan has owners and dates — 48h / 1w / 90d
- [ ] Member selection is diverse across segments, tenure, and voice
- [ ] At least one renewal-risk or at-risk-relationship member is included
- [ ] Success criteria are specific and measurable

## What Makes This Skill Different From a Generic Customer Meeting
- Structured as a *forum*, not a sales event or feature request session
- 80/20 rule is enforced, not aspired to
- "If you were running product" segment surfaces unprompted candor
- Pre-work sets expectations; members arrive ready to talk
- Synthesis plan exists before the session — commitments get published, not buried
- Trust loop: members see their input shape direction within 90 days

## Integration Points
- **Discovery Cadence (H3)**: CAB themes feed into the weekly discovery rhythm; follow-up interviews with CAB members are high-signal
- **Opportunity Solution Tree**: New opportunities surfaced in CAB become OST nodes
- **Product Strategy Memo (H7)**: CAB input often informs the diagnosis; a strategy memo should cite CAB signal when available
- **Assumption Test Designer (H4)**: CAB is a low-cost desirability signal for enterprise-targeted solutions
- **PR/FAQ Generator (H1)**: CAB members are often the first external audience for a draft PR/FAQ — a "test gate" for enterprise framing
- **Decision Logger**: Decisions informed by CAB get explicitly tagged with CAB session source
- **Exec Update Writer**: The post-CAB commitments memo is a high-leverage exec comms artifact
- **Impact Journal**: Running a CAB that shifted direction = CROSS-ORG / TRUST / INFLUENCE / STRATEGY entry
- **Feedback Themes**: CAB synthesis feeds `context/users/feedback-themes.md` with enterprise-specific themes
