# Responsive Layout

MiliUI's responsive layout layer builds on `UI.Screen`, percentage dimensions, persistent `UI.Row` / `UI.Column` containers, size constraints, and aspect-aware composition.

The goal is to remove most manual coordinate math without recreating a full browser-style flexbox engine.

## Screen root

```lua
local screen = UI.Screen(script.object, {
    padding = 48,
    background = "page",
})
```

`screen.root` covers the full canvas. Passing `screen` itself as a parent routes normal content into the padded `screen.content` area.

The canvas size is read when the screen is created. `screen:Refresh()` remains an explicit escape hatch for projects that can change canvas size during runtime, but responsive layout does not depend on continuous polling.

## UI units, not physical pixels

Numeric layout values are Miliastra UI units, not literal physical screen pixels. The editor authors UI against a 1600x900 reference design space and the host scales those values with the player's screen.

For example:

```lua
UI.Card(parent, {
    width = 300,
    height = 120,
})
```

means 300 by 120 UI units. It should remain the same relative authored size as the host scales the UI to another resolution. In runtime testing on a 2560x1440 display, a `width = 300` sidebar measured roughly 472 physical screen pixels, while still behaving as the expected fixed-width sidebar inside the MiliUI layout.

Do not use numeric MiliUI dimensions as promises about physical pixel counts. Use them as editor/reference-space units. Use percentages and `grow` when a relationship to the available content area matters more than the authored reference size.

## Native Client Control hierarchy

Runtime testing confirms that Client UI Control anchors resolve against the **immediate parent control**, not the full canvas.

A horizontally stretched child using:

```lua
child:SetAnchorMin(0, 0.5)
child:SetAnchorMax(1, 0.5)
child:SetSizeDelta(-60, 50)
```

behaved as a parent-width stretch with a 60-unit total horizontal inset. Resizing the parent from 600 to 900 UI units widened the child from the equivalent of 540 to 840 UI units without changing its reported `SizeDelta`.

That distinction matters because `SizeDelta` is not always the final rendered size. For a stretched axis, the useful mental model is:

```text
rendered axis size
≈ parent axis size × (anchorMax - anchorMin)
  + SizeDelta
```

The same runtime test confirmed that:

- a fixed-size child anchored at `anchorX = 1` stays attached to the immediate parent's right edge when that parent resizes;
- a child stretched from `0,0` to `1,1` grows and shrinks with the immediate parent on both axes;
- `SetLocalScale(...)` on a parent visually scales its descendant hierarchy, including child sizes and offsets;
- child `GetSizeDelta()` values remain their logical authored values while the parent transform changes the final rendered result.

Do not assume Server UI editor anchor behavior applies to Client UI Controls. MiliUI's own percentage/grow system still resolves relationships explicitly against wrapper content rectangles, but the underlying Client Control hierarchy is also genuinely parent-relative.

## Percentage dimensions

Basic MiliUI controls can use percentage width/height values:

```lua
UI.Box(parent, {
    width = "100%",
    height = "50%",
})
```

Percentages resolve against the resolved parent content rectangle. For example, a direct child of `UI.Screen` resolves against `screen.content`, while a direct child of `UI.Row` or `UI.Column` resolves against that stack's padded `content` rectangle.

`fillWidth = true` and `fillHeight = true` are convenience requests equivalent to filling the corresponding parent axis.

Responsive root sizing now extends through MiliUI's composed display, input, selection, tabs, feedback, and modal components. Components whose internals are owned by MiliUI register resize behavior so their child visuals reflow with the root. See [`ResponsiveComponents.md`](ResponsiveComponents.md) for the component-specific behavior.

Native wrappers such as `KeyHint`, `TextWindow`, `GridScroller`, and `UI.Native` already pass their roots through the responsive core; their engine-owned internals are intentionally left to the host.

## Min / max size constraints

Any standard layout rectangle can constrain either axis:

```lua
UI.Card(parent, {
    width = "80%",
    minWidth = 360,
    maxWidth = 900,
    height = 300,
})
```

The four constraint props are:

```text
minWidth
maxWidth
minHeight
maxHeight
```

Each accepts either a numeric UI-unit value or a percentage of the same parent axis:

```lua
UI.Card(parent, {
    width = "100%",
    minWidth = 320,
    maxWidth = "70%",
    height = 300,
})
```

If a resolved maximum is below the resolved minimum, the minimum wins.

Constraints also participate in Row/Column grow. A grow child can stop expanding at a maximum while another grow child receives the leftover space:

```lua
local row = UI.Row(screen, {
    width = "100%",
    height = 300,
    gap = 20,
})

UI.Card(row, {
    grow = 1,
    minWidth = 220,
    maxWidth = 420,
})

UI.Card(row, {
    grow = 2,
    minWidth = 260,
})
```

Grow starts from each child's minimum, then distributes the remaining main-axis space by weight. If a grow child reaches its maximum, unused space is redistributed across grow children that still have room. If combined minimums exceed the available space, MiliUI honors the minimums and the layout may overflow rather than silently shrink below them.

## Aspect ratio

`aspectRatio` is expressed as width divided by height:

```lua
UI.Image(parent, {
    width = 480,
    aspectRatio = 16 / 9,
})
```

With width supplied and height omitted, MiliUI derives height. The reverse also works:

```lua
UI.Image(parent, {
    height = 240,
    aspectRatio = 4 / 3,
})
```

Inside Row/Column, grow can own the main axis while `aspectRatio` derives an unspecified cross axis:

```lua
UI.Card(row, {
    grow = 1,
    maxWidth = 500,
    aspectRatio = 16 / 9,
})
```

Aspect ratio only fills an axis that is otherwise unspecified. Explicit width and height both win over it. Likewise, explicit conflicting min/max constraints are allowed to break the ratio rather than overflow those bounds.

