---
name: youtube-summarizer
description: "Extract transcripts from YouTube videos and generate comprehensive, detailed summaries using intelligent analysis frameworks"
category: content
risk: safe
source: community
tags: "[video, summarization, transcription, youtube, content-analysis]"
date_added: "2026-02-27"
---

# youtube-summarizer

## Purpose

This skill extracts transcripts from YouTube videos and generates comprehensive, verbose summaries using the STAR + R-I-S-E framework. It validates video availability, extracts transcripts using the `youtube-transcript-api` Python library, and produces detailed documentation capturing all insights, arguments, and key points.

## Resources

| Resource | Description |
| :--- | :--- |
| [Workflow Details](./resources/workflow-details.md) | Technical CLI commands, Python logic, and error handlers for extraction. |
| [Output & Examples](./resources/output-examples.md) | STAR + R-I-S-E framework details, formatting guides, and summary examples. |

## When to Use This Skill

- User provides a YouTube video URL and wants a detailed summary.
- User needs to document video content for reference without rewatching.
- User wants to extract insights, key points, and arguments from educational content.
- User asks to "summarize", "resume", or "extract content" from YouTube videos.

## Step 0: Discovery & Setup

Validate the environment and dependencies:

```bash
# Check if youtube-transcript-api is installed
python3 -c "import youtube_transcript_api" 2>/dev/null
```

**If missing:** Offer to install with `pip install youtube-transcript-api`.

## Main Workflow

### Progress Tracking Guidelines
Display a visual progress gauge before each step (e.g., `[████░░░░░░░░] 20%`).

### Step 1: Validate YouTube URL
Extract video ID from supported formats (`watch?v=`, `youtu.be/`, etc.).  
> See [Workflow Details: Step 1](./resources/workflow-details.md#step-1-validate-youtube-url)

### Step 2: Check Availability
Verify video exists and transcripts are accessible (not disabled/private).  
> See [Workflow Details: Step 2](./resources/workflow-details.md#step-2-check-video--transcript-availability)

### Step 3: Extract Transcript
Retrieve transcript in preferred language with English fallback.  
> See [Workflow Details: Step 3](./resources/workflow-details.md#step-3-extract-transcript)

### Step 4: Generate Comprehensive Summary
Apply the **STAR + R-I-S-E** framework to the transcript.
1. **S**ituation / **T**ask / **A**ction / **R**esult
2. **R**elate / **I**llustrate / **S**ynthesize / **E**xpand

### Step 5: Format and Present Output
Deliver clean Markdown with executive synthesis, detailed breakdown, and terminology.  
> See [Output & Examples](./resources/output-examples.md)

---
**Version:** 1.2.1 (Sharded)
**Last Updated:** 2026-04-06
