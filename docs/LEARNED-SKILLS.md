# Learned Skills

Skills Shotgun writes for itself as it works with you, the compounding execution layer.

When a multi-step task gets figured out and is likely to recur, the agent offers to save the procedure (see SHOTGUN.md §9). Each learned skill captures the exact steps that worked *for this founder*, file locations, preferences, tools, so next time is instant and consistent.

## Where they live

`.shotgun/skills/learned-<task-name>/SKILL.md`, flat alongside the core skills. The `learned-` prefix marks them as self-written; the location means compatible agents discover them natively, same as core skills.

## Format

```
---
name: learned-<task-name>
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
- Every new learned skill gets one line in `memory/MEMORY.md` so it shows up in recall.

The count of `learned-*` skills over time is a measure of how much of your business Shotgun has mastered. The doctor skill audits their health monthly.
