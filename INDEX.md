> **New here?** Start with [GUIDE.md](GUIDE.md) for the complete user manual.

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
| Who I am, working style, AI instructions | `MY_PROFILE.md` | ⬜ Fill from template |
| PM frameworks and methodology | `context/my/pm-frameworks.md` | ✅ Ready |
| Interview methodology | `context/my/interview-playbook.md` | ✅ Ready |
| Stakeholder management playbook | `context/my/stakeholder-strategies.md` | ✅ Ready |
| Writing voice and samples | `context/my/writing-samples.md` | ✅ Ready |
| Career goals for this role | `context/my/career-goals.md` | ✅ Ready |
| Lessons from previous roles | `context/my/lessons-learned.md` | ✅ Ready |
| Impact journal | `context/my/impact-journal.md` | ⬜ Needs setup |
| Domain expertise | `context/my/domain-expertise.md` | ⬜ Needs setup |
| Innovation pipeline | `context/my/innovation-pipeline.md` | ⬜ Needs setup |
| Mentorship tracker | `context/my/mentorship-tracker.md` | ⬜ Needs setup |
| Promotion packet | `context/my/promotion-packet.md` | ⬜ Needs setup |

### Company Context
| Topic | File | Status |
|-------|------|--------|
| Product overview | `context/company/product-overview.md` | ⬜ Fill from template |
| Team tool stack | `context/company/tool-stack.md` | ⬜ Fill from template |
| PM team norms & practices | `context/company/pm-team-norms.md` | ⬜ Fill from template |

### Templates (for new PMs — copied by setup script)
| Topic | File |
|-------|------|
| Personal context (11 templates) | `context/my.template/` → `context/my/` |
| Company context (3 templates) | `context/company.template/` → `context/company/` |

### Product & Strategy
| Topic | File | Status |
|-------|------|--------|
| Current priorities | `context/strategy/current-priorities.md` | ⬜ Needs onboarding |
| OKRs | `context/strategy/okrs.md` | ⬜ Needs onboarding |
| Active PRDs | `context/strategy/active-prds/` | ⬜ Empty |
| Retrospectives & lessons | `context/strategy/retrospectives/` | ⬜ Empty |

### Decisions
| Topic | File | Status |
|-------|------|--------|
| Decision log | `context/decisions/decision-log.md` | ⬜ Empty (template ready) |

### Cross-Organizational
| Topic | File | Status |
|-------|------|--------|
| Initiative tracker | `context/cross-org/initiative-tracker.md` | ⬜ Needs setup |
| Synergy log | `context/cross-org/synergy-log.md` | ⬜ Needs setup |

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

### Skills (13 built)
| Category | Location | Built Skills |
|----------|----------|-------------|
| Daily routines | `skills/daily/` | morning-briefing, impact-journal, end-of-day-rollup, onboarding-accelerator |
| Meetings | `skills/meetings/` | meeting-summarizer |
| Discovery | `skills/discovery/` | ai-research-scout, market-intelligence |
| Definition | `skills/definition/` | prd-generator |
| Strategy | `skills/strategy/` | strategy-critique, decision-logger, bold-idea-lab |
| Execution | `skills/execution/` | action-item-extractor |
| Communication | `skills/communication/` | email-drafter |

_See GUIDE.md Section 4 for 9 future skills to build as context accumulates._

### Templates
| Template | Location |
|----------|----------|
| All 19 templates | `templates/` |

---

## Recent Changes (Last 7 Days)
[Auto-populated by skills as they update files]

_No changes yet — system initialized._

---

## Onboarding Checklist
Track your progress populating the knowledge base:

### Week 1 (Critical)
- [ ] Product overview populated (`context/company/product-overview.md`)
- [ ] Team directory built (`context/team/directory.md`)
- [ ] Stakeholder map started (`context/team/stakeholder-map.md`)
- [ ] Current priorities defined (`context/strategy/current-priorities.md`)
- [ ] First meeting processed through meeting summarizer
- [ ] Action item tracker active (`tracking/action-items.md`)
- [ ] First decisions logged (`context/decisions/decision-log.md`)
- [ ] MY_PROFILE.md filled in with your details
- [ ] Connect Slack MCP (Dev workspace)
- [ ] Connect Atlassian MCP (Jira + Confluence)
- [ ] Run onboarding accelerator to pull Confluence docs → context files
- [ ] Start impact journal (`context/my/impact-journal.md`)
- [ ] Identify cross-org stakeholders and log in initiative tracker
- [ ] Run first AI research scan (`skills/discovery/ai-research-scout`)

### Week 2 (Important)
- [ ] OKRs documented (`context/strategy/okrs.md`)
- [ ] User personas started (`context/users/personas.md`)
- [ ] Competitor matrix started (`context/competitors/matrix.md`)
- [ ] North star metrics defined (`context/metrics/north-star.md`)
- [ ] Sprint context captured (`tracking/current-sprint.md`)
- [ ] Org context notes (`context/team/org-context.md`)
- [ ] Connect Amplitude MCP
- [ ] Connect Productboard MCP
- [ ] Connect GitHub MCP

### Month 1 (Comprehensive)
- [ ] 20+ context files populated
- [ ] 10+ meeting summaries generated
- [ ] First PRD created with AI assist
- [ ] First competitive teardown complete
- [ ] First weekly status report generated
- [ ] Feedback themes populated from existing research
- [ ] All Tier 1 + Tier 2 MCP integrations connected and verified
- [ ] Context auto-population working (metrics, sprint, priorities)
