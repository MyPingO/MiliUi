# Responsive Components

MiliUI's responsive component layer extends the layout foundation into composed controls. Component roots accept the same `MiliUI.LayoutProps` used by primitives, and components with MiliUI-owned internal geometry reflow those internals when their root size changes.

This means composed controls can safely participate in `UI.Row`, `UI.Column`, and `UI.Responsive` layouts without leaving MiliUI-owned visuals at their original construction size.

For the higher-level responsive strategy, focus fallback, layout diagnostics, and the TextWindow breakpoint finding, see [`ResponsiveFoundation.md`](ResponsiveFoundation.md).

## Runtime status

The responsive foundation and representative composed controls have now been validated in Test Play across normal, narrow, extreme, short, and combined micro/short safe-area conditions.

Confirmed behaviors include:

- three-column responsive grids at roomy sizes;
- automatic reduction to fewer columns as width tightens;
- focus fallback when useful minimum width/height can no longer be preserved;
- `ProgressBar`, `Slider`, `SegmentedControl`, Cards, and text content remaining usable through those transitions;
- one native `TextWindow` remaining clean through the same transitions;
- layout diagnostics reporting an intentionally introduced 2.00-unit bottom overflow exactly.

This does not mean every arbitrary component composition is impossible to misuse. Rich components still need realistic minimum useful sizes, and project-specific layouts should be stress-tested when they contain unusual nesting or density.

## Covered components

The responsive component pass covers:

- `UI.Badge` / `UI.Chip`
- `UI.Stat`
- `UI.ProgressBar`
- `UI.Slider`
- `UI.IconButton`
- `UI.Toggle`
- `UI.Checkbox`
- `UI.Stepper`
- `UI.SegmentedControl`
- `UI.Tabs`
- `UI.Alert`
- `UI.ToastManager`
- `UI.Modal`

`UI.Card`, `UI.Panel`, `UI.Button`, and the primitive controls use the responsive core directly.

Native wrappers such as `UI.KeyHint`, `UI.TextWindow`, `UI.GridScroller`, and `UI.Native` pass their root layout through `Core.Rect`. Their engine-owned internals are intentionally left to the host.

## Example

```lua
local screen = UI.Screen(script.object, {
    padding = 48,
})

local page = UI.Column(screen, {
    width = "100%",
    height = "100%",
    gap = 16,
    align = "stretch",
})

local header = UI.Row(page, {
    fillWidth = true,
    height = 72,
    gap = 12,
    align = "center",
})

local body = UI.Responsive(page, {
    name = "SettingsBody",
    grow = 1,
    fillWidth = true,
    gap = 20,
    maxColumns = 3,
    minCellWidth = 320,
    minCellHeight = 230,
})

UI.Slider(body, {
    name = "AudioSlider",
    minWidth = 300,
    minHeight = 220,
})

UI.Stepper(body, {
    name = "RoundStepper",
    minWidth = 260,
    minHeight = 220,
    min = 1,
    max = 8,
})
```

The same component roots are resized/repositioned as the available safe area changes. No Wide/Medium/Narrow copies are required.

## Component-specific behavior

### Display components

Badge, Stat, and ProgressBar resize their text/content regions from the current root size. ProgressBar preserves its normalized value while recomputing the fill width.

### Slider

Slider keeps `thumbSize` and `trackHeight` as explicit authored dimensions while its track length follows the root width. Cursor-to-value conversion uses the current track width after every reflow.

### Toggle and Checkbox

The switch/box remains an authored fixed-size control. The label region expands or contracts with the responsive root, and the full hitbox follows the root size.

### Stepper

The minus/plus buttons preserve `buttonWidth`, move to the current left/right edges, and fill the current root height. The center value region consumes the remaining width.

### SegmentedControl

All segments are recalculated from the current root width. Gap remains fixed while segment widths divide the remaining space evenly.

For compatibility, numeric `width` / `height` values continue to represent the previous inner segment dimensions plus the control's 8-unit outer frame. Percentage dimensions apply to the outer responsive control.

### Tabs

The tab bar spans the current root width, individual tab widths are recalculated evenly, and every persistent tab-content container follows the available body size. Percentage descendants inside tab contents are refreshed after a tab-body resize.

### Alert and Shell

Alerts resize their title/message regions with the panel. Matching shells using percentage dimensions such as `width = "100%"` reflow with the parent rather than remaining at their original resolved size.

### ToastManager

The manager accepts responsive sizing. Toast alerts fill the manager's current width, so changing manager width also changes existing and future toast widths.

### Modal

The overlay defaults to `100%` of its resolved parent instead of a hard-coded canvas size. `width` / `height` describe the dialog card; `overlayWidth` / `overlayHeight` describe the backdrop/input-blocker root.

```lua
local modal = UI.Modal(screen.root, {
    width = "60%",
    minWidth = 420,
    maxWidth = 680,
    height = 340,
    contentWidth = "90%",
})
```

The backdrop fills the screen while the dialog obeys the responsive constraints. Title, close button, and content region reflow from the actual dialog size.

### TextWindow

`UI.TextWindow` is a native wrapper. MiliUI owns its root rectangle, text properties, and public wrapper behavior; the scrolling viewport/mask is engine-owned.

Runtime stress testing confirmed that a single TextWindow behaves correctly when:

- resized repeatedly;
- nested inside responsive Card/Column layouts;
- hidden directly;
- hidden only through an ancestor;
- moved through wide, medium, narrow, extreme, short, and focus-mode responsive arrangements.

A separate stress harness produced dark rectangular masking artifacts when it prebuilt multiple breakpoint trees that each contained their own TextWindow and kept all of those native controls alive simultaneously.

Therefore do not create separate Wide/Medium/Narrow copies of the same TextWindow merely to implement responsive breakpoints. Prefer one responsive tree and resize/reposition the same TextWindow. `UI.Responsive` follows this single-tree pattern naturally.

This is deliberately not treated as a general "hidden TextWindow" bug; direct and ancestor-only hiding both behaved correctly in isolation.

## What stays fixed

Responsive does not mean every internal number becomes a percentage. Component-specific authored dimensions such as Slider thumb size, Stepper button width, Toggle switch size, tab height, and alert text inset remain fixed UI-unit values unless their public props explicitly say otherwise.

This keeps controls visually stable while allowing their outer composition to adapt.

## Minimum useful sizes

A component can be technically resized to dimensions where its internals are no longer useful. Responsive layouts should therefore define realistic `minWidth` / `minHeight` thresholds for rich sections rather than assuming every component can shrink indefinitely.

`UI.Responsive` uses these thresholds to decide when to reduce grid density and, if necessary, switch to focus mode instead of crushing several rich sections into the same small area.

## Diagnostics

During development, run:

```lua
UI.CheckLayout(root, {
    recursive = true,
    print = true,
})
```

to catch controls whose transformed bounds escape their immediate parent. This is especially useful after aggressive safe-area or minimum-size testing.

Use meaningful `name` values on important page/layout controls so warnings identify the actual UI region rather than a generic `Box`.

Diagnostics report geometry mistakes; they do not automatically clip or redesign invalid content.

## Runtime galleries

`examples/ResponsiveComponentGallery.lua` exercises the composed responsive components.

`examples/ResponsiveFoundation.lua` demonstrates the single-tree responsive pattern, automatic grid-density changes, focus fallback, safe-area stress testing, and layout diagnostics.

`examples/ResponsiveStress.lua` exercises larger child counts, mixed minimum useful sizes, nested Responsive layouts, asymmetric safe-area changes, and runtime remove/re-add behavior.
