# Versioning

MiliUI uses version numbers in the form:

```text
major.minor.patch
```

Public beta builds add a prerelease suffix:

```text
0.9.0-beta.1
0.9.0-beta.2
0.9.0-beta.3
```

## Before 1.0

During the public beta, MiliUI is intended for real projects, but API changes may still occur when testing reveals a design problem.

Breaking changes will be called out in release notes and the changelog.

## Runtime, Manager, and IntelliSense versions

These are versioned separately.

- **MiliUI runtime**: the framework used by your game.
- **MiliUI Manager**: the Windows installer/updater.
- **MiliUI IntelliSense**: the VS Code/LuaLS support package.

A normal runtime update does not necessarily require a new Manager or IntelliSense version.

## Finding the runtime version

At runtime:

```lua
print(UI.VERSION)
```

The Manager also shows the runtime version it is prepared to install.

## Release channels

The first public releases use the `beta` channel. Stable releases will use the `stable` channel after sufficient public testing.
