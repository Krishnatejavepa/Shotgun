# The Cofounder Memory Format (CMF) v1.0

A formal, versioned spec of how Shotgun stores a venture's memory, published so any tool can read or write a Shotgun brain. The format is the moat AND the exit door: if Shotgun disappeared tomorrow, this document is enough to rebuild a reader for every memory it ever stored.

Design constraints (normative): plain markdown, no database, no embeddings, no binary formats, human-editable with any text editor, versionable by git. A conforming store MUST be fully understandable by a person with no tooling.

## 1. Layout

A CMF store is a directory named `memory/` containing:

| File | Required | Purpose |
|---|---|---|
| `MEMORY.md` | yes | The index. One line per memory entry. Loaded first, always. |
| `founder-profile.md` | yes (post-onboarding) | Who the founder is, preferences, working style |
| `venture.md` | yes (post-onboarding) | Live business state: product, customers, priorities, risks |
| `open-loops.md` | yes (post-onboarding) | Unfinished work, one line each, with owner and due date |
| `decisions.md` | when first decision | Append-only decision log (4-line format, §3) |
| `metrics.md` | when first number | Append-only dated numbers history |
| `voice.md` | optional | Writing samples + derived voice rules + corrections log |
| `feedback.md` | optional | Corrections from the founder, with why |
| `changelog.md` | optional | One line per shipped thing; `[external]` tags mark confirmed irreversible actions |
| `journal.md` | yes (post-onboarding) | One ≤2-sentence entry per session, date-prefixed |
| `README.md` | recommended | The store's own protocol documentation |
| `_templates/` | optional | Blank skeletons; never counted as memories |

## 2. The index contract

`MEMORY.md` holds one line per entry: `- [Title](file.md): one-line hook`. Rules a conforming writer MUST follow:

1. Every memory file has at least one index line; every index line points to a file that exists.
2. The index stays under ~50 lines; beyond that, consolidation merges duplicates and archives stale entries.
3. The index may carry a 1-2 line condensed venture summary so readers get basic context without opening `venture.md`.

## 3. Entry formats

**Decisions** (append-only, never rewritten):

```
YYYY-MM-DD, DECISION: <what>
WHY: <one line>
REVISIT WHEN: <trigger condition, not a date>
```

**Metrics**: append-only per date. A correction is a new row with today's date, never an edit of an old row. History is the point.

**Open loops**: `- [ ] YYYY-MM-DD, <what>, next action: <concrete task>, owner: <name>, due: <YYYY-MM-DD>`. Loops without all three fields are non-conforming ("zombie loops").

**Journal**: `YYYY-MM-DD, <what happened, ≤2 sentences>`. Months older than 30 days may be rolled up into one `YYYY-MM: <summary>` block; git history preserves the raw lines.

**Dates** are always absolute ISO (2026-07-10), never relative.

## 4. Semantics

1. **One fact, one place.** A fact lives in its most specific file; other files reference it.
2. **Recall is grep + synonyms.** A conforming reader answers memory questions by searching the store (the reader generates synonyms; the store stays dumb). Answers cite file and date. Facts without a source line are not asserted.
3. **Secrets are forbidden.** No API keys, passwords, or tokens anywhere in a CMF store. Pointers to `.env` locations are the conforming alternative.
4. **Git is the version layer.** Every change SHOULD be committed; `git log -p memory/` is the audit trail. CMF does not define its own history mechanism because git already exists.
5. **Merging two stores** is a human-reviewed operation: diff, show conflicts (same fact, different value), founder picks per conflict, rebuild the index. Bulk overwrite is non-conforming.

## 5. Conformance

A tool "reads CMF" if it can load the index, locate entries by grep, and respect §4.2's source-cited recall. A tool "writes CMF" if its writes keep every invariant in §2–§4. Partial writers (e.g., a Stripe importer that only appends metrics rows) are valid as long as the rows conform.

## 6. Versioning

This is CMF v1.0. The version lives in this file and only changes when an invariant changes. Additive changes (new optional files) do not bump the major version. Breaking changes require a migration note in this document.

Anything not specified here is intentionally unspecified: tools may add their own optional files, but MUST NOT change the meaning of the files above.
