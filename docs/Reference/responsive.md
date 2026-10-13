# API reference: Responsive

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `responsive.lua`  
**Coverage:** 10 classes, 65 fields, 1 aliases, 24 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [ResponsiveLayout](../ResponsiveLayout.md) · [ResponsiveComponents](../ResponsiveComponents.md)

## Classes, component props and return types

### `MiliUI.ResponsiveProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `gap?` | `number` | Space between items, in UI units, used for both horizontal and vertical gaps. Example: `gap = 12`. Use `gapX` or `gapY` for different values. |
| `gapX?` | `number` | Empty space between items **left to right**, in UI units. Example: `gapX = 12`. Overrides `gap` for horizontal spacing. |
| `gapY?` | `number` | Empty space between items **top to bottom**, in UI units. Example: `gapY = 8`. Overrides `gap` for vertical spacing. |
| `padding?` | `number` | Empty space **inside** all four sides of the container, before its children. Example: `padding = 16`. |
| `paddingX?` | `number` | Empty space inside the **left and right** edges of the container. Example: `paddingX = 16`. |
| `paddingY?` | `number` | Empty space inside the **top and bottom** edges of the container. Example: `paddingY = 8`. |
| `paddingLeft?` | `number` | Empty space inside the container's **left** edge. Example: `paddingLeft = 12`. |
| `paddingRight?` | `number` | Empty space inside the container's **right** edge. Example: `paddingRight = 12`. |
| `paddingTop?` | `number` | Empty space inside the container's **top** edge. Example: `paddingTop = 12`. |
| `paddingBottom?` | `number` | Empty space inside the container's **bottom** edge. Example: `paddingBottom = 12`. |
| `maxColumns?` | `integer` | Most columns to use when there is enough room. Example: `maxColumns = 3` allows up to three items per row. |
| `minCellWidth?` | `number` | Smallest useful width for each grid item; if space is too narrow, MiliUI reduces columns or switches to focus mode. |
| `minCellHeight?` | `number` | Smallest useful height for each grid item before MiliUI switches layouts. |
| `overflow?` | `MiliUI.ResponsiveOverflowMode` | What to do when a grid no longer fits. `'focus'` switches to showing one item at a time instead of squeezing or overlapping them. |
| `validateOverflow?` | `boolean` | After calculating a grid, check whether visible children extend outside their cells. When true with `'focus'`, switch to one-item mode if they do. |
| `focusIndex?` | `integer` | Which item is shown first when layout switches to one-item mode. Lua counts from 1. |
| `diagnostics?` | `boolean` | Print/check layout warnings when children overflow their available space. Useful during development. |
| `diagnosticTolerance?` | `number` | Overflow tolerance in UI units. Default 0.5. |

### `MiliUI.ResponsiveChildOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `minWidth?` | `MiliUI.Dimension` | Minimum useful width used when deciding whether the grid still fits. |
| `maxWidth?` | `MiliUI.Dimension` | Optional maximum actual width inside its cell/focus area. |
| `minHeight?` | `MiliUI.Dimension` | Minimum useful height used when deciding whether the grid still fits. |
| `maxHeight?` | `MiliUI.Dimension` | Optional maximum actual height inside its cell/focus area. |

### `MiliUI.ResponsiveLayoutInfo`

| Field | Declared type | Description |
| --- | --- | --- |
| `mode` | `'grid'\|'focus'` | The layout mode MiliUI is currently using to arrange this group of elements. |
| `columns` | `integer` | Number of columns (items across). Example: `columns = 3`. |
| `rows` | `integer` | Number of rows (items down). Example: `rows = 2`. |
| `cellWidth` | `number` | Width of one grid cell in the current layout, in UI units. |
| `cellHeight` | `number` | Height of one grid cell in the current layout, in UI units. |
| `focusIndex` | `integer` | 1-based position of the item currently shown in focused-item mode. |
| `count` | `integer` | Total number of items in the layout. |
| `width` | `number` | Width in Miliastra UI units. |
| `height` | `number` | Height in Miliastra UI units. |

