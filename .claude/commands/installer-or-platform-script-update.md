---
name: installer-or-platform-script-update
description: Workflow command scaffold for installer-or-platform-script-update in sparkle.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /installer-or-platform-script-update

Use this workflow when working on **installer-or-platform-script-update** in `sparkle`.

## Goal

Updates installer scripts or platform-specific install/uninstall logic, often for service or binary handling.

## Common Files

- `build/installer.nsh`
- `build/linux/postinst`
- `build/linux/preinst`
- `build/pkg-scripts/postinstall`
- `build/pkg-scripts/preinstall`
- `electron-builder.yml`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Edit installer scripts (build/installer.nsh, build/linux/postinst, build/linux/preinst, build/pkg-scripts/postinstall, build/pkg-scripts/preinstall)
- Update electron-builder or related config if needed (electron-builder.yml)
- Update main process files if install logic affects runtime (src/main/core/manager.ts, src/main/resolve/autoUpdater.ts, src/main/utils/ipc.ts)
- Update renderer utils if IPC contract changes (src/renderer/src/utils/ipc.ts)

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.