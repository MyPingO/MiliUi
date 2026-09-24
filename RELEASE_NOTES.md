# MiliUI 0.9.0-beta.1

MiliUI's first planned public beta packages the framework for real creator testing while keeping framework development centralized.

## Highlights

- reusable Lua UI primitives and composed components;
- responsive Row/Column layouts and Screen helpers;
- theming and localization support;
- ScrollArea and Scrollbar;
- Hosts, Pages, and Session state;
- keyboard/mouse and controller interaction;
- native controller navigation and Confirm activation;
- animated controller focus indicators;
- motion, audio, and selected native-control wrappers;
- MiliUI Manager for installation and verified runtime updates;
- MiliUI IntelliSense for VS Code/LuaLS;
- public Quick Start and beginner examples.

## Installation

The recommended path is **MiliUI Manager**.

1. Download `MiliUI-Manager.exe` from this release.
2. Select the Miliastra project you want to use.
3. Install MiliUI.
4. Restart Test Play.

Advanced users can install `MiliUI-init.lua` manually at:

```text
external_lua_file/MiliUI/init.lua
```

## Public beta expectations

This is a beta release. The API is intended for real projects, but breaking changes may still occur before 1.0 when public testing exposes a design problem.

Please report:

- setup friction;
- confusing documentation;
- reproducible component bugs;
- controller/navigation issues;
- responsive-layout edge cases;
- missing APIs that repeatedly block real projects.

See `KNOWN_ISSUES.md` for current known limitations.
