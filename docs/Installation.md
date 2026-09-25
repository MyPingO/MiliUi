# Installation and Updates

## Recommended installation: MiliUI Manager

MiliUI Manager is the recommended way to install and update MiliUI on Windows.

The Manager:

- looks for Miliastra projects on your computer;
- lets you choose exactly one project at a time;
- tells you whether MiliUI is missing, already current, or different from the official version;
- backs up an existing MiliUI folder before replacing it;
- installs the official production runtime;
- checks the downloaded file before installing it.

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

Once remote updates are enabled for the public beta, the Manager will check MiliUI's small online release file to see which runtime version is current.

The update flow is designed to:

1. download the official runtime;
2. check its SHA-256 file hash (a fingerprint used to confirm the file matches the official release);
3. back up the existing MiliUI folder;
4. replace the MiliUI runtime in one controlled step;
5. leave the rest of your project files untouched.

## Manual installation

Download the production `init.lua` release asset and place it at:

```text
external_lua_file/MiliUI/init.lua
```

If replacing an existing install manually, make your own backup first.

## Development/custom installs

If your MiliUI folder contains extra framework files instead of only the normal production `init.lua`, the Manager treats it as a development/custom install. If you choose to replace it with the production build, the Manager creates a backup first and then installs the normal production folder.

## IntelliSense

Runtime installation and editor declarations are separate. The runtime only needs `MiliUI/init.lua`.

Install the MiliUI IntelliSense VS Code extension separately when you want LuaLS completion and MiliUI type information.
