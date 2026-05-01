---
name: log-system-enhancement
description: Workflow command scaffold for log-system-enhancement in sparkle.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /log-system-enhancement

Use this workflow when working on **log-system-enhancement** in `sparkle`.

## Goal

Enhances log handling, settings, and real-time log features across main and renderer processes.

## Common Files

- `src/main/utils/log.ts`
- `src/main/core/mihomoApi.ts`
- `src/main/core/manager.ts`
- `src/main/utils/ipc.ts`
- `src/shared/types/app.d.ts`
- `src/shared/types/controller.d.ts`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Update main process log logic (src/main/utils/log.ts, src/main/core/mihomoApi.ts, src/main/core/manager.ts, src/main/utils/ipc.ts)
- Update shared types if log data shape changes (src/shared/types/app.d.ts, src/shared/types/controller.d.ts)
- Update renderer components/pages for log display or settings (src/renderer/src/pages/logs.tsx, src/renderer/src/components/mihomo/log-setting.tsx, src/renderer/src/utils/mihomo-log-store.ts, etc.)
- Update utility files for IPC or log store if needed (src/renderer/src/utils/ipc.ts, src/renderer/src/utils/mihomo-log-store.ts)

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.