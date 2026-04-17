# Product Trio Charter — Template

> **How to use this template**: A Product Trio is the working unit of discovery and delivery: **Product (PM) + Design (EM/Design Lead) + Engineering (Tech Lead)**. This charter captures how the three will decide together, who owns what, and how conflicts are resolved. Inspired by Marty Cagan / SVPG. Fill this out jointly in a single 60-90 minute session. Revisit quarterly or when a trio member changes. Save the completed charter to `artifacts/charters/[team-name]-trio-charter-YYYY-MM-DD.md`.
>
> **Principle**: Decision-right confusion is the single most common root cause of trio dysfunction. This charter exists to prevent that.

---

## Trio Identity

**Team / product area**: [e.g., Checkout, Creator Experience, Growth-Activation]
**Charter version**: 1.0
**Effective date**: [Date]
**Revisit date**: [Date, quarterly default]

### Members

| Role | Name | Primary responsibility | Secondary interest |
|------|------|-----------------------|-------------------|
| Product (PM) | [Name] | Value — why we're building this and for whom | Viability — does the business benefit |
| Design (Design Lead / Sr Designer) | [Name] | Usability — can people actually use it | Desirability — do people want it |
| Engineering (Tech Lead) | [Name] | Feasibility — can we build and operate it | Value — engineering shaping the what |

### Extended trio (consulted, not core)
- **Data / Analytics**: [Name] — on-call for measurement questions
- **User Research**: [Name] — on-call for discovery questions
- **Marketing / Sales / Support**: [Name per function] — consulted at defined moments

---

## 1. What We Believe About Product

[3-5 sentences stating the trio's shared beliefs. This is not generic — it's this trio's stake in the ground. Examples of things to state:
- Discovery is continuous, not phased
- Outcomes > outputs
- Opinions are cheap; evidence decides
- We ship the smallest thing that delivers value, then learn
- Engineering participates in discovery, not just delivery
- Design is a thinking partner, not a service function]

---

## 2. Decision Rights (RAPID / DACI / Custom)

Use this matrix to make decision rights explicit. For each decision type, state who Recommends, who Approves, who's Consulted, who's Informed, and who has a veto (if any).

| Decision type | Recommend | Approve | Consult | Inform | Veto? |
|---------------|-----------|---------|---------|--------|-------|
| What problem to solve (opportunity selection) | PM | Trio | UXR, stakeholders | Company | None |
| Which solution to pursue | Trio | Trio | Customers, UXR | Stakeholders | Any trio member |
| Scope of an MVP / first slice | Trio | Trio | — | Stakeholders | TL (feasibility) |
| Technical architecture | TL | TL | PM, Design | Trio | TL |
| UX / interaction design | Design | Design | Trio | Stakeholders | Design |
| Release timing | Trio | PM | TL (readiness), Design (polish) | Stakeholders | TL (quality floor) |
| Kill / pivot a solution | Trio | Trio | Stakeholders | Company | None |
| Pricing / positioning | PM | PM + Marketing | Trio | Sales | None |
| Accessibility bar | Design | Design | Trio | — | Design |
| SLO / reliability targets | TL | TL | PM (business impact) | Trio | TL |

**Rule for vetoes**: A veto is a *no* in their domain of expertise (TL on feasibility, Design on usability), not a blanket override. Vetoes must be explained in the same conversation, not announced and walked away from.

**Escalation**: If the trio cannot resolve a decision in [agreed window — usually 3 business days], escalate to [named Director / VP / skip-level].

---

## 3. Working Cadences

| Ritual | Frequency | Who attends | Purpose | Duration |
|--------|-----------|-------------|---------|----------|
| Trio sync | Weekly (e.g., Mon 30 min) | PM + Design + TL | Align on the week — discovery progress, delivery status, risks | 30 min |
| Discovery review | Weekly | Trio + UXR | Customer insights, assumption tests, OST updates | 45 min |
| Delivery check | Weekly / per sprint | Trio + team | Delivery progress, blockers, scope pressure | 30 min |
| Quarterly trio retro | Quarterly | Trio only (no team) | How is the trio itself working? Refresh this charter | 60 min |
| Ad-hoc decision meeting | As needed | Decision-relevant subset | One specific decision when async fails | 30-45 min |

**Async defaults**: Anything that's informational goes async (channel / doc comment). Meetings are for decisions, debate, or deep synthesis.

---

## 4. Discovery & Delivery Split

**Default split of PM / Design / TL time**:

| Role | Discovery % | Delivery % | Planning / Org % |
|------|-------------|-----------|------------------|
| PM | [40%] | [30%] | [30%] |
| Design | [30%] | [60%] | [10%] |
| TL | [20%] | [70%] | [10%] |

**How discovery shows up for each role**:
- **PM**: Customer interviews, assumption tests, OST maintenance, strategy memos
- **Design**: Prototypes, Wizard-of-Oz tests, usability sessions, design critiques
- **TL**: Technical spikes, feasibility prototypes, architecture discovery, platform constraints exploration

