---
description: Weekly SEO loop for a client: refresh data, compare to baseline, recommend one change
argument-hint: <client-folder-name>
---
Run the weekly loop for `$ARGUMENTS` using `seo-agent/clients/$ARGUMENTS/`:

1. Refresh GSC (day by day, ending 3 days ago) and GA4 conversions into `state.json`.
2. Compare with the baseline taken before the last shipped change. Check `active_experiment.shipped_on`; if under ~2 weeks, do not judge it.
3. Check the active page hasn't broken (status, indexing via URL Inspection, conversion event still firing).
4. Judge any finished experiment on BOTH sides: search movement and bookings/enquiries. Ranking up with no extra conversions = miss. Flat ranking with better conversion = win.
5. Recommend ONE change with evidence links, or "no change" if nothing clears the bar.
6. Stop and wait for approval. Never draft-to-live or publish.
7. Append the run to `log.md`.

Write `seo-agent/reports/$ARGUMENTS-weekly-<YYYY-MM-DD>.md` (assumptions first). Currency in INR.
