---
name: citation-management
description: "Manage citations systematically throughout the research and writing process."
license: MIT License
metadata:
    skill-author: K-Dense Inc.
risk: unknown
source: community
---

# Citation Management

## Overview

Manage citations systematically throughout the research and writing process. This skill provides tools and strategies for searching academic databases, extracting accurate metadata, validating citation information, and generating BibTeX entries.

## 📚 Resources

| Resource | Description |
|----------|-------------|
| [Discovery & Search](file:///c:/workspaces/antigravity-meta/.agents/skills/citation-management/resources/discovery-and-search.md) | Advanced strategies for Google Scholar and PubMed. |
| [Tools & Scripts](file:///c:/workspaces/antigravity-meta/.agents/skills/citation-management/resources/tools-and-scripts.md) | Documentation for bundled Python scripts and CLI tools. |
| [Best Practices & Pitfalls](file:///c:/workspaces/antigravity-meta/.agents/skills/citation-management/resources/best-practices-and-pitfalls.md) | Quality standards and troubleshooting guide. |
| [Example Workflows](file:///c:/workspaces/antigravity-meta/.agents/skills/citation-management/resources/example-workflows.md) | End-to-end task examples and CLI sequences. |

## Core Workflow

### Phase 1: Paper Discovery and Search
> [!NOTE]
> See [Discovery & Search](file:///c:/workspaces/antigravity-meta/.agents/skills/citation-management/resources/discovery-and-search.md) for advanced strategies.

### Phase 2: Metadata Extraction
Convert identifiers (DOI, PMID, arXiv ID) to metadata:
```bash
# Extract from DOI
python scripts/extract_metadata.py --doi 10.1038/s41586-021-03819-2

# Batch extraction
python scripts/extract_metadata.py --input identifiers.txt --output citations.bib
```

### Phase 3: BibTeX Formatting
Generate clean entries using `format_bibtex.py`:
```bash
python scripts/format_bibtex.py references.bib --deduplicate --sort year --output clean.bib
```

### Phase 4: Citation Validation
Verify accuracy via `validate_citations.py`:
```bash
python scripts/validate_citations.py references.bib --auto-fix --report report.json
```

### Phase 5: Integration
Seamlessly integrate citations into LaTeX or markdown manuscripts.

## Related Skills
- `literature-review`: Systematic search and synthesis.
- `scientific-writing`: Manuscript preparation.
- `venue-templates`: Submission formatting.

## Dependencies
```bash
pip install requests bibtexparser biopython scholarly
```

## Summary
Maintains accurate, complete citations through automated search, extraction, and validation.
