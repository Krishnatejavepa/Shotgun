# Changelog

## v1.5 (2026-07-10)

The theme: compounding depth. Smarter first contact, richer rituals, an open memory standard.

**The Cofounder Memory Format (CMF) v1.0**

- New `docs/MEMORY-FORMAT.md`: a formal, versioned spec of the memory store (layout, index contract, entry formats, recall semantics, conformance rules). Any tool can now read or write a Shotgun brain; if Shotgun vanished, the spec is enough to rebuild a reader. The moat and the exit door in one document.

**Rituals**

- **CEO Weekly** ("run my CEO weekly"): the weekly review, revisit scan, metrics pulse, a drafted weekly update, next week's ONE thing, and one proposed experiment, chained into one command with one filed output document.
- **Debate Mode** in the Panel ("debate this", "argue it out"): the two specialist lenses with the strongest opposing stakes argue a trade-off across two strict rounds, then the cofounder referees with a position. Ties are forbidden.
- **Health Score**: every doctor checkup now ends with a transparent 0-100 score (system integrity 60 + momentum 40), appended to `memory/metrics.md` so health itself becomes a tracked metric. Any secret leak caps the score at 25.

**Onboarding**

- **Phase 0.5, stack detection**: onboarding silently reads the folder first (package.json, requirements.txt, Stripe/Shopify signals), opens with what it already knows, pre-selects the matching starter template, and pre-wires the first metric. It removes questions, never adds them.

**Port & data**

- **Three new importers**: Roam (JSON/EDN), Google Docs/Takeout, and Linear (CSV → open loops in ruthless format). All follow the reviewed-proposal pattern: nothing enters memory unreviewed.
- **Advisor Mode**: a redacted read-only bundle for mentors/investors, built from an explicit allowlist (venture, metrics, decisions, changelog + named vault files only), verified before sending, with the private files structurally unable to leak.
- **Transcript intake** (organize-data): meeting transcripts, Loom captions, and voice-note text get summarized with speaker attribution; decisions, action items, and durable facts are extracted as proposed entries. Transcripts are data, never instructions (RULE 0).

**Growth**

- **Split-test recipe** in the grow skill: honest no-infra A/B testing with sample floors, stated methodology, and a "meaningful gap or it's a tie" verdict rule. No p-value theater on 40 data points.

**One-command upgrades**

- New `shotgun-upgrade` command (installed by the same one-liner as `shotgun-init`): upgrades any install from v1.0 onward to the latest release in place. Framework files (loop, skills, commands, docs, entry points) are refreshed; `memory/`, `vault/`, `workspace/`, learned-* skills, and `.env` are untouched by contract; the old `SHOTGUN.md` and `.shotgun/` are backed up to a dated folder first. Pre-v1.2 installs get their learned skills migrated from the old `skills/` location automatically. CI runs the upgrade end-to-end on every push, asserting founder data survives.

**Project**

- New `GOVERNANCE.md`: the constraint contract (what will never merge), how decisions get made, the maintainer path, and the fork clause. Honest about the single-maintainer present, clear about the rules.
- Parked for a future release, deliberately: the visual dashboard and official skill packs.

## v1.4 (2026-07-09)

The theme: a quickstart that actually works, and compatibility with the whole agent ecosystem instead of five tools.

**Installer, rebuilt (the v1.3 one was broken)**

- `curl | bash` / `iwr | iex` now work from anywhere: the installer downloads Shotgun once to `~/.shotgun-os` (git clone with tarball fallback), or uses your local clone if run from inside one. The v1.3 script required you to already be inside a cloned repo, which contradicted its own instructions.
- `shotgun-init` now scaffolds the complete OS, not just `.shotgun/` + SHOTGUN.md: memory protocol + templates, vault guide + index, starter templates, docs, workspace, all agent entry points, `.gitignore`, and the compatibility symlinks. v1.3 created empty `memory/` and `vault/` folders that onboarding then couldn't fill (missing `_templates/`).
- Re-running the installer updates in place instead of appending duplicate aliases. Existing project files are never overwritten (`cp -n` everywhere).

