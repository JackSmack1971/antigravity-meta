# Citation Management Example Workflows

This resource provides end-to-end workflow examples for common citation management tasks.

## 1. Building a Bibliography for a Paper

Follow this systematic process to build a production-ready bibliography from scratch:

```bash
# Step 1: Find key papers on your topic
python scripts/search_google_scholar.py "transformer neural networks" \
  --year-start 2017 \
  --limit 50 \
  --output transformers_gs.json

# Step 2: Extract metadata from search results
python scripts/extract_metadata.py \
  --input transformers_gs.json \
  --output transformers.bib

# Step 3: Add specific papers by DOI
python scripts/doi_to_bibtex.py 10.1038/s41586-021-03819-2 >> transformers.bib

# Step 4: Format and deduplicate
python scripts/format_bibtex.py transformers.bib \
  --deduplicate \
  --sort year \
  --descending \
  --output formatted.bib

# Step 5: Validate and auto-fix
python scripts/validate_citations.py formatted.bib \
  --auto-fix \
  --report validation.json \
  --output final_references.bib
```

## 2. Converting a Batch of Identifiers

```bash
# You have a text file with DOIs, PMIDs, and arXiv IDs (one per line)
# identifiers.txt contains:
# 10.1038/s41586-021-03819-2
# 34265844
# 2103.14030

# Extract and convert all to BibTeX
python scripts/extract_metadata.py --input identifiers.txt --output references.bib

# Validate the result
python scripts/validate_citations.py references.bib --verbose
```

## 3. Cleaning an Existing/Messy BibTeX File

```bash
# Step 1: Format and standardize
python scripts/format_bibtex.py messy_references.bib \
  --output step1_formatted.bib

# Step 2: Remove duplicates
python scripts/format_bibtex.py step1_formatted.bib \
  --deduplicate \
  --output step2_deduplicated.bib

# Step 3: Validate and auto-fix
python scripts/validate_citations.py step2_deduplicated.bib \
  --auto-fix \
  --output step3_validated.bib

# Step 4: Final sort by year
python scripts/format_bibtex.py step3_validated.bib \
  --sort year \
  --descending \
  --output clean_references.bib
```

## 4. Finding and Citing Seminal Papers

```bash
# Find highly cited papers on a topic
python scripts/search_google_scholar.py "AlphaFold protein structure" \
  --year-start 2020 \
  --sort-by citations \
  --limit 20 \
  --output alphafold_seminal.json

# Extract metadata and convert to BibTeX
python scripts/extract_metadata.py \
  --input alphafold_seminal.json \
  --output alphafold_refs.bib
```
