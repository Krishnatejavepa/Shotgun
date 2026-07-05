# Learned Skills

Skills Shotgun writes for itself as it works with you, the compounding execution layer.

When a multi-step task gets figured out and is likely to recur, the agent offers to save the procedure here (see CLAUDE.md §9). Each learned skill captures the exact steps that worked *for this founder*, file locations, preferences, tools, so next time is instant and consistent.

## Format

Same as core skills, `<task-name>/SKILL.md`, with three additions that keep learned skills honest:

```
---
name: <task-name>
description: <what it does + the trigger phrases that should invoke it>
version: 1
---

# <Title>

<the exact numbered steps that worked>

## Verify
<a CHECKABLE way to confirm the procedure worked this time: a command to run,
a file that must exist, an output to eyeball. Every learned skill MUST have one.>

## Changelog
- YYYY-MM-DD v1: created after <the task that taught it>.
```

## Rules

- Learned skills are checked BEFORE working from scratch on any request.
- After every reuse, run the `## Verify` section. Pass = done. Fail = finish the task another way, then fix the skill, bump `version`, and add a changelog line saying what broke and what changed. Skills never rot silently.
- Every edit bumps `version` and gets a changelog line. `git log -p` on the skill file shows its full evolution.
- Learned skills automate **procedure only**: never judgment, never confirmation gates (§9 bounds).
- A learned skill that fails twice in a row after a repair gets flagged in the weekly review: repair again with the founder, or delete it. A wrong procedure is worse than no procedure.

This folder starts empty. Its size over time is a measure of how much of your business Shotgun has mastered.
