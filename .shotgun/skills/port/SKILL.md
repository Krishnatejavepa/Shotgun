---
name: port
description: Import, export, back up, or migrate the cofounder itself. Use when the founder says "back this up", "export everything", "move to my new laptop", "import my Obsidian vault", "import my Notion export", "import my Roam graph", "import my Google Docs", "import my Linear issues", "import my ChatGPT history", "make an advisor bundle", or asks how to take their cofounder somewhere else.
---

# Port: Your Cofounder Is Luggage, Not Furniture

Everything Shotgun knows is plain markdown and git. That makes the whole cofounder (memory + vault + skills, learned ones included) a folder you can zip, move, and unzip. This skill makes those moves explicit and safe.

## Export: the full bundle

When the founder wants a backup or a copy to take elsewhere:

1. Confirm scope: full cofounder (default) or memory-only.
2. Run from the repo root, per OS:

   macOS/Linux:
   ```bash
   tar --exclude='.env' --exclude='*/node_modules' --exclude='.DS_Store' \
       -czf ../shotgun-backup-$(date +%Y-%m-%d).tar.gz \
       SHOTGUN.md .shotgun/ memory/ vault/ workspace/ docs/ templates/
   ```

   Windows PowerShell:
   ```powershell
   $stamp = Get-Date -Format yyyy-MM-dd
    Compress-Archive -Path SHOTGUN.md, .shotgun, memory, vault, workspace, docs, templates `
       -DestinationPath "..\shotgun-backup-$stamp.zip"
   ```

3. Verify before declaring done (MUST): list the archive contents (`tar -tzf <bundle>` on macOS/Linux, or expand the zip listing on Windows), confirm `memory/` and `.shotgun/skills/` are present, and confirm zero `.env` entries. Compress-Archive excludes nothing by itself: if a `.env` is inside `workspace/`, exclude that project folder and re-archive.
4. Report: bundle path, size, file count, and the one-line restore instruction: "unzip anywhere, open the folder in your coding environment, and run the startup sequence."

Secrets never travel. `.env` is excluded by contract; tell the founder to move credentials by hand.

## Import: bringing an existing brain in

**Obsidian vault:** treat it as founder data, not memory. Copy the vault folder into `vault/inbox/`, then run the organize-data skill against it. Notes that are clearly facts about the founder or the venture get PROPOSED as memory entries (show the list, get a yes, then write them via the normal memory protocol). Never bulk-write someone's notes into memory unreviewed.

**Notion export (zip of md/csv):** unzip into `vault/inbox/`, flatten Notion's hash-suffixed folder names during filing, then same flow as Obsidian.

**ChatGPT / Claude.ai export:** the export contains a conversations file (ChatGPT: `conversations.json`). Don't file raw chat logs into the vault; they're noise. Instead: scan the conversations for durable facts (about the founder, the venture, customers, decisions made, preferences stated) and produce a PROPOSED memory list, each item with its conversation date. The founder reviews and picks; the picks get written via the normal memory protocol; the raw export goes to `vault/_archive/`. Months of context in another AI shouldn't die there, but it enters memory reviewed, never wholesale.

**Roam export (JSON or EDN):** parse pages and blocks; daily-notes pages are journal-like noise, skip them by default. Pages that read as durable facts, decisions, or venture knowledge get PROPOSED as memory entries (same reviewed flow as ChatGPT). Everything else files into `vault/inbox/` as markdown for the organize-data skill. The raw export goes to `vault/_archive/`.

**Google Docs / Takeout (zip of docs):** unzip into `vault/inbox/`, convert docs to markdown where the harness can, then the standard organize-data flow. Docs that are clearly business records (contracts, plans, customer notes) get filed by the vault taxonomy; facts inside them get PROPOSED as memories, never bulk-written.

**Linear export (CSV):** issues are open loops in someone else's format. Propose: open/in-progress issues → `memory/open-loops.md` in ruthless format (concrete next action, owner, due date; issues missing a due date get flagged, not guessed). Closed issues worth history → one summary line each in `memory/changelog.md`. The raw CSV goes to `vault/data/` with a schema line in `vault/data/SCHEMAS.md`.

**Plain folders / another machine's Shotgun:** if it contains a `memory/` in Shotgun format (the spec is `docs/MEMORY-FORMAT.md`), this is a MERGE, not a copy. Diff both `memory/` trees, show conflicts (same fact, different value), let the founder pick per-conflict, then rebuild MEMORY.md.

## Advisor Mode: a redacted, read-only bundle for a mentor or investor

When the founder wants to show an advisor the state of the business without handing over their private brain:

1. Confirm the audience and purpose in one line (mentor check-in vs investor diligence changes what's sensible to include).
2. Build the bundle from an ALLOWLIST, never by excluding from the full set: `memory/venture.md`, `memory/metrics.md`, `memory/decisions.md`, `memory/changelog.md`, plus any vault files the founder names explicitly. NEVER include: `founder-profile.md`, `voice.md`, `feedback.md`, `journal.md`, `open-loops.md`, `.env` anywhere, or anything in `vault/` the founder didn't name.
3. Assemble into a dated folder `../shotgun-advisor-YYYY-MM-DD/`, add a one-page `OVERVIEW.md` on top (venture in 3 lines, the numbers with trends, the 3 most recent decisions), then archive it (tar/zip, same per-OS commands as the backup bundle).
4. Verify like every export (MUST): list the archive, confirm ONLY allowlisted files are present, confirm zero `.env` entries. Show the founder the final file list before they send anything.
5. Sending it to the advisor is the founder's act, not yours (§3.3). Log one `[external]` line in `memory/changelog.md` when they confirm it went out.

## Migrate: new machine

1. Export the full bundle (above).
2. On the new machine: unzip into a plain local folder (not OneDrive/Dropbox/iCloud, see `docs/HARDENING.md`), `git init -b main` if git didn't travel, recreate `.env` by hand.
3. First session on the new machine MUST start with the Session Start Protocol as usual; the cofounder should be able to summarize the venture correctly before you call the migration done. That's the verification.

## Hard rules

- `.env` and secrets never enter a bundle. MUST.
- Imports never overwrite existing memory without a shown-and-approved merge plan.
- Every export gets verified by listing the archive, never assume the tar (or zip) worked.
