# YouTube Summarizer: Output Structure and Formatting

This document defines the STAR + R-I-S-E output structure and provides reference examples for presenting comprehensive video summaries.

## Final presentation: Formatting and Presentation

**Progress:**
```bash
echo "[████████████████████] 100% - Step 5/5: Formatting Output"
```

**Objective:** Deliver the summary in clean, well-structured Markdown.

**Output Structure:**

```markdown
# [Video Title]

**Canal:** [Channel Name]  
**Duração:** [Duration]  
**URL:** [https://youtube.com/watch?v=VIDEO_ID]  
**Data de Publicação:** [Date if available]


## 📝 Detailed Summary

### [Topic 1]

[Comprehensive explanation with examples, data, quotes...]

#### [Subtopic 1.1]

[Detailed breakdown...]

### [Topic 2]

[Continued detailed analysis...]


## 📚 Concepts and Terminology

- **[Term 1]:** [Definition and context]
- **[Term 2]:** [Definition and context]


## 📌 Conclusion

[Final synthesis and takeaways]


### **Example 2: Missing Dependency**

**User Input:**
```
claude> summarize this youtube video https://youtu.be/abc123
```

**Skill Response:**

```
⚠️  youtube-transcript-api not installed

This skill requires the Python library 'youtube-transcript-api'.

Would you like me to install it now?
- [ ] Yes - Install with pip
- [ ] No - I'll install manually
```

**User selects "Yes":**

```bash
$ pip install youtube-transcript-api
Successfully installed youtube-transcript-api-0.6.1

✅ Installation complete! Proceeding with video summary...
```


### **Example 4: Invalid URL**

**User Input:**
```
claude> summarize youtube video www.youtube.com/some-video
```

**Skill Response:**

```
❌ Invalid YouTube URL format

Expected format examples:
- https://www.youtube.com/watch?v=VIDEO_ID
- https://youtu.be/VIDEO_ID

Please provide a valid YouTube video URL.
```


## 📊 Executive Summary

This video provides a comprehensive introduction to the fundamental concepts of Artificial Intelligence (AI), designed for beginners and professionals who want to understand the technical foundations and practical applications of modern AI. The instructor covers everything from basic definitions to machine learning algorithms, using practical examples and visualizations to facilitate understanding.

[... continued detailed summary ...]
```

**Save Options:**

```
What would you like to save?
→ Summary + raw transcript

✅ File saved: resumo-exemplo123-2026-02-01.md (includes raw transcript)
[████████████████████] 100% - ✓ Processing complete!
```

---

## Summarization Framework: STAR + R-I-S-E Reference

The summarizer uses a hybrid framework to ensure both structural integrity and exhaustive insight:

### [S-T-A-R] (Situational Tracking & Alignment)
1. **S**ituation: The core context of the video.
2. **T**ask: The main objective/problem being addressed.
3. **A**ction: The steps taken or solutions proposed.
4. **R**esult: The final ultimate outcome or conclusion.

### [R-I-S-E] (Radial Insight & Specificity Engine)
1. **R**elate: Link concepts to real-world applications.
2. **I**llustrate: Use specific examples mentioned in the transcript.
3. **S**ynthesize: Condense complex sections without losing depth.
4. **E**xpand: Elaborate on nuance and terminology mentioned.
