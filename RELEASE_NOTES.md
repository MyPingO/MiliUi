# MiliUI 0.9.0-beta.1

MiliUI's first public beta packages the framework for real Miliastra creator testing while keeping framework development centralized.

## Highlights

- reusable Lua UI primitives and composed components;
- responsive Row/Column layouts, intrinsic sizing, and Screen helpers;
- theming and localization support;
- ScrollArea and Scrollbar with pressable-child drag cancellation;
- Hosts, Pages, and Session state;
- keyboard/mouse and controller interaction;
- native controller navigation, Confirm activation, and focus indicators;
- motion, managed audio, and selected native-control wrappers;
- MiliUI Manager for installation, backup, and verified runtime updates;
- MiliUI IntelliSense for VS Code/LuaLS;
- public Quick Start, controller guide, component docs, and beginner examples.

## Release-candidate hardening

Before the public beta, the runtime and documentation received a focused in-game validation pass covering:

- text clipping and localization-safe sizing;
- theme apply/restore behavior;
- managed audio;
- native UI Animation controls;
- explicit controller focus/navigation between UI regions;
- native GridScroller behavior;
- the `UI.Native` escape hatch;
- ScrollArea gesture ownership for Buttons, Toggle, Checkbox, Tabs, SegmentedControl, Select triggers, MultipleChoiceWindow choices, PlayingCard, and ordinary click Hitboxes.

Drag-owning controls such as Slider and Scrollbar retain their own drag behavior rather than moving an ancestor ScrollArea.

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
