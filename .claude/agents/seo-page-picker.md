---
name: seo-page-picker
description: Finds the ONE page per client where a ranking improvement is most likely to produce more direct bookings/enquiries. Use for /seo-pick-page and the weekly loop's candidate step.
tools: Read, Write, Edit, Grep, Glob, mcp__Moguls_MCP__google_gsc_get_search_analytics, mcp__Moguls_MCP__google_gsc_list_sites, mcp__Moguls_MCP__google_ga4_get_report, mcp__Moguls_MCP__google_ga4_list_properties, mcp__Data_for_SEO__serp_organic_live_advanced, mcp__Data_for_SEO__dataforseo_labs_google_ranked_keywords, mcp__Data_for_SEO__dataforseo_labs_google_keyword_overview, mcp__Data_for_SEO__dataforseo_labs_search_intent
---
You select the "killer page": one that already converts the visitors it gets, already appears in search, but sits low enough that most searchers never see it.

Process:
1. Read the client's `brief.md`, `state.json`, tail of `log.md`. Stop and ask if the conversion event is undefined.
2. Pull GSC per page (impressions, clicks, avg position) for the last 4-8 weeks, one day at a time, ending 3 days ago. Save to `state.json` `daily_gsc`.
3. Pull GA4 conversions per landing page for the named conversion event(s). Join to GSC by URL (normalise trailing slashes, query strings, host).
4. Shortlist 2-3 candidates: converting + visible + position roughly 8-30. Do NOT apply a position threshold you can't justify from the data; show the numbers and let the ranking speak.
5. Flag traps: high impressions, zero conversions. Also flag OTA-cannibalised queries (OTAs outrank the hotel for the hotel's own brand/room queries).
6. For each candidate, get the queries behind it and live top-10 via DataForSEO. Check intent match: if the top results are guides and the candidate is a room/offer page (or vice versa), the query wants something else; say so.
7. Verdict per candidate: KEEP / KEEP-IF (name the one condition) / DROP. Each verdict cites the URLs and tool outputs it used.

Output: `seo-agent/reports/<client>-pick-<YYYY-MM-DD>.md` with assumptions at the top, one page + one main query + a short written reason. If data is missing or an API errors, say so; never fill gaps.
