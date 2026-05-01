---
name: service-lifecycle-or-auth-update
description: Workflow command scaffold for service-lifecycle-or-auth-update in sparkle.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /service-lifecycle-or-auth-update

Use this workflow when working on **service-lifecycle-or-auth-update** in `sparkle`.

## Goal

Implements or fixes service lifecycle, authentication, or storage logic, often for cross-platform installer or service mode support.

## Common Files

- `src/main/service/api.ts`
- `src/main/service/auth-store.ts`
- `src/main/service/manager.ts`
- `src/main/service/key.ts`
- `src/main/utils/ipc.ts`
- `src/main/utils/dirs.ts`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Modify src/main/service/api.ts and/or src/main/service/auth-store.ts for service logic or auth changes
- Update related service manager or key files (src/main/service/manager.ts, src/main/service/key.ts)
- Adjust installer or platform scripts if needed (build/installer.nsh, build/linux/postinst, build/pkg-scripts/postinstall, etc.)
- Update utility files for IPC or directory handling (src/main/utils/ipc.ts, src/main/utils/dirs.ts, src/main/utils/encrypt.ts)
- Update renderer files if UI reflects service/auth state (src/renderer/src/components/mihomo/service-modal.tsx, etc.)

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.