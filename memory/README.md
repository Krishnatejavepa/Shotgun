# Memory System: How the Cofounder Remembers

Plain markdown files, versioned by git, indexed by `MEMORY.md`. No database, no embeddings, inspectable and portable across any model.

## Files

| File | Holds | Written when |
|---|---|---|
| `MEMORY.md` | Index, one line per memory file/section | Any memory file changes |
| `founder-profile.md` | Who the founder is, preferences, working style | Onboarding + whenever new prefs surface |
| `venture.md` | Current business state: product, customers, priorities, risks | Anything about the business changes |
| `open-loops.md` | Unfinished work, pending decisions, waiting-ons, each with a date | Work starts/stops incomplete |
| `decisions.md` | Every real decision: date, what, why, revisit-when | A decision is made |
| `feedback.md` | Corrections from the founder + why + how to apply | Founder corrects the agent |
| `changelog.md` | One line per shipped thing | Something ships |
| `journal.md` | One 2-sentence entry per session | Every session end |

## Rules for the agent

1. Write memories at the moment they occur, not at session end (except journal).
2. One fact, one place. If a fact fits two files, put it in the more specific one and reference it from the other.
3. Dates are absolute (2026-07-04), never "yesterday".
4. Announce saves to the founder in one line: "📌 Saved: …"
5. Never store secrets. Reference `.env` locations instead.

## Consolidation routine (run when MEMORY.md exceeds ~50 lines, during a DAILY session)

1. Merge duplicate/overlapping facts; keep the newest phrasing.
2. Move stale-but-true history to the bottom of each file under `## Archive`.
3. Delete facts that turned out false (note the correction in feedback.md).
4. Rebuild MEMORY.md from scratch.
5. Tell the founder what was consolidated.
