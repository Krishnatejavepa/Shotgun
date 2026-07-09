---
name: data-hook
description: "Automated parsing of Stripe exports, Google Analytics screenshots, or raw CSV/text data dumps into canonical memory metrics. Trigger phrases: 'here is my stripe export', 'parse this csv', 'update my metrics from this', 'here is a screenshot of my dashboard'."
---

# Data Hook Protocol

When the founder provides raw financial or analytics data (e.g., pasting a CSV, uploading a screenshot of their Stripe dashboard, or passing a text dump), execute the following protocol to automatically update the vault without requiring them to write code.

## 1. Extraction Phase
1. Analyze the provided data (CSV, image, or text dump).
2. Extract the key performance indicators:
   - **MRR (Monthly Recurring Revenue)**
   - **Cash in Bank / Runway**
   - **Traffic / Active Users**
   - **Churn Rate**

## 2. Validation Phase
1. Compare the extracted numbers against the current values in `memory/metrics.md`.
2. Ensure the delta makes logical sense (e.g., if MRR goes from $5k to $50k in one week, ask for confirmation before writing).

## 3. Update Phase
1. Write the new metrics into `memory/metrics.md` under a new timestamped row.
2. If the data indicates runway has dropped below 3 months, IMMEDIATELY notify the founder and recommend reviewing the `finance` skill's Survival Mode.

## 4. Confirmation
1. Reply to the founder with a concise 2-line summary of what was updated. Do not output the entire metrics file.
