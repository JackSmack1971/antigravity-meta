---
name: analyze-project
description: Forensic root cause analyzer for Antigravity sessions. Classifies scope deltas, rework patterns, root causes, hotspots, and auto-improves prompts/health.
risk: unknown
source: community
---

# /analyze-project — Root Cause Analyst

## Overview

Perform forensic analysis on AI-assisted coding sessions to identify patterns of struggle, root causes of failure, and opportunities for repo health or prompt improvement.

## 📚 Resources

| Resource | Description |
|----------|-------------|
| [Forensics & Evidence](file:///c:/workspaces/antigravity-meta/.agents/skills/analyze-project/resources/session-forensics-and-evidence.md) | Intent classification and evidence gathering from `brain/`. |
| [Scope & Prompt](file:///c:/workspaces/antigravity-meta/.agents/skills/analyze-project/resources/scope-and-prompt-classification.md) | Prompt sufficiency scoring and scope change taxonomy. |
| [RCA & Severity](file:///c:/workspaces/antigravity-meta/.agents/skills/analyze-project/resources/root-cause-and-severity-framework.md) | Primary root causes and the 0-100 severity scoring model. |
| [Reporting Templates](file:///c:/workspaces/antigravity-meta/.agents/skills/analyze-project/resources/analysis-reporting-templates.md) | Metric summary tables and structured recommendation patterns. |

## Goal

For each session, determine:
1. **Delta**: What changed from the initial ask to the final work?
2. **Attribution**: Was friction caused by the user/spec, the agent, or the repo?
3. **Friction Hotspots**: Which files/subsystems correlate with repeated rework?
4. **Correction**: What changes would most improve future execution?

## Core Workflow

### 1. Extraction
Analyze [Session Evidence](file:///c:/workspaces/antigravity-meta/.agents/skills/analyze-project/resources/session-forensics-and-evidence.md) (task versions, plans, walkthroughs).

### 2. Classification
Apply [Scope and Prompt Scoring](file:///c:/workspaces/antigravity-meta/.agents/skills/analyze-project/resources/scope-and-prompt-classification.md) to find requirement gaps.

### 3. Diagnosis
Assign a [Primary Root Cause](file:///c:/workspaces/antigravity-meta/.agents/skills/analyze-project/resources/root-cause-and-severity-framework.md) (e.g., REPO_FRAGILITY) and severity score.

### 4. synthesis
Generate the [Analysis Report](file:///c:/workspaces/antigravity-meta/.agents/skills/analyze-project/resources/analysis-reporting-templates.md) with evidence-backed recommendations.

## Summary
Improve Antigravity performance by diagnosing systematic failures in spec clarity, repo architecture, and agent coordination.
