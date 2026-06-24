# Mission: A day as Zava's Principal Data Scientist

## The situation

Zava's product and support leaders keep arguing about what customers really think, and they are working from a handful of cherry-picked reviews. The feedback is multilingual, scattered across reviews and support chats, and nobody has turned it into something measurable. They want a defensible read on customer themes, and they want to know how far to trust it.

## Your mission

Build a semantic theme-discovery and retrieval-quality study over Zava's customer text. Use the precomputed embeddings and the vector tool to surface related feedback across languages, then audit how trustworthy those matches actually are. Deliver an analysis another scientist could critique, not a polished demo.

## What you'll work through

This is an iterative study with honest evaluation, not a lookup:

- The text is multilingual, in English, Spanish, and French, so keyword grouping fails and semantic similarity is the point.
- The corpus is small and unlabeled, so a heavyweight clustering metric would be performative. Your evaluation has to be lightweight and defensible: hand-label a few neighbor pairs and reason from them.
- Vector neighbors include false positives that share words but not meaning, and finding and characterizing them is the real work.
- Reviews and support chats share one document space, so a theme can cross sources, which is a feature or a trap depending on the question.

Move from "the tool returned neighbors" to "here is the theme, here is its retrieval precision on a sample I labeled, and here is where it is wrong."

## Tools you'll lean on

- The custom vector tool, `find_similar_docs_by_doc_id`, and the SQL MCP tools to pull and connect evidence by id, one table per call with no joins.
- Python in the container (pandas and the embeddings) to compute similarity, label a sample, and visualize.
- A notebook as the durable artifact, with a retrieval-quality audit.

## What good looks like

- A small set of customer themes, each grounded in real documents and traced through the vector tool.
- A retrieval-quality audit: precision at k on a sample you hand-labeled, the false positives you found, and the limits of an 83-document corpus.
- A short model-card style note: what the system is good for and what it is not.
- An honest account of where the agent overclaimed and how you reined it in.

## Submission checklist

- [ ] The overarching goal you set
- [ ] The agent and model you used
- [ ] The SQL MCP and vector tools, with evidence of the calls
- [ ] The turn-by-turn journey, including dead ends and corrections
- [ ] The artifact (a notebook with the retrieval audit and labeled examples)
- [ ] An architecture or workflow diagram
- [ ] What you would test or improve next
