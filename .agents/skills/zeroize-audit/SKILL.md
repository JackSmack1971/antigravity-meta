---
name: zeroize-audit
description: "Detects missing zeroization of sensitive data in source code and identifies zeroization removed by compiler optimizations, with assembly-level analysis, and control-flow verification."
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - Write
  - Task
  - AskUserQuestion
  - mcp__serena__activate_project
  - mcp__serena__find_symbol
  - mcp__serena__find_referencing_symbols
  - mcp__serena__get_symbols_overview
risk: unknown
source: community
---

# zeroize-audit — Claude Skill

## Purpose
Detect missing zeroization of sensitive data in source code and identify zeroization removed by compiler optimizations (e.g., dead-store elimination). Supports C/C++ and Rust.

## Resources

| Resource | Description |
| :--- | :--- |
| [Technical Prerequisites](file:///c:/workspaces/antigravity%20hybrid/.agents/skills/zeroize-audit/resources/technical-prerequisites.md) | C/C++/Rust toolchain requirements, failure modes, and script paths. |
| [Agent Architecture](file:///c:/workspaces/antigravity%20hybrid/.agents/skills/zeroize-audit/resources/agent-architecture.md) | 11-agent pipeline, 8-phase execution flow, and ID naming conventions. |
| [Analysis Logic](file:///c:/workspaces/antigravity%20hybrid/.agents/skills/zeroize-audit/resources/analysis-logic.md) | Gating logic, detection strategy, and rationalization patterns to reject. |
| [Output Schemas](file:///c:/workspaces/antigravity%20hybrid/.agents/skills/zeroize-audit/resources/output-schemas.md) | Markdown report structure and `findings.json` schema documentation. |

## When to Use
- Auditing cryptographic implementations (keys, seeds, nonces, secrets)
- Reviewing authentication systems (passwords, tokens, session data)
- Analyzing code that handles PII or sensitive credentials

## Inputs (Summary)

Key configuration fields (see schemas/input.json for full details):
- `path`: Repo root
- `compile_db` / `cargo_manifest`: Build context paths
- `opt_levels`: Default `["O0", "O1", "O2"]`
- `mcp_mode`: Serena MCP usage (`off`, `prefer`, `require`)
- `enable_asm` / `enable_cfg` / `enable_semantic_ir`: Analysis toggles

## Approved Wipe APIs

### C/C++
- `explicit_bzero`, `memset_s`, `SecureZeroMemory`, `OPENSSL_cleanse`, `sodium_memzero`
- Volatile wipe loops (pattern-based)

### Rust
- `zeroize::Zeroize` trait, `Zeroizing<T>` wrapper, `ZeroizeOnDrop` macro

## Finding Capabilities (Summary)

| Category | Description |
| :--- | :--- |
| `MISSING_SOURCE_ZEROIZE` | No zeroization found in source |
| `PARTIAL_WIPE` | Incorrect size or incomplete wipe |
| `SECRET_COPY` | Sensitive data copied without tracking |
| `OPTIMIZED_AWAY_ZEROIZE` | Compiler removed zeroization (IR required) |
| `STACK_RETENTION` | Stack frame retains secrets (ASM required) |
| `REGISTER_SPILL` | Secrets spilled from registers (ASM required) |

## Fix Recommendations
1. `explicit_bzero` / `SecureZeroMemory` / `zeroize::Zeroize` (Rust)
2. `memset_s` (C11)
3. Volatile wipe loop with compiler barrier

---
**Version:** 1.3.1 (Sharded)
**Last Updated:** 2026-04-06
