# Skill: Storyboard Generator

## Metadata
- name: storyboard-generator
- trigger: "generate storyboard", "storyboard for", "customer journey storyboard", "before-and-after storyboard", "visualize the journey"
- version: 1.0
- author: PM Command Center Team
- category: discovery

## Purpose
Produce a 12-16 frame **storyboard** describing a customer's experience *before* and *after* a proposed product change. Inspired by Airbnb's "Snow White" storyboard exercise — the artifact Brian Chesky commissioned to force the team to describe the emotional arc of a customer journey, frame by frame, before building.

**The principle**: when a roadmap item is described abstractly ("improve onboarding"), the team optimizes for vague outcomes. When a roadmap item is described as 15 frames of a real customer going through a moment, the team builds the product that actually changes that moment.

Storyboards force:
1. A **specific user** (not "users")
2. A **specific moment** (not "the experience")
3. An **emotional arc** (not just tasks completed)
4. A **before / after contrast** that forces intentional tradeoffs

This skill is narrative-first, not visual. The output is a written frame-by-frame description that a designer or illustrator can execute — or that the team can simply read aloud to align.

## Inputs
- **Required**: A feature, initiative, or experience change to storyboard
- **Optional**:
  - Focus persona (if multiple user types, pick the highest-leverage one)
  - Target moment (activation, purchase, churn recovery, first-week experience, etc.)
  - Time horizon (is this next-quarter, next-year, or aspirational?)
  - Number of frames (default: 12-15; go up to 20 for complex multi-session journeys)
- **Auto-loaded context** (read silently):
  - `context/users/personas.md` — persona details to ground the character
  - `context/users/journey-maps.md` — existing journey references (if any)
  - `context/users/feedback-themes.md` — real user pain that fuels the "before" frames
  - `context/company/product-overview.md` — what the product is today
  - `context/competitors/matrix.md` — how competitors handle the same moment
  - `artifacts/prfaqs/` — if a PR/FAQ exists for this, mine it for the customer promise
  - `artifacts/prd/` — if a PRD exists, extract target behavior from it
  - `context/my/opportunity-solution-tree.md` — linked opportunity / solution nodes

## Process

### Step 1: Name the protagonist and the moment

Do NOT generate frames without a specific protagonist and a specific moment. Generic storyboards produce generic products.

Ask (or propose, then confirm):

- **Protagonist**: Named character from the persona file (e.g., "Maya, 34, independent consultant, has been using spreadsheets for 3 years, just hit a scale wall"). Give the character a name, a role, and a *current emotional state* when the story opens.
- **Moment**: The specific temporal window — e.g., "the first 45 minutes with the product", "the hour after receiving the renewal email", "the Monday morning after a big weekend order spike".
- **Starting emotional state**: What is the protagonist feeling when frame 1 opens? (curious / frustrated / hopeful / defeated / skeptical)
- **Ending emotional state (target)**: Where does the *after* journey land? What's the emotional delta we're promising?

Record these in a header block before any frames are drafted.

### Step 2: Frame the "before" journey (5-7 frames)

The before journey is the world *without* your solution. It should be honest — based on real user research, not a caricature. Each frame captures:

```
### Frame [N]: [Short title — present tense verb-led]
**Visual (if illustrated)**: [1-2 sentence description of what we'd see]
**Action**: [What the protagonist is doing]
**Thought bubble**: [What they're thinking — in their voice, not PM voice]
**Emotional state**: [1-3 words]
**Pain signal**: [What's going wrong in this frame]
**Evidence source**: [Link to user interview, ticket theme, NPS comment, etc.]
```

**Rules for before frames**:
- Ground each frame in a real user signal if possible — pull from `context/users/feedback-themes.md`
- The emotional arc should *decline or plateau* — the before world doesn't resolve the pain
- No strawmen — the "before" product isn't gratuitously bad; the failure is subtle and real

### Step 3: Frame the transition (1-2 frames)

