# Contributing to Shotgun

Thanks for wanting to make Shotgun better. Two ground rules keep this project what it is:

1. **The loop stays deterministic.** Changes to CLAUDE.md must be explicit checklists that any capable model executes identically. If a rule depends on model judgment to interpret, rewrite it until it doesn't.
2. **Memory stays portable markdown.** No databases, no embeddings, no proprietary formats. If a founder can't read their agent's memory in a text editor, it doesn't ship.

## What we want most

- **New skills.** Vertical workflows for specific founder types: e-commerce, agency, indie hacker, content business. One folder, one SKILL.md, frontmatter with clear trigger phrases. Look at `skills/decide/SKILL.md` for the shape.
- **War stories.** Open an issue describing where the agent broke the loop or produced something dumb. Real transcripts (redacted) are gold.
- **Docs fixes.** Anything that confused you will confuse others.

## How

1. Fork, branch, PR. Small PRs get reviewed fast, big rewrites should start as an issue.
2. Test your skill by actually running it with Claude Code in a scratch copy, and say in the PR what model you tested on.
3. Writing style everywhere: no em dashes, no filler, short sentences. The style contract in CLAUDE.md §8 applies to docs too.

## What we'll decline

- Features that require a server, daemon, or account.
- Skills that automate judgment or bypass confirmation gates.
- Anything that makes onboarding longer. Ten minutes is the ceiling.
