# Dockerfile Optimization and Security Hardening

This resource provides best practices for writing high-performance and secure Dockerfiles.

## Optimization Patterns

### Multi-Stage Builds
Separate build dependencies from the production runtime to keep images lean.
```dockerfile
# Build stage
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/package*.json ./
RUN npm ci --only=production
CMD ["node", "dist/index.js"]
```

### Layer Caching
Order commands to maximize cache hits. Always copy dependency files (`package.json`, `requirements.txt`) and install libraries **before** copying the full source code.

### Image Size Reduction
- **Base Selection**: Use `alpine` or `distroless` (e.g., `gcr.io/distroless/nodejs18`) instead of full Debian/Ubuntu images.
- **Layer Consolidation**: Combine `RUN` commands where appropriate to reduce layer count, but keep frequently changing parts separate.

## Security Hardening

### Non-Root Execution
Never run containers as `root`. Create a specific user/group and switch to it.
```dockerfile
RUN addgroup -g 1001 -S appgroup && adduser -S appuser -u 1001 -G appgroup
USER 1001
```

### Secrets Management
- **Never** bake secrets into image layers or environment variables in Dockerfiles.
- Use **Docker Secrets** or **BuildKit Secrets** (`--mount=type=secret`) for build-time credentials.

### Minimal Attack Surface
- Remove build-time dependencies (`gcc`, `make`, etc.) in the final production stage.
- Use `.dockerignore` to exclude `.git`, tests, and local environment files from the build context.
