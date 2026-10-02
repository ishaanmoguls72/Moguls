# Moguls SEO & AEO Agents

A Claude Code setup that runs a weekly SEO/AEO loop per hospitality client, built around one rule: **a page only matters if it converts** (direct booking, enquiry, WhatsApp, call). Rankings and impressions are inputs, not goals.

## Layout
```
CLAUDE.md                          agent rules (read every run)
.claude/agents/                    seo-page-picker, seo-page-auditor
.claude/commands/                  /seo-pick-page, /seo-audit-page, /seo-weekly
.claude/hooks/require-approval.sh  asks before any live/ads-changing tool
seo-agent/clients/_template/       brief.md, state.json, log.md per client
seo-agent/reports/                 generated reports (confidential; one client each)
docs/rollout-plan.md               4-week plan
```

## Per-client setup
1. `cp -r seo-agent/clients/_template seo-agent/clients/<client>`
2. Fill `brief.md`, especially the exact GA4 conversion event name (verify it fires first).
3. Fill `state.json` with the GSC property and GA4 property ids (`google_gsc_list_sites`, `google_ga4_list_properties`).
4. Run `/seo-pick-page <client>`, then `/seo-audit-page <client> <url>`, then schedule `/seo-weekly <client>`.

## Data sources
Uses the already-connected Moguls MCP (GSC, GA4, PageSpeed) and DataForSEO MCP. The article's PostHog is replaced by GA4; Firecrawl, Parallel and Ahrefs are optional and not wired here. Use DataForSEO's sandbox/small queries first to check cost before bulk pulls.

## Safety model
- Hook forces confirmation on CMS publish and ad-mutation tools. The matcher is name-based: after you connect a CMS MCP, check its tool names match `.claude/settings.json` and extend the pattern if not.
- Schedule weekly runs as a local/desktop scheduled task in a permission mode that stops and waits. Cloud routines run without approval, so give them read-only access only.
- Draft only; a human does the final read before anything goes live.

## Caveats
Several claims in the source article (Google's stance on llms.txt and AI Overviews, the Ahrefs schema test, Bing's AI Performance report) are third-party and platform behaviour changes often. Treat them as "verify" before presenting to a client.
