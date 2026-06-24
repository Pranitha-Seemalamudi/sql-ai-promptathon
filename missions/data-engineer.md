# Mission: Build Zava's Support Intelligence Data Mart

## Background

Zava's analysts are struggling because sales, support tickets, chat transcripts, reviews, and vector-search results are spread across multiple tables. Leadership wants a reusable notebook that turns the raw `PromptathonDb` database into a clean, analyst-ready dataset for investigating product quality and customer support risk.

You are the data engineer assigned to build that notebook.

## Objective

Create a notebook-driven pipeline that extracts, cleans, joins, validates, and scores Zava's sales/support data into a reusable **Support Intelligence Mart**.

The final notebook should let an analyst quickly answer:

> Which products, categories, customers, clients, or channels show the strongest signals of revenue risk caused by support issues?

## Required notebook workflow

The notebook must run end-to-end and include these sections:

1. **Database discovery**
   - Inspect available entities and key columns.
   - Confirm relationships between `SalesOrders`, `SalesOrderLines`, `SupportTickets`, `SupportChats`, `Docs`, `Products`, `Customers`, and `Employees`.

2. **Data quality checks**
   - Count null keys, duplicate IDs, orphaned records, missing satisfaction scores, missing customer IDs, and malformed JSON.
   - Specifically handle `SalesOrders.CustomerId` being null for guests and walk-ins.
   - Produce a short data quality summary table.

3. **Sales fact engineering**
   - Build a clean sales fact dataset at order-line level.
   - Include order type, channel, customer/client name, product, category, quantity, line total, and total order amount.
   - Separate B2C, B2B, guest, and retail walk-in behavior.

4. **Support fact engineering**
   - Build a clean support fact dataset at ticket level.
   - Include ticket category, priority, status, satisfaction score, assigned employee, customer/client context, and transcript metadata.

5. **Chat transcript parsing**
   - Parse `SupportChats.MessagesJson`.
   - Extract message count, customer messages, agent messages, keywords, complaint phrases, and resolution indicators.
   - Create a flattened transcript table or view inside the notebook.

6. **Document enrichment**
   - Use `Docs` to classify documents by `SourceType`, rating tags, scenario tags, SKU tags, language tags, and resolution tags.
   - Link documents back to related customers, orders, or tickets where possible.

7. **Vector similarity feature**
   - Select several negative or high-risk `Docs` rows.
   - Run `find_similar_docs_by_doc_id`.
   - Convert similarity results into features such as similar complaint count, repeated SKU count, repeated scenario count, and similarity cluster strength.

8. **Risk scoring model**
   - Create a transparent engineering score, not a black-box ML model.
   - Combine:
     - revenue,
     - quantity sold,
     - ticket volume,
     - priority severity,
     - unresolved/open ticket count,
     - low satisfaction,
     - negative document count,
     - vector-similar complaint density.
   - Output a ranked risk table by product/category/channel/customer segment.

## Final deliverable

The notebook should produce:

1. A clean **sales-support analytical mart**.
2. A **data quality report**.
3. A parsed **support chat feature table**.
4. A **vector similarity feature table**.
5. A ranked **product/support risk scorecard**.
6. A short markdown executive summary explaining the top 3 risk clusters.

## Difficulty requirement

This should be hard because the engineer must handle relational joins, null customer identities, B2C vs B2B logic, JSON parsing, document tagging, vector-search outputs, feature engineering, and reproducible notebook structure, not just write one SQL query.
