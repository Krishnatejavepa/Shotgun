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

## Phase 0.5: Read the room (silent stack detection, 30 seconds)

Before asking anything, look at what's already in the folder. Founders often run `shotgun-init` inside an existing project, and a cofounder who asks "what are you building?" while standing inside the answer looks blind.

1. Detect the stack from files present: `package.json` (read the framework: Next.js, Remix, Express…), `requirements.txt`/`pyproject.toml` (Python), `Gemfile`, `go.mod`, `Cargo.toml`, a `shopify.app.toml`, a `.env.example` mentioning STRIPE keys, an `app/` or `src/` layout.
2. If a stack is found, open Phase 1 with it: "I can see this is a Next.js app with Stripe wired in. Tell me what it does and who it's for." Skip questions the folder already answers.
3. Map the detection to a starter template BEFORE Phase 2: Stripe/subscription signals → `templates/saas.md`; Shopify/product catalogs → `templates/ecommerce.md`; content folders/newsletter tooling → `templates/creator.md`; client-name folders → `templates/agency.md`. Propose it, don't impose it.
4. Pre-wire the first-week rhythm from the template's "numbers that matter": name the ONE metric the weekly pulse will track first, and say what a good first week of sessions looks like (one line).
5. Nothing detected → plain folder, skip silently to Phase 1. This phase must never add questions, only remove them.

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

Seed the STACK STATUS block in `memory/venture.md` from what Phase 0.5 detected (Stripe keys in `.env.example` → payments: pending; a `vercel.json` or deploy config → hosting: ready or pending; nothing → all pending). The stack skill keeps it current from here.

Then offer the company roadmap in one line: "Want a company roadmap? One file, staged milestones from where you are to launch and beyond, checked off as evidence shows up." On yes: copy `memory/_templates/roadmap.md` to `memory/roadmap.md`, shape it with the starter template's roadmap emphasis, pre-mark steps that are already evidenced (stage answers from Phase 1, stack detection from Phase 0.5, real numbers from this phase), and name the next available step. On no, skip; the roadmap skill offers again only when asked.

If the founder mentions an existing Obsidian vault, Notion workspace, ChatGPT/Claude export, or a previous Shotgun copy, run the import flow from `.shotgun/skills/port/SKILL.md` as part of Phase 3.

## Phase 3: The Data Rescue (deliver value NOW)

1. Ask: "Where does your project stuff currently live? Point me at folders, files, spreadsheets, anything scattered."
2. For everything accessible: inventory it (name, type, one-line guess at what it is). Present the inventory.
3. Propose a filing plan into `vault/` using the taxonomy in `vault/VAULT-GUIDE.md`. Show the plan as a "file → destination" list.
4. On approval, execute: copy (never move originals without permission), rename to the vault naming convention, and write `vault/_index.md` describing every file.
5. Report: X files organized, structure created, anything that looked duplicate or unreadable.

## Phase 4: The Voice (2 minutes, skippable)

Ask once: "Paste 2-3 things you wrote and actually liked, a post, an email, anything. I'll learn to write in your voice instead of AI voice." On receiving samples, extract the patterns into `memory/voice.md` (template in `memory/_templates/voice.md`) and show the voice rules back in 3 lines. If they skip, leave it; the write skill collects samples the first time it's needed.

## Phase 4.5: The Look (1 minute, skippable)

Ask once: "Three words your brand should feel like, and one product whose look you admire?" On an answer, seed a starter `vault/brand/DESIGN.md` in the format from `.shotgun/skills/design/SKILL.md` (vibe words + reference, everything else marked TBD) and index it. If they skip, leave it; the design skill runs the full brand interview the first time visual work shows up.

## Phase 5: First Open Loops

Ask: "What are the 3 things most on your mind right now?" → write them to `memory/open-loops.md` with dates.

## Phase 6: Close

1. Update `memory/MEMORY.md` index with every file created.
2. Append the first entry to `memory/journal.md`.
3. Close with: what you now know (3 lines), what you organized (1 line), and a suggested first real task.

Onboarding is complete only when founder-profile.md, venture.md, and open-loops.md exist and the vault has an `_index.md`. Voice and metrics are strongly wanted but never block completion.
