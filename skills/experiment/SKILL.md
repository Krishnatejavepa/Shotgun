---
name: experiment
description: Metric hill-climbing loop (the Karpathy autoresearch pattern): autonomously improve a measurable number through many small keep-or-revert experiments. Use when the founder says "make X faster/better/cheaper", "optimize this", "squeeze more out of", and the quality can be expressed as a number a command can produce.
---

# Experiment: The Optimizer

Unlike LOOP (drive to a done-condition), EXPERIMENT maximizes a metric with no finish line: propose a small change → measure → keep if better, revert if worse → repeat until budget runs out. Git is the undo button.

## Step 1: Contract first (MUST)

Write to `workspace/<project>/EXPERIMENTS.md`:

```
METRIC: <a COMMAND that outputs a number, a benchmark, a lighthouse score,
        a runtime, a file size. If the founder's goal isn't measurable by a
        command, build the measurement harness FIRST or decline into BUILD.>
DIRECTION: maximize | minimize
BASELINE: <run the metric 3 times before touching anything; record median>
BUDGET: <max experiments, default 20, or a time box>
CONSTRAINTS: <what must not change: behavior, outputs, APIs, dependencies…
             plus a SANITY CHECK, a correctness test that must still pass,
             so we never trade correctness for score>
LOG: (one line per experiment, appended)
```

Requirements: the project must be a git repo (init one if not) with a clean state before starting.

## Step 2: The cycle (per experiment)

1. **Propose** ONE small change, the smallest change that could plausibly move the metric. Never bundle changes; you won't know which one worked.
2. **Apply** it.
3. **Measure**: run the metric command. Noisy metrics get 3 runs, take the median.
4. **Sanity check**: run the correctness test from CONSTRAINTS. Fail = automatic revert, regardless of the metric.
5. **Keep or revert**: improved AND sane → `git commit` with the metric in the message. Otherwise → `git checkout .` (full revert). No "maybe keep", the tree is always clean between experiments.
6. **Log**: `#N: <change> → <metric> (<kept|reverted>)`.

## Step 3: Exit report

Baseline → final metric (with %), number of experiments, kept changes (the git log IS the changelog), reverted dead-ends worth remembering, and your read on whether more budget would keep paying.

## Guardrails (Goodhart protection)

- **The metric is a proxy; the sanity check is the truth.** Famous failure mode: a "53% speedup" that turned out to overfit the benchmark. If a gain looks too good, verify it on a variation of the measurement before trusting it.
- Never experiment on production, live data, or anything users touch. Copy → optimize → founder reviews → founder ships.
- Irreversible actions (§3.3) never happen inside an experiment loop.
- If 5 consecutive experiments revert, stop proposing variations of the same idea, change strategy level (different algorithm, not different constants) or exit and report.
