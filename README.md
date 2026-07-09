# Shotgun

**Don't Build Alone. Let Shotgun Ride Along.**

Shotgun turns your AI agent into a persistent, personalized cofounder for solo founders. It remembers everything about you and your venture, builds your product, writes in your voice, organizes your scattered data into one clean vault, scouts your market, runs your distribution, and keeps your daily operating rhythm. Like a cofounder who owns half the company would.

Not a chatbot. Not a coding tool. An operating system for running a company of one.

## What it does

- 🧠 **Persistent memory.** Founder profile, venture state, every decision with its "why", open loops, session journal. It compounds: your cofounder knows your business better every single day.
- 📊 **Your numbers, remembered.** A metrics file gets one dated row every weekly review. Momentum (or its absence) is visible across months, and decisions get revisited when the numbers you named actually trip.
- 🔨 **Full technical execution.** Plans, codes, tests, ships. Verifies everything before handing it over. Logs shortcuts honestly.
- ✍️ **Writing in YOUR voice.** It learns from samples of your real writing and drafts launch posts, emails, landing copy, and investor updates that sound like you, not like AI. When you edit its drafts, it learns why.
- 🔎 **A scout for the outside world.** Market questions, competitor pricing, "what already exists for this": researched, dated, sourced, and filed where they stay useful. It says "couldn't verify" instead of guessing.
- 📣 **Distribution as a system.** One channel at a time, growth experiments with hypotheses and kill-dates, launch checklists. Because silence kills more solo ventures than bugs do.
- ⚖️ **Legal & Compliance.** Tracks your jurisdiction and visa status to automate localized privacy policies, incorporation roadmaps, and tax basics, strictly guarded by attorney disclaimers.
- 🗄️ **Data vault.** Your scattered files, CSVs, and notes organized into one indexed, canonical structure. Nothing ever deleted, everything findable in seconds.
- 🎯 **Cofounder judgment.** Pushes back on bad ideas once, then commits. Treats reversible and irreversible decisions differently. Protects your focus.
- 📅 **Operating rhythm.** Daily standups, weekly reviews, one thing per day, zombie-loop detection, ruthless open loops, and automated weekly planning.
- 📈 **Learned & Engineering skills.** Shotgun comes pre-equipped with 24 production-grade engineering skills (TDD, UI architecture, CI/CD, etc.) and specialist personas. When a custom multi-step task gets figured out, Shotgun saves the procedure and reuses it. It gets faster at your business every week and repairs its own skills when they break.
- 🔁 **Autonomous loops.** Say "keep going until it works" and walk away. Shotgun writes a loop contract (goal, checkable done-condition, iteration budget), cycles act, verify, fix, and exits with either verified-done or a precise blocker report. Loop state lives in a file, so any session can resume it.
- 🧪 **Experiment mode.** The Karpathy autoresearch pattern, applied to your business. "Make this faster" triggers a metric hill-climb: one small change at a time, measured, committed if better, reverted if not, with a correctness check so it never games the number.
- 👥 **The Panel.** A virtual team of five specialists (product, design, QA, release, growth) that reviews work before it ships. Each lens gives max 3 specific findings and the Panel ends with one verdict: ship, fix then ship, or rethink.
- 🩺 **A doctor for itself.** A monthly checkup audits the memory index, loop registry, vault hygiene, git safety, and secret leaks. A cofounder that quietly rots is worse than none.
- 🧳 **Portable by design.** One command exports your entire cofounder (memory, vault, skills) as a bundle, secrets excluded and verified. Import your Obsidian vault, Notion export, or ChatGPT history on day one. Move machines without losing a single memory.
- 🏁 **Starter templates.** SaaS, creator, agency, and e-commerce skeletons that pre-shape your venture profile, vault taxonomy, and the numbers that matter for your business type.

## Requirements

