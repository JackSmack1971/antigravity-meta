# React Best Practices — Waterfalls & Data Fetching

## 1. Eliminating Waterfalls (CRITICAL)

Waterfalls are the #1 performance killer. Each sequential await adds full network latency.

### 1.1 Defer Await Until Needed
Move `await` operations into branches where they're used.

```typescript
// Correct: only blocks when needed
async function handleRequest(userId: string, skipProcessing: boolean) {
  if (skipProcessing) return { skipped: true }
  
  const userData = await fetchUserData(userId)
  return processUserData(userData)
}
```	ext

### 1.2 Dependency-Based Parallelization
Use `better-all` to maximize parallelism for partial dependencies.

```typescript
import { all } from 'better-all'
const { user, config, profile } = await all({
  async user() { return fetchUser() },
  async config() { return fetchConfig() },
  async profile() { return fetchProfile((await this.$.user).id) }
})
```	ext

### 1.3 Parallel Data Fetching in API Routes
Start independent operations immediately.

```typescript
export async function GET(request: Request) {
  const sessionPromise = auth()
  const configPromise = fetchConfig()
  const session = await sessionPromise
  const [config, data] = await Promise.all([configPromise, fetchData(session.user.id)])
  return Response.json({ data, config })
}
```	ext

### 1.4 Strategic Suspense Boundaries
Use Suspense to show wrapper UI faster while data streams.

---

## 3. Server-Side Performance (HIGH)

### 3.1 Cross-Request LRU Caching
`React.cache()` only works within one request. Use `lru-cache` for shared data across requests.

### 3.2 Minimize Serialization at RSC Boundaries
Only pass fields the client uses. Serialized data impacts page weight.

### 3.3 Parallel Data Fetching with Component Composition
Restructure components to avoid sequential execution in the tree.

---

## 4. Client-Side Data Fetching (MEDIUM-HIGH)

### 4.1 Deduplicate Global Event Listeners
Use `useSWRSubscription()` to share listeners across instances.

### 4.2 Use SWR for Automatic Deduplication
Use `useSWR`, `useImmutableSWR`, and `useSWRMutation` for caching and revalidation.

