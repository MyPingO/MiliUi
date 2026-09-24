# Scrollbar

`UI.Scrollbar` is MiliUI's reusable vertical scrollbar primitive. It owns the arrow buttons, draggable thumb, numeric range, step snapping, shared scrollbar theme, and value-change events without requiring Miliastra's native GridScroller.

## Basic usage

```lua
local scrollbar = UI.Scrollbar(parent, {
    min = 1,
    max = 20,
    value = 1,
    step = 1,
    pageSize = 5,
    height = 280,
})

scrollbar:OnChange(function(value)
    print("first visible item", value)
end)
```

Lower values are at the top. Higher values move the thumb downward.

## Range and value

```lua
scrollbar:GetValue()
scrollbar:GetRatio()

local minimum, maximum = scrollbar:GetRange()

scrollbar:SetValue(8, true)
scrollbar:ScrollBy(1, true)
scrollbar:SetRange(1, 30)
```

`step` snaps values to a stable increment. Programmatic setters fire `OnChange` only when `fireEvent == true`, matching the normal MiliUI input convention.

The up/down buttons use `buttonStep`. When omitted, it defaults to `step`, or one tenth of the current range when no step is configured.

## Thumb sizing

For scrollable content, `pageSize` is usually the easiest option:

```lua
UI.Scrollbar(parent, {
    min = 1,
    max = 16,
    pageSize = 5,
})
```

MiliUI derives the visible thumb fraction as:

```text
pageSize / ((max - min) + pageSize)
```

This works naturally for list windows. For 20 total items with 5 visible at once, the first-visible-index range is `1..16`, and `pageSize = 5` produces a thumb representing 5/20 of the logical content.

For direct visual control, use `thumbFraction` or `SetThumbFraction(...)` instead:

```lua
scrollbar:SetThumbFraction(0.35)
```

Calling `SetPageSize(...)` switches back to page-size-derived sizing.

## Shared theme

`UI.Scrollbar` consumes `UI.Theme.scrollbar` directly. The built-in theme uses the same visual language established for Select:

- rectangular dark track;
- light-rounded blue thumb;
- brighter blue hover/drag state;
- image-backed arrow controls.

```lua
UI.Theme.Apply({
    scrollbar = {
        trackColor = "surface2",
        trackImage = 100001,
        thumbColor = "accent",
        thumbHoverColor = "accentHover",
        thumbImage = 106007,
    },
})
```

Explicit `UI.Scrollbar` constructor props override the shared theme values.

`trackEndInset` shortens only the visible rail at each end while preserving the full logical thumb travel. The built-in fallback is `1`, which prevents the square track from peeking beyond the rounded thumb at its minimum and maximum positions.

## Runtime controls

```lua
scrollbar:SetEnabled(false)
scrollbar:SetEnabled(true)

scrollbar:OnChange(function(value, control)
end)

scrollbar:Destroy()
```

Dragging compensates for nested MiliUI scale through `Core.ScreenDeltaToLocal`, matching Slider and Select scrollbar behavior.

## Composed-control integration

Long-list `UI.Select` composes this same `UI.Scrollbar` internally instead of maintaining a separate scrollbar implementation. Select maps its visible-item window to a 1-based scrollbar range, keeps one-row arrow increments, and uses `pageSize` so the thumb size still represents the visible fraction of the item list.

`UI.ScrollArea` also composes `UI.Scrollbar`, mapping arbitrary content height to a pixel-style scroll range from `0` to `contentHeight - viewportHeight`.

The shared `UI.Theme.scrollbar` section therefore controls the visual language for standalone scrollbars and scrollable composed controls unless a component supplies explicit overrides.

## Current scope

Scrollbar v1 is vertical only. It intentionally does not move arbitrary content itself; use `UI.ScrollArea` when a masked scrollable content container is needed. It also does not invent mouse-wheel behavior because the current Miliastra cursor-event API does not expose a reliable wheel event.