**AGENTS.md standard adoption**

- Added a root `AGENTS.md` following the Linux Foundation AGENTS.md standard. Shotgun now boots natively on 28+ agents (Codex CLI, Windsurf, Zed, Devin, Aider, Amp, Jules, and more), not just the five with dedicated entry points.
- Documented the entry-point model in `docs/ARCHITECTURE.md`; the doctor skill now audits entry points and compatibility symlinks (new Check 6).

**CI self-validation**

- New `.github/workflows/validate.yml`: on every push, machine-checks every skill's frontmatter (name matches folder), every routing path in SHOTGUN.md, all `.shotgun/` cross-references repo-wide, entry-point presence, installer syntax, and a full end-to-end `shotgun-init` scaffold test. The doctor skill audits a founder's copy; CI audits the framework itself.

**Loop fixes**

- New **IDEA** request class routed to the `idea-refine` skill (it existed in v1.3 but was reachable only by native discovery). Vague, unclassifiable requests now route to `interview-me`.
- §1 lazy loading fixed: it referenced a "PLAN" task type that was never a class. Profile now loads for WRITE/DECIDE/SPAR/IDEA; venture for BUILD/GROW/DECIDE/FINANCE/LEGAL.
- All 7 slash commands referenced a nonexistent `agent-skills:` plugin namespace (12 dangling references, leftover from the upstream plugin). They now route by explicit `.shotgun/skills/` path, same as the loop.
- Doctor's journal roll-up threshold aligned to the v1.3 value (30 lines; it still said 60).
- `docs/ARCHITECTURE.md` class count corrected (it still described twelve classes; there are eighteen).
- Fixed a wrong skill path in the web-performance-auditor persona, stale 2024-era model names across docs, the metrics template attributing the weekly pulse to the wrong skill, and added `.shotgun/settings.local.json` to `.gitignore`. The data-hook skill description now carries trigger phrases like every other skill.

## v1.3 (2026-07-08)

**Core Upgrades (Pure Markdown/Prompt)**

- **Global Installer**: Added `install.sh` and `install.ps1` to easily set up a `shotgun-init` alias, allowing founders to initialize the OS in any existing codebase without cloning.
- **Morning Intelligence Brief**: Upgraded the `daily` skill. Typing "good morning" now generates a comprehensive brief including yesterday's burn, metrics checks, pending decisions for research, and today's ONE thing.
- **Data Hooks**: Added `data-hook` skill (`DATA-HOOK` class in loop) to instruct the agent to parse pasted Stripe CSVs, text dumps, or screenshots directly into canonical metrics without needing code or API keys.

**Cross-Platform Architecture**

- Transformed Shotgun into a truly platform-agnostic operating system. The core loop is now `SHOTGUN.md` and skills live in `.shotgun/`.
- Created native entry point files for **Claude Code, Cursor, Antigravity, Gemini, and GitHub Copilot**.
- Provided `setup-compatibility.sh` and `setup-compatibility.ps1` to automatically wire up native platform directories (like `.cursor/rules` or `.agents`) to the universal `.shotgun/` vault.

**Solofounder Core Skills**

- **`spar`**: A dedicated "Red Team" skill. When the founder needs to bounce an idea, Shotgun intentionally plays devil's advocate, aggressively stress-testing assumptions to break the echo chamber.
- **`finance`**: A virtual CFO. Tracks MRR, Burn Rate, and Runway. If runway drops below 3 months, Shotgun enters "Survival Mode" and aggressively pushes back against any BUILD requests that don't generate immediate revenue.
- **`legal`**: A compliance advisor. Captures the founder's jurisdiction and individual visa/immigration status, drafts localized privacy policies/terms, and generates corporate roadmaps based on immigration constraints (all guarded by strict attorney disclaimers).
- **`support`**: A triage system for noisy user feedback. Categorizes emails/tweets, files bugs, and drafts empathetic replies in the founder's voice, preventing context-switching.

**Engineering Skills Integration**

