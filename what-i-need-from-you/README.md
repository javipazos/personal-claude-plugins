# What I Need From You

A Claude Code plugin that ends every response that leaves the user something to answer or do with a highlighted block:

```
`▶ What I need from you ──────────────────────────`
1. Answer: <a question the work is waiting on, and what reply counts as an answer>
2. Do: <something only the user can do, with the exact command or link>
`─────────────────────────────────────────────────`
```

Long responses bury the one question or action that the work is waiting on. The block sits at the end of the response, which is the part still on screen when the response finishes, and it only appears when something is actually pending, so its presence alone tells the user whether they have to act.

A `SessionStart` hook adds the instructions in `what-i-need-from-you.md` to the session context. Claude Code adds a `SessionStart` hook's plain-text stdout as context, so the instructions live in Markdown rather than in an escaped JSON string. Like any instruction, it shapes what Claude writes but does not guarantee it.

## Installation

```
/plugin marketplace add javipazos/personal-claude-plugins
/plugin install what-i-need-from-you@javipazos-personal-claude-plugins
```

## Tests

```
bash what-i-need-from-you/tests/session-start-hook.test.sh
```
