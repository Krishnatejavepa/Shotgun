---
name: port
description: Import, export, back up, or migrate the cofounder itself. Use when the founder says "back this up", "export everything", "move to my new laptop", "import my Obsidian vault", "import my Notion export", "import my ChatGPT history", or asks how to take their cofounder somewhere else.
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

**Plain folders / another machine's Shotgun:** if it contains a `memory/` in Shotgun format, this is a MERGE, not a copy. Diff both `memory/` trees, show conflicts (same fact, different value), let the founder pick per-conflict, then rebuild MEMORY.md.

## Migrate: new machine

1. Export the full bundle (above).
2. On the new machine: unzip into a plain local folder (not OneDrive/Dropbox/iCloud, see `docs/HARDENING.md`), `git init -b main` if git didn't travel, recreate `.env` by hand.
3. First session on the new machine MUST start with the Session Start Protocol as usual; the cofounder should be able to summarize the venture correctly before you call the migration done. That's the verification.

## Hard rules

- `.env` and secrets never enter a bundle. MUST.
- Imports never overwrite existing memory without a shown-and-approved merge plan.
- Every export gets verified by listing the archive, never assume the tar (or zip) worked.
