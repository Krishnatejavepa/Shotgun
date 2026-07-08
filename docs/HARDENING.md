# Hardening: Optional Setup That Pays Off

Shotgun works with zero configuration beyond the quickstart. Everything here is optional and takes minutes. Ordered by payoff.

## 1. Keep the cofounder out of cloud-sync folders

Don't run your Shotgun copy inside OneDrive, Dropbox, iCloud Drive, or Google Drive folders. Two real failure modes:

- **Git corruption.** Sync clients race with git on the hundreds of small files inside `.git/`. Conflicted copies and partial syncs can corrupt history, and history is your memory audit log.
- **Placeholder stalls.** "Files on demand" features replace files with cloud placeholders; git and scripts then fail with misleading errors on files that look present.

Right way to get durability: a plain local folder (e.g., `~/shotgun` or `C:\Users\you\shotgun`) plus either a **private** git remote you own (`git push` after sessions) or a periodic export bundle from the port skill. Both give you restore points without a sync daemon touching live files.

## 2. Back up on a rhythm

Ask the cofounder to commit at session end (it already journals; committing makes the snapshot durable). Once a week, either push to your private remote or say "back everything up" (the port skill produces a verified, secrets-excluded bundle). The migrate flow in the port skill is the restore test; run it once so the backup isn't theoretical.

## 3. Optional Claude Code hooks

Claude Code can run a command at session start and inject its output into context. This makes the Session Start Protocol mechanical instead of instructed. If you want it, create `.claude/settings.json`:

macOS/Linux:

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          { "type": "command", "command": "cat memory/open-loops.md 2>/dev/null || true" }
        ]
      }
    ]
  }
}
```

Windows (PowerShell):

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          { "type": "command", "command": "powershell -NoProfile -Command \"if (Test-Path memory/open-loops.md) { Get-Content memory/open-loops.md }\"" }
        ]
      }
    ]
  }
}
```

Shotgun ships without hooks on purpose: a broken hook breaks every session, and the loop's MUST-reads cover the same ground. Add them only if you've seen the model skip session start, and test in the same session you add them.

## 4. Permissions worth pre-approving

If Claude Code keeps prompting for the same safe operations, allow them in `.claude/settings.json` permissions: reads and greps of `memory/` and `vault/`, `git add/commit/log/diff` in the repo. Keep prompts ON for anything under §3.3 (push, deploy, send, delete, spend). The prompt friction there is the feature.

## 5. Model choice

The loop runs on any capable Claude model by design. If you use multiple: Opus-class models for DECIDE-heavy and REVIEW-heavy sessions, Sonnet-class for BUILD/ORGANIZE grinding. Memory files make the switch free; nothing lives in the conversation.

## 6. If you push anywhere, push private

Your `memory/` is the most personal file set you own: it knows your numbers, your customers, your doubts. The onboard skill cuts the public-repo cord automatically, but the rule is yours to keep: any remote this repo pushes to must be private and yours. The doctor skill checks this monthly.
