# Skill: AI Research Scout

## Metadata
- name: ai-research-scout
- trigger: "AI research scan", "what's new in AI", "AI landscape update", "frontier scan"
- version: 1.0
- author: PM Command Center Team
- category: discovery

## Purpose
Stay current on AI developments that matter for product strategy, competitive positioning, and thought leadership. Produces a structured briefing that filters the noise of the AI landscape into actionable insights — what's new, why it matters, and what to do about it.

## Inputs
- **Required**: None for broad scan; topic string for focused scan (e.g., "multimodal agents", "enterprise RAG", "AI regulation")
- **Optional**:
  - Scope: broad (default) or focused
  - Time window: last 1 week (default), 2 weeks, or custom
  - Depth: quick scan (headlines + relevance) or deep dive (full analysis + implications)
- **Auto-loaded context** (read before processing):
  - `context/my/domain-expertise.md` — current AI knowledge base and areas of focus
  - `context/product-overview.md` — product context for relevance filtering
  - `context/strategy/current-priorities.md` — to prioritize findings by strategic relevance

## Process

### Step 1: Determine scope
Ask or infer the scan type:
- **Broad scan**: Cover all categories below. Best for weekly cadence (Friday or Monday).
- **Focused scan**: Narrow to a specific topic. Best for ad-hoc research before a strategy session or when a specific development breaks.

If the user doesn't specify, default to broad scan covering the last 1-2 weeks.

### Step 2: Research using web search
Search across these categories, prioritizing recency and credibility:

| Category | Sources to Search | What to Look For |
|----------|------------------|-----------------|
| **AI Research** | Papers With Code trending, arXiv highlights, Hugging Face trending models | Breakthrough papers, new architectures, benchmark improvements |
| **Industry News** | TechCrunch AI, The Verge AI, VentureBeat AI | Product launches, company announcements, market moves |
| **Model Releases** | OpenAI, Anthropic, Google DeepMind, Meta AI, Mistral, Cohere | New model versions, capability jumps, pricing changes, API updates |
| **Open Source** | GitHub trending (ML/AI), Hugging Face spaces | Popular new tools, frameworks, libraries gaining traction |
| **Regulation** | EU AI Act updates, US executive orders, state-level legislation | Compliance requirements, enforcement actions, policy shifts |
| **Enterprise AI** | Gartner, Forrester, enterprise AI blogs | Adoption trends, buyer behavior, ROI studies |

For focused scans, search deeply within the relevant category and expand to adjacent topics.

### Step 3: Filter for relevance
Score each finding on four relevance dimensions:

| Dimension | Question | Rating |
|-----------|----------|--------|
| **Direct product impact** | Could this change our product roadmap or feature set? | High / Medium / Low / None |
| **Competitive impact** | Does this affect our competitive position or a competitor's capabilities? | High / Medium / Low / None |
| **Market impact** | Does this shift buyer expectations, market dynamics, or industry direction? | High / Medium / Low / None |
| **Thought leadership value** | Could the user reference this in talks, blog posts, or stakeholder conversations? | High / Medium / Low / None |

Keep items that score Medium or higher on at least one dimension. Drop the rest.

### Step 4: Generate structured briefing
Assemble findings into a report:

```
# AI Research Scout — [Date]
**Scope**: [Broad / Focused: {topic}] | **Window**: [Date range]

---

## Key Developments

| # | Development | Source | Date | Relevance |
|---|------------|--------|------|-----------|
| 1 | [Title/description] | [Source with link] | [Date] | [Product / Competitive / Market / Thought Leadership] |
| 2 | ... | ... | ... | ... |

---

## Product Implications
- [How development X could affect our product or roadmap]
- [Capability we should watch or consider adopting]
- [Technical trend that changes our build-vs-buy calculus]

---

## Competitive Implications
- [What this means for competitor positioning]
- [Capability gap opened or closed]
- [Market window created or closing]

---

## Thought Leadership Angles
2-3 talking points the user can share in conversations, presentations, or writing:
1. [Angle with supporting evidence]
2. [Angle with supporting evidence]
3. [Angle with supporting evidence]

---

## Deep Dives Worth Reading
- [Title](link) — [1-2 sentence summary of why it's worth reading]
- [Title](link) — [1-2 sentence summary]
- [Title](link) — [1-2 sentence summary]

---

## Scan Metadata
- Sources searched: [N]
- Items reviewed: [N]
- Items included: [N]
- Items filtered out: [N]
```

### Step 5: Update knowledge base
After generating the briefing, offer to:
- **Append to domain expertise**: Add key insights or new knowledge to `context/my/domain-expertise.md`
- **Flag for innovation pipeline**: If any development suggests a product opportunity, offer to add it to `context/my/innovation-pipeline.md` as a raw signal
- **Update competitive context**: If competitor moves were found, offer to update `context/competitors/matrix.md`

## Output Format
Save to: `artifacts/reports/YYYY-MM-DD-ai-research-scan.md`

**Recommended cadence**:
- Weekly broad scans: Friday afternoon or Monday morning
- Ad-hoc focused scans: Before strategy sessions, when a major development breaks, or when exploring a specific technology area

## Quality Checklist (self-verify before presenting)
- [ ] All findings are from the specified time window (no stale results)
- [ ] Sources are credible and links are included
- [ ] Relevance filtering was applied — no "interesting but irrelevant" items included
- [ ] Product implications are specific to our product context, not generic AI commentary
- [ ] Thought leadership angles are concrete talking points, not vague observations
- [ ] Deep dive recommendations include a clear reason to read each one
- [ ] Competitive implications reference actual competitors from the knowledge base

## Integration Points
- **Morning Briefing**: Major AI developments can surface in the Cross-Org Radar section
- **Bold Idea Lab**: AI research findings feed directly into trend-riding brainstorm mode
- **Market Intelligence**: AI developments relevant to your market space are cross-referenced
- **Strategy Critique**: New AI capabilities can inform feasibility and differentiation assessments
- **PRD Generator**: Emerging AI capabilities inform what's technically possible in new product definitions
