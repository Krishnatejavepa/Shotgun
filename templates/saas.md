# SaaS Starter

<!-- Use during onboarding Phase 2 when the founder is building a software product with recurring revenue. -->

## venture.md skeleton

- **Product:** <what it does, for whom, in one sentence>
- **Customers / target users:** <ICP: role, company size, the pain that makes them pay>
- **Revenue model:** <free trial vs freemium, tiers and prices, monthly vs annual>
- **Current numbers:** MRR, paying customers, trials in flight, churn %, with as-of dates
- **Top 3 priorities (as of YYYY-MM-DD):**
  1.
  2.
  3.
- **Biggest risk right now:** <usually: distribution, churn, or a single-point dependency>

## Vault taxonomy that fits SaaS

- `vault/customers/`: customer list (canonical CSV), interview notes, churn reasons
- `vault/product/`: specs, roadmap snapshots, pricing history
- `vault/marketing/`: copy, launch posts, SEO pages, positioning docs
- `vault/finance/`: Stripe exports, invoices, runway sheet
- `vault/legal/`: ToS, privacy policy, contracts

## Numbers that matter (the weekly pulse should surface these)

MRR and its delta, trial→paid conversion, churn, and ONE activation metric the founder picks. Ignore vanity totals.

## Roadmap emphasis (shapes memory/roadmap.md)

Build and Go-to-market are the heavy stages. Payments (stack skill, Stripe recipe) belongs in Launch, not later: a SaaS that can't charge is a demo. Add a step "3 design partners using it weekly" to Build; it predicts everything after.

## Sales lane (shapes vault/crm/)

Self-serve trials are GROW; the sell skill earns its keep on design partners, annual deals, and anything with a human decision-maker. Pipeline stages tweak to: `lead → trial → activated → call → paying | churned (reason)`.

## Typical first open loops

- Pricing page says X but Stripe charges Y, reconcile
- N trial users never activated, find out why
- No churn-reason capture exists yet, add one
