# Knowledge Base Index
Last updated: [auto-update on each session]

---

## How This File Works
This is the routing table for the PM Command Center. Claude reads this file first to understand what context is available and where to find it. It prevents Claude from loading everything (which wastes context window) and instead points it to the right file for the right task.

**Update discipline**: This file should be updated whenever new context files are created, major content changes occur, or during the weekly maintenance routine.

---

## Quick Routing

### Identity & Preferences
| Topic | File | Status |
|-------|------|--------|
| Who I am, working style, AI instructions | `CLAUDE.md` | ✅ Ready |
| PM frameworks and methodology | `context/personal/pm-frameworks.md` | ✅ Ready |
| Interview methodology | `context/personal/interview-playbook.md` | ✅ Ready |
| Stakeholder management playbook | `context/personal/stakeholder-strategies.md` | ✅ Ready |
| Writing voice and samples | `context/personal/writing-samples.md` | ✅ Ready |
| Career goals for this role | `context/personal/career-goals.md` | ✅ Ready |
| Lessons from previous roles | `context/personal/lessons-learned.md` | ✅ Ready |

### Product & Strategy
| Topic | File | Status |
|-------|------|--------|
| Product overview & vision | `context/product-overview.md` | ⬜ Needs onboarding |
| Current priorities | `context/strategy/current-priorities.md` | ⬜ Needs onboarding |
| OKRs | `context/strategy/okrs.md` | ⬜ Needs onboarding |
| Active PRDs | `context/strategy/active-prds/` | ⬜ Empty |
| Retrospectives & lessons | `context/strategy/retrospectives/` | ⬜ Empty |

### Decisions
| Topic | File | Status |
|-------|------|--------|
| Decision log | `context/decisions/decision-log.md` | ⬜ Empty (template ready) |

### Team & Stakeholders
| Topic | File | Status |
|-------|------|--------|
| Team directory | `context/team/directory.md` | ⬜ Needs onboarding |
| Stakeholder map | `context/team/stakeholder-map.md` | ⬜ Needs onboarding |
| Org context & culture | `context/team/org-context.md` | ⬜ Needs onboarding |

### Users & Research
| Topic | File | Status |
|-------|------|--------|
| User personas | `context/users/personas.md` | ⬜ Needs onboarding |
| User journey maps | `context/users/journey-maps.md` | ⬜ Needs onboarding |
| Feedback themes | `context/users/feedback-themes.md` | ⬜ Needs onboarding |

### Competitors
| Topic | File | Status |
|-------|------|--------|
| Competitor matrix | `context/competitors/matrix.md` | ⬜ Needs onboarding |
| Individual teardowns | `context/competitors/teardowns/` | ⬜ Empty |

### Metrics
| Topic | File | Status |
|-------|------|--------|
| North star & key metrics | `context/metrics/north-star.md` | ⬜ Needs onboarding |
| Metric baselines | `context/metrics/baselines.md` | ⬜ Needs onboarding |
| Weekly snapshots | `context/metrics/weekly-snapshots/` | ⬜ Empty |

### Tracking (Operational)
| Topic | File | Status |
|-------|------|--------|
| Action items | `tracking/action-items.md` | ✅ Template ready |
| Current sprint | `tracking/current-sprint.md` | ⬜ Needs onboarding |
| Risks & blockers | `tracking/risks-and-blockers.md` | ⬜ Needs onboarding |
| Archive | `tracking/archive/` | ⬜ Empty |

### Artifacts (Generated Outputs)
| Topic | Location |
|-------|----------|
| Meeting notes | `artifacts/meetings/` |
| PRDs | `artifacts/prds/` |
| Reports | `artifacts/reports/` |
| Decks | `artifacts/decks/` |
| Email drafts | `artifacts/emails/` |
| Prototypes | `artifacts/prototypes/` |

### Skills
| Category | Location | Skills Available |
|----------|----------|-----------------|
| Daily routines | `skills/daily/` | morning-briefing, email-triage, end-of-day-rollup |
| Meetings | `skills/meetings/` | meeting-summarizer, 1on1-processor, meeting-prep |
| Discovery | `skills/discovery/` | interview-synthesis, feedback-clustering, competitive-scan, market-sizing |
| Definition | `skills/definition/` | prd-generator, user-story-generator, spec-reviewer, release-notes |
| Strategy | `skills/strategy/` | strategy-critique, decision-logger, opportunity-scoring, roadmap-narrative |
| Execution | `skills/execution/` | action-item-extractor, status-report, blocker-scanner, ticket-generator |
| Communication | `skills/communication/` | email-drafter, exec-update-writer, stakeholder-faq, deck-builder |
| Data | `skills/data/` | metric-explorer, funnel-analyzer, nps-analyzer |

### Templates
| Template | Location |
|----------|----------|
| All 13 templates | `templates/` |

---

## Recent Changes (Last 7 Days)
[Auto-populated by skills as they update files]

_No changes yet — system initialized._

---

## Onboarding Checklist
Track your progress populating the knowledge base:

### Week 1 (Critical)
- [ ] Product overview populated (`context/product-overview.md`)
- [ ] Team directory built (`context/team/directory.md`)
- [ ] Stakeholder map started (`context/team/stakeholder-map.md`)
- [ ] Current priorities defined (`context/strategy/current-priorities.md`)
- [ ] First meeting processed through meeting summarizer
- [ ] Action item tracker active (`tracking/action-items.md`)
- [ ] First decisions logged (`context/decisions/decision-log.md`)
- [ ] CLAUDE.md company section filled in

### Week 2 (Important)
- [ ] OKRs documented (`context/strategy/okrs.md`)
- [ ] User personas started (`context/users/personas.md`)
- [ ] Competitor matrix started (`context/competitors/matrix.md`)
- [ ] North star metrics defined (`context/metrics/north-star.md`)
- [ ] Sprint context captured (`tracking/current-sprint.md`)
- [ ] Org context notes (`context/team/org-context.md`)
- [ ] Gmail + Calendar MCP connected
- [ ] Jira/Linear MCP connected

### Month 1 (Comprehensive)
- [ ] 20+ context files populated
- [ ] 10+ meeting summaries generated
- [ ] First PRD created with AI assist
- [ ] First competitive teardown complete
- [ ] First weekly status report generated
- [ ] Feedback themes populated from existing research
- [ ] All MCP integrations connected
