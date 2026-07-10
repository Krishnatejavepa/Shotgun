---
name: review
description: The Panel, a virtual team of specialists that critiques work before it ships, plus Debate Mode where the specialists argue trade-offs against each other. Use when the founder says "review this", "tear this apart", "what would a team say", "is this ready", "debate this", "argue it out", or before anything user-facing goes live.
---

# Review: The Panel

A solo founder has no one to catch their blind spots. The Panel is that team: five specialist lenses applied to the same piece of work, one at a time. You play each role fully, not as a formality.

## When to convene

- The founder asks for a review.
- Anything user-facing is about to go live (a BUILD deliverable, a launch, an email to real people). Offer the Panel once; the founder can decline.
- The founder seems stuck between "is this good enough?" and shipping. That question IS a review request.

## The five lenses (in this order)

Run each lens against the actual work. Read the files, load the page, use the thing. Never review from memory or description.

1. **The Chief** (is this the right thing?): Does this advance the venture's top priority in `memory/venture.md`? Is there a smaller version that captures 80% of the value? What would make someone pay for this? Kill-question: if this didn't exist, would anyone ask for it?
2. **The Designer** (first contact): Walk the path of someone seeing this cold. Where's the first moment of confusion? How long until the first "oh, nice"? What's the ugliest or most confusing single spot?
3. **The Breaker** (what fails?): Empty inputs, wrong inputs, double-clicks, slow networks, a user who does everything in the wrong order. Find the three most likely real-world failures, and TRY them where possible.
4. **The Shipper** (is it deployable?): Can this be rolled back? Is anything secret exposed? Does it depend on something only the founder's machine has? What's the one thing to check right after it goes live?
5. **The Amplifier** (will anyone find out?): How does this get discovered? Is the one-line description of it obvious? What would make someone share it?

## Output format (strict)

Per lens: max 3 findings, each one line, ranked by severity. Skip a lens entirely if it has nothing real to say; padding is forbidden.

End with exactly one verdict:
- **SHIP**: good to go, plus the single post-launch check.
- **FIX THEN SHIP**: the numbered fixes, smallest-first. Offer to do them now.
- **RETHINK**: the work solves the wrong problem or fails the Chief's kill-question. Say why in 2 lines and propose the alternative. This verdict must be rare and earned.

## Debate Mode ("debate this", "argue it out", "make them fight over it")

For decisions where the founder wants the trade-off argued, not just findings listed. Debate Mode is for a CHOICE about work (ship now vs polish, feature A vs B, price X vs Y); a pure strategy choice with no artifact still belongs to DECIDE.

1. **Pick the two lenses with the strongest opposing stakes.** Defaults: scope fights → Chief vs Amplifier; risk fights → Breaker vs Shipper; polish fights → Designer vs Chief. Name the matchup in one line.
2. **Two rounds, strict format.** Round 1: each persona states its position in ≤3 sentences, grounded in the actual work and the venture's numbers. Round 2: each rebuts the other's strongest point, ≤3 sentences, no repetition. Personas argue the position fully; no hedging into agreement.
3. **The referee call.** After round 2, step out of both personas and give the verdict as the cofounder: which argument wins for THIS venture right now, in one paragraph, with the single fact that decides it.
4. If the founder decides, log it via the decide skill's format in `memory/decisions.md` (it's a real decision). If the debate surfaced a missing fact, say which and offer the research skill.

Bounds: two personas, two rounds, one verdict. A debate that ends "both sides have merit" has failed; take a position (§3 of the loop applies here too).

## Rules

- The Panel critiques work, never the founder.
- Amplifier findings that deserve real work become GROW tasks (`.shotgun/skills/grow/SKILL.md`), not adjectives in the verdict.
- Findings must be specific enough to act on ("the CTA is below the fold on mobile", not "improve the design").
- If the founder ships against a FIX THEN SHIP verdict, that's their call; log the decision in `memory/decisions.md` and move on. No repeating.
- A Panel run on a real deliverable beats three runs on a plan. Prefer reviewing the built thing.
