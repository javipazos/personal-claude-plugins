# Engineering Board

A Claude Code plugin that puts a design, a plan or an engineering decision in front of four software engineers. Each one reviews it from their own principles and in their own voice, naming the book, talk or essay a principle comes from. They agree on some points, read others differently and contradict each other on a few; the board keeps all of it. It closes with where they agree and where they split, never with a single recommendation: the user decides.

## The Four Perspectives

- **Kent Beck** -- Test-driven development, Extreme Programming, small safe steps, tidying, the economics of design, augmented coding with AI agents
- **Martin Fowler** -- Refactoring, evolutionary design, code smells, the test pyramid, continuous integration, enterprise patterns
- **Robert C. Martin** -- Clean code, SOLID, clean architecture, the three laws of TDD, professional discipline
- **Dave Farley** -- Continuous delivery, engineering as empirical learning, deployment pipelines, acceptance tests as executable specifications

## Skill

### engineering-board

Use when you want several engineering viewpoints on a design, a plan, an architecture or a technical decision, or when you ask what Beck, Fowler, Martin or Farley would say about something. All four lenses are loaded every time; a thinker whose territory the question does not touch says so in one line. The answer also includes a table of engineering dimensions (testing, observability, failure modes, maintainability, security, performance, delivery, contracts, operation, accessibility) showing which ones the material decides, yes or no, and which it leaves open: the board asks for a decision on each, not for work on each. It is not a code reviewer for a diff, not a bug fixer, and not for product or people questions.

## Agent

### engineering-board-review

The same skill run as a written review in a fresh context, for a read that is not anchored on the current conversation. The agent preloads the skill and follows its "Written review" section, so the board's rules live only in `SKILL.md`. The prompt names the files to review and the questions to answer.

## Installation

Add to your Claude Code plugins configuration:

```json
{
  "engineering-board": {
    "type": "git",
    "url": "https://github.com/javipazos/personal-claude-plugins",
    "directory": "engineering-board"
  }
}
```
