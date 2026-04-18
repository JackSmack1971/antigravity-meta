# Database Technology Selection and Evaluation

This resource provides a menu of database technologies and decision frameworks for choosing the right storage engine.

## Database Categories

### 1. Relational (RDBMS)
Best for: Structured data, ACID transactions, complex JOINs.
- **Engines**: PostgreSQL, MySQL, MariaDB, SQL Server, Oracle.
- **Cloud-Native**: Amazon Aurora, Azure SQL Database.

### 2. NoSQL & Document
Best for: Semi-structured data, high write throughput, horizontal scaling.
- **Document**: MongoDB, Firestore, Amazon DocumentDB.
- **Key-Value**: Redis, DynamoDB, Memcached.
- **Wide-Column**: Cassandra, ScyllaDB, Bigtable.

### 3. Specialty Databases
- **Time-Series**: TimescaleDB, InfluxDB (best for IoT/Observability).
- **Graph**: Neo4j, Amazon Neptune (best for social networks/fraud detection).
- **Search**: Elasticsearch, Meilisearch (best for full-text indexing).
- **NewSQL**: CockroachDB, YugabyteDB (best for global distribution + ACID).

## Selection Framework

### The CAP Theorem
- **Consistency (C)**: Every read receives the most recent write.
- **Availability (A)**: Every request receives a (non-error) response.
- **Partition Tolerance (P)**: System continues to operate despite network failures.
*Rule: You can only pick two, and in a distributed system, P is required.*

### Access Pattern Analysis
| Pattern | Priority | Recommended Tech |
|---------|----------|------------------|
| High Read/Low Write | Read Latency | SQL + Redis Cache |
| High Write/High Read | Throughput | Cassandra / DynamoDB |
| Complex Relations | Join Performance | PostgreSQL |
| High-Velocity Assets | Scalability | S3 / MinIO |

## Technology Evaluation Criteria
- **Operational Complexity**: Managed vs. Self-hosted.
- **Developer Experience**: Ecosystem, ORM support, documentation.
- **Cost**: Licensing vs. Infrastructure vs. Engineering time.
- **Scalability**: Scaling up (Vertical) vs. Scaling out (Horizontal).