### `MiliUI.ResponsiveLayout`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Outer responsive rectangle. |
| `content` | `MiliUI.ContainerControl` | Inner padded layout rectangle. |
| `children` | `MiliUI.Parent[]` | Array of controls currently inside this layout. |
| `mode` | `'grid'\|'focus'` | Current layout or interaction mode. |
| `columns` | `integer` | Number of columns (items across). Example: `columns = 3`. |
| `rows` | `integer` | Number of rows (items down). Example: `rows = 2`. |
| `cellWidth` | `number` | Width of the cell part, in UI units. |
| `cellHeight` | `number` | Height of the cell part, in UI units. |
| `focusIndex` | `integer` | Current item position, starting at 1, when the layout is showing one item at a time. |

### `MiliUI.LayoutDiagnosticOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `recursive?` | `boolean` | Check not only the selected container but also the UI elements **inside it**, including their children. Default: `true`. |
| `includeHidden?` | `boolean` | Also check UI elements that are currently hidden or inactive. Default: `false`. |
| `tolerance?` | `number` | Ignore small amounts of UI sticking beyond an edge up to this many UI units. Example: `tolerance = 0.5`. Default: `0.5`. |
| `maxDepth?` | `integer` | How many levels of nested UI containers to inspect. Example: `maxDepth = 32`. Default: `32`. |
| `print?` | `boolean` | Print a warning for each element that extends beyond its allowed area. Useful for finding layout problems. |

### `MiliUI.LayoutBounds`

| Field | Declared type | Description |
| --- | --- | --- |
| `left` | `number` | Horizontal position of the control's left edge, in UI units. |
| `right` | `number` | Horizontal position of the control's right edge, in UI units. |
| `top` | `number` | Vertical position of the control's top edge, in UI units. |
| `bottom` | `number` | Vertical position of the control's bottom edge, in UI units. |
| `parentLeft` | `number` | Horizontal position of the parent area's left edge. |
| `parentRight` | `number` | Horizontal position of the parent area's right edge. |
| `parentTop` | `number` | Vertical position of the parent area's top edge. |
| `parentBottom` | `number` | Vertical position of the parent area's bottom edge. |
| `width` | `number` | Width in Miliastra UI units. |
| `height` | `number` | Height in Miliastra UI units. |

### `MiliUI.LayoutIssue`

| Field | Declared type | Description |
| --- | --- | --- |
| `control` | `MiliUI.Control` | The UI control MiliUI found extending outside its expected area. |
| `parent` | `MiliUI.Control` | The container this problem control is supposed to fit inside. |
| `name` | `string` | Name of this UI element, useful for debugging. |
| `parentName` | `string` | Parent name used by this layout issue. |
| `left` | `number` | Left overflow in UI units. |
| `right` | `number` | Right overflow in UI units. |
| `top` | `number` | How far this UI control extends **above** the area available to it, in UI units. A value of `0` means no top overflow. |
| `bottom` | `number` | Bottom overflow in UI units. |
| `bounds` | `MiliUI.LayoutBounds` | Measured edges of the UI element's rectangle. |

### `MiliUI.LayoutWatcher`

*No fields are declared directly on this type.*

### `MiliUI.DiagnosticsAPI`

| Field | Declared type | Description |
| --- | --- | --- |
| `enabled` | `boolean` | Whether this component is enabled. |

### `MiliUI.ResponsiveClass`

*No fields are declared directly on this type.*

## Type aliases and enum values

### `MiliUI.ResponsiveOverflowMode`

```lua
---@alias MiliUI.ResponsiveOverflowMode
---| 'focus' # Default. When a grid cell would fall below its minimum usable size, show one section at a time.
---| 'grid' # Never enter focus mode; keep the calculated grid even when cells are below the requested minimum.
```

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `ResponsiveLayout:Add(value, options)`

Adds an existing control/wrapper. Controls created directly with the
Responsive wrapper as parent are added automatically.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `T` | — |
| Parameter `options?` | `MiliUI.ResponsiveChildOptions` | — |
| Returns | `T` | value |

**Additional annotations:** `@generic T`

**Original LuaLS annotations:**

```lua
---@generic T
---@param value T
---@param options? MiliUI.ResponsiveChildOptions
---@return T value
```


### `ResponsiveLayout:Remove(value)`

Remove the supplied child element from this responsive layout so it is no longer arranged with the other elements.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `MiliUI.Parent` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param value MiliUI.Parent
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:Clear()`

Forgets all children without destroying them.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:SetGap(gapX, gapY)`

Sets horizontal and optional vertical gap.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `gapX` | `number` | — |
| Parameter `gapY?` | `number` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param gapX number
---@param gapY? number
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:SetPadding(padding)`

Change the padding setting for this ResponsiveLayout.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `padding` | `number` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param padding number
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:SetInsets(left, right, top, bottom)`

