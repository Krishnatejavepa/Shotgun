# Getting Started

## 1. Install Claude Code

Follow https://claude.com/claude-code. You need a Claude subscription (Pro or higher). Shotgun runs on Opus or Sonnet; no specific model tier required.

## 2. Pick the folder

A plain local folder. Not OneDrive, Dropbox, iCloud, or Google Drive: sync clients race with git and can corrupt your cofounder's memory history (details and the right backup setup in [docs/HARDENING.md](docs/HARDENING.md)).

## 3. Get the repo

macOS/Linux:

```bash
git clone https://github.com/Krishnatejavepa/Shotgun my-cofounder
cd my-cofounder
rm -rf .git && git init -b main && git add -A && git commit -m "day zero"
```

Windows (PowerShell):

```powershell
git clone https://github.com/Krishnatejavepa/Shotgun my-cofounder
cd my-cofounder
Remove-Item -Recurse -Force .git; git init -b main; git add -A; git commit -m "day zero"
```

That last step makes the memory YOURS and versioned: every day of your cofounder's memory becomes a git commit you can inspect or roll back. (If you skip it, the agent will catch it and cut the cord for you during onboarding.)

## 4. First session: onboarding

```bash
claude
```

Say "hi". Because `memory/founder-profile.md` doesn't exist yet, the agent runs onboarding automatically:

1. Five questions about you (5 min)
2. A few questions about your venture, and any real numbers get a metrics baseline
3. **The data rescue**: point it at your scattered folders/files/spreadsheets; it inventories, proposes a filing plan, and organizes everything into `vault/`
4. **The voice**: paste 2-3 things you wrote and liked, so drafts come out sounding like you (skippable)
5. Your top 3 open concerns get logged

Tip: before this session, drop any messy files you want organized into `vault/inbox/`. Got months of context in ChatGPT? Export it and say "import my ChatGPT export": durable facts get proposed as memories, you pick which ones stick.

## 5. Daily use

Start sessions with "good morning" or "what's next" and you'll get a standup plus today's ONE thing. End sessions with "that's it for today" and the agent journals, then updates open loops so tomorrow's session starts warm.

Once a week, ask "how's it going" for the weekly review: shipped/decided/open, the pulse numbers appended to `memory/metrics.md`, and any decision whose revisit-trigger has tripped.

Commit regularly (or ask the agent to): `git add -A && git commit -m "session"`.

## 6. Customizing

- **Loop behavior:** edit `CLAUDE.md`: it's the contract; the agent follows what's written.
- **Add skills:** create `.claude/skills/<name>/SKILL.md` with a frontmatter description; reference it from CLAUDE.md §2 if it's a new request class.
- **Rename the product/agent:** it's your cofounder, call it whatever you want in `founder-profile.md`.

## Troubleshooting

- **Agent not following the loop?** Say "re-read CLAUDE.md and follow the session start protocol." The loop is self-correcting because it's explicit.
- **Something feels off in general?** Say "checkup". The doctor skill audits memory, loops, vault, git, and skills, then reports one line per check.
- **Memory feels bloated/noisy?** Say "run the memory consolidation routine" (defined in `memory/README.md`).
- **Wrong facts stored?** Just edit the memory files directly, they're plain markdown, or tell the agent and it must record the correction in `feedback.md`.
