#!/usr/bin/env bash
set -euo pipefail

plugin_root="$(cd "$(dirname "$0")/.." && pwd)"
failures=0

fail() {
  echo "FAIL: $1"
  failures=$((failures + 1))
}

command="$(jq -r '.hooks.SessionStart[0].hooks[0].command' "$plugin_root/hooks/hooks.json")"

if ! output="$(CLAUDE_PLUGIN_ROOT="$plugin_root" bash -c "$command")"; then
  fail "the SessionStart hook command exits with an error"
fi

if [[ "$output" == "{"* ]]; then
  fail "the hook output starts with '{', so Claude Code would parse it as JSON instead of plain-text context"
fi

if [[ "$output" != *'`▶ What I need from you '* ]]; then
  fail "the hook output does not contain the opening line of the What I need from you block"
fi

if [[ "$output" != *"The block is the last thing in the response"* ]]; then
  fail "the hook output does not contain the rule that places the block at the end of the response"
fi

if [[ "$failures" -gt 0 ]]; then
  exit 1
fi
echo "PASS: SessionStart hook emits the What I need from you instructions as plain-text context"
