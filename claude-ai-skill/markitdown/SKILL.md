---
name: markitdown
description: Convert uploaded files (PDF, Word .docx, Excel .xlsx/.xls, PowerPoint .pptx, images, audio, video, HTML, CSV, JSON, XML, ZIP, EPUB) to Markdown with Microsoft's MarkItDown before reading them, to save context. Use whenever the user uploads or references one of these files and asks to read, summarize, analyze, search, or convert it — even if they don't mention MarkItDown.
---

# MarkItDown

Convert uploaded files to Markdown with [MarkItDown](https://github.com/microsoft/markitdown)
before reading them. The Markdown is much smaller than the original, so only read the parts you need.

## Steps

1. Find the file (uploads are normally in `/mnt/user-data/uploads/`).
2. Convert it with the bundled script. It installs MarkItDown if needed:

   ```bash
   bash /mnt/skills/user/markitdown/scripts/convert.sh "/mnt/user-data/uploads/<file>"
   ```

   The script writes `/home/claude/converted/<file>.md` and prints its path, size and line count.
   If the skill path differs, locate the script with `find / -name convert.sh -path '*markitdown*' 2>/dev/null`.
3. Read the Markdown economically:
   - Small file (under ~500 lines): read it all.
   - Large file: start with the headings (`grep -n '^#' file.md`), then read only the relevant
     sections with `sed -n 'START,ENDp' file.md`, or search with `grep -n -i 'term' file.md`.
   - Do not read the original file directly or paste the whole Markdown into the reply.
4. If the user wants the Markdown file itself, copy it to `/mnt/user-data/outputs/` and share it.

## If installation fails

Pip installs need network access to PyPI. If `pip install` fails, tell the user that code execution
must be allowed to reach package managers (Settings → Capabilities), then fall back to
reading the file with the usual tools.

## Notes

- Audio and video transcription needs `ffmpeg` and an internet speech service; it may not work
  in the sandbox. Say so if it fails instead of guessing the content.
- Images yield only metadata (EXIF) unless an LLM client is configured, so for images look at the
  image directly when its visual content matters.
