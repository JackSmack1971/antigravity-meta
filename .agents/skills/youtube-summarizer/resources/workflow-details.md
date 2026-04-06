# YouTube Summarizer: Technical Workflow Details

This document contains the low-level CLI commands and logic for video validation, transcript extraction, and availability checks.

## Step 1: Validate YouTube URL

**Objective:** Extract video ID and validate URL format.

**Supported URL Formats:**
- `https://www.youtube.com/watch?v=VIDEO_ID`
- `https://youtube.com/watch?v=VIDEO_ID`
- `https://youtu.be/VIDEO_ID`
- `https://m.youtube.com/watch?v=VIDEO_ID`

**Actions:**

```bash
# Extract video ID using regex or URL parsing
URL="$USER_PROVIDED_URL"

# Pattern 1: youtube.com/watch?v=VIDEO_ID
if echo "$URL" | grep -qE 'youtube\.com/watch\?v='; then
    VIDEO_ID=$(echo "$URL" | sed -E 's/.*[?&]v=([^&]+).*/\1/')
# Pattern 2: youtu.be/VIDEO_ID  
elif echo "$URL" | grep -qE 'youtu\.be/'; then
    VIDEO_ID=$(echo "$URL" | sed -E 's/.*youtu\.be\/([^?]+).*/\1/')
else
    echo "❌ Invalid YouTube URL format"
    exit 1
fi

echo "📹 Video ID extracted: $VIDEO_ID"
```

**If URL is invalid:**

```
❌ Invalid YouTube URL

Please provide a valid YouTube URL in one of these formats:
- https://www.youtube.com/watch?v=VIDEO_ID
- https://youtu.be/VIDEO_ID

Example: https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

## Step 2: Check Video & Transcript Availability

**Progress:**
```bash
echo "[████████░░░░░░░░░░░░] 40% - Step 2/5: Checking Availability"
```

**Objective:** Verify video exists and transcript is accessible.

**Actions:**

```python
from youtube_transcript_api import YouTubeTranscriptApi, TranscriptsDisabled, NoTranscriptFound
import sys

video_id = sys.argv[1]

try:
    # Get list of available transcripts
    transcript_list = YouTubeTranscriptApi.list_transcripts(video_id)
    
    print(f"✅ Video accessible: {video_id}")
    print("📝 Available transcripts:")
    
    for transcript in transcript_list:
        print(f"  - {transcript.language} ({transcript.language_code})")
        if transcript.is_generated:
            print("    [Auto-generated]")
    
except TranscriptsDisabled:
    print(f"❌ Transcripts are disabled for video {video_id}")
    sys.exit(1)
    
except NoTranscriptFound:
    print(f"❌ No transcript found for video {video_id}")
    sys.exit(1)
    
except Exception as e:
    print(f"❌ Error accessing video: {e}")
    sys.exit(1)
```

**Error Handling:**

| Error | Message | Action |
|-------|---------|--------|
| Video not found | "❌ Video does not exist or is private" | Ask user to verify URL |
| Transcripts disabled | "❌ Transcripts are disabled for this video" | Cannot proceed |
| No transcript available | "❌ No transcript found (not auto-generated or manually added)" | Cannot proceed |
| Private/restricted video | "❌ Video is private or restricted" | Ask for public video |

## Step 3: Extract Transcript

**Progress:**
```bash
echo "[████████████░░░░░░░░] 60% - Step 3/5: Extracting Transcript"
```

**Objective:** Retrieve transcript in preferred language.

**Actions:**

```python
from youtube_transcript_api import YouTubeTranscriptApi

video_id = "VIDEO_ID"

try:
    # Try to get transcript in user's preferred language first
    # Fall back to English if not available
    transcript = YouTubeTranscriptApi.get_transcript(
        video_id, 
        languages=['pt', 'en']  # Prefer Portuguese, fallback to English
    )
    
    # Combine transcript segments into full text
    full_text = " ".join([entry['text'] for entry in transcript])
    
    # Get video metadata
    from youtube_transcript_api import YouTubeTranscriptApi
    transcript_list = YouTubeTranscriptApi.list_transcripts(video_id)
    
    print("✅ Transcript extracted successfully")
    print(f"📊 Transcript length: {len(full_text)} characters")
    
    # Save to temporary file for processing
    with open(f"/tmp/transcript_{video_id}.txt", "w") as f:
        f.write(full_text)
    
except Exception as e:
    print(f"❌ Error extracting transcript: {e}")
    exit(1)
```

**Transcript Processing:**

- Combine all transcript segments into coherent text
- Preserve punctuation and formatting where available
- Remove duplicate or overlapping segments (if auto-generated artifacts)
- Store in temporary file for analysis
