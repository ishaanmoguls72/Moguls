#!/usr/bin/env bash
# PreToolUse hook: force a human confirmation before anything that publishes,
# edits a live page, submits a URL, or changes ads. Reads the tool call JSON on stdin.
tool=$(python3 -c 'import json,sys; print(json.load(sys.stdin).get("tool_name",""))' 2>/dev/null)
cat <<JSON
{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"SEO agent rule: '$tool' can change something live. Approve only after reviewing the draft."}}
JSON
