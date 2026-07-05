---
name: loop
description: Autonomous work loop, delegated tasks the agent iterates on alone until verifiably done. Use when the founder says "loop on this", "keep going until it works", "don't stop until", or delegates a bounded task and walks away.
---

# Loop: Delegated Autonomous Work

The founder stops being the person who prompts each step and becomes the person who defines done. You run the cycle: act → verify → fix → repeat → stop.

## Step 1: Contract before iterating (MUST, never skip)

Before the first iteration, write the loop contract to `workspace/<project>/LOOP.md`:

```
GOAL: <what we're producing>
DONE WHEN: <a CHECKABLE condition, a test passes, a page renders, a file validates.
           "Looks good" is not checkable. If the founder's done-condition isn't
           checkable, propose one and get a yes.>
BUDGET: <max iterations, default 10>
OUT OF BOUNDS: <what this loop may NOT touch, default: anything irreversible
              (§3.3 actions), anything outside the project folder>
STATUS: running | done | stopped-budget | stopped-blocked
PROGRESS: <iterations used>/<budget>, <one-line read on trajectory>
LOG: (one line per iteration, appended below)
```

Then register the loop (MUST): add one line to `memory/open-loops.md`:
`LOOP: <goal> → workspace/<project>/LOOP.md (started YYYY-MM-DD, status: running)`. Update this line on every exit. This registry is how standups see all loops at a glance without opening every project.

## Step 2: The cycle

Each iteration, in order:

1. **Act**: one coherent unit of work toward the goal.
2. **Verify**: run the DONE WHEN check. Actually run it; never assess by reading.
3. **Log**: append one line to LOOP.md: `#N: <what changed> → <check result>`, and update the PROGRESS line.
4. **Decide**: check passed → STATUS: done, exit. Budget exhausted → exit. Same failure twice in a row → you're circling: change approach entirely, or exit as blocked. Otherwise → next iteration.

## Step 3: Exit report (every exit, any reason)

- **Done:** what was built, iterations used, final verification output.
- **Budget/blocked:** exactly where it stopped, the LOOP.md log, your diagnosis, and the ONE decision or input you need from the founder to continue. Never quietly give up mid-loop.
- Either way: update `memory/open-loops.md` (remove if done, update with blocker if not). If the task type will recur, offer a learned skill (§9).

## Hard rules

- Never loop on irreversible actions. Deploys, sends, deletions, purchases sit OUTSIDE the loop and get individual confirmation (§3.3).
- LOOP.md is the resumable state: any future session (any model) can read it and continue the loop exactly where it stopped.
- One loop at a time per project. A loop inside a loop is a bug, not ambition.
- Multiple loops across projects are fine, but each needs its own registry line in `memory/open-loops.md`. When the founder asks "what's running", read the registry, then each LOOP.md's STATUS and PROGRESS lines, and report them as a table: loop, status, progress, blocker if any. If two loops compete for the founder's attention, rank them by which one blocks the top venture priority.
- If the DONE WHEN condition turns out to be wrong mid-loop (the check passes but the goal clearly isn't met), stop and renegotiate the contract, don't silently redefine done.
