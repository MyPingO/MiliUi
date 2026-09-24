# Responsive Foundation

MiliUI's responsive foundation is designed around one principle:

> Express layout intent so developers do not have to maintain fragile coordinate arithmetic.

The lower-level `UI.Row`, `UI.Column`, percentage sizing, `grow`, min/max constraints, and `UI.Screen` safe-area APIs remain the normal tools for flow layout. `UI.Responsive` is the higher-level tool for layouts whose information density must change when the available safe area changes materially.

## Runtime status

The current responsive foundation has been validated in Test Play against aggressive safe-area changes and nested scrolling compositions.

Runtime-confirmed behavior includes:

- `UI.Screen` safe-area insets resizing the available content area;
- `UI.Column` with a fixed-height header and `grow = 1` responsive body consuming the remaining height without manual offset math;
- `UI.Responsive` changing from three columns to fewer columns as width becomes constrained;
- `UI.Responsive` entering `focus` mode when the grid can no longer preserve useful minimum sizes;
- `Next()`, `Previous()`, and `SetFocus(...)` cycling the same existing control tree in focus mode;
- one native `TextWindow` remaining clean while the responsive layout changes density and enters focus mode;
- native Client UI Control stretch anchors resolving against the immediate parent, with parent local scale propagating visually through descendants;
- `UI.Scrollbar` working inside Row/Column layouts, including percentage/fill sizing;
- `UI.ScrollArea` clipping arbitrary interactive controls, nesting inside another ScrollArea, and composing with `Select`, Tabs, inputs, Cards, and persistent layouts;
- `UI.CheckLayout(...)` detecting an intentionally introduced **2.00 UI-unit bottom overflow exactly**;
- the recent scrollable-component stress harness completing with `layoutIssues=0` and `textIssues=0` after the tested fixes.

The responsive runtime should therefore be treated as a usable foundation, not only an experimental prototype. More complex compositions should still be stress-tested because responsive design cannot infer every project's information hierarchy automatically.

## Mental model

Use the layers in this order:

```text
UI.Screen
  owns canvas size and safe-area subtraction

UI.Row / UI.Column
  own ordinary flow, gaps, padding, and remaining-space distribution

UI.Responsive
  changes information density when the available area becomes materially tighter

UI.ScrollArea
  clips and vertically scrolls arbitrary rich child UI when content is intentionally taller than its viewport

UI.Diagnostics / UI.CheckLayout
  reports geometry mistakes that escaped the intended parent bounds
```

This keeps responsibilities narrow. `UI.Responsive` is not intended to replace every Row or Column, and `UI.ScrollArea` is not a substitute for fixing content that should have fit without scrolling.

## Recommended page structure

For ordinary pages, prefer flow layout over manual `x` / `y` math:

```lua
local screen = UI.Screen(script.object, {
    padding = 32,
})

local page = UI.Column(screen, {
    name = "SettingsPage",
    width = "100%",
    height = "100%",
    gap = 16,
    align = "stretch",
})

local header = UI.Row(page, {
    name = "SettingsHeader",
    fillWidth = true,
    height = 72,
    gap = 12,
    align = "center",
})

local body = UI.Responsive(page, {
    name = "SettingsBody",
    grow = 1,
    fillWidth = true,
    maxColumns = 3,
    minCellWidth = 340,
    minCellHeight = 220,
    gap = 20,
})
```

The body receives the remaining height from the Column. Developers do not need to calculate:

```text
available height - header height - gap - safe-area inset
```

That arithmetic belongs to the layout system.

### Name important containers

`name` is optional, but naming significant page/layout controls makes diagnostics substantially easier to read:

```lua
local body = UI.Responsive(page, {
    name = "InventoryBody",
    grow = 1,
    fillWidth = true,
})

UI.Card(body, {
    name = "InventoryFilters",
    minWidth = 320,
    minHeight = 220,
})
```

A diagnostic such as:

```text
MILIUI_LAYOUT_WARNING | control=InventoryFilters | parent=Content | overflow=L0.00 R0.00 T0.00 B2.00
```

is more actionable than one involving several unnamed `Box` controls.

## UI.Responsive

