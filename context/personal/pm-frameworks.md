# My PM Frameworks & When I Use Them

These are the frameworks I reach for most often. When generating PRDs, critiquing strategy, or scoring opportunities, reference these as my preferred approach.

---

## Prioritization

### RICE (default for feature prioritization)
- **Reach**: How many users will this affect in a given period?
- **Impact**: How much will it move the target metric per user? (3=massive, 2=high, 1=medium, 0.5=low, 0.25=minimal)
- **Confidence**: How sure are we about reach and impact estimates? (100%=high, 80%=medium, 50%=low)
- **Effort**: Person-months of work
- **Score**: (Reach × Impact × Confidence) / Effort
- **When I use it**: Quarterly roadmap planning, backlog grooming, comparing dissimilar features. Good for removing politics from prioritization because it's transparent and quantified.
- **Watch out for**: Gaming confidence scores. If I'm not sure, I use 50% not 80%.

### MoSCoW (for scoping within a feature)
- Must have (P0): Launch blockers. Ship is broken without these.
- Should have (P1): Expected at launch. Can slip to fast-follow if pressured.
- Could have (P2): Nice to have. Only if team has capacity.
- Won't have: Explicitly out of scope this iteration.
- **When I use it**: Inside a PRD to scope P0/P1/P2. Also in sprint planning to triage when capacity is tight.

### Eisenhower Matrix (for my own time management)
- Urgent + Important: Do now
- Important + Not Urgent: Schedule it (this is where strategy lives)
- Urgent + Not Important: Delegate or timebox
- Not Urgent + Not Important: Eliminate
- **When I use it**: Weekly planning. When I feel overwhelmed, I map my tasks onto this grid.

---

## Discovery & Research

### Jobs to Be Done (JTBD)
- Format: "When [situation], I want to [motivation], so I can [expected outcome]"
- Focus on the job, not the solution. The job is stable; solutions change.
- **When I use it**: User interviews, persona creation, feature ideation. Forces me to understand the underlying need, not just the surface request.
- **My twist**: I always ask "what triggered this?" — the trigger is often more important than the job itself because it tells you when to surface the feature.

### Opportunity Solution Tree (Teresa Torres)
- Start with a desired outcome (metric)
- Map opportunities (user needs/pain points) that could move that metric
- For each opportunity, brainstorm multiple solutions
- For each solution, define assumption tests
- **When I use it**: Early discovery when I have a goal but not a clear path. Prevents jumping to solutions before understanding the opportunity space.

### 5 Whys (for root cause analysis)
- State the problem. Ask "why?" Repeat 5 times.
- Stop when you hit a fundamental cause you can actually address.
- **When I use it**: When a metric drops, when a launch goes wrong, when user feedback reveals a deeper issue. Also in retrospectives.

---

## Strategy

### Product Strategy Framework (what I look for)
A good product strategy should answer:
1. **Who** is the target user (specific, not everyone)
2. **What** problem are we solving (grounded in evidence)
3. **Why** now (timing, market window, competitive pressure)
4. **How** we win (what's our unique advantage)
5. **What** we're NOT doing (explicit trade-offs)
6. **How** we'll know (measurable success criteria)

If any of these are missing or vague, the strategy needs more work.

### Porter's Five Forces (for market analysis)
- Threat of new entrants
- Bargaining power of suppliers
- Bargaining power of buyers
- Threat of substitutes
- Industry rivalry
- **When I use it**: New market entry decisions, competitive strategy. Helps me understand structural dynamics beyond just feature comparison.

### Moat Assessment
- What makes our product defensible? Network effects, data advantage, switching costs, brand, distribution, technology, regulatory?
- **When I use it**: Strategy reviews, competitive teardowns. If we can't articulate the moat, we're in a commodity fight.

---

## Execution

### Definition of Done (my standard)
A feature is done when:
1. All acceptance criteria pass in staging
2. Code reviewed and approved
3. Tests written and passing
4. No P0/P1 bugs open
5. PM has accepted the implementation
6. Documentation updated (if user-facing)
7. Analytics instrumented and verified
8. Deployed to production

### Sprint Health Indicators
Healthy sprint signals:
- Completion rate >80%
- Carryover <2 stories
- Unplanned work <20% of capacity
- No blockers lasting >2 days
- Retro generates specific, owned improvements

Unhealthy signals:
- Velocity declining 3+ sprints in a row
- Same retro items appearing repeatedly
- Stories regularly need re-estimation mid-sprint
- Action items from retros not being executed

---

## Communication

### Pyramid Principle (for all written communication)
- Start with the answer/recommendation
- Group supporting arguments
- Order arguments logically
- Support with data
- **When I use it**: Every email, every status update, every PRD. The reader should get the point from the first paragraph.

### SCQA (for framing problems to stakeholders)
- **Situation**: What's the current state
- **Complication**: What's changed or what's wrong
- **Question**: What do we need to decide
- **Answer**: What I recommend
- **When I use it**: Exec presentations, strategy proposals, decision documents.

### SBI (for feedback)
- **Situation**: When/where the behavior happened
- **Behavior**: What specifically they did (observable, not interpretive)
- **Impact**: What effect it had
- **When I use it**: 1:1s, performance conversations, peer feedback. Keeps it specific and non-judgmental.

---

## Measurement

### Metrics Hierarchy (how I think about metrics)
1. **North star metric**: The one metric that captures the core value delivered to users
2. **Input metrics**: Leading indicators you can influence (e.g., activation rate, feature adoption)
3. **Output metrics**: Lagging indicators of business success (e.g., revenue, retention)
4. **Guardrail metrics**: Things that should NOT get worse (e.g., page load time, error rate, NPS)
5. **Counter-metrics**: The thing that might suffer if you optimize too hard for one metric

### A/B Test Decision Framework
- **Pre-test**: Define hypothesis, primary metric, sample size, minimum detectable effect, duration
- **During**: Don't peek. Seriously. Set the duration and wait.
- **Post-test**: Statistical significance ≥95% for primary metric. Check for novelty effects. Check guardrail metrics. Consider practical significance (statistically significant but tiny effect ≠ ship it)
