# React Best Practices — JavaScript & Advanced Patterns

## 7. JavaScript Performance (LOW-MEDIUM)

Micro-optimizations for hot paths.

### 7.1 Batch DOM CSS Changes
Avoid changing styles one property at a time. Group into classes or `cssText` to minimize reflows.

### 7.2 Build Index Maps for Repeated Lookups
For `.find()` calls by a key, use `new Map()` for O(1) lookups.

### 7.3 Cache Property Access in Loops
Avoid `obj.config.settings.value` inside loops.

### 7.4 Cache Repeated Function Calls
Use module-level `Map` caches for expensive functions.

### 7.5 Cache Storage API Calls
`localStorage`, `sessionStorage`, and `document.cookie` are synchronous and expensive.

### 7.6 Combine Multiple Array Iterations
Combine multiple `.filter()` or `.map()` calls into one loop.

### 7.7 Early Length Check for Array Comparisons
If lengths differ, avoid expensive deep equality or sorting.

### 7.8 Early Return from Functions
Return immediately once result is determined.

### 7.9 Hoist RegExp Creation
Don't create RegExp inside render. Hoist to module scope.

### 7.10 Use Loop for Min/Max Instead of Sort
Finding smallest/largest only requires a single pass (O(n)).

### 7.11 Use Set/Map for O(1) Lookups
Convert arrays to `Set` for membership checks.

### 7.12 Use toSorted() Instead of sort()
`.sort()` mutates in place, breaking React's model. Use `.toSorted()`.

---

## 8. Advanced Patterns (LOW)

### 8.1 Store Event Handlers in Refs
Use `useEffectEvent` or refs for stable subscriptions.

### 8.2 useLatest for Stable Callback Refs
Access latest values in callbacks without adding to dependency arrays.
