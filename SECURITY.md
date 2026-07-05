# Security & Trust Model

Always-on personal AI agents have earned real security criticism: daemons with broad system access, messaging-channel attack surfaces, prompt injection through inbound messages, and opaque memory stores. Shotgun's answer is architectural, not promises.

## Design: no daemon, no gateway, no inbound channels

- **Shotgun only runs when you run it.** There is no background process, no server, no webhook, nothing listening. The attack surface when you're not in a session is zero.
- **No messaging-platform bridges.** Nothing can message your agent but you, sitting at your keyboard. Prompt injection via inbound WhatsApp/Telegram/email, the classic always-on-agent attack, is structurally impossible here.
- **Human in the loop by contract.** The operating loop (CLAUDE.md §3.3) requires explicit confirmation before anything irreversible: deleting data, deploying, sending anything to real people, spending money. This rule cannot be overridden by a learned skill (§9 bounds).

## Data

- **Everything is local files.** Memory, vault, code, plain markdown and source on your machine. No cloud copy exists unless you push one.
- **Everything is inspectable.** You can read every fact your agent has stored and delete any of it with a text editor. No hidden state.
- **Secrets never enter memory or the vault.** API keys and credentials live only in `.env` files, which are gitignored by default. The loop forbids the agent from writing secrets into memory files.
- **Git is your audit log.** Every memory change is a diff. `git log -p memory/` shows you exactly what your agent learned and when.

## Injection surfaces that DO exist (and mitigations)

- **Files you feed it.** A malicious document in the vault could contain adversarial instructions. Mitigation: the loop treats file contents as data, not instructions; the CLAUDE.md contract explicitly wins over any conflicting instruction (RULE 0). Still, don't feed it files from sources you don't trust.
- **Web content during research.** Same principle: fetched content is data. Confirmation gates on irreversible actions are the backstop.

## Your responsibilities

1. Keep your personal copy's repo private if you push it anywhere.
2. Don't commit `.env` (the default `.gitignore` already blocks it).
3. Review confirmation prompts instead of reflex-yes-ing them, they exist for exactly the actions that can hurt you.

## Reporting

Found a hole in the loop's guardrails? Open a GitHub issue (or email the maintainer for sensitive reports).
