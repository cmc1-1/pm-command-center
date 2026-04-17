# PLG Growth Loop Canvas: [Product / Surface Name]

> **Purpose**: Map a single product-led growth loop — trigger → action → value → reinvestment — with metrics and bottlenecks at each stage.
> **When to use**: When designing or optimizing an acquisition, activation, engagement, or monetization loop. Pair with `experiment-designer` to stress-test the bottleneck.
> **Audience**: You, growth/product trio, and leadership aligning on which loops to invest in.

**Author:** [Your name]
**Date:** [Date]
**Status:** [Draft / Reviewed / Active / Archived]
**Product / Surface:** [What this canvas covers]

---

## Use This Canvas

A **growth loop** is not a funnel. A funnel dumps users out the bottom. A loop feeds its output back into its input — the act of using the product generates the fuel for acquiring the next user.

This canvas maps four loops per Reforge's PLG framework: Acquisition, Activation, Monetization, and Virality/Retention. For each:
- **Inputs**: what fuels the loop
- **Action**: what the user does
- **Output**: what the loop produces
- **Reinforcement**: how the output feeds back to input
- **Rate-limiting step**: the current bottleneck
- **Current rate** → **Target rate**

Inspired by Reforge (growth loops), Notion (templates-as-acquisition), Figma (community-led growth), and the four-fit framework (Market / Model / Channel / Product).

---

## Product Fit Context

Before mapping loops, verify the four fits. If any is weak, loops won't compound regardless of design.

| Fit | Question | Current state | Evidence |
|-----|----------|--------------|---------|
| **Market** | Is there clear demand for the outcome we enable? | [Strong / Mixed / Weak] | [Data / feedback themes] |
| **Product** | Does the core workflow consistently deliver that outcome? | [Strong / Mixed / Weak] | [Activation / NPS / retention data] |
| **Channel** | Can we reach the audience scalably through channels matched to our model? | [Strong / Mixed / Weak] | [CAC, channel performance] |
| **Model** | Does the revenue model align with how value is delivered and consumed? | [Strong / Mixed / Weak] | [LTV:CAC, pricing-page data] |

---

## PQL Definition (Product-Qualified Lead)

A PQL is a user who has experienced enough value in-product that they're sales- or monetization-ready. Define it precisely.

```
A PQL in [product] is a user who, within [time window], has:
  1. [Action that signals intent — e.g., invited ≥2 teammates]
  2. [Action that signals value — e.g., created a first workspace]
  3. [Action that signals scale — e.g., exceeded free tier on metric X]

Current PQL-to-paid conversion rate: [X%]
```

---

## Loop 1: Acquisition

**Loop hypothesis (one sentence):**
"[Action a user takes in product] creates [output that reaches new users] which causes [new user discovery / signup] which increases our user base — then those new users repeat the action."

### The loop

```
[Input] ──→ [Action] ──→ [Output] ──→ [New user acquisition]
    ↑                                           │
    └───────────────────────────────────────────┘
```

