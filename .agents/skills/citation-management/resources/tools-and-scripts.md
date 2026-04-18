# Citation Management Tools and Scripts

This resource provides a detailed guide to the CLI tools and Python scripts bundled with the citation-management skill.

## 1. search_google_scholar.py
Search Google Scholar and export results.

**Features**:
- Automated searching with rate limiting
- Pagination support
- Year range filtering
- Export to JSON or BibTeX
- Citation count information

**Usage**:
```bash
# Basic search
python scripts/search_google_scholar.py "quantum computing"

# Advanced search with filters
python scripts/search_google_scholar.py "quantum computing" \
  --year-start 2020 \
  --year-end 2024 \
  --limit 100 \
  --sort-by citations \
  --output quantum_papers.json
```

## 2. search_pubmed.py
Search PubMed using E-utilities API.

**Features**:
- Complex query support (MeSH, field tags, Boolean)
- Date range filtering
- Publication type filtering
- Batch retrieval with metadata
- Export to JSON or BibTeX

**Usage**:
```bash
# Simple keyword search
python scripts/search_pubmed.py "CRISPR gene editing"

# Complex query with filters
python scripts/search_pubmed.py \
  --query '"CRISPR-Cas Systems"[MeSH] AND "therapeutic"[Title/Abstract]' \
  --date-start 2020-01-01 \
  --date-end 2024-12-31 \
  --publication-types "Clinical Trial,Review" \
  --limit 200 \
  --output crispr_therapeutic.json
```

## 3. extract_metadata.py
Extract complete metadata from paper identifiers.

**Features**:
- Supports DOI, PMID, arXiv ID, URL
- Queries CrossRef, PubMed, arXiv APIs
- Handles multiple identifier types
- Batch processing
- Multiple output formats

**Usage**:
```bash
# Single DOI
python scripts/extract_metadata.py --doi 10.1038/s41586-021-03819-2

# Batch processing (file with one identifier per line)
python scripts/extract_metadata.py \
  --input paper_ids.txt \
  --output references.bib
```

## 4. validate_citations.py
Validate BibTeX entries for accuracy and completeness.

**Features**:
- DOI verification via doi.org and CrossRef
- Required field checking
- Duplicate detection
- Format validation
- Auto-fix common issues
- Detailed reporting

**Usage**:
```bash
# Basic validation
python scripts/validate_citations.py references.bib

# With auto-fix
python scripts/validate_citations.py references.bib \
  --auto-fix \
  --output fixed_references.bib
```

## 5. format_bibtex.py
Format and clean BibTeX files.

**Features**:
- Standardize formatting
- Sort entries (by key, year, author)
- Remove duplicates
- Validate syntax
- Fix common errors
- Enforce citation key conventions

**Usage**:
```bash
# Basic formatting
python scripts/format_bibtex.py references.bib

# Sort by year (newest first)
python scripts/format_bibtex.py references.bib \
  --sort year \
  --descending \
  --output sorted_refs.bib
```

## 6. doi_to_bibtex.py
Quick DOI to BibTeX conversion.

**Features**:
- Fast single DOI conversion
- Batch processing
- Multiple output formats
- Clipboard support

**Usage**:
```bash
# Single DOI
python scripts/doi_to_bibtex.py 10.1038/s41586-021-03819-2

# Copy to clipboard
python scripts/doi_to_bibtex.py 10.1038/nature12345 --clipboard
```
