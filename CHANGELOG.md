# Changelog

All notable public MiliUI releases will be recorded here.

## Unreleased

## [0.9.0-beta.2] - 2026-10-10

### Added

- Per-Host sequential `UI.Navigation` history, Page-context shortcuts, and optional directional slide transitions.
- Collapsible `UI.Accordion` with automatic content sizing and remembered state.
- Reusable `UI.Motion` effects for entrance and interaction feedback.
- Host-scoped Server Signal and Custom Variable subscriptions.
- Native controller Row/Column navigation, focused-item auto-scroll, and configurable inside/outside focus chevrons.

### Changed

- `UI.Select` dropdown menus now use a same-Host overlay portal to escape clipped/scrolling parent containers.
- Controller Confirm press-state cleanup is centralized, and scroll focus chevrons render above Buttons with horizontal overhang and vertical viewport clipping.
- The Windows Manager no longer replaces a newer bundled beta runtime with an older runtime from the public manifest.
- IntelliSense 0.1.8 now explains commonly confusing properties in plain language, fills missing hover descriptions, and includes beginner-friendly examples and a layout quick start.
- Release packages include the pinned, unchanged starter `.gil` from beta.1.

### Breaking changes

- Replaced signal-based `UI.Player` registration with `UI.Player.Configure(customVariableName)` and a `PlayerSelf` Custom Variable. Removed `SetEntity`, `IsRegistered`, and `RegisterFromSignal` (see release notes for migration).

### Known limitations

- Native PC controller safe-area padding and controller focus initialization during a running Test Play level remain engine limitations. Native fullscreen animation layering, inverted native masks, and estimated wrapped-text heights also remain limitations.
- Navigation does not yet restore controller focus or scroll position.

## [0.9.0-beta.1] - 2026-09-25

Initial public beta.

### Added

- production single-file MiliUI runtime;
- MiliUI Manager installer/updater with backup and SHA-256 verified runtime updates;
- MiliUI IntelliSense package for VS Code/LuaLS;
- responsive layouts and common UI primitives;
- composed inputs, display components, ScrollArea, and Scrollbar;
- Hosts, Pages, and Session state;
- theming and localization helpers;
- interaction, motion, managed audio, and native-control wrappers;
- keyboard/mouse and controller navigation support;
- controller focus indicators and explicit directional navigation guidance;
- public Quick Start, component documentation, and beginner examples.

### Hardened before release

- localization-safe intrinsic text/Button sizing and wrapped TextWindow guidance;
- ScrollArea drag cancellation across ordinary pressable controls;
- Slider/Scrollbar drag ownership inside parent ScrollAreas;
- controller Confirm/focus examples;
- GridScroller runtime behavior and documentation;
- UI.Native guidance and native-control examples.

### Known limitations

See [KNOWN_ISSUES.md](KNOWN_ISSUES.md).
