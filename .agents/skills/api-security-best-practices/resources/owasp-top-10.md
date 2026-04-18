# OWASP API Security & Checklist

This resource covers the OWASP Top 10 vulnerabilities and provides a final security checklist for production APIs.

## OWASP API Security Top 10

1. **Broken Object Level Authorization** - Insecure direct object references. Always verify permissions.
2. **Broken Authentication** - Weak credentials or token handling.
3. **Broken Object Property Level Authorization** - Excessive data exposure in responses.
4. **Unrestricted Resource Consumption** - Lack of rate limits or payloads size limits.
5. **Broken Function Level Authorization** - Insufficient checks on administrative functions.
6. **Unrestricted Access to Sensitive Business Flows** - Failure to protect critical paths like payment or login.
7. **Server Side Request Forgery (SSRF)** - API fetching external resources without validation.
8. **Security Misconfiguration** - Default passwords, verbose errors, or missing headers.
9. **Improper Inventory Management** - Shadow APIs or legacy versions left exposed.
10. **Unsafe Consumption of APIs** - Blindly trusting third-party API data.

## Final Security Checklist

### Authentication & Authorization
- [ ] Implement strong authentication (JWT/OAuth 2.0).
- [ ] Use HTTPS/TLS for all traffic.
- [ ] Hash passwords (bcrypt/argon2).
- [ ] Implement token revocation (via database/blacklist).
- [ ] Use Role-Based Access Control (RBAC).

### Data & Input Validation
- [ ] Validate all inputs against a strict schema.
- [ ] Use parameterized queries/ORM.
- [ ] Sanitize HTML/rendered content.
- [ ] Implement strict CORS origin allowlists.
- [ ] Disable verbose error messages in production.

### Resilience & Monitoring
- [ ] Implement global rate limiting.
- [ ] Add specific limits for authentication endpoints.
- [ ] Use security headers (Helmet).
- [ ] Log security-critical events (Login fail, Privilege escalation).
- [ ] Regularly update dependencies for CVE fixes.

## Additional Resources
- [OWASP API Security Project](https://owasp.org/www-project-api-security/)
- [Express Security Guide](https://expressjs.com/en/advanced/best-practice-security.html)
- [Node.js Security Best Practices](https://blog.risingstack.com/node-js-security-checklist/)
