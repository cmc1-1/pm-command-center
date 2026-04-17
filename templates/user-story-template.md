# User Story: [Short Title]

> **Purpose**: Single user story in As-a / I-want / So-that format with acceptance criteria and INVEST check.
> **When to use**: Breaking a PRD into engineering-ready units. Referenced from `prd-generator` output; written into Jira or equivalent.
> **Audience**: Engineering, design, QA — and anyone reviewing scope.

## Story
**As a** [specific persona from context/users/personas.md],
**I want to** [action — what the user is trying to do],
**So that** [outcome — the value they get from doing it].

---

## INVEST Checklist
Before committing this story to a sprint, verify:

- [ ] **Independent** — Can be developed and delivered without depending on another unfinished story
- [ ] **Negotiable** — Details can be discussed and adjusted with the team without invalidating the story
- [ ] **Valuable** — Delivers clear value to the user or business (not just technical plumbing)
- [ ] **Estimable** — Team can estimate the effort with reasonable confidence
- [ ] **Small** — Fits within a single sprint (if not, break it down further)
- [ ] **Testable** — Acceptance criteria are specific enough to write test cases

---

## Context
[2-3 sentences: Why does this story exist? What user need, feedback theme, or strategic priority does it address? Link to relevant PRD, decision, or research.]

- **Related PRD**: [Link or file path]
- **Related decision**: [D-NNN if applicable]
- **User research evidence**: [Interview quote, feedback theme, or data point that validates this need]

---

## Acceptance Criteria

### Scenario 1: [Happy path — primary use case]
```gherkin
Given [precondition — the starting state]
  And [additional precondition if needed]
When [action the user takes]
Then [expected outcome]
  And [additional outcome if needed]
```

### Scenario 2: [Alternate path or variant]
```gherkin
Given [precondition]
When [different action or condition]
Then [expected outcome for this variant]
```

### Scenario 3: [Edge case or error state]
```gherkin
Given [precondition that creates an edge case]
When [user attempts the action]
Then [system handles gracefully — specific behavior]
  And [user sees appropriate feedback]
```

[Add as many scenarios as needed. Every acceptance criterion should be testable — a QA engineer should be able to write an automated test from each scenario.]

---

## Design Reference
- **Mockup**: [Link to Figma / screenshot]
- **Prototype**: [Link if available]
- **Design notes**: [Specific design decisions or constraints]

---

## Technical Notes
[For the engineering team — any implementation guidance, API considerations, performance requirements, or constraints the PM is aware of.]

- **API endpoint**: [If known]
- **Data model changes**: [If known]
- **Performance requirement**: [e.g., "Page load under 2s on 3G"]
- **Security consideration**: [e.g., "Must validate permissions before showing data"]
- **Migration notes**: [e.g., "Backwards compatible with existing users"]
- **Feature flag**: [Yes/No — flag name if applicable]

---

## Out of Scope for This Story
[Explicitly state what this story does NOT include — prevents scope creep during development]

- [Thing that's tempting to add but should be a separate story]
- [Thing that's related but not necessary for this increment]

---

## Dependencies
- **Blocked by**: [Other story / infrastructure / external team — or "None"]
- **Blocks**: [Stories that depend on this one — or "None"]
- **External dependency**: [API, third-party service, design approval, legal review]

---

## Estimation

| Method | Estimate | Confidence |
|--------|----------|------------|
| Story points | [X] | High / Medium / Low |
| T-shirt size | XS / S / M / L / XL | |
| Time estimate | [X days] (if team uses time) | |

**Estimation notes**: [Any factors that affect the estimate — uncertainty, new technology, team familiarity]

---

## Definition of Done
This story is complete when:
- [ ] All acceptance criteria pass in the staging environment
- [ ] Code reviewed and approved
- [ ] Unit tests written and passing
- [ ] Integration/E2E tests updated if applicable
- [ ] No P0/P1 bugs open against this story
- [ ] PM has accepted the implementation against acceptance criteria
- [ ] Documentation updated (if user-facing)
- [ ] Analytics events instrumented and verified
- [ ] Deployed to production (behind feature flag if applicable)
