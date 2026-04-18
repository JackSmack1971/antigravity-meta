# Data Modeling and Indexing Strategies

This resource provides patterns for designing efficient schemas and high-performance indexing strategies.

## Data Modeling Principles

### Normalization (1NF to 3NF)
- **Goal**: Reduce data redundancy and improve consistency.
- **Best for**: OLTP systems where data integrity is paramount.
- **Rules**: Every non-key attribute must depend on the key, the whole key, and nothing but the key.

### Denormalization
- **Goal**: Improve read performance by reducing JOIN complexity.
- **Best for**: OLAP / Analytical workloads or performance-critical paths.
- **Strategies**: Materialized views, pre-computed aggregates, document embedding.

## Indexing Strategy

### Index Types
- **B-Tree**: Default for equality and range queries.
- **GIN/GIST**: Best for full-text and JSONB indexing (PostgreSQL).
- **BRIN**: Best for large, naturally ordered datasets (time-series).
- **Hash**: Fast equality checks but no range support.

### Advanced Optimization
- **Covering Indexes**: Including all columns required by a query to avoid table lookups (Index-Only Scans).
- **Partial Indexes**: Indexing only a subset of data (e.g., `WHERE status = 'active'`) to save space.
- **Composite Indexes**: Ordering multiple columns based on query cardinality (most selective first).

## Query Optimization Patterns
- **Batching**: Use bulk inserts/updates to reduce round-trip latency.
- **Plan Analysis**: Check `EXPLAIN ANALYZE` for seq-scans on large tables.
- **Connection Pooling**: Use PgBouncer or server-side pooling to manage high connection counts.
