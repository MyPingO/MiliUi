# Image masking

You can use `UI.Image(...)` to hide parts of an image or child control that fall outside a mask. MiliUI passes these masking settings to Miliastra's built-in image control (`ClientUIImageControl`).

A mask determines which parts of its children are visible. For example, you can show a square image inside a rounded shape without its square corners sticking out.

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

- [Multiple Choice Window](MultipleChoiceWindow.md): selection grids with custom item designs
- [Theming](Theming.md): default component styles and custom images
- [Common Mistakes](CommonMistakes.md): sizing and image-related issues
