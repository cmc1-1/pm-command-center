# Risk Register

Last updated: YYYY-MM-DD

---

## Active Risks Dashboard

| Total | 🔴 Critical | 🟠 High | 🟡 Medium | 🟢 Low | Mitigated This Period |
|-------|-----------|---------|----------|--------|----------------------|
| 0 | 0 | 0 | 0 | 0 | 0 |

---

## Impact × Likelihood Matrix

Use this to score and prioritize risks:

```
              │ Low Impact   │ Med Impact   │ High Impact  │
──────────────┼──────────────┼──────────────┼──────────────┤
High          │ 🟡 Medium    │ 🟠 High      │ 🔴 Critical  │
Likelihood    │ Monitor      │ Active plan  │ Escalate now │
──────────────┼──────────────┼──────────────┼──────────────┤
Medium        │ 🟢 Low       │ 🟡 Medium    │ 🟠 High      │
Likelihood    │ Accept       │ Monitor      │ Active plan  │
──────────────┼──────────────┼──────────────┼──────────────┤
Low           │ 🟢 Low       │ 🟢 Low       │ 🟡 Medium    │
Likelihood    │ Accept       │ Accept       │ Monitor      │
──────────────┴──────────────┴──────────────┴──────────────┘
```

---

## Risk Register

### R-001: [Risk Title]

- **Date identified**: YYYY-MM-DD
- **Source**: [Meeting, planning session, stakeholder feedback, retrospective]
- **Category**: Technical | Resource | Timeline | Scope | Dependency | Market | Compliance | Organizational
- **Status**: 🔴 Active | 🟡 Monitoring | 🟢 Mitigated | ⚫ Closed | ⚪ Accepted

**Assessment:**
- **Impact**: High / Medium / Low — [What happens if this risk materializes? Be specific: "2-week delay to launch", "20% revenue miss", "$50K budget overrun"]
- **Likelihood**: High / Medium / Low — [How probable is this? Base on evidence, not gut feel]
- **Risk score**: 🔴 Critical | 🟠 High | 🟡 Medium | 🟢 Low (from matrix above)
- **Trend**: ↑ Increasing | → Stable | ↓ Decreasing

**Details:**
- **Description**: [What could go wrong — 2-3 sentences]
- **Leading indicators**: [Early warning signs that this risk is materializing. What would you see first?]
- **Trigger event**: [The specific event that turns this risk into an issue]

**Response plan:**
- **Strategy**: Mitigate | Transfer | Avoid | Accept
- **Mitigation actions**: [Specific steps to reduce likelihood or impact]
  1. [Action] — Owner: [Name] — Deadline: [Date] — Status: Done / In progress / Not started
  2. [Action] — Owner: [Name] — Deadline: [Date] — Status: [Status]
- **Contingency plan**: [If the risk materializes despite mitigation, what's the backup plan?]
- **Risk owner**: [Single person accountable for monitoring and mitigation]

**Review history:**

| Date | Reviewed By | Assessment Change | Notes |
|------|-----------|-------------------|-------|
| [Date] | [Name] | [Stable / Escalated / Downgraded] | [Brief note] |

---

### R-002: [Risk Title]
[Same structure — repeat for each risk]

---

## Risk Summary Table

| ID | Risk | Category | Score | Owner | Status | Last Reviewed |
|----|------|----------|-------|-------|--------|---------------|
| R-001 | [Title] | [Category] | 🔴🟠🟡🟢 | [Name] | Active/Monitoring/Mitigated | [Date] |
| R-002 | [Title] | [Category] | 🔴🟠🟡🟢 | [Name] | [Status] | [Date] |

---

## Common PM Risk Categories

Use these as a prompt when identifying risks — scan each category and ask "what could go wrong here?":

**Technical risks:**
- Key system dependency is unreliable or unproven
- Performance won't meet requirements at scale
- Security vulnerability in new feature area
- Data migration complexity underestimated
- Integration with third-party service could break

**Resource risks:**
- Key engineer leaves or is reassigned mid-project
- Team capacity lower than planned (PTO, on-call, attrition)
- Contractor availability uncertain
- Budget insufficient for needed work

**Timeline risks:**
- External deadline is immovable but scope isn't finalized
- Dependencies on other teams with different priorities
- Regulatory approval timeline uncertain
- Customer commitments create hard deadlines

**Scope risks:**
- Requirements still evolving during development
- Stakeholder adds "one more thing" mid-sprint
- Edge cases discovered late require rework
- Accessibility or compliance requirements missed

**Market / customer risks:**
- Competitor ships a similar feature first
- Customer needs shift between research and delivery
- Pricing or packaging assumptions invalid
- Key customer churns during development

**Organizational risks:**
- Reorg changes team structure or priorities
- Executive sponsor changes or loses interest
- Cross-team alignment breaks down
- Decision-making process stalls

---

## Maintenance Cadence
- **Weekly**: Scan active risks during sprint standup — any new leading indicators?
- **Biweekly**: Full risk register review during sprint planning — add new risks, update scores, close mitigated ones
- **Monthly**: Present risk summary to stakeholders — escalate critical risks proactively
- **After incidents**: Any production issue or missed deadline → check if it was a known risk or should be added as a new pattern