**Non-negotiable**: Every trio member spends at least **2 hours per week on discovery**, even in heavy delivery weeks. Delivery-only weeks are a charter violation unless explicitly declared for an incident.

---

## 5. How We Handle Common Conflict Modes

### Conflict: "TL says it's infeasible; PM insists it's required"
- State the *cost curve*, not just "hard / easy" — what does 1 week, 1 month, 1 quarter buy?
- PM makes the business case for each rung; TL maps the technical cost honestly
- Escalate with a choice set (not a plea) if unresolved

### Conflict: "Design wants more polish; PM wants to ship"
- Define the **polish floor** — what's non-negotiable for launch (accessibility, core flow clarity)
- Everything above the floor is *nice-to-have* and deferrable
- Design has veto on the floor; PM has the call on everything above

### Conflict: "PM wants to scope up; TL wants to scope down"
- Use the pre-agreed MVP definition as the anchor
- Any scope change requires the trio, not bilateral PM↔TL negotiation
- If scope creep is chronic, add it to the quarterly retro

### Conflict: "The data doesn't tell us which of two options is right"
- Default to a test, not a debate (see `skills/discovery/assumption-test-designer.md`)
- If testing isn't feasible, PM makes the call with the trio's input; reversibility matters — prefer the more-reversible option

### Conflict: "Stakeholder is bypassing the trio to get their feature built"
- All three escalate jointly, not individually
- Point stakeholder back to the discovery process
- If persistent, add the stakeholder to the OST opportunity conversation

---

## 6. Communication Norms

**Within the trio**:
- Disagreement in the meeting, unity in front of the team
- No silent dissent — if you disagreed in the room, you advocate for the decision outside the room
- "I changed my mind" is welcomed, not mocked

**With the team**:
- The trio speaks with one voice on direction
- Each function speaks authoritatively in their domain (TL on feasibility, Design on craft, PM on priority)

**With stakeholders**:
- Updates go through one channel (defined below) — stakeholders don't get private side-channels
- Requests go to the PM first; PM triages to the trio

---

## 7. Shared Artifacts & Ownership

| Artifact | Primary owner | Trio touches it when |
|----------|---------------|---------------------|
| Opportunity Solution Tree | PM | Weekly — during discovery review |
| PRD | PM (authored), Design + TL (co-reviewed) | Before engineering investment |
| Technical design doc | TL (authored), PM + Design (informed) | Before major technical investment |
| Design system contribution | Design (authored), Trio (reviewed) | When introducing net-new patterns |
| Launch brief | PM (authored), Trio (reviewed) | At phase-gate decisions |
| Retrospective notes | Rotating | Monthly |

---

## 8. Anti-Patterns We Agree to Avoid

- [ ] **Feature factory** — counting output instead of measuring outcomes
- [ ] **PM-as-project-manager** — PM reduced to ticket-herding while Design and TL do the thinking
- [ ] **Design-as-service** — "give me a screen for X" instead of including Design in the *what*
- [ ] **Engineering-as-implementers** — TL handed a spec instead of shaping the solution
- [ ] **Consensus theater** — nodding along in the meeting, dissenting after
- [ ] **HIPPO (highest-paid person's opinion)** — unchallenged executive input bypasses the trio
- [ ] **Roadmap-as-promise** — treating a roadmap like a commitment in a discovery environment
- [ ] **Discovery skipped for speed** — declaring "we already know what to build" without testing the critical assumption

---

## 9. Health Signals

**Monthly self-check** — the trio rates each on 1-5:

| Signal | Current rating (1-5) | Notes |
|--------|---------------------|-------|
| Decisions are getting made at the trio level, not escalated | | |
| Each role is spending appropriate time in discovery | | |
| We disagree productively, not quietly | | |
| Stakeholders are routed through the trio, not around it | | |
| We're shipping outcomes, not features | | |
| The team feels aligned on direction | | |

Scores ≤ 3 on any line trigger a 30-minute trio conversation in the next sync.

---

## 10. Signatures

By signing, each trio member commits to operating by this charter and to flagging when they see it violated — including by themselves.

| Role | Name | Signature / Date |
|------|------|------------------|
| PM | [Name] | |
| Design | [Name] | |
| TL | [Name] | |

---

### Change Log
| Date | Change | Reason |
|------|--------|--------|
| [Date] | Charter v1.0 adopted | Initial trio formation |

---

## Formatting Notes

- Keep this charter to 2-3 pages when printed — if it grows beyond that, it's likely drifting into a process document
- Revisit quarterly at minimum; anytime a trio member changes, rewrite sections 1, 2, and 10
- Save the signed copy to `artifacts/charters/`
- Link from `context/team/directory.md` so new hires can find it
- Consider pairing with `skills/strategy/team-health-monitor.md` — "Clarity of Roles" attribute reads directly off this charter
