# MiliUI Manager

MiliUI Manager is the recommended Windows installer/updater for MiliUI.

## What it does

The Manager:

- finds Miliastra projects under the normal local project-storage paths;
- lets you select exactly one project at a time;
- can also accept a project folder manually;
- detects missing/current/different/custom MiliUI installations;
- checks the official MiliUI release manifest;
- downloads the current official runtime when needed;
- verifies the runtime's SHA-256 digest before installation;
- backs up an existing MiliUI folder;
- atomically replaces only the selected project's MiliUI folder.

It intentionally does not provide an "update every project" button.

## Offline behavior

The Manager contains the MiliUI runtime that was current when that Manager build was released.

If the online update check is unavailable, the bundled runtime remains usable.

## Files installed into a project

A managed production install contains only:

```text
external_lua_file/
└─ MiliUI/
   └─ init.lua
```

The readable MiliUI development source is not installed.

## Backups

Backups are stored outside the Miliastra project under:

```text
%LOCALAPPDATA%\MiliUI Manager\Backups
```

Downloaded verified runtimes are cached under:

```text
%LOCALAPPDATA%\MiliUI Manager\Downloads
```

## Updating the Manager itself

Most MiliUI runtime updates do not require a new Manager.

If a release requires a newer Manager, the release manifest declares a minimum Manager version and the old Manager will tell you to update it before installing that runtime.
