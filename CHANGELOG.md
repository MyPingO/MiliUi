# Changelog

All notable public MiliUI releases will be recorded here.

## [0.9.0-beta.1] - Unreleased

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
