# Launch Checklist: [Feature / Product Name]

> **Purpose**: End-to-end readiness checklist covering product, GTM, support, legal, and analytics for a single launch.
> **When to use**: 4-6 weeks before launch. Pair with `launch-orchestrator` for phase-gated rollout (fishfood → teamfood → dogfood → beta → GA).
> **Audience**: Launch DRI (you), cross-functional launch team, exec go/no-go approvers.

## Launch Metadata
- **Feature**: [Name]
- **PRD**: [Link to PRD]
- **Target launch date**: YYYY-MM-DD
- **Launch type**: GA / Beta / Limited / Internal
- **Rollout strategy**: Big bang / Phased (10%→50%→100%) / Feature flag / Region-by-region
- **Launch owner (DRI)**: [Name — typically the PM]
- **Go/no-go decision date**: [Date — typically 2-3 days before launch]

---

## RACI for Launch

| Function | Person | Responsibility |
|----------|--------|---------------|
| Product (PM) | [Name] | **Accountable** — owns the launch end-to-end |
| Engineering | [Name] | **Responsible** — feature complete, deploy, monitoring |
| Design | [Name] | **Responsible** — final assets, design QA |
| QA | [Name] | **Responsible** — test plan execution, sign-off |
| Customer Success | [Name] | **Consulted** — trained, escalation plan ready |
| Marketing | [Name] | **Consulted** — announcement, positioning |
| Sales | [Name] | **Informed** — enablement materials, talking points |
| Legal/Compliance | [Name] | **Consulted** — review complete (if applicable) |
| Exec sponsor | [Name] | **Informed** — go/no-go approval (if required) |

---

## T-minus Checklist

### T-14 days: Foundation

**Engineering:**
- [ ] Feature code complete and merged to staging
- [ ] Feature flag configured (if phased rollout)
- [ ] Performance testing complete — no regressions above [threshold]
- [ ] Security review complete (if applicable)
- [ ] Database migrations tested and reversible
- [ ] Monitoring dashboards created (error rates, latency, key events)
- [ ] Alerting configured for anomalies

**Design:**
- [ ] Final UI/UX matches approved mockups
- [ ] Design QA complete — pixel-level review on target devices/browsers
- [ ] Empty states, error states, loading states all handled
- [ ] Accessibility check passed (WCAG 2.1 AA minimum)

**Product:**
- [ ] Acceptance criteria validated against PRD
- [ ] Edge cases tested with realistic data
- [ ] Rollback plan documented and tested
- [ ] Success metrics instrumented and baseline measured

### T-7 days: Readiness

**QA:**
- [ ] Full regression test suite passed
- [ ] Exploratory testing complete — no P0/P1 bugs open
- [ ] Cross-browser/device testing complete
- [ ] Load testing complete (if user-facing at scale)
- [ ] Bug triage: all launch-blocking bugs resolved or accepted

**Documentation:**
- [ ] Help center articles written and reviewed
- [ ] API documentation updated (if applicable)
- [ ] Internal knowledge base updated
- [ ] Release notes drafted (internal + external versions)
- [ ] Changelog entry prepared

**Customer Success:**
- [ ] CS team briefed on feature, common questions, known limitations
- [ ] Support scripts/macros created for expected inquiries
- [ ] Escalation path defined (CS → Engineering for launch issues)
- [ ] FAQ document created for frontline support

### T-3 days: Go/No-Go

**Go/no-go meeting:**
- [ ] All checklist items above are green or have accepted exceptions
- [ ] Launch owner presents readiness status to stakeholders
- [ ] Decision recorded: GO / NO-GO / CONDITIONAL (with conditions listed)
- [ ] If NO-GO: revised date set, blockers identified, owners assigned

**Marketing & Sales (if applicable):**
- [ ] Announcement copy finalized (blog, email, social, in-app)
- [ ] Sales team briefed — battle cards and talking points delivered
- [ ] Customer advisory board notified (if enterprise feature)
- [ ] Press/analyst briefing scheduled (if major launch)

