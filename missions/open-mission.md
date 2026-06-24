# Mission: Bring your own

## The situation

You have your own problem worth solving, or you want to push past the three role missions. This is your space to define your own goal and build it with the agent. Stay with the Zava data, or bring your own.

## Your mission

Set one overarching goal in the spirit of the three role missions, and build toward it across several turns with the agent. Use the Zava database, or bring your own SQL database and point the SQL MCP server at it. Either way, the work should run through SQL MCP and require real iteration, not a single answer.

## What makes it strong

- It produces an artifact: a notebook, a script, or a report.
- It runs through SQL MCP, against the Zava data or your own SQL database, with the agent as a collaborator across turns.
- It is honest about limits: small samples, missing links, messy text.

## Minimum bar

A complete entry includes:

- Evidence from at least two tables or entities, or one plus a vector or semantic search step.
- One validation, reconciliation, or robustness step, not just a headline number.
- A rerunnable artifact (a parameterized notebook or a script), not a single chat answer.
- One approach that failed or that you changed, and why.
- One explicit limitation of your data, such as small samples, missing links, or messy text.

Goals that are too small: a single aggregate with a caption, a top-ten list, or one question with one number.

## Tools you'll lean on

- The SQL MCP tools, and the Python toolchain in the container.
- If you use the Zava data, the custom vector tool is available too.
- Bringing your own database: point the SQL MCP server at your SQL connection, and show the tool calls.

## What good looks like

- A goal that reflects real work, on the Zava data or your own.
- A multi-turn journey with dead ends and course corrections, not a single prompt.
- A working artifact and an honest account of what the agent got wrong.

## Submission checklist

- [ ] The overarching goal you set
- [ ] The agent and model you used
- [ ] The tools used, with evidence of SQL MCP tool calls
- [ ] The turn-by-turn journey, including dead ends and corrections
- [ ] The artifact you produced
- [ ] An architecture or workflow diagram
- [ ] What you would do next
