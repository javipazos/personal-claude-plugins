---
name: wild-design
description: Design a new interface (a page, screen, landing, app view or visual world) from a random word seed, then deepen it with an independent design critic and finish it with the impeccable skill. Use for every request to design or create something new, so the result does not land on the model's most predictable choices. SKIP when the user wants an existing design audited, critiqued or polished.
when_to_use: On requests like "diseña", "hazme un diseño", "design a landing page", "create a new screen", "mock up", "give it a new look".
argument-hint: <what to design>
---

# Wild design

Target: $ARGUMENTS

A model asked for something "unique" still picks the most likely option at every step. This process takes the creative direction from a source the model does not choose (random words), widens the options before narrowing them, and has the work judged by a critic that sees only the result.

## 1. Seed

Run `python3 -I "${CLAUDE_SKILL_DIR}/seed.py" 10`. It prints ten lines of one or two words picked at random by the script, no word repeated. Each line seeds one idea of step 2, in order.

Derive each idea's direction from its own line: palette, layout, typography, mood, motion. Read each word for the images, materials, textures, verbs and contrasts it suggests, and when a line has two words, for the odd juxtaposition between them; take each one literally or sideways. When the user named an inspiration or constraint, it wins over the seed where they clash.

The words are internal: never show or mention them to the user, and never let them appear in the design (no words from the seed in the copy, no copy built from them). The user sees the direction only through the ideas in step 2.

## 2. Go broad, then sharpen

1. Propose 8 to 10 ideas, one per seed line from the first, one or two lines each, low on detail. Each names a concrete inspiration source outside web design (a video game, an interior design trend, an art installation, a print tradition) and says in specific, ambitious words how it shapes the result, e.g. "a radically asymmetric layout, dissonant colors and typography, and uncomfortable negative space".
2. Ask the user which ones they like and what they like or dislike in them. Stop until they answer.
3. Sharpen the chosen idea with their taste, and show it.
4. Write a concise build prompt an agent could use to build a first version of the page. Ask the user for reference designs (a moodboard) they want it measured against; they are baselines, never targets to copy.

## 3. Build

Invoke the `impeccable` skill with the build prompt as new work, and build the first version.

### Imagery

Where the design calls for imagery, generated images beat gradients or abstract shapes standing in for them. Look for an image source, in this order:

1. A connected tool that generates images, such as Figma's `generate_image` or a Fal connector. A tool whose server only exposes `authenticate` is not connected.
2. An API key for an image generation service, such as `OPENAI_API_KEY` or `GEMINI_API_KEY`, in the environment or in a file of the project that `git check-ignore` confirms is ignored.

When one or more is available, ask the user once per session whether to use it for the images, naming the service and that each image costs credits or money. When they already answered earlier in the conversation, follow that answer without asking again.

When none is available, tell the user once per session which options exist (connecting a tool that generates images, or an OpenAI or Gemini API key with a low spend limit, stored in an ignored file of the project) and continue with images the user provides, or with none.

With an API key, read the provider's current image generation docs before calling it, and save the images into the project's assets. Never print the key, write it into the design's code, or commit it.

Generate video (looping animated graphics, scroll-scrubbed transitions) only when the user asks for it.

## 4. Critic loop

1. Render the page and take screenshots at the sizes it ships at (at least desktop and mobile), saved to files.
2. Launch a new `wild-design:design-critic` agent each round. Its prompt holds only the screenshot paths and the reference designs' paths, if any: no code, no conversation, no build prompt, no target score.
3. Fix the gaps it lists, starting with the largest.
4. The work is done when a critic scores it 9/10 or higher. After two rounds, compare the scores: when they are not rising, stop and show the user the last critique and screenshots to decide. Never run more than four rounds.

## 5. Remove

Run impeccable's `distill` on the result. Go element by element and keep only what the page needs: glows, gradients, extra labels, custom controls where a native one does the job, and decorative highlights go.

## 6. Remove AI tells

Run impeccable's `audit` on the result: its detector and its Implementation Integrity check find the patterns that mark a design as AI-generated and the structure any unrelated product could reuse unchanged. Fix the verified findings with impeccable's `polish`.

Show the user the final screenshots, the critic's last score, and what the audit found and fixed.
