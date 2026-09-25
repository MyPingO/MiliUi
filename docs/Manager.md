# MiliUI Manager

MiliUI Manager is the recommended Windows installer/updater for MiliUI.

## What it does

The Manager:

- finds Miliastra projects in the normal project folders on your computer;
- lets you select exactly one project at a time;
- can also accept a project folder manually;
- tells you whether MiliUI is missing, current, different, or a custom/development install;
- checks MiliUI's official online release information;
- downloads the current official runtime when needed;
- checks the runtime's SHA-256 file hash before installation to make sure the download matches the official file;
- backs up an existing MiliUI folder;
- safely replaces only the selected project's MiliUI folder.

It intentionally does not provide an "update every project" button.

## Offline behavior

The Manager contains the MiliUI runtime that was current when that Manager build was released.

If the online update check is unavailable, you can still install the runtime bundled with that Manager version.

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

If a runtime release needs a newer Manager, the online release information includes the minimum Manager version. An older Manager will tell you to update the Manager before installing that runtime.
