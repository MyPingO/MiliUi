# MiliUI 0.9.0-beta.2

This beta updates the public MiliUI runtime, reference documentation, and editor declarations with systems validated during the development cycle after beta.1.

## Highlights

- Optional sequential Page navigation through `UI.Navigation`, including Push, Replace, Back, Reset, per-Host history, and Session-backed restoration.
- Optional `slideLeft` and `slideRight` Page transitions with configurable duration. Without transition options, Navigation remains immediate.
- `UI.Accordion` collapsible sections with fitted content, controller-focusable headers, and optional remembered state.
- `UI.Select` dropdown improvements, including a same-Host overlay portal for placement beyond clipped/scrolling containers.
- Expanded `UI.Motion` preset library for reusable scale, slide, position, and rotation feedback effects.
- Host-owned incoming Server Signal and Custom Variable subscriptions through `UI.Signals` and `UI.Variables`.
- Native controller focus navigation for Rows, Columns, and ScrollColumns, automatic scroll-to-focused-Button, stable press/release states, and visible above-content focus chevrons.

## Added

- `UI.Navigation.Push`, `Replace`, `Back`, `Reset`, `GetCurrent`, `GetHistory`, and `CanGoBack`, plus Page-context shortcuts.
- `UI.Accordion` with `remember = true` support.
- More `UI.Motion` effects including `SlideIn`, `BounceIn`, `Nudge`, `Wobble`, `Punch`, `Squash`, `SpinIn`, `Hop`, `Swing`, `RubberBand`, `DropIn`, `Slam`, and `Breathe`.
- Host-scoped `UI.Signals.Listen` and `UI.Variables.Watch` utilities.

## Changed

- `UI.Select` dropdowns now open through an overlay belonging to their existing Host/page rather than remaining clipped by a parent `ScrollArea` or `Accordion`.
- `UI.Player` now resolves the current Player Entity from a configured `PlayerSelf` Custom Variable. Signal-driven Player registration is no longer needed.
- Controller-focus indicators now support inset and outside placement, with a dedicated focus overlay that stays above scroll-list Buttons and permits horizontal overhang while clipping vertically.
- MiliUI Manager preserves a newer bundled beta runtime when the published online manifest still points to an older beta; newer public releases continue to update normally.
- MiliUI IntelliSense 0.1.8 provides plain-language property and function hover descriptions, examples for Row/Column sizing, responsive layouts, controller focus, and common components, plus a beginner-oriented VS Code extension guide.

## Breaking change: Player setup

The old `UI.Player.SetEntity`, `IsRegistered`, and `RegisterFromSignal` APIs have been removed.

Instead, create an Entity-valued Player Custom Variable referencing the current Player Entity and configure its name from shared client initialization:

```lua
UI.Player.Configure("PlayerSelf")
```

Use `UI.Player.GetEntity()` or `UI.Player.RequireEntity()` in scripts that need the Entity. `"PlayerSelf"` is an example variable name; use your actual Custom Variable name. See the public Player guide for complete setup.

## Installation and upgrade

MiliUI Manager is the recommended installation/update path. Updating the runtime replaces `MiliUI/init.lua` after creating a backup. Restart Test Play after updating.

The runtime, Windows Manager, IntelliSense VSIX, manifest, and optional `MiliUI-Template-Save-File.gil` are included in the GitHub Release.

**Starter-save note:** beta.2 carries forward the *unchanged* official beta.1 starter save, verified against its published SHA-256. It is an optional starting project; install/update the new beta.2 runtime after importing the save. A newly rebuilt and in-game revalidated starter save is not claimed.

## Known limitations

- Some PC controller configurations apply Miliastra-native UI safe-area padding.
- On affected PC Test Play builds, native controller focus must be initialized by restarting the level after switching into Controller mode; switching input mid-level can leave native focus unavailable.
- Navigation does not yet automatically restore controller focus or scroll position.
- Native fullscreen UI animations render behind normal UI layers.
- Native `reverseMaskArea` remains unreliable.
- Preferred wrapped-text height is estimated by the framework.

This remains a beta release. Please report reproducible issues through the public repository and the community support channel.
