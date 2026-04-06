# Zeroize Audit: Technical Prerequisites

This document contains the toolchain requirements, failure modes, and script paths for C, C++, and Rust analysis.

## C/C++ Prerequisites

Before running, verify the following. Each has a defined failure mode.

| Prerequisite | Failure mode if missing |
|---|---|
| `compile_commands.json` at `compile_db` path | Fail fast — do not proceed |
| `clang` on PATH | Fail fast — IR/ASM analysis impossible |
| `uvx` on PATH (for Serena) | If `mcp_mode=require`: fail. If `mcp_mode=prefer`: continue without MCP; downgrade affected findings per Confidence Gating rules. |
| `{baseDir}/tools/extract_compile_flags.py` | Fail fast — cannot extract per-TU flags |
| `{baseDir}/tools/emit_ir.sh` | Fail fast — IR analysis impossible |
| `{baseDir}/tools/emit_asm.sh` | Warn and skip assembly findings (STACK_RETENTION, REGISTER_SPILL) |
| `{baseDir}/tools/mcp/check_mcp.sh` | Warn and treat as MCP unavailable |
| `{baseDir}/tools/mcp/normalize_mcp_evidence.py` | Warn and use raw MCP output |

## Rust Prerequisites

| Prerequisite | Failure mode if missing |
|---|---|
| `Cargo.toml` at `cargo_manifest` path | Fail fast — do not proceed |
| `cargo check` passes | Fail fast — crate must be buildable |
| `cargo +nightly` on PATH | Fail fast — nightly required for MIR and LLVM IR emission |
| `uv` on PATH | Fail fast — required to run Python analysis scripts |
| `{baseDir}/tools/validate_rust_toolchain.sh` | Warn — run preflight manually. Checks all tools, scripts, nightly, and optionally `cargo check`. Use `--json` for machine-readable output, `--manifest` to also validate the crate builds. |
| `{baseDir}/tools/emit_rust_mir.sh` | Fail fast — MIR analysis impossible (`--opt`, `--crate`, `--bin/--lib` supported; `--out` can be file or directory) |
| `{baseDir}/tools/emit_rust_ir.sh` | Fail fast — LLVM IR analysis impossible (`--opt` required; `--crate`, `--bin/--lib` supported; `--out` must be `.ll`) |
| `{baseDir}/tools/emit_rust_asm.sh` | Warn and skip assembly findings (`STACK_RETENTION`, `REGISTER_SPILL`). Supports `--opt`, `--crate`, `--bin/--lib`, `--target`, `--intel-syntax`; `--out` can be `.s` file or directory. |
| `{baseDir}/tools/diff_rust_mir.sh` | Warn and skip MIR-level optimization comparison. Accepts 2+ MIR files, normalizes, diffs pairwise, and reports first opt level where zeroize/drop-glue patterns disappear. |
| `{baseDir}/tools/scripts/semantic_audit.py` | Warn and skip semantic source analysis |
| `{baseDir}/tools/scripts/find_dangerous_apis.py` | Warn and skip dangerous API scan |
| `{baseDir}/tools/scripts/check_mir_patterns.py` | Warn and skip MIR analysis |
| `{baseDir}/tools/scripts/check_llvm_patterns.py` | Warn and skip LLVM IR analysis |
| `{baseDir}/tools/scripts/check_rust_asm.py` | Warn and skip Rust assembly analysis (`STACK_RETENTION`, `REGISTER_SPILL`, drop-glue checks). Dispatches to `check_rust_asm_x86.py` (production) or `check_rust_asm_aarch64.py` (**EXPERIMENTAL** — AArch64 findings require manual verification). |
| `{baseDir}/tools/scripts/check_rust_asm_x86.py` | Required by `check_rust_asm.py` for x86-64 analysis; warn and skip if missing |
| `{baseDir}/tools/scripts/check_rust_asm_aarch64.py` | Required by `check_rust_asm.py` for AArch64 analysis (**EXPERIMENTAL**); warn and skip if missing |

## Common Prerequisites

| Prerequisite | Failure mode if missing |
|---|---|
| `{baseDir}/tools/generate_poc.py` | Fail fast — PoC generation is mandatory |