`UI.Responsive` owns **one set of child controls**. It does not create breakpoint copies.

```lua
local body = UI.Responsive(page, {
    name = "DashboardBody",
    grow = 1,
    fillWidth = true,

    maxColumns = 3,
    minCellWidth = 340,
    minCellHeight = 220,
    gap = 20,

    overflow = "focus",
})

UI.Card(body, {
    name = "ProfileSection",
    minWidth = 320,
    minHeight = 220,
})

UI.Card(body, {
    name = "StatsSection",
    minWidth = 320,
    minHeight = 240,
})

UI.Card(body, {
    name = "ActionsSection",
    minWidth = 320,
    minHeight = 220,
})
```

Children created directly with the Responsive wrapper as their parent are added automatically. This is the simplest and preferred path.

### Grid selection

MiliUI chooses the largest column count up to `maxColumns` that can satisfy the useful minimum cell width.

It then calculates the row count and resulting cell height. If both axes still satisfy the useful minimums, the layout remains a grid.

Conceptually:

```text
Wide
[ A ][ B ][ C ]

Medium
[ A ][ B ]
[ C ]
```

The exact column count is driven by available layout space rather than hard-coded device names.

### Focus fallback

When the available area cannot preserve the requested useful minimums, the default `overflow = "focus"` policy stops crushing sections and shows one child in the full responsive area:

```text
Tight
[             A             ]
```

Use:

```lua
responsive:Next()
responsive:Previous()
responsive:SetFocus(2)
```

to choose which section is shown.

This is intentional. "Responsive" does not mean every rich panel remains simultaneously visible at arbitrarily small dimensions. When the original information density is physically impossible, MiliUI preserves usability by changing what is shown at once.

A common navigation pattern is:

```lua
local nextSection = UI.Button(header, {
    label = {
        text = "NEXT SECTION",
        needsTranslation = false,
    },
})

nextSection:OnClick(function()
    responsive:Next()
end)

local function UpdateResponsiveNavigation()
    nextSection.root:SetVisible(responsive:GetMode() == "focus")
end

responsive:OnModeChange(function()
    UpdateResponsiveNavigation()
end)

responsive:OnFocusChange(function()
    UpdateResponsiveNavigation()
end)

UpdateResponsiveNavigation()
```

## Useful minimums are decision thresholds

A Responsive child may provide its own minimum useful size:

```lua
local inventory = UI.Card(body, {
    minWidth = 420,
    minHeight = 300,
})
```

These values help decide whether the grid is still a good presentation. They are **not** permission to force a child beyond the available safe area in focus mode.

That distinction is important:

```text
minWidth / minHeight in Responsive
  = "below this, change the presentation"

not

  = "overflow the screen until this size is satisfied"
```

### Mixed minimum sizes

Different children may use different useful minimums. `UI.Responsive` uses the strictest requirements when deciding whether a uniform grid remains viable.

```lua
UI.Card(body, { minWidth = 300, minHeight = 200 })
UI.Card(body, { minWidth = 420, minHeight = 240 })
UI.Card(body, { minWidth = 340, minHeight = 300 })
```

This is intentionally conservative: the grid should not choose a cell size that makes one of its rich sections unusable.

### Maximum sizes

`maxWidth` / `maxHeight` can keep a grid or focused child from becoming unnecessarily large:

```lua
UI.Card(body, {
    minWidth = 360,
    minHeight = 240,
    maxWidth = 720,
})
```

The capped control remains centered in its assigned cell.

## Dynamic children

The simplest dynamic-add path is to create the new component with the Responsive wrapper as its parent:

```lua
local extra = UI.Card(responsive, {
    name = "ExtraSection",
    minWidth = 320,
    minHeight = 220,
})
```

It is auto-added and the layout refreshes.

`responsive:Remove(value)` removes a child from responsive layout ownership **without destroying the control**:

```lua
responsive:Remove(extra)
extra.root:SetVisible(false)
```

The same still-parented control can later be re-added:

```lua
extra.root:SetVisible(true)
responsive:Add(extra, {
    minWidth = 320,
    minHeight = 220,
})
```

`Add(...)` is intended for controls whose root is already parented under the Responsive content tree. It is not a generic reparenting API.

