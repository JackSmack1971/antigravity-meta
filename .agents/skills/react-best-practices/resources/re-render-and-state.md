# React Best Practices — Re-render & State Optimization

## 5. Re-render Optimization (MEDIUM)

Reducing unnecessary re-renders minimizes wasted computation and improves UI responsiveness.

### 5.1 Defer State Reads to Usage Point
Don't subscribe to dynamic state (searchParams, localStorage) if you only read it inside callbacks.

### 5.2 Extract to Memoized Components
Extract expensive work into `memo()` or `useMemo()`. (Note: React Compiler might handle this).

### 5.3 Narrow Effect Dependencies
Specify primitive dependencies instead of objects.

### 5.4 Subscribe to Derived State
Subscribe to boolean transitions instead of continuous values via `useMediaQuery`.

### 5.5 Use Functional setState Updates
Prevent stale closures and unnecessary recreations by using functional updates.

```typescript
// Correct: stable callbacks, no stale closures
setItems(curr => [...curr, ...newItems])
```	ext

### 5.6 Use Lazy State Initialization
Pass a function to `useState` for expensive initial values to avoid re-run on every render.

### 5.7 Use Transitions for Non-Urgent Updates
Mark non-urgent updates as `startTransition` to maintain UI responsiveness.

