# Playbook: [Process Name]

> **Purpose**: Repeatable "how we do X" document — scope, steps, roles, examples, and escalation paths.
> **When to use**: After doing a process 2-3 times and noticing you re-explain it. Lives in `artifacts/` or team wiki; referenced from skill docs when relevant.
> **Audience**: Team members running the process, new hires learning it, cross-functional partners following it.

**Author:** [Your name]
**Created:** [Date]
**Last Updated:** [Date]
**Version:** [e.g., 1.0]
**Owner:** [Person or team responsible for maintaining this playbook]

---

## Purpose

[Describe what process this playbook documents and why it exists. What problem does it solve? What outcome does following this process produce? Keep it to 2-3 sentences. E.g., "This playbook documents our incident response process for production outages. Following this process ensures we respond consistently, minimize customer impact, and capture learnings for prevention."]

---

## When to Use

[Define the trigger conditions that tell someone they should follow this playbook.]

**Use this playbook when:**
- [Trigger condition 1 — e.g., "A customer-facing service is down or degraded for more than 5 minutes"]
- [Trigger condition 2 — e.g., "A new feature is ready for launch and needs go-to-market coordination"]
- [Trigger condition 3]

**Do NOT use this playbook when:**
- [Exception 1 — e.g., "The issue is limited to internal tooling with no customer impact — use the internal ops runbook instead"]
- [Exception 2 — when a different process applies, name it]

---

## Prerequisites

[What needs to be true before starting this process? List everything someone needs to have, know, or verify before step 1.]

- [ ] [Prerequisite 1 — e.g., "You have access to the monitoring dashboard (link)"]
- [ ] [Prerequisite 2 — e.g., "The stakeholder list is up to date (link)"]
- [ ] [Prerequisite 3 — e.g., "You have completed the onboarding training for this process"]
- [ ] [Prerequisite 4 — e.g., "The required template/document has been created from (link)"]

---

## Steps

### Step 1: [Step Name]

**Who:** [Role or person responsible]
**Time:** [Expected duration — e.g., "~15 minutes"]

[Detailed description of what to do. Be specific enough that someone doing this for the first time can follow along.]

- [Sub-step a]
- [Sub-step b]
- [Sub-step c]

**Output:** [What should exist when this step is complete — e.g., "A draft brief shared in #channel"]

---

### Step 2: [Step Name]

**Who:** [Role or person responsible]
**Time:** [Expected duration]

[Detailed description.]

- [Sub-step a]
- [Sub-step b]

**Output:** [What this step produces]

---

### Step 3: [Step Name] -- DECISION POINT

**Who:** [Role or person responsible]
**Time:** [Expected duration]

[Describe the decision that needs to be made at this point.]

| Condition | Action |
|-----------|--------|
| [If condition A is true — e.g., "Impact is P1/critical"] | [Go to Step 4A] |
| [If condition B is true — e.g., "Impact is P2/moderate"] | [Go to Step 4B] |
| [If condition C is true — e.g., "Issue is resolved"] | [Skip to Step 6] |

**Decision maker:** [Who has authority to make this call]

---

### Step 4A: [Step Name — Path A]

**Who:** [Role]
**Time:** [Duration]

[Details for this path.]

**Output:** [Result]

---

### Step 4B: [Step Name — Path B]

**Who:** [Role]
**Time:** [Duration]

[Details for this path.]

**Output:** [Result]

---

### Step 5: [Step Name]

**Who:** [Role]
**Time:** [Duration]

[Details.]

**Output:** [Result]

---

### Step 6: [Step Name — Wrap-up]

**Who:** [Role]
**Time:** [Duration]

[Final steps — documentation, communication, handoff, retrospective.]

- [Sub-step a — e.g., "Update the tracking log with outcome and date"]
- [Sub-step b — e.g., "Send summary to stakeholders"]
- [Sub-step c — e.g., "Schedule retrospective if applicable"]

**Output:** [Final deliverable — e.g., "Completed log entry, stakeholder notification sent"]

---

## Tools & Resources Needed

