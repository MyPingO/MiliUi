# ScrollArea

`UI.ScrollArea` is MiliUI's reusable vertical scrolling container. It combines a native image mask with the shared `UI.Scrollbar`, so arbitrary MiliUI controls can scroll inside a clipped viewport without requiring Miliastra's native GridScroller.

## Basic usage

```lua
local area = UI.ScrollArea(parent, {
    width = 520,
    height = 320,
    contentHeight = 900,
})

UI.Card(area.content, {
    y = 350,
    width = "90%",
    height = 120,
})
```

Parent scrollable controls to `area.content`, not directly to `area.root`.

`contentHeight` is explicit in v1. MiliUI uses it to compute the scroll range and scrollbar thumb length:

```text
max scroll offset = contentHeight - viewportHeight
```

When the content fits, the scrollbar is hidden and the viewport reclaims the full width. Set `alwaysShowScrollbar = true` if a stable reserved lane is preferred.

## Interactive and nested content

ScrollArea only owns clipping and vertical movement. Child controls keep their normal interaction behavior.

For example, buttons, toggles, checkboxes, sliders, Tabs, Selects, Cards, Rows, and Columns can all live under `area.content`:

```lua
local column = UI.Column(area.content, {
    width = "100%",
    height = "100%",
    padding = 16,
    gap = 12,
    align = "stretch",
})

UI.Button(column, {
    fillWidth = true,
    height = 52,
    label = {
        text = "TRACK MISSION",
        needsTranslation = false,
    },
})

UI.Checkbox(column, {
    fillWidth = true,
    height = 52,
    label = {
        text = "Show completed",
        needsTranslation = false,
    },
})
```

Pressable controls inside `area.content` participate in grab-to-scroll automatically. This includes Buttons/IconButtons, Toggle, Checkbox, Stepper Buttons, SegmentedControl segments, Tabs, Select triggers, MultipleChoiceWindow choices, PlayingCard, and ordinary `UI.Hitbox` click surfaces.

When a press moves far enough for Miliastra to emit `CursorBeginDrag`, the ScrollArea claims that gesture. MiliUI cancels the child's pending activation and resets its pressed/hover transform before scrolling. Releasing after the drag therefore scrolls instead of accidentally toggling, selecting, opening, or clicking the control that received the original press. A press/release that never becomes a drag remains the control's normal activation.

Drag-owning controls intentionally keep their own gesture. `UI.Slider` keeps horizontal slider dragging and `UI.Scrollbar` keeps thumb/arrow interaction rather than moving an ancestor ScrollArea. Custom `UI.Button` and `UI.Hitbox` controls can make the same choice with `parentScroll = false`:

```lua
local dragSurface = UI.Hitbox(area.content, {
    width = 240,
    height = 80,
    parentScroll = false,
})
```

Focusable Buttons and click Hitboxes that participate in parent scrolling also let the containing ScrollArea consume Right Stick scrolling while they are focused.

Nested ScrollAreas are supported when a real interface needs independent inner and outer scroll regions. Use nesting deliberately; one ScrollArea is easier to navigate when the design does not genuinely need independent scroll regions.


## Coordinate model

Scroll offsets are measured downward from the top of the logical content:

```lua
area:GetScrollOffset()      -- 0 at the top
area:GetMaxScrollOffset()   -- bottom-most offset
area:GetScrollRatio()       -- normalized 0..1
```

Programmatic scrolling:

```lua
area:ScrollBy(80)
area:ScrollTo(240)
area:ScrollToRatio(0.5)
area:ScrollToStart()
area:ScrollToEnd()
```

Pass `true` as the final argument when a programmatic call should fire `onScroll` / `OnScroll`:

```lua
area:ScrollTo(240, true)
```

Arrow buttons use `scrollStep`, which defaults to 48 UI units.

## Dynamic content height

If content grows or shrinks at runtime, update the logical height:

```lua
area:SetContentHeight(1200)
```

The viewport width, scrollbar range, and thumb length are recalculated automatically. If the current offset is beyond the new range, it is clamped.

For normal responsive composition, put a persistent layout inside `area.content`:

```lua
local column = UI.Column(area.content, {
    width = "100%",
    height = "100%",
    gap = 12,
    padding = 16,
})
```

When `SetContentHeight(...)` changes the content container size, MiliUI refreshes percentage/fill descendants so layout roots such as `Column` can reflow.

Keep `contentHeight` accurate. If it is smaller than the actual arranged content, the bottom items may legitimately overflow the logical content container and diagnostics can report that mistake.

## Shared scrollbar

`area.scrollbar` is a normal `MiliUI.Scrollbar`. The default appearance comes from `UI.Theme.scrollbar`:

```lua
UI.Theme.Apply({
    scrollbar = {
        trackImage = 100001,
        trackColor = "surface2",
        thumbImage = 106007,
        thumbColor = "accent",
        thumbHoverColor = "accentHover",
    },
})
```

ScrollArea-specific overrides use the `scrollbar...` prefix:

```lua
local area = UI.ScrollArea(parent, {
    contentHeight = 900,
    scrollbarWidth = 28,
    scrollbarThumbWidth = 12,
    scrollbarThumbColor = "success",
})
```

The shared theme remains the fallback because ScrollArea delegates the actual scrollbar to `UI.Scrollbar`.

## Clipping and viewport shape

The viewport uses native `ImageControl` masking. Square clipping is the default.

For rounded clipping:

```lua
local area = UI.ScrollArea(parent, {
    width = 520,
    height = 320,
    contentHeight = 900,
    viewportRadius = "lg",
})
```

You can also supply a custom opaque mask asset with `maskImage`.

Because overflow beneath an active native mask is intentional and visually clipped, `UI.CheckLayout(...)` does not report a direct child merely for extending beyond a masking parent. Descendants are still checked normally against their own layout parents.

## Events and state

```lua
area:OnScroll(function(offset, ratio, control)
    print(offset, ratio)
end)

area:SetEnabled(false)
area:SetEnabled(true)
```

Disabling the ScrollArea disables scrollbar interaction but does not hide or reposition content.

Useful exposed controls:

```lua
area.root
area.viewport
area.content
area.scrollbar
```

## Current scope

ScrollArea v1 is vertical only and uses an explicit logical `contentHeight`. It does not attempt automatic descendant measurement, mouse-wheel input, inertial scrolling, or horizontal scrolling. Those can be added later if the Miliastra host exposes reliable input support and real interfaces need them.
