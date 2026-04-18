# API Authentication and Authorization

This resource provides detailed implementation patterns for securing APIs using robust authentication and authorization mechanisms.

## Authentication Methods
- **JWT (JSON Web Tokens)**: Stateless token-based authentication.
- **OAuth 2.0**: Industry-standard protocol for authorization.
- **API Keys**: Simple identifier/secret pairs for machine-to-machine.
- **MFA (Multi-Factor Authentication)**: Adding extra layers of verification.

## JWT Implementation Example (Node.js/Express)

### 1. Generating Secure Tokens
```javascript
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

app.post('/api/auth/login', async (req, res) => {
  const { email, password } = req.body;
  const user = await db.user.findUnique({ where: { email } });
  
  if (!user || !(await bcrypt.compare(password, user.passwordHash))) {
    return res.status(401).json({ error: 'Invalid credentials' });
  }

  const token = jwt.sign(
    { userId: user.id, role: user.role },
    process.env.JWT_SECRET,
    { expiresIn: '1h', issuer: 'your-app', audience: 'your-app-users' }
  );
  
  res.json({ token });
});
```

### 2. Verification Middleware
```javascript
function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  
  if (!token) return res.status(401).json({ error: 'Access token required' });

  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) return res.status(403).json({ error: 'Invalid token' });
    req.user = user;
    next();
  });
}
```

## Authorization & RBAC
Always verify that the authenticated user has permission to perform the requested action.

### Ownership Check
```javascript
app.delete('/api/posts/:id', authenticateToken, async (req, res) => {
  const post = await prisma.post.findUnique({ where: { id: req.params.id } });
  
  if (post.userId !== req.user.userId && req.user.role !== 'admin') {
    return res.status(403).json({ error: 'Not authorized' });
  }
  
  await prisma.post.delete({ where: { id: req.params.id } });
  res.json({ success: true });
});
```

## Best Practices
- ✅ Use strong secrets (256-bit minimum).
- ✅ Set short expiration times (1 hour).
- ✅ Implement refresh tokens for long-lived sessions.
- ✅ Store refresh tokens in the database for revocation.
- ✅ Never store sensitive data in the JWT payload.