| Tool / Resource | Purpose | Link / Location |
|----------------|---------|----------------|
| [e.g., Monitoring dashboard] | [What it's used for in this process] | [URL or path] |
| [e.g., Communication template] | [Purpose] | [Link] |
| [e.g., Tracking spreadsheet] | [Purpose] | [Link] |
| [e.g., Slack channel] | [Purpose] | [#channel-name] |
| [e.g., Escalation contact list] | [Purpose] | [Link] |

---

## Common Pitfalls

| Pitfall | How to Prevent It | How to Recover |
|---------|-------------------|---------------|
| [e.g., Skipping stakeholder notification in Step 2] | [e.g., Use the checklist — don't rely on memory] | [e.g., Send a late notification with apology and context] |
| [e.g., Spending too long on root cause analysis before mitigating] | [e.g., Set a 15-minute timebox for initial diagnosis — mitigate first, investigate later] | [e.g., Switch to mitigation immediately, schedule RCA for after resolution] |
| [e.g., Not documenting the decision rationale at Step 3] | [e.g., Fill in the decision log before moving to the next step] | [e.g., Reconstruct rationale from Slack/meeting notes and backfill the log] |
| [e.g., Forgetting the wrap-up step] | [e.g., Set a reminder or use the completion checklist] | [e.g., Complete the wrap-up retroactively within 24 hours] |

---

## Success Criteria

[How do you know this process worked? Define what "done well" looks like.]

- [ ] [Criterion 1 — e.g., "Resolution achieved within SLA targets"]
- [ ] [Criterion 2 — e.g., "All stakeholders were notified within 30 minutes"]
- [ ] [Criterion 3 — e.g., "Documentation is complete and the tracking log is updated"]
- [ ] [Criterion 4 — e.g., "Retrospective is scheduled (if applicable) and learnings are captured"]

---

## Variations

[Document when and how to adapt the standard process. Not every situation fits the default path.]

### Variation: [Scenario Name — e.g., "Expedited process for time-sensitive situations"]
- **When to use:** [Trigger — e.g., "Executive request with same-day deadline"]
- **What changes:** [Which steps are modified, shortened, or skipped]
- **What stays the same:** [Which steps are still required]

### Variation: [Scenario Name — e.g., "Cross-team version"]
- **When to use:** [Trigger]
- **What changes:** [Modifications]
- **What stays the same:** [Constants]

### Variation: [Scenario Name — e.g., "Lightweight version for low-impact situations"]
- **When to use:** [Trigger]
- **What changes:** [Modifications]
- **What stays the same:** [Constants]

---

## Owner & Review Cadence

| Attribute | Detail |
|-----------|--------|
| **Process owner** | [Name and role — the person responsible for keeping this playbook current] |
| **Review cadence** | [How often this playbook is reviewed — e.g., "Quarterly" or "After every major incident"] |
| **Next review date** | [Date] |
| **Feedback channel** | [Where to submit suggestions — e.g., "#process-feedback Slack channel" or "File an issue in repo X"] |

---

## Version History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | [Date] | [Author] | [Initial version] |
| [1.1] | [Date] | [Author] | [What changed and why — e.g., "Added Step 3 decision point based on Q1 retro feedback"] |
| [1.2] | [Date] | [Author] | [Changes] |

---

## Formatting Guidelines

- **Write for the newcomer:** Assume the reader is following this process for the first time. Include enough detail that they don't need to ask someone for help. Link to tools, templates, and examples.
- **Mark decision points clearly:** Use the "DECISION POINT" label and the condition/action table so readers know when they need to make a judgment call vs. follow a fixed sequence.
- **Keep steps atomic:** Each step should have one clear action and one clear output. If a step has more than 3 sub-steps, consider splitting it.
- **Pitfalls are gold:** The common pitfalls table is often the most valuable section. Populate it from real experience — after each time the process runs, ask "what almost went wrong?" and add it.
- **Version history matters:** Always log changes. When someone follows an outdated version of the process, they need to understand what changed and when.
- **Review regularly:** A playbook that hasn't been updated in 6+ months is probably out of date. Set the review cadence and stick to it.
- **Test the playbook:** Have someone unfamiliar with the process follow it end-to-end and note where they get confused. Those confusion points are gaps in your documentation.
- **Target length:** Varies by process complexity. Simple processes: 2-3 pages. Complex processes: 5-8 pages. If it exceeds 10 pages, consider splitting into sub-playbooks.
