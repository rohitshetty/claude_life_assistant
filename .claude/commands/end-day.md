---
description: Evening review. Captures wins, lessons, daily journal, and prep for tomorrow.
---

Read CLAUDE.md and NOW.md for full context.

## Context

Run: `date '+%A %B %d, %Y %H:%M'`

If before 6pm: "Closing out early?"

Read silently: CLAUDE.md (stable identity), NOW.md (current state), today's journal folder (if exists).

## Part 1: Task Review

### Ask

"How'd it go with [MIT from NOW.md]?"

Let them talk. Don't ask 5 questions.

### Follow up (maybe)

One question if needed:
- "Did you get your one thing done?"
- "What got in the way?"
- "Anything carrying to tomorrow?"

Or nothing.

---

## Part 2: Daily Journal

After task review, prompt for a broader journal:

### Ask

"Now tell me about your whole day — work, non-work, whatever's on your mind. Just talk, I'll capture it."

Let them rant. This is free-form. Don't interrupt with questions. They might talk about:
- What they did outside of MIT
- How they felt
- Random thoughts, frustrations, wins
- Non-work stuff (health, relationships, hobbies, life)

When they're done (they'll signal or you can ask "anything else?"), acknowledge briefly and move to saving.

---

## Part 3: Save to Daily Folder

Create folder structure: `journal/YYYY-MM-DD/`

Inside that folder, create two files:

### 1. `raw.md` — Verbatim capture
```markdown
# [Date] — Raw Journal

## Task Review
[What they said about MIT/tasks, verbatim]

## Daily Journal
[Everything they said in Part 2, verbatim — preserve their exact words, tone, tangents]
```

### 2. `journal.md` — Cleaned version
```markdown
# [Date] — Daily Journal

## Intention
[From /start-day if it happened, or summarize]

## What Got Done
- [Bullet points of actual accomplishments]
- [Both work and non-work]

## What Didn't
- [If relevant]

## Energy/Mood
[Summarize if mentioned]

## Non-Work
[Health, relationships, hobbies, life stuff — summarized cleanly]

## Key Moments
[Important events, decisions, realizations]

## Quotes
> "[Exact quote if something felt important]"

## Notes
[Your observations as the agent — patterns, concerns, wins]
```

**Formatting rules for journal.md:**
- Fix grammar, spelling, punctuation
- Organize chaotic thoughts into sections
- Keep their voice but make it readable
- This is for future Rohit to understand the week quickly

---

## Part 4: Update Memory Files

**Update NOW.md:**
- Add Memory Log entry with today's observation
- Quote important words: *'their exact words'*
- Note patterns, wins, or blocks
- Update Actions table if needed
- Include non-work observations if relevant to energy/patterns

**Update CLAUDE.md only if:**
- New long-term pattern discovered (add to Bugs or Psychology)
- Something about identity/mission shifted
- Learned something stable about how Rohit works (rare, needs 3+ occurrences)

---

## Part 5: Observe and Surface

If pattern (3x+):
- "You've mentioned [X] a few times. Worth naming?"
- "That's the third day you [pattern]. What's going on?"
- **Add to Memory Log**
- **Consider adding to CLAUDE.md if it's a stable pattern**

If they hit MIT multiple days:
- "That's [N] days in a row. What's working?"
- **Add to Memory Log**

If they missed MIT:
- "What got in the way?" — no guilt
- **Add to Memory Log**

Non-work patterns to watch:
- Sleep/energy correlations
- Mood triggers
- Distraction sources
- What recharges vs drains

---

## Part 6: Close

Short:
- "Rest."
- "Tomorrow: [their next thing if set]"
- Connect to mission if deep enough

---

## Memory Log Entry Format

Every /end-day should add a Memory Log entry in NOW.md:

```markdown
### [Date] (evening)
- [Key task observation]
- [Non-work note if relevant]
- [Pattern if noticed]
- Quote: *'their exact words if important'*
```

This is the core feature. The log builds pattern recognition over time. The daily folders provide the raw material; the Memory Log is the distilled insight.
