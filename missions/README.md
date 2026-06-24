# Zava missions

The Promptathon is built around a multi-turn experience with an AI agent, not a single prompt. Each mission puts you in the role of a principal on Zava's data team, a smart-fabric apparel company, and asks you to deliver something real with Copilot in agent mode and the SQL MCP tools.

You set one overarching goal, work with the agent across several turns, and submit the journey: the prompts, the SQL MCP tool calls, the dead ends, the artifact you built, and where the agent struggled.

## How it works

1. Open Copilot Chat in the Codespace and switch to agent mode.
2. Ask the agent which SQL MCP tools it has, and let it work against the database.
3. Pick a mission and pursue its goal across several turns.
4. Build a real artifact: a notebook, a script, or a report.
5. Submit your goal, your journey, your artifact, and an honest account of what went sideways.

## A note on the tools

The SQL MCP server exposes one table per entity, and `read_records` does not perform SQL joins, so you follow a relationship by matching ids across reads and aggregates. Treat the SQL MCP tools as your required interface to the data. The container also ships Python (pandas, numpy, matplotlib) with notebook support, so you can merge, model, and visualize what the tools return.

## Missions

| Mission | You play | The deliverable |
| --- | --- | --- |
| [Principal Data Engineer](data-engineer.md) | The Support Intelligence mart builder | A reusable sales-and-support risk scorecard |
| [Principal Data Scientist](data-scientist.md) | The voice-of-customer lead | A semantic system with an evaluation |
| [Principal Data Analyst](data-analyst.md) | The product-quality investigator | An evidence-backed product-quality risk brief |
| [Bring your own](open-mission.md) | Yourself | A deliverable you define, on the Zava data or your own |

## What a submission shows

A strong entry is a journey, not a one-shot answer:

- The overarching goal.
- The agent and model.
- The turn-by-turn path, including where it went wrong.
- The artifact you built and with an optional architecture diagram.
- Where the agent struggled.

Submit one GitHub issue per entry using the submission form.
