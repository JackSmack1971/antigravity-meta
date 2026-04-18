# Docker Code Review and Diagnostics

This resource provides checklists for reviewing Docker configurations and guides for diagnosing common container issues.

## Code Review Checklist

### 1. Optimization
- [ ] Dependencies copied before source code (caching).
- [ ] Multi-stage builds used to separate build/runtime.
- [ ] `.dockerignore` excludes unnecessary files.
- [ ] Base image is minimal (Alpine/Distroless).

### 2. Security
- [ ] Container runs as a non-root `USER`.
- [ ] Secrets NOT stored in environment variables.
- [ ] Health checks implemented.
- [ ] No unnecessary ports exposed.

### 3. Orchestration
- [ ] Services have resource `limits` (CPU/Memory).
- [ ] Service startup order managed via `depends_on` + health checks.
- [ ] Persistent data using named volumes, not bind mounts.

## Common Issue Diagnostics

| Symptom | Probable Cause | Solution |
|---------|----------------|----------|
| **Slow Builds** | Cache invalidation or large context. | Optimize `COPY` order; update `.dockerignore`. |
| **"No Manifest Found"** | Multi-architecture mismatch. | Use `docker buildx` for multi-platform support. |
| **"Connection Refused"** | Service on incorrect network/port. | Check Compose network isolation; verify internal port bindings. |
| **OOM Killed** | No memory limits set on container. | Define `deploy.resources.limits.memory` in Compose. |
| **Dangling Layers** | Build tools left in final stage. | Use multi-stage builds; clean package manager caches. |
