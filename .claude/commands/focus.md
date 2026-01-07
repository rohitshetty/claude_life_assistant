---
description: Start a focused work session with timer and accountability.
---

Read CLAUDE.md and NOW.md for full context.

## Context

Run: `date '+%A %B %d, %Y %H:%M'`

Read silently: CLAUDE.md (stable identity), NOW.md (current state), today's journal.

## Ask

Two questions:

1. "What are you focusing on?"
2. "How long do you think it'll take?"

Wait for both.

## After they answer

### Breakdown (optional)

Ask: "Want me to break this into steps?"

- If yes: break into 3-5 concrete steps, numbered
- If no: skip

### Duration

Based on their estimate, suggest a focus duration:

| Their estimate | Your suggestion |
|----------------|-----------------|
| < 30 min | Round to 25 or 30 min |
| 30-60 min | Match their estimate |
| > 60 min | Suggest 60 min blocks with break |

Present: "I'll set a [X] minute timer. Sound good?"

- If they agree: proceed
- If they disagree: adjust to their preference

### Start

Once confirmed:

1. Note the focus session in today's journal under Notes:
   ```
   - [TIME] Focus: [task] ([X] min)
   ```

2. Run the timer:
   ```bash
   ./timer.sh [minutes]
   ```

3. Say: "Timer started. Go."

## After timer ends

### Interview

Ask: "How'd it go?"

Wait.

### Respond

| They... | You... |
|---------|--------|
| Finished | "Good. What's next?" |
| Made progress | "What's left?" |
| Got stuck | "What blocked you?" |
| Got distracted | "What pulled you away?" |
| Underestimated | "How much more time?" |
| Procrastinated | "What's the resistance?" |
| Venting | Listen, then "Want me to save that?" |
| Lost/confused | "What actually matters right now?" |
| On fire | Stay out of the way |

### Update

1. Kill the timer if still running:
   ```bash
   pkill -f "timer.sh" 2>/dev/null || true
   ```

2. Get current time: `date '+%H:%M'`

3. **journal**: Update the focus entry with outcome and end time
   ```
   - [START_TIME] Focus: [task] ([X] min) - [outcome] [END_TIME]
   ```

4. **NOW.md**: Update if needed
   - MIT changed or blocker discovered → update Actions
   - Pattern or insight from session → add to Memory Log

5. **CLAUDE.md**: Only if new long-term pattern discovered (rare)
   - e.g., recurring resistance, new effective strategy, persistent bug

## Close

- "Another round?"
- "Back to it."
- "Take a break, then go again."
