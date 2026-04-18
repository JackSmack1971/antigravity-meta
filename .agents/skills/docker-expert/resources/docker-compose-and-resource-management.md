# Docker Compose and Resource Management

This resource provides patterns for orchestrating multiple containers and managing their resource consumption.

## Service Orchestration

### Dependency Management
Use `depends_on` with `condition: service_healthy` to ensure services start in the correct order.
```yaml
services:
  app:
    build: .
    depends_on:
      db:
        condition: service_healthy
```

### Health Checks
Implement health checks to allow Docker to monitor service availability.
```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
  interval: 30s
  timeout: 10s
  retries: 3
```

## Network Isolation
Use internal networks to prevent backend services (databases, caches) from being exposed.
```yaml
networks:
  frontend:
    driver: bridge
  backend:
    driver: bridge
    internal: true
```

## Resource Management (Production)

Prevent a single container from crashing the host by setting strict resource limits.
- **CPU Limits**: Use `cpus: '0.5'` to cap usage.
- **Memory Limits**: Use `memory: 512M` to prevent OOM kills on the host.
- **Restart Policy**: Use `on-failure` with `max_attempts` for resilience.

```yaml
deploy:
  resources:
    limits:
      cpus: '1.0'
      memory: 1G
    reservations:
      cpus: '0.5'
      memory: 512M
```
