# docs/archive/

Historical design and planning documents from the initial build of the PM Command Center (March 2026). **All four are superseded by `GUIDE.md`** and are retained here for historical reference only.

| File | Original Purpose | Superseded By |
|------|------------------|---------------|
| `AI_PM_Assistant_Blueprint.md` | Day-0 research + product vision for the system | `GUIDE.md` §1–3 |
| `PM_Command_Center_Unified_Blueprint_v2.md` | v2 design spec consolidating the blueprint into implementation | `GUIDE.md` (all sections) |
| `PM_Command_Center_Systems_Architecture.md` | Deep-dive on meeting pipeline + decision architecture | `GUIDE.md` §4–5 + individual skill files |
| `PM_Command_Center_Implementation_Plan.md` | Week-by-week rollout plan (pre-start → Month 1) | `GUIDE.md` §6 "First Week" + `INDEX.md` onboarding checklist |

## Why archived rather than deleted
- They contain design rationale not captured in the user-facing guide.
- Some future decisions (e.g., which skills to consolidate or split) may want to reference the original reasoning.
- They reference a "v1 catalog" of skills — do **not** treat their skill lists as current. The authoritative skill list is `INDEX.md` and `GUIDE.md` §4.

## Known contradictions with current state
- These docs reference an "Interview Synthesis" skill that was absorbed into `discovery-cadence`.
- They reference 11–13 skill counts; the current system has **26**.
- They reference templates that existed at build time; the current set is **22** in `templates/`.

**For any live question about system state, read `GUIDE.md` + `INDEX.md`, not these files.**
