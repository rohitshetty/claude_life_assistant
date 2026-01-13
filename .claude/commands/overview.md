---
description: Full task overview. MIT, queue, and recently completed.
---

Read NOW.md silently for current task state.

## Gather Data

1. **From NOW.md**: Extract MIT, Queue, Blocked, Icebox sections
2. **From journals**: Read `journal/YYYY-MM-DD.md` files from the last 7 days. Extract completed tasks (lines matching `- [x]`).

## Display

Output in this exact format:

```
MIT (Today):
- [ ] Task 1
- [ ] Task 2

Queue (N):
- Task A (Jan 10) — Xd
- Task B (Jan 6) — Xd, stale
  > inline note if exists

Blocked:
- Task C — waiting on X

Completed (last 7 days):
- Task D (Jan 13, 17:43)
- Task E (Jan 13, 17:35)
- Task F (Jan 12)
- Task G (Jan 11)
```

## Rules

- **MIT**: Show as unchecked items. If empty or says "Completed", show "None set"
- **Queue**: Show count in header. Calculate age in days from date. Flag 7+ days as "stale". Show inline notes (indented `>` lines) if they exist.
- **Blocked**: Show what it's waiting on. If none, show "None"
- **Icebox**: Don't show (these are someday/maybe, not active)
- **Completed**: Reverse chronological (newest first). Include timestamp if available. Limit to last 7 days. Group by date.

## No interaction

This is a read-only view. Don't ask questions. Just display and exit.
