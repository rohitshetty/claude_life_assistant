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

### Anti-Pattern Check (silent analysis, selective intervention)

Read the **Bugs** section from CLAUDE.md. Analyze the stated task against known patterns:

| Bug | Trigger signals | Intervention |
|-----|-----------------|--------------|
| **Rabbit holes** | "research", "explore", "look into", "figure out", "understand", "learn about", "investigate", open-ended tasks | "What's the minimum you need to know to move forward? Define done before you start." |
| **Perfectionism trap** | Vague deliverable, no clear output, "work on", "think about", task has been attempted before | "What's the ugly first version? What does 'good enough' look like?" |
| **Gets sidelined** | Task not related to MIT or active deadlines, sounds interesting but not urgent | "Is this your MIT right now, or are you avoiding something harder?" |

**Rules:**
- Only intervene if a pattern match is detected (don't slow down every session)
- One question max — don't stack interventions
- If they give a clear answer, proceed. Don't argue.
- If they push back ("I know what I'm doing"), let it go and proceed
- Log the intervention in the focus entry: `[warned: rabbit hole]`

**Priority order:** If multiple patterns match, use the first one that applies:
1. Gets sidelined (most urgent — wrong task entirely)
2. Rabbit holes (scope risk)
3. Perfectionism (execution risk)

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
   If anti-pattern intervention was triggered, append the tag:
   ```
   - [TIME] Focus: [task] ([X] min) [warned: rabbit hole]
   ```

2. Run the timer (include the task in quotes):
   ```bash
   ./timer.sh [minutes] "[task description]"
   ```

3. Say: "Timer started. Go."

## After timer ends (or when user reports back)

### Acknowledge

First, stop the persistent pinging:
```bash
touch ~/.claude/focus_ack
```

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