When `align = "stretch"`, an applicable aspect ratio takes precedence over automatic cross-axis stretch because the ratio is intentionally defining that missing cross size.

## Screen orientation and breakpoint queries

MiliUI does not impose arbitrary device breakpoint names. `UI.Screen` instead exposes the current shape and a generic query helper:

```lua
local orientation = screen:GetOrientation()
-- "landscape", "portrait", or "square"

local isWide = screen:Matches({
    minAspect = 1.9,
})

local hasLargeContentArea = screen:Matches({
    content = true,
    minWidth = 1000,
    minHeight = 600,
})
```

`screen:Matches(...)` supports:

```text
content
minWidth / maxWidth
minHeight / maxHeight
minAspect / maxAspect
orientation
```

Width/height thresholds use Miliastra UI units, not physical pixels. Aspect thresholds are usually the more portable way to detect materially different screen shapes.

This is intentionally a query rather than a built-in `mobile` / `tablet` / `wide` system. Projects can define breakpoints that actually match their UI:

```lua
if screen:Matches({ maxAspect = 1.55 }) then
    -- Build a tighter/stacked composition.
else
    -- Build the standard wide composition.
end
```

Because test-play windows cannot currently be resized live in the normal workflow, the most useful pattern is to choose the composition when the screen is built. If a future host flow changes the canvas while the screen remains alive, `screen:Refresh()` updates the recorded dimensions and the same queries can be evaluated again.

## Row and Column

`UI.Row` lays children left-to-right. `UI.Column` lays children top-to-bottom.

Both expose a padded inner `content` container and accept:

```text
gap
padding
paddingX / paddingY
paddingLeft / paddingRight / paddingTop / paddingBottom
align = start | center | end | stretch
justify = start | center | end | between
```

Example:

```lua
local body = UI.Row(screen, {
    width = "100%",
    height = "100%",
    gap = 24,
    align = "stretch",
    justify = "start",
})
```

Children created directly with the Row/Column wrapper as their parent are automatically registered with the layout. You do not need to call `Add` for normal construction:

```lua
UI.Card(body, {
    width = 300,
    height = "100%",
})

UI.Card(body, {
    grow = 1,
    height = "100%",
})
```

`Add` remains available when adding an existing control or overriding its stored layout metadata:

```lua
row:Add(existingCard, {
    grow = 2,
    minWidth = 280,
    maxWidth = 600,
    alignSelf = "center",
})
```

## Grow

`grow` applies on the stack's main axis.

For a Row, grow divides remaining width. For a Column, grow divides remaining height.

```lua
local row = UI.Row(screen, {
    width = "100%",
    height = 300,
    gap = 20,
})

UI.Card(row, {
    grow = 2,
    height = "100%",
})

UI.Card(row, {
    grow = 3,
    height = "100%",
})
```

After fixed-size children and gaps are accounted for, the first card receives 2/5 of the remaining width and the second receives 3/5 unless min/max constraints cap one of them.

When `grow > 0`, grow owns that child's main-axis size. Use a fixed size or percentage instead when you do not want the stack to distribute the remaining axis space.

## Cross-axis alignment

For a Row, `align` controls vertical placement. For a Column, it controls horizontal placement.

```lua
align = "start"
align = "center"
align = "end"
align = "stretch"
```

`stretch` fills the cross axis only when the child does not already specify an explicit cross-axis size/fill request or an applicable aspect ratio.

A child can override the container with `alignSelf`:

```lua
UI.Button(row, {
    text = "Special",
    width = 180,
    height = 52,
    alignSelf = "end",
})
```

## Main-axis justification

```lua
justify = "start"
justify = "center"
justify = "end"
justify = "between"
```

`between` preserves the configured base `gap` and distributes otherwise-unused main-axis space between children.

The default remains `center` to preserve the previous persistent Stack behavior.

## Nested responsive composition

A typical page can now be expressed without manual X/Y calculations:

```lua
local screen = UI.Screen(script.object, {
    padding = 48,
    background = "page",
})

local body = UI.Row(screen, {
    width = "100%",
    height = "100%",
    gap = 24,
    align = "stretch",
})

local sidebar = UI.Card(body, {
    width = 300,
    height = "100%",
})

local main = UI.Column(body, {
    grow = 1,
    minWidth = 600,
    height = "100%",
    gap = 24,
    align = "stretch",
})

UI.Card(main, {
    width = "100%",
    height = 120,
})

UI.Card(main, {
    width = "100%",
    grow = 1,
})
```

Conceptually:

```text
Screen.content
└── Row
    ├── Sidebar Card (300 UI units)
    └── Main Column (grow 1, min 600 UI units)
        ├── Header Card (120 UI units)
        └── Content Card (grow 1)
```

Nested Row/Column roots propagate size changes through their content boxes, so grow, percentage descendants, percentage constraints, and responsive composed components can be recalculated when an ancestor layout changes.

## Runtime setters

Persistent stacks expose:

```lua
row:SetGap(20)
row:SetPadding(24)
row:SetInsets(24, 24, 32, 24)
row:SetAlign("stretch")
row:SetJustify("between")
row:Refresh()
```

All setters return the stack for chaining.

## Scope

This is intentionally not CSS flexbox. The responsive layer now covers percentage/fill sizing, grow, padding/gap/alignment, min/max constraints, aspect ratios, user-defined screen queries, and reflow for MiliUI-owned composed controls.

It still does not add automatic text measurement, flex-shrink, wrapping, min-content/max-content sizing, percentage X/Y positions, automatic DOM-style reparenting, or a permanent responsive polling loop.

Those features should only be added when a real Miliastra UI use case justifies the additional complexity.
