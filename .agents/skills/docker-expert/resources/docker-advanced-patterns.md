# Advanced Docker Patterns

This resource covers advanced container techniques for BuildKit, multi-architecture support, and sophisticated monitoring.

## Multi-Architecture Builds (Buildx)
Build images for multiple platforms (e.g., `linux/amd64` and `linux/arm64`) using a single command.
```bash
docker buildx build --platform linux/amd64,linux/arm64 -t myapp:latest --push .
```

## BuildKit Secret Mounting
Securely mount secrets at build-time without them being stored in image layers.
```dockerfile
# Dockerfile
RUN --mount=type=secret,id=api_key \
    API_KEY=$(cat /run/secrets/api_key) && ./build.sh
```
*Note*: Requires `DOCKER_BUILDKIT=1` or using `docker buildx`.

## Build Cache Mounting
Speed up builds by caching project-specific package manager directories (npm, pip, etc.) across builds.
```dockerfile
RUN --mount=type=cache,target=/root/.npm \
    npm ci --only=production
```

## Sophisticated Health Checks
For complex startup sequences, use a custom script instead of a single `curl` command.
```dockerfile
COPY health-check.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/health-check.sh
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD ["/usr/local/bin/health-check.sh"]
```