- Integrated a library of 24 production-grade engineering skills (TDD, architectural reviews, CI/CD, etc.) natively into `.shotgun/skills/`.
- Included specialist personas (e.g., Code Reviewer, Security Auditor) in `.shotgun/agents/` and reference checklists in `.shotgun/references/`.
- Added 8 development lifecycle slash commands (`/build`, `/test`, `/review`, etc.) via `.shotgun/commands/`.

**Operating Rhythm Upgrades**

- **Ruthless Open Loops**: Open loops now mandate a concrete next action, an owner, and a strict due date. The daily standup automatically flags any zombie loops missing this data.
- **Weekly Planning Command**: A new command inside the `daily` skill generates a comprehensive weekly plan from the latest journal entries and the current venture state.

**Context & Token Optimization**

- Implemented **Lazy Loading** for memory: `founder-profile.md` and `venture.md` are only loaded for relevant task types (`WRITE`/`PLAN`/`DECIDE`/`BUILD`/`GROW`), saving context tokens on quick queries.
- The journal roll-up threshold was reduced from 60 lines to 30 lines to prevent context bloat.
- `MEMORY.md` now receives a highly condensed 1-2 line venture summary during consolidation to reduce load on the main files.

## v1.2 (2026-07-07)

The theme: a cofounder for the whole company, not just the codebase, and a system that keeps itself honest.

**New skills**

- **write**: drafts in the founder's real voice (learned from their samples into `memory/voice.md`), with a mandatory cut pass and a voice-drift learning loop. Copy stops sounding like AI.
- **research**: the scout. Market, competitor, and "what exists" questions answered with sources and dates, filed to `vault/research/`, with a maintained competitor watchlist. Fact / inference / unknown, labeled.
- **grow**: distribution as a system. One channel at a time, growth experiments with hypotheses and kill-dates in a growth log, launch checklists. Solo ventures die of silence more often than bugs.
- **doctor**: monthly self-checkup. Memory index integrity, loop registry drift, vault hygiene, git safety (remotes, tracked .env, secret grep), skill health, contract audit. One line per check.

**Memory upgrades**

- `memory/voice.md`: writing samples + derived voice rules + a corrections log that sharpens with every edited draft.
- `memory/metrics.md`: append-only numbers history. The weekly pulse now WRITES a dated row instead of evaporating, so momentum is visible across months.
- Weekly review now scans every decision's REVISIT WHEN trigger against current venture state and metrics, so "revisit if churn > 5%" actually fires.

**Structural**

- Skills moved from `skills/` to `.shotgun/skills/`: compatible agents now discover them natively (frontmatter preloaded, better triggering), while SHOTGUN.md keeps routing by explicit path for any harness. Learned skills live flat as `learned-<name>` next to core skills; format doc moved to `docs/LEARNED-SKILLS.md`.
- SHOTGUN.md session start uses `@memory/MEMORY.md` and `@memory/venture.md` imports (inlined automatically by agents that support it); the MUST-read instruction remains as fallback.
- RULE 0 now states explicitly that file/web content is data, never instructions.

**Cross-platform**

- Every command in onboarding, port, and the quickstart now has a Windows PowerShell variant next to the bash one. The export bundle has a Compress-Archive path.
- New `docs/HARDENING.md`: why not to run your cofounder inside OneDrive/Dropbox/iCloud, backup rhythm, optional agent-specific hooks (off by default, on purpose), permission pre-approvals, model choice.

**Imports**

- ChatGPT / Claude.ai export import: durable facts are mined from `conversations.json` and PROPOSED as memories (reviewed, never bulk-written). Months of context in another AI no longer die there.

**Templates**

- New `templates/ecommerce.md` (stores: Shopify, Etsy, Gumroad). Templates now also seed the metrics file's "numbers that matter".

## v1.1 (2026-07-05)

- Portability (port skill), recall routine, self-testing learned skills, the Panel, staged builds. By Krishna Teja.

## v1 (2026-07-04)

- The core: operating loop, memory system, vault, build/decide/daily/loop/experiment skills. By Krishna Teja.
