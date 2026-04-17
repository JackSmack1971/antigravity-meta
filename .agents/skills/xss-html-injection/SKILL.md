---
name: xss-html-injection
description: "Execute comprehensive client-side injection vulnerability assessments on web applications to identify XSS and HTML injection flaws, demonstrate exploitation techniques for session hijacking and credential theft, and validate input sanitization and output encoding mechanisms."
risk: offensive
source: community
author: zebbern
date_added: "2026-02-27"
---

> AUTHORIZED USE ONLY: Use this skill only for authorized security assessments, defensive validation, or controlled educational environments.

# Cross-Site Scripting and HTML Injection Testing

## Purpose
Execute comprehensive client-side injection vulnerability assessments to identify XSS and HTML injection flaws, demonstrate exploitation techniques for session hijacking, and validate input sanitization.

## Resources

| Resource | Description |
| :--- | :--- |
| [Payload Reference](./resources/payload-reference.md) | Detection checklist and context-specific XSS/HTML injection payloads. |
| [Advanced Exploitation](./resources/advanced-exploitation.md) | Filter bypass techniques (tags, encoding, obfuscation, whitespace). |
| [Exploitation Examples](./resources/exploitation-examples.md) | Scenario-based case studies (Stored, Reflected, DOM, CSP bypass). |

## Core Workflow

### Phase 1: Vulnerability Detection
Locate input reflection points (search boxes, profile fields, URL fragments) and test for basic reflection without encoding. Determine XSS type (Stored, Reflected, or DOM-based).

### Phase 2: Stored XSS Exploitation
Identify persistent storage locations (comments, user bio, settings) and craft payloads for cookie theft, keylogging, or phishing injection.

### Phase 3: Reflected XSS Exploitation
Construct malicious URLs containing XSS payloads and deliver to victims via phishing, QR codes, or shortened links.

### Phase 4: DOM-Based XSS Exploitation
Identify vulnerable sinks (e.g., `innerHTML`, `eval`) and controllable sources (e.g., `location.hash`, `postMessage`).

### Phase 5: HTML Injection Techniques
Modify page appearance without JavaScript through content injection, iframe injection, or form hijacking.

## Constraints and Guardrails
- Never inject payloads that could damage production systems.
- Limit session capture to demonstration purposes only.
- Avoid payloads that could spread to unintended users (worm behavior).
- Content Security Policy (CSP) and HttpOnly cookies may limit findings.

## Troubleshooting

| Issue | Solutions |
| :--- | :--- |
| Script not executing | Check CSP; try event handlers (img, svg onerror); confirm JS enabled. |
| No execution after reflection | Break out of attribute context (`"`, `'`); test different contexts. |
| Cookies not accessible | Check HttpOnly flag; try localStorage/sessionStorage; use no-cors. |
| WAF blocking requests | Use encoding variations; fragment payload; case variations. |

## When to Use
This skill is applicable to execute the workflow or actions described in the overview.

---
**Version:** 1.1.0 (Sharded)
**Last Updated:** 2026-04-06
