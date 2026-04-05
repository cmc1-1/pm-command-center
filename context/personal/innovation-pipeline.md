# Innovation Pipeline
Last updated: [auto-update timestamp]

---

## How to Use This File
This is your idea inventory — a kanban-style tracker for product opportunities from raw signal to validated hypothesis to active exploration. Ideas flow in from Bold Idea Lab sessions, meeting insights, customer conversations, market intelligence, and AI research scans. Nothing gets lost; everything gets evaluated.

---

## Pipeline Stages

### Raw Signal
_Ideas that surfaced but haven't been evaluated yet. Capture first, assess later._

| ID | Date | Idea | Source | Tags |
|----|------|------|--------|------|

### Hypothesis
_Ideas that passed initial gut check and have a testable thesis._

| ID | Date | Hypothesis | Key Assumption to Test | Effort to Validate | Priority |
|----|------|-----------|----------------------|-------------------|----------|

### Exploring
_Ideas being actively investigated — research, customer conversations, prototypes._

| ID | Date Started | Idea | Validation Status | Next Step | Owner |
|----|-------------|------|------------------|-----------|-------|

### Validated
_Ideas with enough evidence to justify a PRD or business case._

| ID | Idea | Evidence Summary | Recommended Next Step | PRD Link |
|----|------|-----------------|----------------------|----------|

### Parked
_Ideas that aren't right for now but shouldn't be forgotten._

| ID | Idea | Why Parked | Revisit Trigger |
|----|------|-----------|-----------------|

### Killed
_Ideas evaluated and rejected — with documented reasoning so they don't resurface._

| ID | Idea | Why Killed | Date Killed |
|----|------|-----------|-------------|

---

## ID Convention
Format: IDEA-[NNN] (e.g., IDEA-001)
Sequential, never reused.
Next available ID: IDEA-001

---

## Monthly Review Prompt
Each month, review this pipeline:
- Promote ideas that gained evidence (Raw Signal → Hypothesis → Exploring)
- Park ideas that lost urgency
- Kill ideas that were invalidated
- Check if any Parked ideas should be revived based on new context
