# Zeroize Audit: Output Schemas and Reports

This document defines the structure of the human-readable Markdown report and the machine-readable JSON findings.

## Markdown Report Structure (`final-report.md`)

The markdown report contains these sections:

- **Header**: Run metadata (run_id, timestamp, repo, compile_db, config summary)
- **Executive Summary**: Finding counts by severity, confidence, and category
- **Sensitive Objects Inventory**: Table of all identified objects with IDs, types, locations
- **Findings**: Grouped by severity then confidence. Each finding includes location, object, all evidence (source/IR/ASM/CFG), compiler evidence details, and recommended fix
- **Superseded Findings**: Source findings replaced by CFG-backed findings
- **Confidence Gate Summary**: Downgrades applied and overrides rejected
- **Analysis Coverage**: TUs analyzed, agent success/failure, features enabled
- **Appendix: Evidence Files**: Mapping of finding IDs to evidence file paths

## Structured JSON (`findings.json`)

The `findings.json` file follows the schema in `{baseDir}/schemas/output.json`. Each `Finding` object matches the following structure:

```json
{
  "id": "ZA-0001",
  "category": "OPTIMIZED_AWAY_ZEROIZE",
  "severity": "high",
  "confidence": "confirmed",
  "language": "c",
  "file": "src/crypto.c",
  "line": 42,
  "symbol": "key_buf",
  "evidence": "store volatile i8 0 count: O0=32, O2=0 — wipe eliminated by DSE",
  "compiler_evidence": {
    "opt_levels": ["O0", "O2"],
    "o0": "32 volatile stores targeting key_buf",
    "o2": "0 volatile stores (all eliminated)",
    "diff_summary": "All volatile wipe stores removed at O2 — classic DSE pattern"
  },
  "suggested_fix": "Replace memset with explicit_bzero or add compiler_fence(SeqCst) after the wipe",
  "poc": {
    "file": "generated_pocs/ZA-0001.c",
    "makefile_target": "ZA-0001",
    "compile_opt": "-O2",
    "requires_manual_adjustment": false,
    "validated": true,
    "validation_result": "exploitable"
  }
}
```

### PoC Validation Signals

The PoC execution status is converted into a security signal:

| PoC Result | Verified | Impact |
|---|---|---|
| Exit 0 (exploitable) | Yes | Strong signal — upgrade `likely` to `confirmed` |
| Exit 1 (not exploitable) | Yes | Downgrade severity to `low` (informational) |
| Exit 0 or 1 | No | Weak signal — verification failure in evidence |

See `{baseDir}/schemas/output.json` for the full schema and enum values.
