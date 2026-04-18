# Cloud Database Architecture and operations

This resource provides guidance for deploying and maintaining databases in cloud environments.

## Cloud Database Ecosystem

| Feature | AWS | Azure | GCP |
|---------|-----|-------|-----|
| Relational | RDS / Aurora | SQL DB | Cloud SQL |
| NoSQL | DynamoDB | Cosmos DB | Firestore |
| Big Data | Redshift | Synapse | BigQuery |
| Multi-Region | Global Aurora | Global Cosmos | Spanner |

## Operations and Disaster Recovery

### High Availability (HA)
- **Multi-AZ**: Synchronous replication to a standby instance in another zone.
- **Failover**: Automated detection and promotion of standby nodes.

### Backup and Recovery
- **RPO (Recovery Point Objective)**: Maximum acceptable data loss time.
- **RTO (Recovery Time Objective)**: Maximum acceptable downtime.
- **PITR**: Point-in-time recovery using continuous WAL archiving.

## Security & Compliance
- **At-Rest Encryption**: Using KMS or managed keys for all volumes and backups.
- **In-Transit Encryption**: Enforce SSL/TLS for all database connections.
- **Row-Level Security (RLS)**: Enforce data access boundaries within the engine.
- **Audit Logging**: Track all DDL and sensitive DML operations for compliance (GDPR/HIPAA).

## Monitoring & Observability
- **Key Metrics**: Latency (p99), Throughput, Connection Count, CPU/Memory utilization, Disk IOPS.
- **Profiling**: Use slow-query logs and execution plan analysis (e.g., Performance Insights).
