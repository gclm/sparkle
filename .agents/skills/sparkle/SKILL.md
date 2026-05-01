```markdown
# sparkle Development Patterns

> Auto-generated skill from repository analysis

## Overview

This skill teaches you how to contribute effectively to the `sparkle` repository, a TypeScript and React-based application. You'll learn the project's coding conventions, file organization, and the main workflows for updating services, logs, installers, and shared features. The guide includes step-by-step instructions and code examples to help you follow best practices and maintain consistency.

## Coding Conventions

### File Naming

- **CamelCase** is used for file names.
  - Example: `serviceModal.tsx`, `mihomoApi.ts`

### Import Style

- **Relative imports** are preferred.
  - Example:
    ```typescript
    import { fetchLogs } from './utils/log';
    import ServiceModal from '../components/mihomo/serviceModal';
    ```

### Export Style

- **Named exports** are standard.
  - Example:
    ```typescript
    // src/main/utils/log.ts
    export function fetchLogs() { ... }
    export const LOG_LEVELS = ['info', 'warn', 'error'];
    ```

### Component and Utility Structure

- React components are placed under `src/renderer/src/components/`.
- Utilities are under `src/main/utils/` or `src/renderer/src/utils/`.

## Workflows

### Service Lifecycle or Auth Update

**Trigger:** When you need to update service startup, authentication, or lifecycle handling (e.g., for new OS support, bugfixes, or new service features).  
**Command:** `/update-service-auth`

1. Modify service logic or authentication:
    - Edit `src/main/service/api.ts` and/or `src/main/service/auth-store.ts`.
2. Update related service files:
    - `src/main/service/manager.ts`, `src/main/service/key.ts`
3. Adjust installer or platform scripts if needed:
    - `build/installer.nsh`, `build/linux/postinst`, `build/pkg-scripts/postinstall`, etc.
4. Update utility files for IPC or directory handling:
    - `src/main/utils/ipc.ts`, `src/main/utils/dirs.ts`, `src/main/utils/encrypt.ts`
5. Update renderer files if UI reflects service/auth state:
    - `src/renderer/src/components/mihomo/serviceModal.tsx`, etc.

**Example:**
```typescript
// src/main/service/api.ts
export function startService() { /* ... */ }
```
```tsx
// src/renderer/src/components/mihomo/serviceModal.tsx
import { startService } from '../../../main/service/api';
```

---

### Log System Enhancement

**Trigger:** When you want to add, improve, or fix log system features, including settings, real-time updates, or log storage.  
**Command:** `/enhance-logs`

1. Update main process log logic:
    - `src/main/utils/log.ts`, `src/main/core/mihomoApi.ts`, `src/main/core/manager.ts`, `src/main/utils/ipc.ts`
2. Update shared types if log data shape changes:
    - `src/shared/types/app.d.ts`, `src/shared/types/controller.d.ts`
3. Update renderer components/pages for log display or settings:
    - `src/renderer/src/pages/logs.tsx`, `src/renderer/src/components/mihomo/logSetting.tsx`, `src/renderer/src/utils/mihomoLogStore.ts`
4. Update utility files for IPC or log store if needed:
    - `src/renderer/src/utils/ipc.ts`, `src/renderer/src/utils/mihomoLogStore.ts`

**Example:**
```typescript
// src/main/utils/log.ts
export function getLogs() { /* ... */ }
```
```tsx
// src/renderer/src/pages/logs.tsx
import { getLogs } from '../../../main/utils/log';
```

---

### Installer or Platform Script Update

**Trigger:** When you need to fix or enhance installation/uninstallation for a specific platform or update how binaries/services are handled during install.  
**Command:** `/update-installer-scripts`

1. Edit installer scripts:
    - `build/installer.nsh`, `build/linux/postinst`, `build/linux/preinst`, `build/pkg-scripts/postinstall`, `build/pkg-scripts/preinstall`
2. Update `electron-builder.yml` or related config if needed.
3. Update main process files if install logic affects runtime:
    - `src/main/core/manager.ts`, `src/main/resolve/autoUpdater.ts`, `src/main/utils/ipc.ts`
4. Update renderer utils if IPC contract changes:
    - `src/renderer/src/utils/ipc.ts`

**Example:**
```nsh
; build/installer.nsh
WriteRegStr HKLM "Software\Sparkle" "InstallPath" "$INSTDIR"
```
```typescript
// src/main/core/manager.ts
export function handleInstallEvent() { /* ... */ }
```

---

### Feature or Setting Addition with Shared Types

**Trigger:** When adding a new setting, feature, or option that needs to be reflected in both backend and frontend, with type safety.  
**Command:** `/add-setting-feature`

1. Update or add logic in main process:
    - `src/main/core/manager.ts`, `src/main/utils/template.ts`, `src/main/sys/sysproxy.ts`, etc.
2. Update shared types to reflect new fields or settings:
    - `src/shared/types/app.d.ts`
3. Update renderer UI to surface new feature/setting:
    - `src/renderer/src/pages/*.tsx`, `src/renderer/src/components/**/*.tsx`, `src/renderer/src/utils/*.ts`

**Example:**
```typescript
// src/shared/types/app.d.ts
export interface AppSettings {
  enableFeatureX: boolean;
}
```
```tsx
// src/renderer/src/components/settings/FeatureXToggle.tsx
import { AppSettings } from '../../../../shared/types/app';
```

## Testing Patterns

- **Test files** use the pattern `*.test.*`.
- The testing framework is not explicitly specified.
- Place test files alongside the code or in a `__tests__` directory.
- Example:
    ```
    src/main/utils/log.test.ts
    src/renderer/src/components/mihomo/serviceModal.test.tsx
    ```

## Commands

| Command                   | Purpose                                                            |
|---------------------------|--------------------------------------------------------------------|
| /update-service-auth      | Update service lifecycle, authentication, or storage logic          |
| /enhance-logs             | Enhance log handling, settings, or real-time log features          |
| /update-installer-scripts | Update installer or platform-specific install/uninstall scripts     |
| /add-setting-feature      | Add or update a feature/setting with shared type definitions       |
```