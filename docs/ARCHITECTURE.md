# Architecture

## The stack

```
┌──────────────────────────────────────────┐
│  Model (any frontier LLM)                │  ← interchangeable
├──────────────────────────────────────────┤
│  SHOTGUN.md: the operating loop           │  ← the contract; deterministic checklists
├──────────────────────────────────────────┤
│  .shotgun/skills/: workflow modules       │  ← onboard, build, write, organize-data,
│    (+ learned-*: self-written)           │    decide, research, grow, daily, loop,
│                                          │    experiment, review, port, doctor
├──────────────────────────────────────────┤
│  State (plain markdown + git)            │
│    memory/    what the cofounder knows   │
│    vault/     the founder's data         │
│    workspace/ code being built           │
└──────────────────────────────────────────┘
```

## Why it's model-portable

The single biggest design constraint: **the loop must run identically on any capable model.** This is achieved by:

1. **MUST-marked checklists, not judgment calls.** "Read memory/founder-profile.md at session start. MUST." leaves nothing to model personality.
2. **Numbered sequences with explicit ordering.** Weaker models follow sequences reliably; only interpretation varies, so interpretation is minimized.
3. **Exact request classification.** Every founder message maps to exactly one of eighteen classes (QUICK/BUILD/WRITE/ORGANIZE/PORT/DECIDE/IDEA/SPAR/FINANCE/DATA-HOOK/LEGAL/SUPPORT/RESEARCH/GROW/DAILY/LOOP/EXPERIMENT/REVIEW), each with its own skill file. No ambient behavior.
4. **State in files, not in context.** The model can be swapped mid-week; the new model reads the same memory and continues. Nothing important lives only in a conversation.
5. **Self-verification steps.** "Run the code before delivering", "announce every memory save", outputs are checkable, so drift is visible and correctable. The doctor skill audits the whole system monthly.

## Why skills live in .shotgun/skills/

Two discovery mechanisms, belt and suspenders:

1. **Explicit routing.** SHOTGUN.md §2 maps every request class to a skill file by path. This works in any harness that can read files, which is what makes Shotgun portable across all supported platforms.
2. **Native discovery.** `.shotgun/skills/` is where compatible agents look for project skills: they preload each skill's frontmatter (name + description) and can trigger the right skill even before classification. The `description` fields carry the trigger phrases for exactly this reason.

Memory auto-load works the same way: SHOTGUN.md §1 uses `@memory/MEMORY.md` imports (inlined automatically by agents that support it) AND a MUST-read instruction as the fallback for all harnesses.

Entry points follow the same belt-and-suspenders logic. The root `AGENTS.md` (the Linux Foundation standard read by 28+ tools) points every compliant agent at SHOTGUN.md; `CLAUDE.md`, `GEMINI.md`, `.cursorrules`, and `.github/copilot-instructions.md` do the same for tools with their own conventions. One sentence each, all roads lead to the loop.

## Data flow

- **In:** founder messages, dropped files (→ `vault/inbox/`), imported CSVs, research findings.
- **Processing:** classification → skill workflow → execution.
- **Out:** deliverables (files, code, cleaned data, drafts) + memory writes + one-line save announcements.
- **Persistence:** git commits = memory snapshots. Rollback = `git checkout`. `memory/metrics.md` = the venture's numbers over time.

## Trust model

- Nothing destructive without confirmation (loop §3.3, vault rule 2).
- Nothing presented as done without verification (build §4).
- All memory human-readable and human-editable, the founder can audit every stored "belief".
- Secrets never enter memory or vault; `.env` only, gitignored. The doctor skill greps for leaks monthly.
- The framework audits itself in CI: `.github/workflows/validate.yml` checks every skill's frontmatter, every routing path in SHOTGUN.md, all cross-references, and runs the installer end-to-end on every push. The doctor skill audits a founder's live copy; CI audits the framework.

## Extension model

A skill = one folder under `.shotgun/skills/` + one SKILL.md with frontmatter (name, description, version). The description tells the agent when to trigger it; a `## Verify` section makes it self-testing. Community skills drop in without touching the core loop; only new *request classes* require a one-line addition to SHOTGUN.md §2. Related skills ship together as packs (CONTRIBUTING.md), and starter templates in `templates/` extend onboarding per vertical without touching the onboard skill.

## Portability model

The cofounder is a folder. The port skill exports it as a verified bundle (secrets excluded), imports Obsidian/Notion/ChatGPT brains through the vault with human-reviewed memory proposals, and merges two Shotgun memories with per-conflict founder decisions. Nothing about the design assumes this machine, this model, or this vendor.
