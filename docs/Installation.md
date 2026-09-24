# Installation and Updates

## Recommended installation: MiliUI Manager

MiliUI Manager is the recommended way to install and update MiliUI on Windows.

The Manager:

- scans for Miliastra projects;
- lets you choose exactly one project at a time;
- detects whether MiliUI is missing, current, or different;
- backs up an existing MiliUI folder before replacement;
- installs the official production runtime;
- verifies the downloaded runtime before installation.

A managed project contains only:

```text
external_lua_file/
└─ MiliUI/
   └─ init.lua
```

The readable MiliUI development source is not installed into game projects.

## Installing

1. Download `MiliUI-Manager.exe` from the latest GitHub Release.
2. Open the Manager.
3. Select your Miliastra project.
4. Click **Install MiliUI**.
5. Restart Test Play.

## Updating

Once remote updates are enabled for the public beta, the Manager will check the official public release manifest and offer the newest runtime.

The update flow is designed to:

1. download the official runtime;
2. verify its SHA-256 digest;
3. back up the existing MiliUI folder;
4. atomically install the new runtime;
5. leave other project files untouched.

## Manual installation

Download the production `init.lua` release asset and place it at:

```text
external_lua_file/MiliUI/init.lua
```

If replacing an existing install manually, make your own backup first.

## Development/custom installs

MiliUI Manager intentionally treats a MiliUI folder containing additional framework files as a development/custom install. Replacing it with the production build removes those extra files from the project after creating a backup.

## IntelliSense

Runtime installation and editor declarations are separate. The runtime only needs `MiliUI/init.lua`.

Install the MiliUI IntelliSense VS Code extension separately when you want LuaLS completion and MiliUI type information.
