# Governance

Honest about today, clear about the rules. Shotgun currently has one maintainer (Krishna Teja). This document exists so the project's direction doesn't depend on trusting one person's memory, and so contributors know exactly how decisions get made.

## The constraint contract (what will never merge)

These are load-bearing. PRs that violate them get declined regardless of quality:

1. No servers, daemons, background processes, or inbound message channels.
2. No required accounts, no telemetry, no phoning home.
3. Memory stays plain, portable markdown per `docs/MEMORY-FORMAT.md`. No databases, no embeddings, no proprietary formats.
4. No skill may automate judgment or bypass a §3.3 confirmation gate.
5. Onboarding stays under ten minutes.

Changing this list requires a public issue, a stated rationale, and a major version bump.

## How decisions get made

- **Skills, templates, docs:** PR review by the maintainer against CONTRIBUTING.md's skill standard. CI must be green. Small PRs get reviewed fast.
- **Changes to SHOTGUN.md (the loop):** the loop is the contract; changes need an issue first, and land only with explicit maintainer approval. The bar is "any capable model executes it identically."
- **Disagreements:** argued in the issue, decided by the maintainer, recorded with reasoning. If reality later proves the decision wrong, it gets reversed with the same paper trail (the project runs on its own decide-skill logic).

## Becoming a maintainer

Sustained, quality contributions (skills that founders actually use, war-story fixes, review help) earn commit rights. There is no formal quota; the pattern is what a cofounder would look for in a hire: judgment, consistency, and care for the constraint contract.

## If the maintainer disappears

The MIT license and the CMF spec are the insurance: fork it, and every founder's memory keeps working. Any active fork that honors the constraint contract may call itself Shotgun-compatible. The name "Shotgun" itself follows the most active good-faith fork.

## Security reports

Sensitive issues: email the maintainer (see SECURITY.md) instead of a public issue.
