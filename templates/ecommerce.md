# E-commerce Starter

<!-- Use during onboarding Phase 2 when the founder sells physical or digital products through a store: Shopify, Etsy, Gumroad, own checkout. -->

## venture.md skeleton

- **Product:** <what's sold, physical or digital, own brand vs resale>
- **Customers / target users:** <who buys, why they buy from you and not Amazon>
- **Revenue model:** <unit price and margin per product line; one-off vs repeat purchase>
- **Current numbers:** monthly revenue, orders, AOV, repeat rate, main traffic source, with as-of dates
- **Top 3 priorities (as of YYYY-MM-DD):**
  1.
  2.
  3.
- **Biggest risk right now:** <usually: single traffic source, single supplier, or margin erosion from ads>

## Vault taxonomy that fits e-commerce

- `vault/products/`: catalog (canonical CSV), photos, supplier specs, cost sheets
- `vault/customers/`: order exports, reviews, support threads, repeat-buyer list
- `vault/marketing/`: ad creatives and results, email campaigns, influencer deals
- `vault/finance/`: platform payouts, ad spend, margin sheets, inventory value
- `vault/operations/`: supplier contacts, shipping rates, returns log

## Numbers that matter (the weekly pulse should surface these)

Revenue, contribution margin after ads (the honest number), AOV, and repeat purchase rate. Revenue without margin is a vanity metric with shipping costs attached.

## Roadmap emphasis (shapes memory/roadmap.md)

The Build stage means the store and the supply chain, not custom software. If the platform handles checkout (Shopify, Etsy, Gumroad), mark STACK STATUS payments as `n/a (platform)` and spend the saved time on the Go-to-market stage: traffic is the whole game here.

## Sales lane (shapes vault/crm/)

B2C orders don't belong in a CRM. The sell skill covers the deals that ARE human-to-human: wholesale accounts, influencer partnerships, supplier negotiations. Stages: `lead → conversation → terms → active | dead (reason)`.

## Typical first open loops

- Ad spend and revenue live in different dashboards, no single margin view exists
- Best-selling product has one supplier and no backup, quote a second
- Reviews are never mined for copy, extract the top phrases customers use
