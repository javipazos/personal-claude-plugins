# Like an Expert

A Claude Code plugin with two agents that do what the best practitioner in a field would do, with that practitioner's instruments, never a persona or a tone. Both read the material themselves instead of a summary of it, treat everything except what the user wants as a hypothesis, and never write code or edit files.

## Agents

### research-like-an-expert

Goes in depth on one question, idea or claim from the rawest material available: the official docs and changelogs of the tools involved, the code and its history, the data. It tests the assumption instead of accepting it, runs a small experiment only when the docs and the code leave a point open, and names what outside evidence would show the answer is right. It returns what the material shows with a source for each claim, and what is still open.

Use it when you want an idea analysed in depth or need to know how something really works, and whenever a conclusion depends on how a third-party product, API or library behaves today.

### think-like-an-expert

Looks at a problem from outside the task the work is busy with and returns every reframing and option it finds: the outcome behind the request, whose problem it is, what happens if nothing is done, cheaper or non-software ways, how other fields solve the same thing, and whether the design taken as fixed really is. It drops none of them, because choosing among them is the user's job. When an option turns on a fact it cannot see, it asks `research-like-an-expert` that one question.

Use it when you want to step back or look from another angle, when you reject or doubt a proposed fix, and before accepting that only one option exists.

## How to brief them

Quote the user's request verbatim and point at the material (files, repository, ticket, logs, docs, links) without summarising it. `think-like-an-expert` refuses to judge without the quoted request. A proposal or conclusion from the conversation goes in as a hypothesis to test, never as the starting point.

## Installation

```
/plugin install like-an-expert --marketplace javipazos/personal-claude-plugins
```
