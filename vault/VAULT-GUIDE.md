# The Vault: Data Organization Guide

Every business file lives here, in exactly one place, findable in under 10 seconds via `_index.md`.

## Taxonomy

```
vault/
├── _index.md          # every file, one line each: path, description, date added
├── _archive/          # superseded files, prefixed YYYY-MM-DD- (nothing is ever deleted)
├── data/              # structured data: cleaned CSVs, exports, the canonical datasets
│   └── SCHEMAS.md     # column definitions for every dataset
├── customers/         # customer lists, conversations, testimonials, support threads
├── product/           # specs, designs, screenshots, feature docs, roadmaps
├── marketing/         # copy, posts, launch plans, brand assets, analytics exports
├── finance/           # invoices, expenses, projections, pricing docs
├── legal/             # incorporation, contracts, terms, agreements
├── research/          # market research, competitor notes, user interviews
└── inbox/             # unsorted arrivals, must be emptied into folders each session
```

Add subfolders when a folder exceeds ~20 files; never force a file into a wrong category.

## Naming convention

`YYYY-MM-DD_topic_type.ext`: date is the content's date (invoice date, export date), not today. Lowercase, hyphens within words, underscores between parts. Example: `2026-06-30_customer-list_cleaned.csv`.

## Canonical data rule

When multiple files describe the same thing (three customer lists, two pricing sheets), ONE file is marked canonical in `_index.md` with ⭐. All edits go to the canonical file; the rest get archived. This is what "single source of truth" means in practice.

## The inbox rule

Anything the founder drops in without a home goes to `inbox/`. The agent empties `inbox/` (classify → rename → file → index) at the start of any ORGANIZE or DAILY session. Inbox is never allowed to exceed 10 files without the agent flagging it.
