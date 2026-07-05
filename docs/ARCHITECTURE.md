# Architecture

## The stack

```
┌──────────────────────────────────────────┐
│  Model (Opus / Sonnet / future)          │  ← interchangeable
├──────────────────────────────────────────┤
│  CLAUDE.md: the operating loop           │  ← the contract; deterministic checklists
├──────────────────────────────────────────┤
│  skills/: workflow modules               │  ← onboard, build, organize-data,
│    (+ skills/learned/: self-written)     │    decide, daily, loop, experiment
├──────────────────────────────────────────┤
│  State (plain markdown + git)            │
│    memory/    what the cofounder knows   │
│    vault/     the founder's data         │
│    workspace/ code being built           │
└──────────────────────────────────────────┘
```

## Why it's model-portable

The single biggest design constraint: **the loop must run identically on any capable model.** This is achieved by:

1. **MUST-marked checklists, not judgment calls.** "Read memory/MEMORY.md at session start. MUST." leaves nothing to model personality.
2. **Numbered sequences with explicit ordering.** Weaker models follow sequences reliably; only interpretation varies, so interpretation is minimized.
3. **Exact request classification.** Every founder message maps to exactly one of five classes (QUICK/BUILD/ORGANIZE/DECIDE/DAILY), each with its own skill file. No ambient behavior.
4. **State in files, not in context.** The model can be swapped mid-week; the new model reads the same memory and continues. Nothing important lives only in a conversation.
5. **Self-verification steps.** "Run the code before delivering", "announce every memory save", outputs are checkable, so drift is visible and correctable.

## Data flow

- **In:** founder messages, dropped files (→ `vault/inbox/`), imported CSVs.
- **Processing:** classification → skill workflow → execution.
- **Out:** deliverables (files, code, cleaned data) + memory writes + one-line save announcements.
- **Persistence:** git commits = memory snapshots. Rollback = `git checkout`.

## Trust model

- Nothing destructive without confirmation (loop §3.3, vault rule 2).
- Nothing presented as done without verification (build §4).
- All memory human-readable and human-editable, the founder can audit every stored "belief".
- Secrets never enter memory or vault; `.env` only, gitignored.

## Extension model

A skill = one folder + one SKILL.md with frontmatter (name, description). The description tells the agent when to trigger it. Community skills drop in without touching the core loop; only new *request classes* require a one-line addition to CLAUDE.md §2.
