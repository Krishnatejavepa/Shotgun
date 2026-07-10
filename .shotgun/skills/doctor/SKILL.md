---
name: doctor
description: Self-integrity checkup of the cofounder system: memory index consistency, loop registry, vault hygiene, git safety, secret leaks, skill health. Use when the founder says "checkup", "health check", "doctor", "something feels off", and monthly during a weekly review.
---

# Doctor: The System Checkup

A cofounder that quietly rots is worse than none: stale loops, a lying index, a leaked secret. This skill checks the system against its own contract. Run every check, in order, and report each one. Fix reversible problems immediately; ask before anything else.

## Check 1: Memory integrity

1. Every file in `memory/` (except README.md and `_templates/`) has a line in `memory/MEMORY.md`, and every index line points to a file that exists. Mismatch → rebuild the index.
2. `MEMORY.md` over ~50 lines → run the consolidation routine (`memory/README.md`). `journal.md` over ~30 lines → run the journal roll-up.
3. Grep `memory/` and `vault/` for secret patterns: `api_key`, `secret`, `password`, `sk-`, `Bearer `, `BEGIN RSA`. Any hit that looks like a real credential → alert the founder FIRST (it may need rotating, deleting the file doesn't unleak it), then move the reference to `.env`.

## Check 2: Loops and open work

1. Every `LOOP:` line in `memory/open-loops.md` points to a LOOP.md that exists, and the registry status matches the file's STATUS line. Fix drift toward the file (it's the source of truth).
2. Open loops older than 7 days get listed for the founder: finish, kill, or consciously park each.
3. Growth experiments in `vault/marketing/growth-log.md` past their time box without a verdict → flag them.

## Check 3: Vault hygiene

1. `vault/inbox/` has ≤10 files. Over → offer to run organize-data now.
2. Spot-check 5 random vault files against `vault/_index.md`: each must have an index line. Misses → offer a reindex.
3. Decisions in `memory/decisions.md`: scan REVISIT WHEN triggers against current `memory/venture.md` and `memory/metrics.md`. Any tripped trigger → surface it as a pending re-decision.

## Check 4: Git safety

1. `git remote -v`: any remote pointing to a Shotgun repo the founder doesn't own (e.g., the public Krishnatejavepa/Shotgun) → remove it and tell them (onboard Phase 0 rule).
2. `git ls-files | grep -E "\.env"` must return nothing. A tracked .env → alert: rotate the secrets, then untrack (`git rm --cached`), the history still holds them.
3. Uncommitted changes older than the session → offer one commit ("memory snapshot").
4. Working directory path contains `OneDrive`, `Dropbox`, or `iCloud` → warn once: cloud sync fights git and can silently corrupt memory (see `docs/HARDENING.md`), recommend a plain local folder plus a private remote.

## Check 5: Skill health

1. Every `.shotgun/skills/*/SKILL.md` has frontmatter with `name` and `description`. Broken frontmatter = a skill the agent harness can't discover → fix it.
2. Every `learned-*` skill has a `## Verify` and a `## Changelog` section. Missing → add them from `docs/LEARNED-SKILLS.md` format.
3. Any learned skill whose last changelog entry records a failed repair → list it for the weekly-review decision: repair with the founder or delete.

## Check 6: Entry points

Confirm every agent entry point exists and points at the loop: `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.cursorrules`, `.github/copilot-instructions.md`. Missing or blank → recreate it with the standard one-liner ("Read SHOTGUN.md to understand your core loop." for platform files; the root AGENTS.md carries the full pointer). Also confirm the platform symlinks/junctions from `setup-compatibility` resolve (`.claude`, `.agents/skills`, `.cursor/rules`); a dangling link is a silent discovery failure.

## Check 7: The contract

`git log --oneline -5 -- SHOTGUN.md`: recent changes to SHOTGUN.md get shown to the founder with one question: "You approved these, right?" (§9.5: the loop is never edited silently.)

## Report format (strict)

One line per check, numbered, ✅ / ⚠️ / ❌ plus a five-word status. Then: fixes applied (list), fixes needing a yes (list), and one overall verdict line. A fully green report should be one screen, not an essay. Log the checkup as one line in `memory/journal.md`.

## The Health Score (ends every checkup)

One number a founder can watch move month to month. Compute it transparently:

1. **System integrity (0–60):** start at 60, subtract per finding: ❌ = −15, ⚠️ = −5. Floor at 0.
2. **Momentum (0–40):** from the last 4 weeks of `memory/metrics.md` and `memory/journal.md`: north-star metric trending up (+15, flat +7, down 0), loops closed ≥ loops opened (+10), at least one experiment or growth verdict logged (+10), decisions pending revisit ≤ 1 (+5).
3. Report as: `HEALTH: NN/100 (system NN/60, momentum NN/40), <one-line read>`. Compare against the previous score and name the biggest mover.
4. Append one dated line to `memory/metrics.md` ad-hoc section: `YYYY-MM-DD: health score NN/100`. The score is itself a tracked metric; a falling score is a revisit trigger a founder can set.

Bounds: the score summarizes the checks, it never replaces them. A 95 with a leaked secret does not exist: any secret finding caps the score at 25 until resolved.