Frames that bridge the before and after — the moment of discovery, the trigger, the onboarding touch. This is where the product enters the story. Keep it light — 1-2 frames. Avoid turning the transition into an infomercial.

```
### Frame [N]: [Trigger or discovery moment]
**Visual**: [...]
**Action**: [Protagonist encounters the new capability]
**Thought bubble**: [Skeptical or curious — not "Wow this is amazing!"]
**Emotional state**: [Cautiously hopeful / skeptical / curious]
```

### Step 4: Frame the "after" journey (5-7 frames)

The after journey is the world *with* your solution. Each frame shows a specific capability in action, with the emotional state rising toward the target ending state.

```
### Frame [N]: [Title]
**Visual**: [...]
**Action**: [What the protagonist is doing with the new capability]
**Thought bubble**: [Their reaction — calibrated, not euphoric]
**Emotional state**: [...]
**Capability at work**: [Which product capability from PRD / PR/FAQ made this frame possible]
**Delta from before**: [1 sentence — how this frame differs from the corresponding before frame]
```

**Rules for after frames**:
- Each frame maps to *at least one* concrete product capability — if a frame has no mapped capability, we're over-promising
- Emotional state should arc upward, but realistically — saving 2 hours is not a "life-changing moment"
- Include at least one "small joy" frame — a moment of unexpected delight that isn't on the core path (this is the detail that makes Airbnb's Snow White famous)

### Step 5: The closing frame (1 frame)

The final frame should be specific — not "the protagonist is happy now". What are they doing 30 days later? What's now possible that wasn't before?

```
### Frame [N]: [Closing moment]
**Visual**: [...]
**Action**: [Protagonist 30 days later, new behavior pattern]
**Thought bubble**: [The new mental model]
**Emotional state**: [...]
**New behavior enabled**: [What's habitual now that wasn't possible before]
```

### Step 6: Extract the capability map

After frames are drafted, extract every capability mentioned in the after journey into a table. This becomes the bridge from storyboard to PRD / backlog.

```
## Capability Map

| # | Capability (from frames) | Frame(s) that depend on it | Exists today? | Priority |
|---|-------------------------|---------------------------|---------------|----------|
| 1 | [Capability] | [Frame N, N] | [Yes / No / Partial] | [P0 / P1 / P2] |
| 2 | ... | ... | ... | ... |
```

**Rule**: If 100% of capabilities exist today, the storyboard is describing a messaging / discovery problem, not a product-build problem. Flag this.

### Step 7: Emotional arc diagram (textual)

Plot the emotional arc across frames. Use a simple scale (-3 to +3).

```
## Emotional Arc

Frame:        1    2    3    4    5    6    7    8    9   10   11   12
Before:      -1   -2   -2   -3   -2   -3                                
Transition:                           -1    0                            
After:                                           +1   +2   +1   +2   +3
```

Visualize as an ASCII chart:

```
 +3 ┤                                           ●
 +2 ┤                                    ●          ●
 +1 ┤                               ●         ●
  0 ┤                          ●
 -1 ┤   ●                ●
 -2 ┤        ●    ●            
 -3 ┤            ●    ●
    └─┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬──
      1    2    3    4    5    6    7    8    9   10   11   12
```

**Rule**: If the arc is flat or the delta between before's low and after's high is less than 3 units, the storyboard is describing an incremental change, not a meaningful one. Either raise the ambition or drop the initiative.

### Step 8: Generate the artifact

```
# Storyboard: [Title — usually the name of the initiative]
**Author**: [From MY_PROFILE.md]
**Date**: [Today]
**Status**: Draft → Review → Adopted

---

## Protagonist
**Name**: [Name]
**Background**: [1-2 sentences]
**Starting emotional state**: [...]
**Target emotional state**: [...]

## Moment
[Specific temporal window this covers]

## The Before Journey
[Frames 1-7, structured per Step 2]

## The Transition
[Frames 8-9, structured per Step 3]

## The After Journey
[Frames 10-15, structured per Step 4]

## 30 Days Later
[Frame 16, structured per Step 5]

## Capability Map
[Table from Step 6]

## Emotional Arc
[ASCII chart from Step 7]

## Narrative Summary (for exec comms)
[150-word prose summary of the full arc — for stakeholders who won't read frame-by-frame]

## Linked Artifacts
- PR/FAQ: [link, if any]
- PRD: [link, if any]
- OST opportunity: [OST-XXX ID]
- Strategy memo: [link, if any]
```

