# React Best Practices — Bundle & Rendering Performance

## 2. Bundle Size Optimization (CRITICAL)

Reducing initial bundle size improves Time to Interactive and Largest Contentful Paint.

### 2.1 Avoid Barrel File Imports
Import directly from source instead of barrel files to avoid thousand-module loads.

```typescript
// Incorrect: imports entire library
import { Check, X, Menu } from 'lucide-react'

// Correct: imports only what you need
import Check from 'lucide-react/dist/esm/icons/check'
```	ext

### 2.2 Conditional Module Loading
Load large data/modules only when activated using `import()`.

### 2.3 Defer Non-Critical Third-Party Libraries
Load analytics, logging, and trackers after hydration with `next/dynamic`.

### 2.4 Dynamic Imports for Heavy Components
Use `next/dynamic` for heavy components like MonacoEditor.

### 2.5 Preload Based on User Intent
Preload bundles on hover or focus.

---

## 6. Rendering Performance (MEDIUM)

### 6.1 Animate SVG Wrapper Instead of SVG Element
Wrap SVG in a `<div>` and animate the wrapper for hardware acceleration.

### 6.2 CSS content-visibility for Long Lists
Use `content-visibility: auto` to defer off-screen rendering.

### 6.3 Hoist Static JSX Elements
Extract static JSX nodes outside components to avoid recreation.

### 6.4 Optimize SVG Precision
Reduce coordinate precision for smaller SVGs.

### 6.5 Prevent Hydration Mismatch Without Flickering
Use synchronous inline scripts to update DOM before React hydrates for theme/preferences.

### 6.6 Use Activity Component for Show/Hide
Use React's `<Activity>` to preserve state/DOM for frequently toggled components.

### 6.7 Use Explicit Conditional Rendering
Use ternary operators (`? :`) instead of `&&` for numbers/NaN.

