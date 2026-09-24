# Image masking

MiliUI exposes Miliastra's native `ClientUIImageControl` masking fields through `UI.Image(...)`.

Masking is useful when an image's rectangular bounds should clip its descendants to the image's alpha silhouette. A common example is placing a square texture inside a rounded MiliUI surface.

## Basic mask

```lua
local mask = UI.Image(parent, {
    image = UI.Surface.Rounded("xl", false),
    width = 260,
    height = 90,
    color = "transparent",
    stretch = true,

    enableMask = true,
})

UI.Image(mask, {
    image = 107033,
    width = "100%",
    height = "100%",
    stretch = true,
})
```

The mask image owns the clipping shape. Descendants render only inside its visible alpha area.

## Supported native mask props

`UI.Image(...)` accepts these native ImageControl properties:

```lua
enableMask = true
enableSoftEdge = false
softEdgeMode = Enum.ImageMaskSoftEdgeMode.Percentage
softEdgeWidthX = 0
softEdgeWidthY = 0
horizontalSoftRange = 0
verticalSoftRange = 0
reverseMaskArea = false
```

`reverseMaskArea` is passed through for completeness, but the current Miliastra host has a known bug where inverted masking does not reliably detect opaque pixels. Avoid depending on `reverseMaskArea = true` until the host behavior is fixed and re-tested.

## Clipping custom surface images to a radius

For normal themed surfaces, MiliUI provides a higher-level convenience option:

```lua
UI.Panel(parent, {
    width = 300,
    height = 100,

    backgroundImage = 107033,
    backgroundStretch = true,

    radius = "xl",
    clipToRadius = true,

    border = true,
})
```

When `clipToRadius = true`, MiliUI keeps the custom image as the visible background but places it underneath an invisible native rounded mask matching `radius`.

This is preferable to simply putting a square image underneath a rounded border, because the square corners are actually clipped instead of merely covered.

## Multiple Choice Window image skins

Built-in Multiple Choice Window items support the same behavior through `itemStyle`:

```lua
UI.MultipleChoiceWindow(parent, {
    items = items,

    itemStyle = {
        backgroundImage = 107033,
        backgroundStretch = true,
        radius = "xl",
        clipToRadius = true,

        border = true,
        borderColor = "borderStrong",
        selectedBorderColor = "white",
    },
})
```

This keeps the normal grid, hover, selection, controller navigation, and submit behavior while allowing square texture assets to fit rounded selection tiles cleanly.

See [MultipleChoiceWindow.md](MultipleChoiceWindow.md) for the full selection API, custom renderer path, item theming, and ServerSignal submission contract.

## Selection hover defaults

When `itemStyle.selectedBackground` is explicitly provided and `itemStyle.selectedHoverBackground` is omitted, MiliUI keeps the selected background while hovered instead of falling back to the global accent-hover color.

Set `selectedHoverBackground` explicitly when a distinct selected-hover appearance is desired.

## Related docs

- [MultipleChoiceWindow.md](MultipleChoiceWindow.md) — styled selection grids and custom item renderers
- [Theming.md](Theming.md) — creation-time component defaults and custom images
- [CommonMistakes.md](CommonMistakes.md) — common geometry and asset-authoring pitfalls
