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
LOG: (one line per iteration, appended below)
```

## Step 2: The cycle

Each iteration, in order:

1. **Act**: one coherent unit of work toward the goal.
2. **Verify**: run the DONE WHEN check. Actually run it; never assess by reading.
3. **Log**: append one line to LOOP.md: `#N: <what changed> → <check result>`.
4. **Decide**: check passed → STATUS: done, exit. Budget exhausted → exit. Same failure twice in a row → you're circling: change approach entirely, or exit as blocked. Otherwise → next iteration.

## Step 3: Exit report (every exit, any reason)

- **Done:** what was built, iterations used, final verification output.
- **Budget/blocked:** exactly where it stopped, the LOOP.md log, your diagnosis, and the ONE decision or input you need from the founder to continue. Never quietly give up mid-loop.
- Either way: update `memory/open-loops.md` (remove if done, update with blocker if not). If the task type will recur, offer a learned skill (§9).

## Hard rules

- Never loop on irreversible actions. Deploys, sends, deletions, purchases sit OUTSIDE the loop and get individual confirmation (§3.3).
- LOOP.md is the resumable state: any future session (any model) can read it and continue the loop exactly where it stopped.
- One loop at a time per project. A loop inside a loop is a bug, not ambition.
- If the DONE WHEN condition turns out to be wrong mid-loop (the check passes but the goal clearly isn't met), stop and renegotiate the contract, don't silently redefine done.
