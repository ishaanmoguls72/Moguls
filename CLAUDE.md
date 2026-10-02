# Moguls SEO & AEO Agent

This repo is the "brain" of a weekly SEO/AEO loop for hospitality clients. Each client has a folder under `seo-agent/clients/<client>/` with three files the agent reads on every run:

- `brief.md`: property, offer, buyer, conversion definition (edit most often)
- `state.json`: baseline numbers per page and the active experiment
- `log.md`: append-only run history. Never delete or rewrite old entries.

Start from `seo-agent/clients/_template/`. Client data is confidential: never reference one client's figures in another client's folder or report.

## Objective
Revenue, not rankings. The unit of work is ONE page where a better ranking turns into more direct bookings or enquiries (rooms, weddings, banquets, restaurant reservations). Impressions, positions and CTR are inputs, never the goal. A page with high impressions and zero conversions is a trap: flag it, don't recommend it.

## Rules for every run
1. Read `brief.md`, `state.json`, tail of `log.md` first. If the brief is missing the conversion event or property type, stop and ask.
2. State assumptions at the top of every report (client, period, platform, data source).
3. Every claim cites the URL or tool output it came from. Missing data is reported as missing, never estimated.
4. Do not invent benchmarks, volumes or platform specs. Google/Bing/AI-answer behaviour changes often: mark such statements "verify".
5. One change per page per cycle. Ignore movements shorter than ~2 weeks. Don't touch pages already performing unless there is a strong, sourced reason.
6. Never publish, edit a live page, submit a URL for indexing, or change ads. Draft only, then wait for explicit approval (a hook enforces this).
7. Don't edit the agent's own instructions mid-experiment; log any change to them.
8. Currency: INR with Indian numbering (₹5 Lakhs, ₹1 Crore) unless the client says otherwise.
9. GSC caveats: data lags 2-3 days; page+query breakdowns drop rows; AI Overview appearances can inflate average position. Pull day by day and store in `state.json`.

## Data sources (already connected via MCP)
- Search: `mcp__Moguls_MCP__google_gsc_*` (analytics, URL inspection, sitemaps)
- Conversions: `mcp__Moguls_MCP__google_ga4_*` (booking-engine click / enquiry / call / WhatsApp events, as named GA4 events)
- Speed: `mcp__Moguls_MCP__google_pagespeed_get_report`
- Keywords, live SERP, AI-mode/LLM mentions, backlinks: `mcp__Data_for_SEO__*` (use for competitor top-10 and AI citation checks)
- Optional, not yet wired: Firecrawl (full-page scrape), Parallel (off-site brand mentions), Ahrefs. Fall back to `mcp__Data_for_SEO__on_page_content_parsing` for page text.

## Commands and subagents
- `/seo-pick-page <client>`: find the one page worth the week
- `/seo-audit-page <client> <url>`: four-pass checkup, ranked fixes, one recommended change
- `/seo-weekly <client>`: the weekly loop
- Subagents: `seo-page-picker`, `seo-page-auditor` (in `.claude/agents/`)
