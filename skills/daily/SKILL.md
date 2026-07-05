---
name: daily
description: Daily/weekly operating rhythm, standup, planning, review, "what should I work on". Use when the founder starts a work session, asks what's next, or wants a review of progress.
---

# Daily: The Operating Rhythm

Solo founders have no team rituals. You are the ritual.

## "Good morning" / "what's next" → Standup (≤10 lines total)

1. Read `memory/open-loops.md`, `memory/journal.md` (last 3 entries), `memory/venture.md` (top 3 priorities).
2. Output exactly:
   - **Yesterday/last session:** what moved (1–2 lines)
   - **Open:** loops that matter today, oldest-first (2–3 lines)
   - **Today's ONE thing:** the single task that most advances the top priority, with a one-line why
   - **Also, if time:** max 2 smaller items
3. If any `LOOP:` registry lines exist in open-loops.md, add one line: **Running loops:** each loop's status and progress from its LOOP.md (e.g., "scraper-fix 6/10 iterations, circling on auth"). Blocked loops go first; they're waiting on the founder.
4. If an open loop has been open for more than 7 days, flag it: finish it, kill it, or consciously park it. Zombie loops drain founders.

## "How's it going" / weekly review → Review (run max once a week)

1. Read the week's journal entries + changelog + decisions.
2. Output: shipped (list), decided (list), still open (list), and ONE honest observation a cofounder would make, pattern-level, e.g., "Three weeks on features, zero on distribution. Worried about that."
3. Ask: "Anything change in priorities?" → update `memory/venture.md` if yes.
4. Self-retro (CLAUDE.md §9.5): scan `memory/feedback.md` for repeated corrections; if any has occurred twice, propose ONE skill-file edit that would prevent it. Also flag any learned skill that failed during reuse this week.
5. Pulse (4 numbers, one line each, from changelog/journal/git): shipped this week, loops run (done vs blocked), experiments kept vs reverted, learned skills added or repaired. Numbers over adjectives; a founder should see momentum or its absence at a glance.
6. Housekeeping check: if `memory/MEMORY.md` exceeds ~50 lines run the consolidation routine, if `memory/journal.md` exceeds ~60 lines run the journal roll-up (both in `memory/README.md`).

## Focus protection

- If the founder proposes a today-task unrelated to the top 3 priorities, ask once: "This over [current ONE thing], intentional switch?" Accept their answer without relitigating.
- If the founder seems overwhelmed (says so, or brings a scattered list of 6+ things), respond with triage, not enthusiasm: pick 1, park the rest into open-loops with dates, and say why that 1.

## Session end

Follow the Session End Protocol in CLAUDE.md §7, journal line, open-loops update, 3-line close. Every session, no exceptions.
