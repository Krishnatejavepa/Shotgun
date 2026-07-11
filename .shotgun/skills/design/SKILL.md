---
name: design
description: "Brand identity and the visual system: brand kit, palette, typography, logo direction, design tokens, \"set up my brand\", \"make it look consistent\", visual briefs for landing pages, decks, and social assets. Writing voice is WRITE; marketing strategy is GROW; this skill owns how things LOOK."
---

# Design: The Brand Cofounder

`memory/voice.md` is how the founder sounds; `vault/brand/DESIGN.md` is how the venture looks. Same idea: capture it once, apply it everywhere, so nothing ships looking like a different company every week.

## The brand kit interview (first run, ~10 minutes, every piece skippable)

Ask one at a time, conversational:

1. **Vibe:** 3 to 5 words the brand should feel like (and 1 or 2 it must never feel like).
2. **References:** 2 or 3 products or sites the founder admires visually, and what specifically they like about each. References do the work adjectives can't.
3. **Temperature:** playful ↔ serious, warm ↔ technical, minimal ↔ rich. Three sliders, one answer each.
4. **Palette:** existing colors if any; otherwise derive from the references: one primary, one neutral ramp, one accent, semantic colors (success/warn/error). Hex values, always.
5. **Type:** existing fonts if any; otherwise propose 2 max (heading + body), boring and legible over fashionable.
6. **Logo direction:** notes only (wordmark vs symbol, feel). Logo execution is a brief for a human tool or an image-capable harness, not a promise.

## The output: vault/brand/DESIGN.md

Write it as usable tokens, not prose about the tokens:

- **Vibe** (the words + the never-words)
- **Palette** (named hex values, usage rule per color)
- **Type** (families, weights, a 4-step size scale)
- **Spacing & radius** (a base unit and its scale)
- **Component rules** (buttons, cards, forms: 1 line each)
- **Imagery direction** (photo vs illustration, mood, what to avoid)
- **Do / Don't** (the 5 lines that prevent the most common drift)

Index it in `vault/_index.md`. This file is founder data: `shotgun-upgrade` never touches it.

## The consistency rule (MUST)

Any work that produces something visible reads `vault/brand/DESIGN.md` FIRST if it exists and follows it: landing pages and UI via the build skill, social and launch assets via the grow skill, decks and one-pagers via the write skill. Deviating is allowed with a stated reason, never silently. This mirrors how the write skill treats `memory/voice.md`.

## Producing assets

- **If the harness can generate images:** brief it from the DESIGN.md tokens (palette hexes, type, vibe words, imagery direction) and iterate against the do/don't list.
- **If it can't:** produce the complete brief a human tool (Figma, Canva, a contractor) can execute without asking questions: dimensions, copy, hierarchy, colors by hex, type by name.
- Either way the deliverable is a file in `vault/brand/` or `vault/marketing/`, indexed. Never claim a visual was produced when only a description was.

## Versioning and refreshes

- Git history is the brand-kit archive. "Show me the old direction" = the file's history, same as memory history.
- A brand refresh is a real decision: it invalidates existing assets. Route the choice through DECIDE, record it with a revisit trigger, then update DESIGN.md in one commit. Never restyle drive-by during a build.

## Onboarding hook

Onboarding asks one optional question (3 vibe words + one admired product) and seeds a starter DESIGN.md from it. The full interview runs the first time real visual work shows up.

## Bounds

- Design tokens, briefs, and specs: yes. Claims of pixel-perfect production design: no. Say what this skill produces plainly.
- UI implementation lives with the build skill (which reads DESIGN.md). This skill decides how it should look, not how the code is structured.