- Works on **any agent that reads the [AGENTS.md standard](https://agents.md)** (28+ tools: Codex CLI, Windsurf, Zed, Devin, Aider, Amp, Jules, and more), with first-class native wiring for **Claude Code, Cursor, Antigravity, Gemini CLI, and GitHub Copilot**.
- The operating loop is written as explicit checklists, so any capable model (Claude Opus or Sonnet, GPT-5 class, Gemini 2.5 Pro or newer) executes it identically. No dependency on a specific model tier.

## Quickstart (10 minutes)

Pick a plain local folder, not OneDrive/Dropbox/iCloud (cloud sync fights git, see [docs/HARDENING.md](docs/HARDENING.md)).

The easiest way to install Shotgun is via the **Global Installer**. This allows you to inject Shotgun into any existing codebase without cloning a separate repository.

macOS/Linux:
```bash
# Run this once to install the shotgun-init command
curl -sSL https://raw.githubusercontent.com/Krishnatejavepa/Shotgun/main/install.sh | bash
source ~/.zshrc
```

Windows (PowerShell):
```powershell
# Run this once to install the shotgun-init command
iwr https://raw.githubusercontent.com/Krishnatejavepa/Shotgun/main/install.ps1 -UseBasicParsing | iex
```

Once installed, simply open any project folder in your terminal and run:
```bash
shotgun-init
```
This injects the full operating system into your directory: the `SHOTGUN.md` loop, `.shotgun/` skills, the memory and vault scaffolds with their templates, starter templates, docs, and every agent entry point (`AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.cursorrules`, Copilot instructions). Existing files are never overwritten. The installer works from anywhere: it downloads Shotgun once to `~/.shotgun-os` (or uses your clone if you run it from one) and is safe to re-run for updates.

Then boot up your preferred AI (e.g. `claude`, Cursor IDE, Antigravity, or Gemini) and just say **"hi"**. The agent detects it's not onboarded and interviews you: who you are, what you're building, where your scattered files live. By the end of the first session your data is organized and your cofounder knows your business.

From then on, every session starts with it reading its memory. Try:

- `"Good morning"` gets you a **Morning Intelligence Brief**: yesterday's burn, metrics checks, and today's ONE thing.
- `"Build me a landing page for X"` gets planned, built, tested, delivered
- `"Write the launch post"` gets drafted in your voice, from your real numbers
- `"Draft a privacy policy"` gets a localized policy tailored to your country's laws.
- `"Here is my Stripe CSV export"` triggers the Data Hook parser, updating your `metrics.md` automatically.
- `"What do my three closest competitors charge?"` gets researched, sourced, dated, and filed
- `"How do I get my first 100 users?"` gets one channel, a hypothesis, and a kill-date, not a listicle
- `"Here are 3 messy customer CSVs, sort them out"` gets cleaned, merged, one canonical file
- `"Should I do lifetime deals or subscriptions?"` gets a structured decision, recorded with a revisit trigger
- `"Fix this scraper, keep going until it runs clean"` runs alone and reports verified-done or the exact blocker
- `"Is this landing page ready?"` convenes the Panel: five specialist reviews and one verdict
- `"Checkup"` audits the whole system and reports one line per check

## How it works

```
shotgun/
├── SHOTGUN.md            # The operating loop: read every session, followed exactly
├── AGENTS.md             # Universal entry point (the AGENTS.md standard, 28+ tools)
├── .shotgun/skills/      # Workflows: onboard, build, write, organize-data, decide,
│                        #   idea-refine, spar, finance, legal, support, data-hook,
│                        #   research, grow, daily, loop, experiment, review, port,
│                        #   doctor (+ 24 engineering skills + learned-* skills)
├── .shotgun/commands/    # Slash commands for the development lifecycle (/build, /test, etc.)
├── .shotgun/agents/      # Specialist personas (e.g. Code Reviewer, Security Auditor)
├── memory/              # The compounding asset: profile, venture, voice, metrics,
│                        #   decisions, loops, journal
├── vault/               # Your organized business data, indexed and canonical
├── templates/           # Starter shapes: SaaS, creator, agency, e-commerce
├── workspace/           # Code projects the agent builds
└── docs/                # Architecture, hardening, learned-skill format
```

Everything is plain markdown and git. No servers, no database, no lock-in. You can read every "thought" your cofounder has stored, edit it, or take it anywhere. Skills live in `.shotgun/skills/`. The `setup-compatibility` script symlinks this directory so that your platform of choice discovers them natively; the loop routes to them by explicit path so any capable harness works too. And the repo audits itself: a CI workflow validates every skill's frontmatter, every routing path, and the installer end-to-end on every push, the machine-checked half of the doctor skill.

## Why not OpenClaw or Hermes Agent?

Use them! They're excellent general personal assistants: always on, connected to WhatsApp and Telegram, automating everything for everyone. Shotgun is deliberately the opposite.

- **Vertical, not horizontal.** They're assistants for anyone. Shotgun is a cofounder for solo founders, with opinions: a decision log, ONE-thing days, a pushback rule, focus protection. An assistant does what you ask. A cofounder tells you when what you asked is a mistake.
- **Your business data, handled.** Neither touches "my customers are in four spreadsheets." The vault does: canonical datasets, indexed, nothing ever deleted.
- **No daemon, no attack surface.** They run always-on gateways bridged to messaging channels. Powerful, but a real injection surface. Shotgun only runs when you run it, and irreversible actions always require your confirmation. See [SECURITY.md](SECURITY.md).

They win on 24/7 availability and channels. Shotgun wins on judgment, focus, and depth for one specific job: running a company of one.

*(Different tool, same name: [shotgun.sh](https://github.com/shotgun-sh/shotgun) is a spec-writing CLI for AI coding agents. Great at turning big features into staged PRs; not a cofounder. If you need both, they coexist fine: use it inside `workspace/` projects.)*

## Philosophy

1. **Memory is the product.** An assistant answers; a cofounder remembers why.
2. **Checklists over vibes.** The loop is deterministic, so behavior stays consistent across models and months.
3. **Files over databases.** Inspectable, versionable, portable, yours.
4. **Trust through verification.** Nothing is presented as done that wasn't run.
5. **Distribution is half the company.** A cofounder who only builds is half a cofounder.

## Docs

- [Getting started](GETTING-STARTED.md), the full setup walkthrough
- [Security & trust model](SECURITY.md), why no-daemon matters
- [Architecture](docs/ARCHITECTURE.md), how the loop, memory, and vault fit together
- [Hardening](docs/HARDENING.md), optional setup: backups, hooks, permissions
- [Learned skills](docs/LEARNED-SKILLS.md), how the cofounder writes and improves its own procedures
- [Contributing](CONTRIBUTING.md), how to add skills, templates, and war stories
- [Changelog](CHANGELOG.md), what changed in v1.4

## License

MIT. Take it, run your company on it, build on it.