### Step 9: Save and integrate

1. Save to `artifacts/storyboards/YYYY-MM-DD-[initiative-slug].md`
2. If a PR/FAQ exists for this initiative, cross-link both files
3. If capabilities in the map are new (don't exist yet), flag them for `prd-generator` input
4. Log to `context/my/opportunity-solution-tree.md` — the storyboard is a discovery artifact on a solution node
5. Offer follow-ups:
   - "Generate the PRD for these capabilities via `prd-generator`?"
   - "Run `pre-mortem-runner` on the after-journey — what would cause it to fail?"
   - "Design assumption tests via `assumption-test-designer` for the riskiest capability?"
   - "Draft an exec narrative via `exec-update-writer` using this storyboard as the anchor?"
   - "Worth logging this in your impact journal? (Authoring a storyboard that shaped direction = STRATEGY / INFLUENCE)"

## Tool Integrations (when MCP connected)

**Figma / FigJam** (if connected):
- Export each frame description to a FigJam canvas for designers to illustrate
- Link back to the narrative artifact

**Miro** (if connected):
- Create a storyboard canvas with frame cards
- Add emotion-arc plotting on the board

**Claude / image-generation APIs** (if connected):
- Generate rough frame visualizations from the `Visual:` descriptions as conversation-starters (not final art)

**Airtable / Notion** (if connected):
- Track all storyboards as a library; surface protagonist / moment / status in a single view

## Quality Checklist (self-verify)
- [ ] Protagonist is named and grounded in a real persona, not "a user"
- [ ] Moment is specific and temporally bounded
- [ ] 12-16 frames total, with roughly 5-7 before, 1-2 transition, 5-7 after, 1 closing
- [ ] Every before frame cites an evidence source (user signal) if possible
- [ ] Every after frame maps to a specific product capability
- [ ] Emotional arc shows a measurable delta (≥ 3 units)
- [ ] At least one "small joy" frame exists in the after journey
- [ ] Capability map identifies what exists vs. what needs to be built
- [ ] No euphoric / infomercial language — characters react realistically
- [ ] Narrative summary for execs fits in ~150 words

## What Makes This Skill Different From a Journey Map
- Storyboards have a *protagonist* and an *emotional arc*; journey maps have steps
- Storyboards *contrast* before and after; journey maps describe current or future singly
- Storyboards include specific capability mapping for build handoff
- Storyboards have narrative tension — the boring middle gets cut; the important moments are over-indexed
- Storyboards force small-joy frames, which journey maps rarely capture

## Integration Points
- **PR/FAQ Generator (H1)**: The PR/FAQ describes the customer headline; the storyboard describes the lived experience behind that headline — often authored together
- **PRD Generator**: The capability map bridges storyboard to PRD; a PRD that doesn't serve at least 3 frames is probably over-scoped
- **Product Strategy Memo (H7)**: A strategy memo's "coherent actions" each deserve a storyboard — if the story isn't tellable, the action isn't real yet
- **Assumption Test Designer (H4)**: Before-journey claims grounded in research are already validated; after-journey claims are assumptions to test
- **Pre-Mortem Runner (H2)**: Pre-mortem the after-journey — what's the frame that fails to land?
- **Exec Update Writer**: The 150-word narrative summary is directly usable in exec comms
- **Opportunity Solution Tree**: Storyboards attach to a solution node as a discovery artifact
- **Bold Idea Lab**: A bold idea that can't be storyboarded is probably not concrete enough yet
- **Impact Journal**: Authoring a storyboard that shaped direction = STRATEGY / INFLUENCE / INNOVATION entry
