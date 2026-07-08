# Contributing to Shotgun

Thanks for wanting to make Shotgun better. Two ground rules keep this project what it is:

1. **The loop stays deterministic.** Changes to CLAUDE.md must be explicit checklists that any capable model executes identically. If a rule depends on model judgment to interpret, rewrite it until it doesn't.
2. **Memory stays portable markdown.** No databases, no embeddings, no proprietary formats. If a founder can't read their agent's memory in a text editor, it doesn't ship.

## What we want most

- **New skills.** Vertical workflows for specific founder types: indie hacker, mobile apps, local services, marketplaces. One folder under `.claude/skills/`, one SKILL.md, frontmatter with clear trigger phrases. Look at `.claude/skills/decide/SKILL.md` for the shape.
- **Starter templates.** New verticals for `templates/` (see the four existing ones for the shape: venture skeleton, vault taxonomy, numbers that matter, typical first loops).
- **War stories.** Open an issue describing where the agent broke the loop or produced something dumb. Real transcripts (redacted) are gold.
- **Docs fixes.** Anything that confused you will confuse others.

## Skill standard (what a PR'd skill must have)

1. Frontmatter: `name`, `description` containing the exact trigger phrases, `version: 1`.
2. Numbered steps a weaker model can follow without judgment calls.
3. A `## Verify` section: a checkable way to confirm the skill worked (a command, a file that must exist, an observable output).
4. Commands founders must run themselves come in both flavors: bash AND Windows PowerShell.
5. Nothing that automates judgment or skips a confirmation gate, those get declined on sight.

Related skills can ship together as a **pack**: one folder per skill plus a `PACK.md` listing what's inside and the founder type it serves. Propose packs as an issue first.

## How

1. Fork, branch, PR. Small PRs get reviewed fast, big rewrites should start as an issue.
2. Test your skill by actually running it with Claude Code in a scratch copy, and say in the PR what model you tested on and what the `## Verify` output was.
3. Writing style everywhere: no em dashes, no filler, short sentences. The style contract in CLAUDE.md §8 applies to docs too.

## What we'll decline

- Features that require a server, daemon, or account.
- Skills that automate judgment or bypass confirmation gates.
- Anything that makes onboarding longer. Ten minutes is the ceiling.
