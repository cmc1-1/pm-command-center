# Skill: Market Intelligence

## Metadata
- name: market-intelligence
- trigger: "market intel", "market scan", "competitive landscape update", "what's happening in our market"
- version: 1.0
- author: PM Command Center Team
- category: discovery

## Purpose
Track the competitive landscape in your product's market to keep product strategy informed by real market dynamics. Produces structured intelligence on competitor moves, market trends, buyer behavior shifts, and strategic implications — not just news aggregation, but assessed intelligence with a point of view. Reads `context/product-overview.md` and `context/competitors/matrix.md` to tailor research to your specific market and competitors.

## Inputs
- **Required**: None for full market scan; competitor name or topic for focused deep-dive
- **Optional**:
  - Scope: full market scan (default) or focused competitor deep-dive
  - Time window: last 2 weeks (default), 1 month, or custom
  - Context: upcoming strategy session, board prep, or general awareness
- **Auto-loaded context** (read before processing):
  - `context/my/domain-expertise.md` — industry and market landscape knowledge
  - `context/competitors/matrix.md` — current competitive positioning data
  - `context/product-overview.md` — product context and differentiators
  - `context/strategy/current-priorities.md` — strategic priorities for relevance weighting

## Process

### Step 1: Determine scope
Ask or infer the intelligence request type:
- **Full market scan**: Broad sweep across all competitors and market signals. Best for bi-weekly cadence.
- **Focused competitor deep-dive**: Single competitor analysis — recent moves, product updates, positioning changes, customer wins/losses. Best for pre-strategy or when a competitor makes a significant move.

If the user doesn't specify, default to full market scan covering the last 2 weeks.

### Step 2: Research
Search across these categories, prioritizing actionable intelligence:

| Category | Sources | What to Look For |
|----------|---------|-----------------|
| **Competitor announcements** | Key competitors from `context/competitors/matrix.md` — press releases, blogs, product updates | New features, partnerships, customer wins, pricing changes, leadership changes |
| **Analyst reports** | Gartner (Magic Quadrant, Market Guide), Forrester (Wave), IDC MarketScape | Positioning changes, emerging categories, vendor evaluations |
| **Industry news** | Legaltech News, Artificial Lawyer, Law.com, Above the Law, Legal IT Insider | Market trends, buyer sentiment, technology adoption stories |
| **Market signals** | Legal ops conferences (CLOC, ACC), enterprise procurement trends, RFP patterns | Buyer priorities shifting, new table-stakes expectations, consolidation signals |
| **M&A and funding** | Crunchbase, PitchBook coverage, TechCrunch | Acquisitions, funding rounds, valuation signals, market consolidation |
| **Customer signals** | G2, Gartner Peer Insights, TrustRadius reviews | User satisfaction trends, feature gaps mentioned, switching signals |

### Step 3: Assess competitive positioning
For each significant finding, analyze what it means for your product:

- **Threat assessment**: Does this narrow our differentiation? Open a new competitive front? Shift buyer expectations?
- **Opportunity assessment**: Does this validate our direction? Create a gap we can exploit? Weaken a competitor's position?
- **Timing assessment**: Is this a near-term (0-3 month) or medium-term (3-12 month) impact?

### Step 4: Identify market trends
Step back from individual moves and identify patterns:
- **Buyer behavior shifts**: Are legal teams prioritizing different capabilities than 6 months ago? Are procurement processes changing?
- **Table-stakes evolution**: What capabilities are moving from "differentiator" to "must-have"? What's the new baseline?
- **12-24 month direction**: Where is the market heading? What new categories are emerging? What capabilities are becoming expected?
- **Consolidation signals**: Are platforms converging? Is the category being absorbed into larger suites?

### Step 5: Generate report
Assemble intelligence into a structured report:

```
# Market Intelligence Report — [Date]
**Scope**: [Full scan / Focused: {competitor or topic}] | **Window**: [Date range]

---

## Market Pulse
[3-5 sentences summarizing the current state of your market. What's the dominant narrative? What's shifting?]

---

## Competitor Moves

| Competitor | Development | Date | Threat Level | Opportunity |
|-----------|------------|------|-------------|-------------|
| [Name] | [What happened] | [Date] | [High/Med/Low] | [Our response opportunity] |
| [Name] | [What happened] | [Date] | [High/Med/Low] | [Our response opportunity] |

### Notable Details
- [Expanded analysis on the most significant competitor move]
- [Second notable development with context]

---

## Market Trends
1. **[Trend name]**: [Description and evidence] — Impact on us: [assessment]
2. **[Trend name]**: [Description and evidence] — Impact on us: [assessment]
3. **[Trend name]**: [Description and evidence] — Impact on us: [assessment]

---

## Our Positioning Assessment
- **Strengthening**: [Where our position is improving and why]
- **Holding**: [Where position is stable]
- **At risk**: [Where position may be eroding and why]

---

## Strategic Implications
1. [Recommendation 1 — specific, actionable, tied to evidence]
2. [Recommendation 2]
3. [Recommendation 3]

---

## Sources
- [Source 1](link) — [Brief note on what was found]
- [Source 2](link) — [Brief note]
```

### Step 6: Update knowledge base
After generating the report, offer to:
- **Update competitor matrix**: Refresh `context/competitors/matrix.md` with new positioning data, feature announcements, or customer wins
- **Update domain expertise**: Add market trend insights to `context/my/domain-expertise.md`
- **Flag for innovation pipeline**: If market gaps or opportunities were identified, offer to add them to `context/my/innovation-pipeline.md`
- **Feed into strategy**: If findings have significant strategic implications, recommend a strategy critique session or roadmap review

## Output Format
Save to: `artifacts/reports/YYYY-MM-DD-market-intelligence.md`

**Recommended cadence**:
- Bi-weekly full market scans
- Ad-hoc focused deep-dives before strategy sessions, board prep, or when a competitor makes a significant move
- Quarterly comprehensive landscape review (combine 6+ bi-weekly scans into a trend analysis)

## Quality Checklist (self-verify before presenting)
- [ ] All major competitors are covered (not just the top 2-3)
- [ ] Findings are from the specified time window — no stale intelligence
- [ ] Threat and opportunity assessments are specific to our product, not generic
- [ ] Market trends are supported by evidence, not speculation
- [ ] Strategic implications are actionable (someone could act on them this sprint)
- [ ] Sources are cited with links where possible
- [ ] Positioning assessment is honest — not just optimistic about our product

## Integration Points
- **AI Research Scout**: AI developments relevant to your market are cross-referenced from AI scans
- **Strategy Critique**: Market intelligence informs competitive reality checks in strategy reviews
- **Bold Idea Lab**: Competitive gaps and market trends feed brainstorm sessions
- **PRD Generator**: Market context informs competitive positioning sections of PRDs
- **Morning Briefing**: High-priority competitive moves can surface in the Cross-Org Radar section
