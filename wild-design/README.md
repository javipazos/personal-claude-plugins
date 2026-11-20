# Wild Design

A Claude Code plugin for designing new interfaces without landing on the model's most predictable choices. It follows the process in Anshu Chimala's [How to turn your AI into a world-class designer](https://www.lennysnewsletter.com/p/how-to-turn-your-ai-into-a-world) (Lenny's Newsletter), with random words as the seed instead of a random string.

## Skill

### wild-design

Seeds each of many broad ideas from its own one or two words picked at random by a script, lets the user react to them, builds the chosen one, loops with the design critic until it scores 9/10, then removes what the page does not need and the patterns that mark it as AI-generated.

## Agent

### design-critic

Judges a design from screenshots alone, in a fresh context, without the code, the conversation or the target score. It names the aesthetic, describes how a top design studio would execute it, lists the biggest gaps and scores the work out of 10.

## Requirements

- The [impeccable](https://github.com/pbakaus/impeccable) skill, which builds the design and runs the distill, audit and polish passes.
- Optionally, an image source for imagery instead of placeholder gradients: a connected tool that generates images (for example Figma or Fal), or an OpenAI or Gemini API key in the environment or in a git-ignored file of the project. The skill asks once per session before using it.

`skills/wild-design/words.txt` holds the words, without their dice numbers, of the EFF's [large wordlist for passphrases](https://www.eff.org/dice), by the Electronic Frontier Foundation, under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/), the license of [EFF's copyright policy](https://www.eff.org/copyright). It is chosen over a general word list because its words are concrete and easy to picture.

## Installation

```
/plugin install wild-design --marketplace javipazos/personal-claude-plugins
```