Sets inner padding in Left, Right, Top, Bottom order. nil preserves an edge.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `left?` | `number` | — |
| Parameter `right?` | `number` | — |
| Parameter `top?` | `number` | — |
| Parameter `bottom?` | `number` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param left? number
---@param right? number
---@param top? number
---@param bottom? number
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:SetMaximumColumns(columns)`

Change the maximum columns setting for this ResponsiveLayout.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `columns` | `integer` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param columns integer
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:SetMinimumCellSize(width, height)`

Change the minimum cell size setting for this ResponsiveLayout.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `width` | `number` | — |
| Parameter `height` | `number` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param width number
---@param height number
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:SetFocus(index)`

Change the focus setting for this ResponsiveLayout.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param index integer
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:Next()`

Move to the next available item or arrangement in this responsive layout.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:Previous()`

Move to the previous available item or arrangement in this responsive layout.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:GetFocus()`

Return the current focus of this ResponsiveLayout.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | index |

**Original LuaLS annotations:**

```lua
---@return integer index
```


### `ResponsiveLayout:GetMode()`

Return the current mode of this ResponsiveLayout.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `'grid'\|'focus'` | mode |

**Original LuaLS annotations:**

```lua
---@return 'grid'|'focus' mode
```


### `ResponsiveLayout:GetLayoutInfo()`

Return the current layout info of this ResponsiveLayout.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ResponsiveLayoutInfo` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ResponsiveLayoutInfo
```


### `ResponsiveLayout:OnModeChange(callback)`

Register a function to run when mode change happens on this ResponsiveLayout.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(mode:'grid'\|'focus', previous:'grid'\|'focus', layout:MiliUI.ResponsiveLayout)` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(mode:'grid'|'focus', previous:'grid'|'focus', layout:MiliUI.ResponsiveLayout)
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:OnFocusChange(callback)`

Register a function to run when focus change happens on this ResponsiveLayout.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(index:integer, previous:integer, layout:MiliUI.ResponsiveLayout)` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(index:integer, previous:integer, layout:MiliUI.ResponsiveLayout)
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:Refresh()`

Update this UI to reflect current settings or data.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ResponsiveLayout
```


### `ResponsiveLayout:Destroy()`

Remove this component and release its UI resources.


### `LayoutWatcher:Check()`

Inspect the current UI layout for problems such as elements extending outside their parents.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.LayoutIssue[]` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.LayoutIssue[]
```


### `DiagnosticsAPI.SetEnabled(enabled)`

Change the enabled setting for this DiagnosticsAPI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.DiagnosticsAPI` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.DiagnosticsAPI
```


### `DiagnosticsAPI.Check(root, options)`

Checks child bounds against their immediate parents.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `root` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.LayoutDiagnosticOptions` | — |
| Returns | `MiliUI.LayoutIssue[]` | — |

**Original LuaLS annotations:**

```lua
---@param root MiliUI.Parent
---@param options? MiliUI.LayoutDiagnosticOptions
---@return MiliUI.LayoutIssue[]
```


### `DiagnosticsAPI.CheckText(root, options)`

Checks MiliUI-tracked Text and TextWindow controls against the calibrated
safe-height rules used by UI.CheckTextGeometry.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `root` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.TextGeometryOptions` | — |
| Returns | `MiliUI.TextGeometryIssue[]` | — |

**Original LuaLS annotations:**

```lua
---@param root MiliUI.Parent
---@param options? MiliUI.TextGeometryOptions
---@return MiliUI.TextGeometryIssue[]
```


### `DiagnosticsAPI.Watch(root, options)`

Rechecks whenever Core.SetSize changes the watched root.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `root` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.LayoutDiagnosticOptions` | — |
| Returns | `MiliUI.LayoutWatcher` | — |

**Original LuaLS annotations:**

```lua
---@param root MiliUI.Parent
---@param options? MiliUI.LayoutDiagnosticOptions
---@return MiliUI.LayoutWatcher
```


### `ResponsiveClass.New(UI, parent, props)`

Create a new responsive-layout component using an existing parent container and the settings you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `UI` | `MiliUI` | — |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ResponsiveProps` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param UI MiliUI
---@param parent MiliUI.Parent
---@param props? MiliUI.ResponsiveProps
---@return MiliUI.ResponsiveLayout
```
