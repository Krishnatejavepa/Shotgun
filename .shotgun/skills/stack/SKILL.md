---
name: stack
description: "Company infrastructure, guided and founder-owned: hosting and deploys, staging-to-prod publishing, domains and DNS, transactional email, database, Stripe payments, analytics wiring. Use for \"set up payments\", \"get this live\", \"set up my domain\", \"add a database\", \"can people pay me yet\". Writing app code is BUILD; this skill gets the company's rails ready."
---

# Stack: The Infrastructure Cofounder

Cloud platforms provision this stuff for you and own it. Here the founder owns every account and key; this skill makes the setup guided, verified, and recorded instead of a weekend of tab-hopping.

## STACK STATUS (the company's infrastructure at a glance)

`memory/venture.md` carries a STACK STATUS block: hosting, database, domain, email, payments, analytics, each marked `ready | pending | n/a (reason)`. If the block is missing, add it (template in `memory/_templates/venture.md`). Every recipe below ends by updating its line. MUST: status reflects what was verified, not what was attempted.

## Ordering guard

Read `memory/roadmap.md` first if it exists. Recommend the stack item the current stage actually needs: a pre-validation founder needs a deployed landing page, not a Stripe integration. Push back once if asked to build rails the stage doesn't justify, then do what the founder decides.

## Recipe: Hosting + publishing

1. Boring defaults: GitHub for the repo; Vercel for Next.js apps, Netlify or GitHub Pages for static sites. State the free-tier limits before any paid choice (§3.3 applies to money).
2. Branch model, mirroring how grown-up teams ship: `main` is staging, `prod` is production. Publishing = a reviewed PR from `main` to `prod`. Preview deploys on PRs if the host supports them.
3. Verify: staging URL loads, a trivial change flows main → preview → prod. Update STACK STATUS: hosting.

## Recipe: Database

1. Default to SQLite until a real multi-user need exists; it's a file, it's backed up with the repo, and the founder can read it. When multi-user auth or concurrent writes arrive: Supabase (managed Postgres + auth) as the boring managed choice.
2. Schema changes are migration files in the repo, applied to staging on merge to `main`, to production on publish. Never hand-edit a live schema.
3. Verify: migration applies clean on a fresh copy. Update STACK STATUS: database.

## Recipe: Domain + DNS

Checklist, founder executes at their registrar, you verify after:

1. Buy at a boring registrar. Apex domain → marketing site, `app.` subdomain → the app, `staging.` → staging, if those exist.
2. Provide the exact DNS records for their host. Warn once: propagation takes minutes to hours; pending is normal.
3. Verify with a DNS lookup once propagated. Update STACK STATUS: domain. The purchase itself is §3.3: state the cost, get the yes, log `[external]`.

## Recipe: Transactional email

1. Resend or Postmark. Domain verification records (SPF, DKIM) provided exactly; founder adds them; you verify.
2. One from-address, one purpose: receipts, sign-in links, alerts. No marketing blasts from transactional rails, no purchased lists, no inbox-warming games, ever.
3. Verify: one test send arrives. Update STACK STATUS: email.

## Recipe: Payments (Stripe)

The monetization recipe, in order:

1. **Keys:** test keys while building, live keys only at launch. Both live in `.env` (gitignored), never in memory, vault, or code (§4 rule). Test and live never mix in one environment.
2. **Webhook:** one endpoint (`/api/stripe/webhook` by convention) that verifies the Stripe signature before trusting anything. Built via the build skill.
3. **Flow:** checkout for one-time, subscriptions for recurring. Simplest Stripe primitive that works (Payment Links count; zero code beats some code).
4. **Verify on test mode:** happy path with Stripe's test cards, one failure path, webhook receives and verifies. Never skip.
5. **Go live:** swapping to live keys is §3.3: confirm, then log `[external]`. First real payment gets celebrated in exactly one line, then a row in `memory/metrics.md`.
6. Update STACK STATUS: payments.

## Recipe: Analytics

1. One privacy-light tool (Plausible, Umami, or PostHog if product analytics is truly needed). One script tag or SDK, verified firing.
2. Wire ONE number to the weekly rhythm: the founder's chosen metric flows to `memory/metrics.md` via the data-hook skill on a stated cadence. Update STACK STATUS: analytics.

## Bounds

- The founder owns every account. Never create accounts, never store their passwords anywhere, `.env` is the only key location.
- Every recipe states costs before incurring them. Free tiers first.
- No daemons, no background services in the Shotgun folder itself: the stack lives at the hosts, this skill wires and verifies it.
