# Input Validation and Sanitization

Protect your API against injection attacks and data corruption by implementing strict input validation and sanitization.

## Preventing SQL Injection
**Never** concatenate user input directly into SQL strings.

### ✅ Parameterized Queries
```javascript
app.get('/api/users/:id', async (req, res) => {
  const userId = req.params.id;
  
  // Use parameterized query
  const user = await db.query(
    'SELECT id, email FROM users WHERE id = $1',
    [userId]
  );
  res.json(user);
});
```

### ✅ Using an ORM
Using an ORM like Prisma or Drizzle handles escaping automatically.
```javascript
const user = await prisma.user.findUnique({
  where: { id: parseInt(req.params.id) }
});
```

## Request Schema Validation (with Zod)
Enforce structural and data type constraints on incoming requests.

```javascript
const { z } = require('zod');

const createUserSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8).regex(/[A-Z]/).regex(/[0-9]/),
  age: z.number().int().min(18).optional()
});

app.post('/api/users', async (req, res) => {
  const result = createUserSchema.safeParse(req.body);
  if (!result.success) {
    return res.status(400).json({ error: result.error.errors });
  }
  // Proceed with validated data...
});
```

## Output Sanitization (Preventing XSS)
Sanitize user-provided HTML before storing or rendering it.

```javascript
const DOMPurify = require('isomorphic-dompurify');

const sanitizedContent = DOMPurify.sanitize(userInputContent, {
  ALLOWED_TAGS: ['b', 'i', 'em', 'strong', 'a'],
  ALLOWED_ATTR: ['href']
});
```

## Validation Checklist
- [ ] Validate all data types (string, number, date).
- [ ] Check value ranges and string lengths.
- [ ] Use allowlists for accepted values.
- [ ] Sanitize data before persistence.
- [ ] Implement strict CORS policies.