`Clear()` similarly forgets all responsive children without destroying them.

## Nested responsive layouts

Responsive layouts may be nested when a section has its own internal information-density problem.

```lua
local dashboard = UI.Responsive(page, {
    grow = 1,
    fillWidth = true,
    maxColumns = 3,
    minCellWidth = 340,
    minCellHeight = 240,
})

local inventorySection = UI.Card(dashboard, {
    minWidth = 360,
    minHeight = 260,
})

local inventoryGrid = UI.Responsive(inventorySection.content, {
    width = "92%",
    height = "78%",
    maxColumns = 2,
    minCellWidth = 150,
    minCellHeight = 100,
    gap = 10,
})
```

When the outer section changes size, percentage/fill sizing refreshes the nested Responsive root, which then recomputes its own layout.

Avoid unnecessary nesting. A normal `Row` or `Column` should remain the first choice when the inner structure only needs flow rather than density changes.

## TextWindow and breakpoint trees

Runtime stress testing exposed an important native-control behavior.

The problematic pattern was:

```text
Responsive page
├── Wide variant
│   └── TextWindow
├── Medium variant
│   └── TextWindow
└── Narrow variant
    └── TextWindow
```

All variants existed simultaneously and inactive variants were hidden. Under aggressive resizing, that harness produced dark rectangular rendering/masking artifacts around `TextWindow`.

Follow-up runtime tests established:

- one TextWindow resized repeatedly behaves correctly;
- one TextWindow nested inside Card/Column layouts behaves correctly;
- hiding a TextWindow directly behaves correctly;
- hiding it only through its parent also behaves correctly;
- transparent versus opaque TextWindow background was not the determining factor;
- a single responsive tree containing one TextWindow remained clean through wide, medium, narrow, extreme, short, and focus-mode safe-area tests.

Therefore the guidance is deliberately narrow:

> Do not duplicate specialized native controls such as TextWindow solely to create separate breakpoint copies. Prefer one responsive control tree and resize/reposition the same native control.

This is not evidence that ordinary hidden TextWindows are broken, and MiliUI does not add a special hack inside `UI.TextWindow`.

`UI.Responsive` naturally follows the tested safe architecture because it owns one child tree and changes layout in place.

## Layout diagnostics

Small geometry errors can be difficult to see in the Miliastra Editor. MiliUI provides opt-in bounds diagnostics:

```lua
local issues = UI.CheckLayout(screen.content, {
    recursive = true,
    print = true,
})
```

A detected overflow prints a compact line such as:

```text
MILIUI_LAYOUT_WARNING | control=SettingsBody | parent=ScreenContent | overflow=L0.00 R0.00 T0.00 B2.00
```

The diagnostics were runtime-tested with a control intentionally extending exactly two UI units below its parent; the checker reported `B2.00` and exactly one issue.

This is intended to catch the same class of mistake as a page whose percentage height plus fixed top offset exceeds the available safe area by only a few units.

You can also use:

```lua
UI.Diagnostics.SetEnabled(true)
```

to make `Diagnostics.Check(...)` print by default.

Or watch one root:

```lua
local watcher = UI.Diagnostics.Watch(body.root, {
    recursive = true,
    print = true,
})

watcher:Check()
```

Diagnostics are development tools. They are not automatic clipping and they do not redesign invalid content.

### What diagnostics measure

The checker compares each visible child's transformed local rectangle against its immediate parent's rectangle.

It accounts for:

- anchors;
- pivot;
- SizeDelta;
- local scale;
- local Z rotation;
- anchored position.

Direct overflow beneath an active native image mask is intentionally ignored because the mask defines that clipping boundary; diagnostics still recurse into the masked subtree and validate descendants against their own parents.

Hidden/inactive subtrees are ignored by default. Set `includeHidden = true` when intentionally auditing hidden content.

Use `tolerance` to ignore tiny floating-point differences:

```lua
UI.CheckLayout(root, {
    tolerance = 1,
    print = true,
})
```

## Safe-area rules

`UI.Screen` owns the full canvas and its padded content rectangle.

Normal page content should usually be parented to `screen` rather than `screen.root`:

