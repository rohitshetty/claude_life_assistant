---
description: Morning kickoff. Sets intentions and MIT for the day.
---

Read CLAUDE.md and NOW.md for full context.

## Context

Run: `date '+%A %B %d, %Y %H:%M'`

Read silently: CLAUDE.md (stable identity), NOW.md (current state), recent journals.

## Surface Queue

Before asking for MIT, show the Queue status:

1. **Show Queue with ages** — calculate days since each task was added
2. **Show inline notes** if they exist (indented `>` lines under tasks)
3. **Flag stale items**:
   - 3-6 days: mention as aging
   - 7+ days: force decision — "Do it, delegate it, or drop it? What's the story?"
4. **Show Blocked items** if any exist

Format:
```
Queue:
- Task A (Jan 10) — 3d
- Task B (Jan 6) — 7d, needs decision
  > Previous note: was blocked by X
- Task C (Jan 5) — 8d, needs decision

Blocked:
- Task D — waiting on X
```

If Queue is empty, skip this section.

When forcing decision on 7+ day items, ask: "What's the story on this one?" — capture their response as an inline note if they're keeping it.

## Ask

"What's your one thing today?"

Wait. They can pick from Queue or add something new.

## After they answer

### Anti-Pattern Check (MIT-specific)

If the stated MIT triggers a known bug from CLAUDE.md, ask ONE clarifying question:

| Pattern | Trigger | Question |
|---------|---------|----------|
| **Rabbit hole risk** | "research", "explore", "figure out", "understand" — open-ended with no clear deliverable | "What's the concrete output? When will you know you're done?" |
| **Perfectionism risk** | Vague or has been MIT before without completion | "What's the minimum viable version of this?" |
| **Scope creep** | MIT has 3+ items or sounds like multiple tasks | "Which one of these is THE one thing?" |

**Rules:**
- Don't intervene on every MIT — only when pattern match is clear
- One question max, then proceed with their answer
- If they push back, accept it and move on

### Update files

- Update NOW.md: Set MIT Today, remove from Queue if picked from there
- Create/update journal (`journal/YYYY-MM-DD.md`)
- Add Memory Log entry if pattern observed

Journal:
```markdown
# YYYY-MM-DD (Day)

## Morning
**MIT:** [their one thing]

## Tasks
- [ ] [MIT item 1]
- [ ] [MIT item 2]
- [ ] [MIT item 3]

## Notes

## Evening
```

## Connect (if appropriate)

If CLAUDE.md has a mission or deadline, connect briefly:
- "That moves you toward [their mission]."
- "[X] days to [deadline]."

## Close

Short:
- "Go."
- "One thing. Get it done."
- "[X] days left. Back to it."

## Observe (don't output)

Notice:
- Energy in their words
- Hesitation
- Same MIT as yesterday?
- Avoiding something?

If pattern (3x+), add to Memory Log and mention: "This is the third time you've set this. What's in the way?"
