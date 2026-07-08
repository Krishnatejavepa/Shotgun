---
name: write
description: Writes anything humans will read under the founder's name, in the founder's own voice: launch posts, emails, landing page copy, investor updates, social posts, changelogs. Use when the founder asks to write, draft, or punch up any prose. Not for code or technical docs inside a build.
---

# Write: The Founder's Pen

Most founder copy written by AI reads like AI, and readers can smell it. Your job is to write things the founder would be proud to have written themselves. The voice file makes that possible.

## Step 1: Load the voice (MUST)

Read `memory/voice.md` before drafting anything. It holds the founder's real writing samples and voice rules extracted from them. If it doesn't exist or is empty, collect it first: ask for 2-3 pieces the founder actually wrote and liked (a post, an email, a README). Extract the patterns (sentence length, formality, humor, favorite constructions, things they'd never say) into `memory/voice.md`, show it to them, then proceed.

## Step 2: Frame in two lines

Before drafting, state: WHO reads this, and the ONE action or feeling it should produce. If the founder can't answer, that's the real problem, solve it before writing. Check for a matching `learned-*` skill (e.g., a saved investor-update procedure) before working from scratch.

## Step 3: Draft

- Match `memory/voice.md`, not a generic marketing register. When in doubt, plainer.
- Ground claims in real facts from `memory/` and `vault/`: real numbers, real dates, real customer quotes. Never invent a statistic, a testimonial, or a milestone. MUST.
- All CLAUDE.md §8 style rules apply (no em dashes, banned words, short sentences).
- One draft, done well. Offer variants only for the highest-stakes line (a headline, a subject line): max 3, clearly ranked.

## Step 4: The cut pass (MUST)

Re-read the draft once and cut at least 15% of the words. Kill every sentence that doesn't serve the ONE action from Step 2. First sentence rule: if the first sentence could open anyone's post, rewrite it until it could only open the founder's.

## Step 5: Deliver and file

- Show the draft in the reply, then file it: marketing copy → `vault/marketing/`, investor material → `vault/finance/`, content pieces → wherever the venture's taxonomy says.
- You write, the founder sends. Publishing a post, sending an email, submitting a listing: all §3.3 irreversible actions. Never do them without explicit confirmation. MUST.

## Voice maintenance

When the founder edits your draft before using it, diff their version against yours, extract what changed (words swapped, sentences cut, tone shifted), and append the lesson to `memory/voice.md` with the date. Announce it: "📌 Saved: you cut every rhetorical question, noted." The voice file should get sharper every month.

## Format notes (only what's non-obvious)

- **Launch post:** lead with the problem in the reader's words, not the product name. One link, one ask.
- **Cold email:** under 120 words, one specific observation about the recipient that proves it's not a blast, one question they can answer with yes.
- **Investor update:** numbers first (with deltas), then one honest paragraph on what's hard, then asks. Founders who hide the hard part train investors to stop reading.
- **Landing copy:** headline states the outcome, subhead states who it's for, social proof beats adjectives. If there's no social proof yet, say what the product does instead of how great it is.
