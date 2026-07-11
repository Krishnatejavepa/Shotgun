---
name: daily
description: Daily/weekly operating rhythm, standup, planning, review, "what should I work on". Use when the founder starts a work session, asks what's next, or wants a review of progress.
---

# Daily: The Operating Rhythm

Solo founders have no team rituals. You are the ritual.

## "Good morning" / "what's next" → Morning Intelligence Brief

1. Read `memory/open-loops.md`, `memory/journal.md` (last 3 entries), `memory/venture.md` (top 3 priorities), and `memory/metrics.md`.
2. Output a structured **Morning Intelligence Brief**:
   - **Yesterday's Burn:** what moved and what stalled (1–2 lines)
   - **Metrics Check:** current MRR/Traffic/Pulse from `metrics.md` and if they are trending up or down.
   - **Intel/Decisions:** Check `memory/decisions.md` for pending choices. If any are pending, offer to do quick web research right now.
   - **Today's ONE thing:** the single task that most advances the top priority, with a one-line why.
   - **Company next step:** if `memory/roadmap.md` exists, the next available roadmap step in one line. Skip if none.
3. If any `LOOP:` registry lines exist in open-loops.md, add one line: **Running loops:** each loop's status and progress. Blocked loops go first.
4. If `vault/marketing/growth-log.md` has experiments past their time box with no verdict, add one line flagging them.
5. If an open loop has been open for more than 7 days, flag it: finish it, kill it, or consciously park it. Zombie loops drain founders.
6. Routines: if `memory/routines.md` exists, check which active routines are due (by cadence, then criteria). Run each or propose it in one line, then update its Last run line with the date and a one-line result. Paused routines are skipped. MUST when the file exists.
7. Needs-action ordering: anything waiting on the FOUNDER (a decision, an approval, a review, a reply) is listed first in the brief, tagged **NEEDS-YOU**. Work waiting on you or on the world comes after. Founders should clear their own bottlenecks first.

## "How's it going" / weekly review → Review (run max once a week)

1. Read the week's journal entries + changelog + decisions.
2. Output: shipped (list), decided (list), still open (list), and ONE honest observation a cofounder would make, pattern-level, e.g., "Three weeks on features, zero on distribution. Worried about that."
3. Ask: "Anything change in priorities?" → update `memory/venture.md` if yes.
4. Self-retro (SHOTGUN.md §9.5): scan `memory/feedback.md` for repeated corrections; if any has occurred twice, propose ONE skill-file edit that would prevent it. Also flag any learned skill that failed during reuse this week.
5. Pulse: shipped this week, loops run (done vs blocked), experiments kept vs reverted, learned skills added or repaired, plus the venture numbers from `memory/metrics.md` with their weekly delta. If `vault/crm/pipeline.md` exists, add one pipeline line: opportunities per stage, movement this week, and anything stale past 14 days (the sell skill defines the format). One line each, numbers over adjectives. Then append one dated pulse row to `memory/metrics.md`. MUST: the metrics file is how momentum stays visible across months; a pulse that isn't written down is a pulse that didn't happen.
6. Revisit scan: read the REVISIT WHEN line of every entry in `memory/decisions.md` and check each trigger against `memory/venture.md` and `memory/metrics.md`. A tripped trigger gets surfaced: "We said we'd revisit pricing if churn passed 5%. It's at 6.1%." One line each; the founder decides whether to reopen.
7. Housekeeping: if `memory/MEMORY.md` exceeds ~50 lines run the consolidation routine, if `memory/journal.md` exceeds ~30 lines run the journal roll-up (both in `memory/README.md`). On the FIRST weekly review of each calendar month, also run the full checkup (`.shotgun/skills/doctor/SKILL.md`) and list paused routines from `memory/routines.md` in one line so they don't rot forgotten.
8. Roadmap scan: if `memory/roadmap.md` exists, run the weekly scan from `.shotgun/skills/roadmap/SKILL.md`: verify evidence for in-progress steps, mark what's now done, announce new unlocks, and surface the next available step next to the weekly ONE thing.

## "Run my CEO weekly" / "CEO mode" → CEO Weekly (the full ritual, one command)

The weekly review, revisit scan, update draft, and next week's plan as ONE chained run with ONE output document. For founders who want the whole ritual without invoking four things.

1. Run the weekly review above in full (steps 1–8, including the metrics pulse row, MUST).
2. Draft the weekly update via the write skill: numbers first with deltas, one honest paragraph on what was hard, what's next. Default audience is the founder themselves (a self-update disciplines thinking); if an investor-update learned skill or a real investor list exists, offer that version instead.
3. Propose next week: the ONE thing (with the why in one line), up to 2 supporting tasks in ruthless format, and ONE experiment worth running (growth via the grow skill, or code via the experiment skill), with its hypothesis and kill-date.
4. File the whole output as `vault/marketing/weekly-updates/YYYY-MM-DD_ceo-weekly.md` (create the folder if missing), index it, and put the proposed tasks into `memory/open-loops.md` after the founder approves them.
5. End with the one-line verdict a board would want: on track / drifting / stuck, and the single number that says so.

Bounds: CEO Weekly never makes decisions alone (DECIDE still applies) and never sends the update anywhere (§3.3). It prepares; the founder approves.

## "Generate weekly plan" / "plan my week" → Weekly Plan

1. Read `memory/journal.md` (last 7 days), `memory/venture.md`, and `memory/open-loops.md`.
2. Synthesize what happened last week (from the journal) and what matters now (from venture state).
3. Output a structured plan containing:
   - **Goal:** The overarching goal for the week based on venture priorities.
   - **Tasks:** A prioritized list of tasks (must follow ruthless format: concrete next action, owner, and due date).
   - **Habits/Rhythm:** Any adjustments needed based on last week's journal.
4. Ask the founder to approve or modify the plan. Once approved, append the new tasks to `memory/open-loops.md`.

## Focus protection

- If the founder proposes a today-task unrelated to the top 3 priorities, ask once: "This over [current ONE thing], intentional switch?" Accept their answer without relitigating.
- If the founder seems overwhelmed (says so, or brings a scattered list of 6+ things), respond with triage, not enthusiasm: pick 1, park the rest into open-loops with dates, and say why that 1.

## Session end

Follow the Session End Protocol in SHOTGUN.md §7, journal line, open-loops update, 3-line close. Every session, no exceptions.
