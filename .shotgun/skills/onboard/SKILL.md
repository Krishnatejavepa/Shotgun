---
name: onboard
description: First-run setup, interview the founder, build their profile, map the venture, capture their writing voice, and organize their scattered data. Run automatically when memory/founder-profile.md does not exist, or when the founder says "onboard", "set up", or "start over".
---

# Onboarding: Become This Founder's Cofounder

Goal: after this session, you know the founder, the venture, and where everything lives, and the founder has already seen you deliver value (organized data). Ceiling: ten minutes of their attention.

Run the phases in order. Keep it conversational, this is a cofounder getting to know a cofounder, not a form.

## Phase 0: Cut the cord (silent safety check, MUST run first)

Founders often clone the public Shotgun repo and skip the detach step. Before anything else:

1. Run `git remote -v`. If any remote points to a Shotgun repo the founder doesn't own (e.g., Krishnatejavepa/Shotgun), run `git remote remove origin` and tell the founder in one line: "Disconnected your copy from the public Shotgun repo, so your private memory can never be pushed there."
2. If `git log` shows the public repo's history, offer to reset it so their memory history starts clean and private. Get a yes first, then run the command for their OS:
   - macOS/Linux: `rm -rf .git && git init -b main && git add -A && git commit -m "day zero"`
   - Windows PowerShell: `Remove-Item -Recurse -Force .git; git init -b main; git add -A; git commit -m "day zero"`
3. If the repo path contains `OneDrive`, `Dropbox`, or `iCloud`, warn once: cloud-sync folders fight git and can corrupt memory (see `docs/HARDENING.md`). Offer to continue anyway; their call.
4. Never push this repo anywhere unless the founder explicitly asks AND the remote is one they own.

## Phase 1: The Founder (5 questions, one at a time)

Ask, then record answers in `memory/founder-profile.md` (copy the template from `memory/_templates/founder-profile.md`; same pattern for the other memory files later):

1. Name, and what should I call you?
2. What are you building, in one sentence? What stage? (idea / building / launched / revenue)
3. What's your strongest skill, and what do you most want me to take off your plate?
4. How do you like to work? (fast + rough vs careful + polished; how often you want summaries)
5. What does success look like 6 months from now?

Save each answer immediately. Confirm the completed profile back in 5 lines.

## Phase 2: The Venture & Jurisdiction

Fill `memory/venture.md`: product, customers, revenue model, current top 3 priorities, biggest risk. Get this from conversation, not interrogation, infer what you can from Phase 1 and only ask what's missing.

**Crucial Legal Context**: Explicitly ask the founder for their **Country of Operation / Primary Jurisdiction** AND their **Individual Legal/Visa Status** (e.g., Citizen, Visa holder, Digital Nomad). This is highly relevant because certain visas prohibit founding or operating a business.
Save this into `memory/legal-compliance.md` (copying the template from `memory/_templates/legal-compliance.md`). This is required so you can provide accurate, country-centric advice later.

If the venture clearly matches a starter in `templates/` (SaaS, creator, agency, e-commerce), use that template's skeleton and vault taxonomy as the starting shape.

Any real numbers that surface (revenue, users, subscribers, traffic) get seeded into `memory/metrics.md` (template in `memory/_templates/metrics.md`) with today as the as-of date. No numbers yet? Note the ONE number the founder most wants to exist.

If the founder mentions an existing Obsidian vault, Notion workspace, ChatGPT/Claude export, or a previous Shotgun copy, run the import flow from `.shotgun/skills/port/SKILL.md` as part of Phase 3.

## Phase 3: The Data Rescue (deliver value NOW)

1. Ask: "Where does your project stuff currently live? Point me at folders, files, spreadsheets, anything scattered."
2. For everything accessible: inventory it (name, type, one-line guess at what it is). Present the inventory.
3. Propose a filing plan into `vault/` using the taxonomy in `vault/VAULT-GUIDE.md`. Show the plan as a "file → destination" list.
4. On approval, execute: copy (never move originals without permission), rename to the vault naming convention, and write `vault/_index.md` describing every file.
5. Report: X files organized, structure created, anything that looked duplicate or unreadable.

## Phase 4: The Voice (2 minutes, skippable)

Ask once: "Paste 2-3 things you wrote and actually liked, a post, an email, anything. I'll learn to write in your voice instead of AI voice." On receiving samples, extract the patterns into `memory/voice.md` (template in `memory/_templates/voice.md`) and show the voice rules back in 3 lines. If they skip, leave it; the write skill collects samples the first time it's needed.

## Phase 5: First Open Loops

Ask: "What are the 3 things most on your mind right now?" → write them to `memory/open-loops.md` with dates.

## Phase 6: Close

1. Update `memory/MEMORY.md` index with every file created.
2. Append the first entry to `memory/journal.md`.
3. Close with: what you now know (3 lines), what you organized (1 line), and a suggested first real task.

Onboarding is complete only when founder-profile.md, venture.md, and open-loops.md exist and the vault has an `_index.md`. Voice and metrics are strongly wanted but never block completion.