```lua
local screen = UI.Screen(script.object, {
    paddingLeft = 48,
    paddingRight = 48,
    paddingTop = 64,
    paddingBottom = 40,
})

local page = UI.Column(screen, {
    width = "100%",
    height = "100%",
})
```

Avoid manually subtracting those values again. The screen content area has already done it.

Use `screen.root` only for elements that intentionally ignore the safe area, such as a fullscreen modal backdrop.

## What MiliUI should own

Prefer framework-owned relationships:

```text
Header has fixed height
Body grows into remaining space
Cards declare useful minimum sizes
Responsive decides grid density
Focus mode handles impossible density
ScrollArea clips intentionally tall rich content
Screen owns safe-area subtraction
Diagnostics report escaped bounds
```

Avoid manually encoding the result of those relationships:

```text
body.y = -106
body.height = 80%
panel.x = -478
panel.width = 450
```

Manual coordinates remain valid for art-directed overlays and intentionally absolute compositions. They simply require more care because the framework cannot infer the developer's intent.

## Any-screen-size goal

MiliUI cannot make physically impossible content fit without changing something.

For example, if three panels each require 400 UI units of width, a 600-unit safe area cannot display all three at their intended size.

The framework's job is to make the fallback predictable:

1. use normal flow and `grow` while there is enough room;
2. reduce grid density while useful minimums are satisfied;
3. switch to focus mode instead of crushing content;
4. use `ScrollArea` when a design intentionally exposes more vertical rich content than the viewport can show at once;
5. keep the same control tree rather than duplicating breakpoint variants;
6. report unintended overflow during development.

This preserves usability rather than promising that all original information remains visible simultaneously.

## Scrolling

MiliUI now has two reusable scrolling layers:

- `UI.Scrollbar` is the standalone vertical scrollbar primitive. It owns arrows, drag behavior, numeric range, step snapping, and shared scrollbar theming.
- `UI.ScrollArea` combines that scrollbar with a native ImageControl mask so arbitrary child UI can move through a clipped vertical viewport.

A typical rich-content composition is:

```lua
local area = UI.ScrollArea(parent, {
    width = "100%",
    height = 420,
    contentHeight = 900,
})

local column = UI.Column(area.content, {
    width = "100%",
    height = "100%",
    padding = 16,
    gap = 12,
})

UI.Button(column, {
    fillWidth = true,
    height = 52,
    label = {
        text = "ACTION",
        needsTranslation = false,
    },
})
```

Interactive descendants remain normal controls; ScrollArea only owns clipping and vertical movement. Nested ScrollAreas and Selects inside ScrollArea have been runtime stress-tested. `contentHeight` is explicit in v1 and must be updated with `SetContentHeight(...)` when the logical content height changes.

Use specialized native controls when they better fit the content:

- `TextWindow` for engine-native scrollable text;
- `GridScroller` for engine-native repeated/list content;
- `ScrollArea` for arbitrary composed MiliUI content.

The current Miliastra cursor API still does not expose a reliable mouse-wheel event, so MiliUI uses scrollbar arrows, thumb dragging, and programmatic scrolling rather than inventing unreliable wheel behavior.

See [`ScrollArea.md`](ScrollArea.md) and [`Scrollbar.md`](Scrollbar.md) for the component-specific APIs.

## Development checklist

Before shipping a responsive page:

1. Parent normal content to `UI.Screen`, not the full-canvas root.
2. Prefer `Row`, `Column`, `grow`, padding, and gap over manual offsets.
3. Use one control tree across responsive states.
4. Give complex sections realistic `minWidth` / `minHeight` thresholds.
5. Use `UI.Responsive` when information density must change across sizes.
6. Use `UI.ScrollArea` when rich content is intentionally taller than its viewport, and keep its `contentHeight` accurate.
7. Check focus-mode navigation and scrollable child interaction.
8. Give important page/layout controls meaningful `name` values.
9. Test aggressive width, height, asymmetric safe-area insets, and nested scrolling where applicable.
10. Run `UI.CheckLayout(..., { print = true })` after those tests.
11. Treat remaining overflow as either intentional art direction or a layout bug that should be fixed.
