---
name: api-security-best-practices
description: "Implement secure API design patterns including authentication, authorization, input validation, rate limiting, and protection against common API vulnerabilities"
risk: unknown
source: community
date_added: "2026-02-27"
---

# API Security Best Practices

## Overview

Build secure APIs by implementing authentication, authorization, input validation, rate limiting, and protection against common vulnerabilities (REST, GraphQL, WebSocket).

## 📚 Resources

| Resource | Description |
|----------|-------------|
| [Authentication](file:///c:/workspaces/antigravity-meta/.agents/skills/api-security-best-practices/resources/authentication.md) | JWT, OAuth 2.0, and RBAC implementation patterns. |
| [Validation](file:///c:/workspaces/antigravity-meta/.agents/skills/api-security-best-practices/resources/validation.md) | Input validation, sanitization, and parameterized queries. |
| [Protection](file:///c:/workspaces/antigravity-meta/.agents/skills/api-security-best-practices/resources/protection.md) | Rate limiting, DDoS mitigation, and security headers (Helmet). |
| [OWASP & Checklist](file:///c:/workspaces/antigravity-meta/.agents/skills/api-security-best-practices/resources/owasp-top-10.md) | API Security Top 10 and production-ready checklist. |

## Core Patterns

### 1. Authentication & Authorization
Implement secure identity verification and permission checks.
> See [Authentication](file:///c:/workspaces/antigravity-meta/.agents/skills/api-security-best-practices/resources/authentication.md) for detailed JWT examples.

### 2. Input Validation & Sanitization
Protect against injection attacks (SQLi, XSS, NoSQLi).
> See [Validation](file:///c:/workspaces/antigravity-meta/.agents/skills/api-security-best-practices/resources/validation.md) for schema validation patterns.

### 3. Rate Limiting & Protection
Prevent abuse and resource exhaustion.
> See [Protection](file:///c:/workspaces/antigravity-meta/.agents/skills/api-security-best-practices/resources/protection.md) for rate limit strategies.

## Security Audit
Always benchmark your API against the [OWASP API Top 10](file:///c:/workspaces/antigravity-meta/.agents/skills/api-security-best-practices/resources/owasp-top-10.md).

## Related Skills
- `ethical-hacking-methodology`: Penetration testing.
- `sql-injection-testing`: Deep dive into injection testing.
- `backend-dev-guidelines`: Secure backend architecture.

## Summary
Improves API posture through defense-in-depth: from secure code patterns to infrastructure-level protection.
