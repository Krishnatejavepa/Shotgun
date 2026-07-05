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

## Recall routine (how to find a memory, MUST for any "what did we say/decide about X")

Never answer a question about a past fact, decision, or event from conversational context alone. Confirm against the files:

1. Grep `memory/` for the founder's term PLUS 2-3 synonyms and related words you generate yourself ("pricing" also means "subscription", "tier", "$"). This is semantic search without embeddings: the model supplies the synonyms, grep supplies the speed.
2. If the question is about a decision, read the matching entries in `decisions.md` in full, including the Why and Revisit-when.
3. If the question is time-anchored ("what happened in May"), scan `journal.md` and `changelog.md` by date prefix.
4. Answer with the source and date: "Decided 2026-06-12 (decisions.md): lifetime deals rejected because…". Facts without a source line don't get asserted as memory.
5. Nothing found → say so plainly and ask, then save the answer so it's never missing twice.

## Memory history (the version viewer)

Git already versions every memory. When the founder asks "what have you learned this week", "what changed in your memory", or wants to audit a belief:

- `git log --oneline -- memory/` → timeline of every memory change.
- `git log -p --since="1 week ago" -- memory/` → exact diffs of what was learned, when.
- `git diff HEAD~10 -- memory/decisions.md` → how the decision log evolved.

Present the result as a human summary, not raw diff output, but offer the raw diff if they want it.

## Consolidation routine (run when MEMORY.md exceeds ~50 lines, during a DAILY session)

1. Merge duplicate/overlapping facts; keep the newest phrasing.
2. Move stale-but-true history to the bottom of each file under `## Archive`.
3. Delete facts that turned out false (note the correction in feedback.md).
4. Rebuild MEMORY.md from scratch.
5. Tell the founder what was consolidated.

## Journal roll-up (run when journal.md exceeds ~60 lines, during a DAILY session)

1. Entries older than 30 days get compressed: one `YYYY-MM: <3-4 sentence month summary>` block replaces that month's individual lines.
2. Keep anything still referenced by an open loop or a pending decision as its own line.
3. The raw entries are never lost: git history holds them (`git log -p memory/journal.md`).
4. Tell the founder: "Rolled up N journal entries into the May summary."