### T-1 day: Final prep

- [ ] Deploy to production (behind feature flag if phased)
- [ ] Smoke test in production environment
- [ ] Monitoring dashboards open and baselined
- [ ] War room / Slack channel created for launch day coordination
- [ ] On-call rotation confirmed for launch window
- [ ] Rollback procedure rehearsed with engineering

---

## Launch Day (T-0)

### Launch sequence
| Time | Action | Owner | Status |
|------|--------|-------|--------|
| [Time] | Enable feature flag for Phase 1 ([X]% of users) | Eng | |
| [Time+30min] | Monitor error rates, latency, key events | Eng | |
| [Time+1hr] | Check early user behavior against expected patterns | PM | |
| [Time+2hr] | Send internal announcement | PM | |
| [Time+2hr] | Publish external announcement (if applicable) | Marketing | |
| [Time+4hr] | Phase 1 health check — green to expand? | PM + Eng | |
| EOD | Launch day summary to stakeholders | PM | |

### Launch day monitoring
Watch these metrics for the first 24 hours:

| Metric | Baseline | Alert Threshold | Dashboard Link |
|--------|----------|----------------|---------------|
| Error rate | [X%] | >[Y%] | [Link] |
| P95 latency | [X ms] | >[Y ms] | [Link] |
| Feature adoption (first use) | N/A | <[X] in first 4hrs | [Link] |
| Support tickets mentioning feature | 0 | >[Y] in first 4hrs | [Link] |

---

## Post-Launch

### T+1 day
- [ ] 24-hour metrics review — feature healthy?
- [ ] Support ticket review — any unexpected patterns?
- [ ] Decision: expand rollout to Phase 2? Hold? Roll back?

### T+3 days
- [ ] Phase 2 rollout (if phased): [X]% → [Y]%
- [ ] Engineering retro on any launch-day issues

### T+7 days
- [ ] Full GA rollout (if phased)
- [ ] First metrics report against success criteria from PRD
- [ ] Customer feedback synthesis (initial reactions)

### T+14 days
- [ ] Comprehensive post-launch review:
  - Metrics vs. targets
  - What went well
  - What didn't go well
  - Lessons for next launch
- [ ] Update PRD with actual results vs. predictions
- [ ] Decision: iterate, expand, or move to maintenance?

### T+30 days
- [ ] Final launch metrics report
- [ ] Decision log entry: Was this launch successful? (reference D-NNN)
- [ ] Archive launch checklist to `context/strategy/retrospectives/`

---

## Rollback Plan

**Trigger conditions** (any one of these = consider rollback):
- Error rate exceeds [X%] for more than [Y] minutes
- P0 bug affecting [Z]% of users with no hotfix available in [timeframe]
- Data integrity issue discovered
- Security vulnerability identified

**Rollback procedure:**
1. [Step 1 — e.g., disable feature flag]
2. [Step 2 — e.g., revert database migration if applicable]
3. [Step 3 — e.g., communicate to affected users]
4. [Step 4 — e.g., post-mortem scheduled within 24 hours]

**Rollback owner**: [Name]
**Rollback decision authority**: [Who can make the call — PM + Eng Lead jointly]
**Estimated rollback time**: [X minutes from decision to complete]

---

## Communication Plan

| Audience | Channel | Timing | Message | Owner |
|----------|---------|--------|---------|-------|
| Internal team | Slack #[channel] | Launch day | Feature live, monitoring, escalation path | PM |
| Leadership | Email | Launch day + T+7 | Launch summary, early metrics | PM |
| All employees | Company update | T+3 to T+7 | Feature announcement | Marketing |
| Existing customers | Email / in-app | Launch day or T+1 | What's new, how to use it | Marketing |
| Prospects | Blog / social | T+1 to T+3 | Public announcement | Marketing |
| Sales team | Slack + enablement session | T-3 | Talking points, demo, battle card | PM + Sales |