| Stage | What happens | Current rate | Target rate |
|-------|-------------|-------------|-------------|
| Input | [What fuels the loop — e.g., existing users creating shareable artifacts] | [N per week] | [Target] |
| Action | [User behavior — e.g., user publishes a Figma file publicly] | [N per week] | [Target] |
| Output | [What's produced — e.g., public file gets indexed by search / shared on social] | [N impressions] | [Target] |
| Reinforcement | [How output converts to new users — e.g., 1 impression → 0.5% signup] | [Conversion %] | [Target] |

### Rate-limiting step (bottleneck)
[Which stage has the lowest conversion or lowest volume? That's where leverage lives.]

### Experiments to run
- [Experiment 1 — change to lift the rate-limiting step]
- [Experiment 2]

---

## Loop 2: Activation

**Loop hypothesis:**
"New users who [specific activation action] reach the [core value moment] within [time window], which leads to [retention signal] and fuels [input to next loop]."

### The loop

```
[New user] ──→ [Activation step] ──→ [Value moment] ──→ [Retention / depth]
```

| Stage | What happens | Current rate | Target rate |
|-------|-------------|-------------|-------------|
| New user arrives | [From acquisition loop] | [N per week] | [Target] |
| Activation step 1 | [e.g., complete onboarding checklist] | [% complete] | [Target] |
| Activation step 2 | [e.g., invite a teammate] | [% complete] | [Target] |
| Value moment | [Aha moment — e.g., first successful use of core workflow] | [% reach value moment] | [Target] |
| Retention signal | [e.g., W2 return; 3-session active] | [% retained] | [Target] |

### Rate-limiting step
[Stage with the largest drop-off — this is your highest-leverage fix.]

### Experiments to run
- [Onboarding experiment]
- [Friction-removal experiment]

---

## Loop 3: Monetization

**Loop hypothesis:**
"Users who hit [usage signal] convert to paid because [value exceeds cost / free-tier limit reached / team uses seat-based feature]. Paid users unlock [capabilities that drive further usage] which generates [more usage signal] and [expansion revenue]."

### The loop

```
[Active user] ──→ [Usage signal] ──→ [Monetization trigger] ──→ [Paid conversion] ──→ [Expansion]
```

| Stage | What happens | Current rate | Target rate |
|-------|-------------|-------------|-------------|
| Usage signal | [PQL behavior — e.g., exceeded free-tier metric] | [% of users] | [Target] |
| Monetization trigger | [What prompts the paid decision — in-product paywall / seat cap / team invite] | [% see it] | [Target] |
| Paid conversion | [PQL → paid] | [% convert] | [Target] |
| Expansion | [Existing paid → higher tier / more seats] | [% expand in 6 mo] | [Target] |
| Retention | [Paid user retention at 12 mo] | [%] | [Target] |

### Pricing model lens
- Pricing unit: [per seat / per usage / per value delivered / flat tier]
- Does the pricing model amplify the growth loops? [Yes / No — explain]
- Friction at paywall: [What stops willing-to-pay users from paying?]

### Experiments to run
- [Pricing experiment]
- [Paywall placement experiment]

---

## Loop 4: Virality / Retention

**Loop hypothesis:**
"[Retained users perform action X] which [invites / exposes / benefits] [other users or their teammates], creating [new acquisition OR deeper retention]."

### The loop

```
[Retained user] ──→ [Viral or retention action] ──→ [Network effect] ──→ [More users / deeper usage]
```

| Stage | What happens | Current rate | Target rate |
|-------|-------------|-------------|-------------|
| Retained user base | [MAU / WAU] | [Count] | [Target] |
| Virality action | [e.g., invite teammate, share link, publish template] | [K-factor — invites sent per user] | [Target] |
| Network acceptance | [e.g., invitation acceptance rate] | [%] | [Target] |
| New-user quality | [Are virally acquired users as good as other channels?] | [Quality metric] | [Target] |
| Retention compounding | [Does the network effect deepen retention for the inviter too?] | [Delta in retention] | [Target] |

### K-factor
- **Formula**: (invites sent per user) × (invite acceptance rate)
- **Current K**: [value]
- **K ≥ 1 means viral growth is sustaining itself.**
- **K < 1 means virality supplements other channels but doesn't sustain growth alone.**

---

## Cross-Loop Dependencies

Loops are not independent. Map how they feed each other:

```
Acquisition ──→ Activation ──→ Monetization
      ↑                                │
      └────────── Virality/Retention ←─┘
```

| From loop | Feeds → | Mechanism |
|-----------|---------|-----------|
| Acquisition | Activation | New users enter the activation funnel |
| Activation | Monetization | Activated users hit PQL thresholds faster |
| Monetization | Virality | Paid users have more seats → more viral invites |
| Virality | Acquisition | Invited users become new acquisition input |
| Retention | All loops | Retained users keep producing fuel for every loop |

---

## Leverage Diagnosis

| Loop | Current fitness | Biggest bottleneck | Investment priority (1-4) |
|------|----------------|-------------------|--------------------------|
| Acquisition | [Weak / Medium / Strong] | [Stage] | [Rank] |
| Activation | [Weak / Medium / Strong] | [Stage] | [Rank] |
| Monetization | [Weak / Medium / Strong] | [Stage] | [Rank] |
| Virality/Retention | [Weak / Medium / Strong] | [Stage] | [Rank] |

**Principle**: Fix weakest loop first — compounding doesn't work with a broken link. But don't tune a well-running loop to perfection while another is starving.

---

## Metric Tree (ties to North Star)

```
North Star Metric: [From context/metrics/north-star.md]
│
├── Acquisition inputs
│   ├── [Metric]
│   └── [Metric]
├── Activation inputs
│   ├── [Metric]
│   └── [Metric]
├── Monetization inputs
│   ├── [Metric]
│   └── [Metric]
└── Virality/Retention inputs
    ├── [Metric]
    └── [Metric]
```

See `templates/north-star-metric-tree-template.md` for detailed metric-tree construction.

---

## Review Cadence
- **Monthly**: Update rates; note which loop moved the most
- **Quarterly**: Re-diagnose bottleneck; revisit investment priorities
- **Annually**: Re-evaluate four fits; has market/model shifted?

---

## Formatting Guidelines

- **Loops, not funnels**: Every diagram should close back on itself. If it ends in an arrow pointing at nothing, it's a funnel.
- **Be honest about fitness**: "Medium" is often the polite way to say "we don't actually know." Back every fitness rating with evidence.
- **Bottleneck is singular**: Each loop has *one* rate-limiting step. Listing three means you haven't diagnosed.
- **K-factor math is ruthless**: Invites × acceptance. Don't confuse "sent invites" with "invites that converted."
- **PQL must be measurable today**: If your definition references data you don't capture, fix instrumentation first.
- **Cross-loop thinking matters more than within-loop optimization**: A 10% lift in the weakest loop beats a 50% lift in the strongest.
