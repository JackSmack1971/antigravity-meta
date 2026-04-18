# Scalability and Migration Strategies

This resource provides patterns for growing your data layer and executing safe migrations.

## Scaling Patterns

### 1. Vertical Scaling (Scale Up)
Increasing CPU, RAM, or IOPS on a single instance.
- **Pros**: Zero architecture change.
- **Cons**: Hard hardware ceiling and high costs.

### 2. Horizontal Scaling (Scale Out)
- **Read Replicas**: Offload read traffic to slave nodes.
- **Sharding**: Partitioning data across multiple independent nodes (Shard Key Selection is critical).
- **Federation**: Splitting a monolithic database into multiple functional databases.

## Zero-Downtime Migration (Strangler Pattern)

1. **Phase 1: Dual Write**: Start writing new data to the new database while maintaining the old one.
2. **Phase 2: Backfill**: Move historical data from old to new in background batches.
3. **Phase 3: Validation**: Compare read results from both systems and verify integrity.
4. **Phase 4: Cutover**: Switch primary read traffic to the new database.
5. **Phase 5: Decommission**: Remove the old database.

## Migration Tools
- **Relational**: Flyway, Liquibase, Prisma Migrate, Alembic.
- **Cloud Managed**: AWS DMS (Database Migration Service).
