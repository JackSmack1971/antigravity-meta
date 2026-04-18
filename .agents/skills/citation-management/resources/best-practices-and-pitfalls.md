# Citation Management Best Practices and Pitfalls

This resource outlines industry-standard best practices for maintaining accurate, complete, and professional bibliographies.

## Best Practices

### 1. Search Strategy
- **Start broad, then narrow**: Begin with general terms to understand the field, then refine with specific keywords and filters.
- **Use multiple sources**: Combine results from Google Scholar, PubMed, and arXiv for comprehensive coverage.
- **Leverage citations**: Check "Cited by" for seminal papers and review references from key papers to discover related work.
- **Document your searches**: Save search queries, dates, and number of results for reproducibility.

### 2. Metadata Extraction
- **Always use DOIs when available**: They are the most reliable, permanent identifiers for scholarly publications.
- **Verify extracted metadata**: Spot-check author names, journal titles, years, and page numbers against the original source.
- **Handle edge cases**: Ensure preprints, conference papers, and book chapters are correctly categorized with all required fields.
- **Journal Abbreviations**: Decide on a consistent style (full name vs. standard abbreviation) and stick to it throughout.

### 3. BibTeX Quality
- **Follow conventions**: Use meaningful citation keys (e.g., `FirstAuthor2024Keyword`).
- **Protect capitalization**: Use curly braces `{}` in titles to preserve acronyms and proper nouns (e.g., `{CRISPR}`).
- **Punctuation**: Use double dashes `--` for page ranges to ensure proper rendering in LaTeX.
- **Minimize noise**: Remove unnecessary fields (abstracts, keywords, file paths) from the production BibTeX file to keep it clean.

### 4. Validation
- **Validate early and often**: Check citations when adding them rather than waiting until the end.
- **Automated verification**: Use provided scripts to verify that DOIs resolve and metadata is consistent.
- **Manual review**: Perform a final eye-ball check on critical citations to ensure they match the published version exactly.

## Common Pitfalls to Avoid

| Pitfall | Consequence | Solution |
|---------|-------------|----------|
| **Single source bias** | Missing seminal works | Search multiple databases (Scholar, PubMed, arXiv). |
| **Accepting metadata blindly** | Incorrect author names or years | Spot-check extracted data against original sources. |
| **Broken DOIs** | Broken links in bibliography | Run `validate_citations.py` before submission. |
| **Inconsistent keys** | Duplicate citations in document | Enforce a consistent key convention (e.g., `AuthorYear`). |
| **Duplicate entries** | Redundant references | Use `--deduplicate` in formatting scripts. |
| **Outdated preprints** | Citing non-peer-reviewed version | Check if preprints have been published; update to journal version. |
| **Special characters** | LaTeX compilation errors | Use proper escaping or standard Unicode in BibTeX. |
| **Manual entry** | High risk of typos | Always use metadata extraction scripts. |
