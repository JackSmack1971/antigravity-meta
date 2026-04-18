# Rate Limiting and DDoS Protection

Protect your API availability and prevent abuse by implementing rate limiting and infrastructure-level defenses.

## Why Rate Limiting?
- Prevent brute force (auth) attacks.
- Mitigate DDoS and resource exhaustion.
- Enforce fair usage policies.
- Protect expensive internal services.

## Basic Rate Limiting (Express)
```javascript
const rateLimit = require('express-rate-limit');
const RedisStore = require('rate-limit-redis');

const apiLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 mins
  max: 100, // Limit per IP/Key
  message: { error: 'Too many requests' },
  standardHeaders: true,
  legacyHeaders: false,
});

app.use('/api/', apiLimiter);
```

## Strict Limiting for Auth
Always apply stricter limits to `login`, `register`, and `password-reset` endpoints.
```javascript
const authLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 5, // 5 attempts per 15 mins
  skipSuccessfulRequests: true,
  message: { error: 'Too many login attempts' }
});

app.use('/api/auth/login', authLimiter);
```

## Security Headers with Helmet.js
Use `helmet` to automatically set secure HTTP headers.
```javascript
const helmet = require('helmet');

app.use(helmet({
  contentSecurityPolicy: true, // Prevent XSS
  frameguard: { action: 'deny' }, // Prevent clickjacking
  hidePoweredBy: true, // Security by obscurity
  hsts: { maxAge: 31536000, includeSubDomains: true } // Enforce HTTPS
}));
```

## Best Practices
- ✅ Use **Redis** for distributed rate limiting across multiple server instances.
- ✅ Tier limits based on user status (Free vs. Pro).
- ✅ Set proper `Retry-After` headers.
- ✅ Implement monitoring for rate-limit trigger spikes.
- ✅ Use a Web Application Firewall (WAF) for L7 DDoS protection.
