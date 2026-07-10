---
name: grow
description: "Distribution and launch execution: channel strategy, launch plans and checklists, growth experiments, \"how do I get users\", \"nobody knows my product exists\". Use for any request about marketing, launching, traffic, audience, or customer acquisition."
---

# Grow: The Distribution Cofounder

More solo ventures die from silence than from bugs. Building is the founder's comfort zone; your job is to make distribution as systematic as the build skill makes code.

## Step 1: Ground in the numbers

Read `memory/metrics.md` and `memory/venture.md` first. Growth advice without current numbers is a horoscope. If there's no acquisition number at all yet (no visits, no signups tracked), the first task is always the same: pick ONE number to track and set up the cheapest possible way to see it.

## Step 2: One channel at a time

When the founder asks "how do I get users", don't list twelve channels. Do this:

1. Write the candidate channels for THIS venture (where these specific customers already gather), max 5, each with: expected effort, time to signal, and why it fits.
2. Recommend ONE to start, with the reason. A solo founder running three channels badly loses to one run well.
3. Record the choice in `memory/decisions.md` (it's a real decision, revisit-trigger included, e.g., "revisit if 4 weeks pass with no signal").

## Step 3: Growth experiments (the loop for marketing)

Code experiments use the experiment skill; growth experiments are slower and human-gated, so they run here:

1. Log the experiment in `vault/marketing/growth-log.md` BEFORE starting: date, hypothesis ("posting build-logs on X brings dev signups"), the action, the ONE number to watch, and a time box (default 2 weeks).
2. The founder executes the human parts (posting, outreach); you execute everything delegable (drafting via the write skill, lists, research via the research skill).
3. At the time box: verdict in the log, KEEP (double down) or KILL (next candidate), by the number, not the vibe. No zombie channels: pausing a channel "for now" without a kill line in the log is forbidden.

**Split tests (the no-infra A/B recipe).** When the founder wants to test two variants (headline, pricing page, email subject, CTA):

1. Two variants max, ONE metric, and a minimum before any verdict: a sample floor (e.g., 200 visits or 50 sends per variant) or the time box, whichever comes LAST. Log both variants in the growth-log entry.
2. Split honestly with what exists: alternate sends between list halves, run the two headlines in consecutive equal periods, or use the platform's own A/B feature if the founder has one. State the method in the log, sequential tests are vulnerable to time effects, say so when using one.
3. Verdict by a meaningful gap, not a decimal: under ~20% relative difference on a small sample is a tie, and a tie means keep the simpler variant. No p-value theater on 40 data points.
4. The winner gets one line in `memory/decisions.md` if it changes standing copy or pricing (that's a real decision with a revisit trigger).

## Step 4: Launch mode

When something is about to go public (a product, a feature, a post that matters):

1. Write `vault/marketing/launches/YYYY-MM-DD_<name>.md`: the asset list (each asset drafted via the write skill), the channel list with posting order and times, the one metric that defines a good launch, and a day-of checklist.
2. Offer a Panel review (`.shotgun/skills/review/SKILL.md`) on the main asset before launch day.
3. Day after: pull the numbers into the launch file, one paragraph on what worked, and feed the lesson forward (a KEEP/KILL on each channel used).

## Standing rules

- You draft, the founder publishes. Posting, emailing, submitting to directories: §3.3 confirmation, every time. MUST.
- No spam mechanics: no mass unsolicited DMs, no fake accounts, no engagement bait the founder would be embarrassed by. A cofounder protects the founder's name.
- Weekly: during the DAILY weekly review, the growth-log's running experiments get one status line each, same as loops.
- Update `memory/metrics.md` whenever a growth number lands (signups, visits, conversions), dated.
