---
name: port
description: Import, export, back up, or migrate the cofounder itself. Use when the founder says "back this up", "export everything", "move to my new laptop", "import my Obsidian vault", "import my Notion export", or asks how to take their cofounder somewhere else.
version: 1
---

# Port: Your Cofounder Is Luggage, Not Furniture

Everything Shotgun knows is plain markdown and git. That makes the whole cofounder (memory + vault + learned skills) a folder you can zip, move, and unzip. This skill makes those moves explicit and safe.

## Export: the full bundle

When the founder wants a backup or a copy to take elsewhere:

1. Confirm scope: full cofounder (default) or memory-only.
2. Run from the repo root:
   ```bash
   tar --exclude='.env' --exclude='*/node_modules' --exclude='.DS_Store' \
       -czf ../shotgun-backup-$(date +%Y-%m-%d).tar.gz \
       CLAUDE.md memory/ vault/ skills/ workspace/ docs/
   ```
3. Verify before declaring done (MUST): `tar -tzf <bundle> | head -30`, confirm memory/ and vault/ are present and no `.env` slipped in (`tar -tzf <bundle> | grep -c "\.env$"` must be 0).
4. Report: bundle path, size, file count, and the one-line restore instruction: "unzip anywhere, run `claude`, say hi."

Secrets never travel. `.env` is excluded by contract; tell the founder to move credentials by hand.

## Import: bringing an existing brain in

**Obsidian vault:** treat it as founder data, not memory. Copy the vault folder into `vault/inbox/`, then run the organize-data skill against it. Notes that are clearly facts about the founder or the venture get PROPOSED as memory entries (show the list, get a yes, then write them via the normal memory protocol). Never bulk-write someone's notes into memory unreviewed.

**Notion export (zip of md/csv):** unzip into `vault/inbox/`, flatten Notion's hash-suffixed folder names during filing, then same flow as Obsidian.

**Plain folders / another machine's Shotgun:** if it contains a `memory/` in Shotgun format, this is a MERGE, not a copy. Diff both `memory/` trees, show conflicts (same fact, different value), let the founder pick per-conflict, then rebuild MEMORY.md.

## Migrate: new machine

1. Export the full bundle (above).
2. On the new machine: unzip, `git init -b main` if git didn't travel, recreate `.env` by hand.
3. First session on the new machine MUST start with the Session Start Protocol as usual; the cofounder should be able to summarize the venture correctly before you call the migration done. That's the verification.

## Hard rules

- `.env` and secrets never enter a bundle. MUST.
- Imports never overwrite existing memory without a shown-and-approved merge plan.
- Every export gets verified by listing the archive, never assume the tar worked.
