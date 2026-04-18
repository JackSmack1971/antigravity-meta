---
name: docker-expert
description: "Advanced Docker containerization expert specializing in optimization, security hardening, and production orchestration."
risk: unknown
source: community
---

# Docker Expert

## Overview

Design, optimize, and secure containerized applications. This skill provides production-ready patterns for multi-stage builds, image size reduction, security hardening, and Docker Compose orchestration.

## 📚 Resources

| Resource | Description |
|----------|-------------|
| [Dockerfile Optimization](file:///c:/workspaces/antigravity-meta/.agents/skills/docker-expert/resources/dockerfile-optimization-and-security.md) | Multi-stage builds, layer caching, and security (non-root). |
| [Compose & Resources](file:///c:/workspaces/antigravity-meta/.agents/skills/docker-expert/resources/docker-compose-and-resource-management.md) | Orchestration, health checks, and resource limits (CPU/RAM). |
| [Advanced Patterns](file:///c:/workspaces/antigravity-meta/.agents/skills/docker-expert/resources/docker-advanced-patterns.md) | Buildx multi-arch, BuildKit secrets, and caching mounts. |
| [Checklists & Diagnostics](file:///c:/workspaces/antigravity-meta/.agents/skills/docker-expert/resources/docker-checklists-and-diagnostics.md) | Code review lists and common issue troubleshooting. |

## Core Workflow

### 1. Analysis & Detection
Identify existing Dockerfiles, Compose configs, and base image patterns in the project.

### 2. Optimization & Security
Implement [Dockerfile Optimization](file:///c:/workspaces/antigravity-meta/.agents/skills/docker-expert/resources/dockerfile-optimization-and-security.md) standards:
- **Caching**: Ensure dependencies are copied before source code.
- **Security**: Create non-root users and use minimal base images.
- **Stages**: Separate build artifacts from the runtime environment.

### 3. Orchestration
Configure [Docker Compose](file:///c:/workspaces/antigravity-meta/.agents/skills/docker-expert/resources/docker-compose-and-resource-management.md) for production:
- **Isolation**: Use internal networks for sensitive services.
- **Resilience**: Add health checks and restart policies.
- **Stability**: Define resource limits to prevent host exhaustion.

## Related Skills
- `kubernetes-expert`: For k8s orchestration.
- `github-actions-templates`: For container CI/CD.

## Summary
Build high-performance, secure, and production-ready container environments through expert Dockerfile design and orchestration.
