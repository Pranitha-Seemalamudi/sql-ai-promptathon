# Mission: Find Zava's Hidden Product-Quality Crisis

## Background

Zava's leadership team believes a product-quality issue is hiding in plain sight. Revenue reports still look healthy, but support teams are seeing scattered complaints across tickets, chats, and reviews. The concern is that one product, category, channel, or customer segment is creating outsized dissatisfaction before it becomes obvious in top-level dashboards.

Your job is to investigate the SQL Server 2025 `PromptathonDb` database and identify the strongest evidence-backed risk cluster.

## Objective

Determine which **product or product category** Zava should prioritize for immediate intervention because it combines:

- meaningful sales impact,
- elevated support burden,
- low customer satisfaction,
- recurring complaint themes,
- and similar negative documents found through vector search.

## Required approach

Use the SQL MCP tools to investigate across these entities:

- `SalesOrders`
- `SalesOrderLines`
- `SupportTickets`
- `SupportChats`
- `Docs`
- `Products`
- `Customers`
- `Employees`
- `find_similar_docs_by_doc_id`

You must not rely on a single metric. A valid answer needs both quantitative and qualitative evidence.

## Tasks

1. Identify product categories and products with meaningful revenue and quantity sold.
2. Compare those against support ticket volume, priority, status, and satisfaction score.
3. Parse `SupportChats.MessagesJson` to find recurring complaint themes.
4. Analyze `Docs` rows from reviews and support chats for negative patterns.
5. Select one representative negative document and run vector similarity search using `find_similar_docs_by_doc_id`.
6. Determine whether similar complaints cluster around the same SKU, product, category, order type, channel, customer segment, country, language, or B2B client.
7. Recommend one concrete business action.

## Final answer format

Return a concise executive brief with:

1. **Risk cluster**
   - Product/category
   - Order type and channel
   - Customer segment or B2B client pattern

2. **Evidence**
   - Revenue and quantity sold
   - Support ticket count
   - Average satisfaction score
   - Priority/status breakdown
   - Review/support document count
   - Vector similarity findings

3. **Complaint themes**
   - Include 3-5 short excerpts from chats or docs.

4. **Recommendation**
   - State the action Zava should take first and why.

5. **Confidence and limitations**
   - Explain how confident you are and what data gaps remain.
