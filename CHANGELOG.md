# Changelog

## v1.6.2 (2026-07-12)

README redesign. No functional changes.

- Two more animated terminal demos (`assets/terminal2.gif`, `assets/terminal3.gif`) placed alongside the feature list and comparison table; existing `assets/terminal.gif` re-recorded.

## v1.6.1 (2026-07-11)

README redesign. No functional changes.

- New layout: centered banner (`assets/banner.png`) and animated terminal demo (`assets/terminal.gif`), Quickstart moved to the top, condensed 12-bullet feature list, compatibility badge row, and a general-assistant comparison table.
- New `assets/` directory for README imagery.
- All content rewritten from the v1.6 README — install commands, structure tree, philosophy, and doc links unchanged in substance.

## v1.6 (2026-07-11)

The theme: from builder to company. Shotgun now runs the parts of a business that happen outside the editor — the company roadmap, the sales pipeline, the brand, the recurring work, and the rails money moves on — the same way it has always run the build: files-first, founder-owned, checked off on evidence. Four new request classes; the loop grows from 18 to 22.

**The Company Roadmap (new ROADMAP class)**

- `memory/roadmap.md`: the staged company-building path (Idea → Setup → Identity → Build → Go-to-market → Launch → Scale → Mature). Steps carry a status (locked/available/in-progress/done), an owner class, and an evidence line: nothing gets checked off on vibes, only on evidence just re-read. Unlocks are computed and announced. Onboarding offers to generate it pre-marked from stack detection; the weekly review scans it; the Morning Brief names the company's next step alongside today's ONE thing. Starter templates shape it per vertical.

**Sales & the CRM (new SELL class)**

- The sell skill: ICP definition (recorded as a decision with a revisit trigger), sourced prospecting, outreach drafted in the founder's voice, call prep, negotiation options, close and post-close checklists. Hard rules: never invent an account, contact, reply, or stage; every send is §3.3-gated.
- `vault/crm/`: `accounts.md` (one block per account, activity log, next step in ruthless format) and `pipeline.md` (one line per opportunity). The weekly pulse gains a pipeline line; stale opportunities (14+ days) get flagged.

**The brand system (new DESIGN class)**

- The design skill: a 10-minute brand-kit interview producing `vault/brand/DESIGN.md`, the visual sibling of `memory/voice.md`: vibe, palette (hex), type, spacing, component rules, imagery direction, do/don't. Build, grow, and write now read it before producing anything visible. Git history is the kit archive; brand refreshes route through DECIDE. Onboarding gains a skippable one-question seed (Phase 4.5).

**Routines**

- `memory/routines.md`: the registry of recurring work: cadence, optional run-criteria, last run + result, next focus, active/paused. The standup checks due routines (MUST when the file exists); paused ones get listed monthly so they don't rot. The agent may propose a routine when it notices repeating work, same discipline as learned skills: offer once, founder approves. Standup, weekly review, and the monthly checkup now live in the registry too.

**Stack & monetize (new STACK class)**

- The stack skill: guided, verified, founder-owned setup for hosting with staging→prod publishing (main → prod PR flow), database (SQLite first, Supabase when real), domain + DNS, transactional email (SPF/DKIM checklists, no warming games), analytics (one privacy-light tool, one number wired to metrics), and the full Stripe recipe: test/live key separation in `.env` only, a signature-verifying webhook route, test-card verification before any real money, go-live behind §3.3.
- STACK STATUS block in `memory/venture.md`: hosting/database/domain/email/payments/analytics, each ready/pending/n/a, updated only on verification. Onboarding seeds it from stack detection; the doctor flags items pending 30+ days when the roadmap stage needs them.

**Library upgrades**

- Reusable scripts: `workspace/scripts/`, one job per file, `--input <path>` convention, registered in the new Scripts section of `vault/_index.md`. Same filename = update in place, never a `_v2_final`. Organize-data and build both route through it.
- Pinned files: a `📌 Pinned` section atop `vault/_index.md` for the files the founder returns to constantly. Pure visibility, doctor-checked for dangling pins.
- Needs-action ordering: the Morning Brief now lists work waiting on the FOUNDER first, tagged NEEDS-YOU. Founders clear their own bottlenecks before anything else.

**Deliberately not copied from the cloud platforms**

- Managed provisioning, hosted agent email inboxes, inbox warming, brokered secrets, in-app domain purchase. All violate the constraint contract (no servers, no databases, no accounts) or the founder's interests (warming games, spray outreach). The guided-recipe versions above are the local-first translations.
- Parked for v1.7: the "hire an agent" scaffold (custom persona + skill + routine as one bundle).

## v1.5.1 (2026-07-11)

- **Health Score trend line**: every doctor checkup now prints the last 5 scores oldest-first (`TREND: 90 → 81 → 74 → 62 → 62 (falling)`) with a one-word slope: rising, stable, or falling. A single 62 says little; a 90→62 slide over three checkups is a different conversation, so the checkup volunteers the slide instead of waiting to be asked. Health-score revisit triggers on decisions are now also checked at score time, not just during the vault scan. (Prompted by launch feedback: a score that only reports the latest number is easy to ignore under pressure.)

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
