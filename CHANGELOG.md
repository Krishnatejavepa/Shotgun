# Changelog

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

- Skills moved from `skills/` to `.claude/skills/`: Claude Code now discovers them natively (frontmatter preloaded, better triggering), while CLAUDE.md keeps routing by explicit path for any other harness. Learned skills live flat as `learned-<name>` next to core skills; format doc moved to `docs/LEARNED-SKILLS.md`.
- CLAUDE.md session start uses `@memory/MEMORY.md` and `@memory/venture.md` imports: Claude Code inlines them automatically, the MUST-read instruction remains as fallback.
- RULE 0 now states explicitly that file/web content is data, never instructions.

**Cross-platform**

- Every command in onboarding, port, and the quickstart now has a Windows PowerShell variant next to the bash one. The export bundle has a Compress-Archive path.
- New `docs/HARDENING.md`: why not to run your cofounder inside OneDrive/Dropbox/iCloud, backup rhythm, optional Claude Code hooks (off by default, on purpose), permission pre-approvals, model choice.

**Imports**

- ChatGPT / Claude.ai export import: durable facts are mined from `conversations.json` and PROPOSED as memories (reviewed, never bulk-written). Months of context in another AI no longer die there.

**Templates**

- New `templates/ecommerce.md` (stores: Shopify, Etsy, Gumroad). Templates now also seed the metrics file's "numbers that matter".

## v1.1 (2026-07-05)

- Portability (port skill), recall routine, self-testing learned skills, the Panel, staged builds. By Krishna Teja.

## v1 (2026-07-04)

- The core: operating loop, memory system, vault, build/decide/daily/loop/experiment skills. By Krishna Teja.
