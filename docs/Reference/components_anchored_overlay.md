# API reference: Components Anchored Overlay

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_anchored_overlay.lua`  
**Coverage:** 5 classes, 54 fields, 2 aliases, 15 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [AnchoredOverlays](../AnchoredOverlays.md)

## Classes, component props and return types

### `MiliUI.PopoverProps`

**Inherits from:** [`MiliUI.SurfaceProps`](aliases.md#miliuisurfaceprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `anchor` | `MiliUI.Parent` | Which Button/control the popover should appear beside. Example: `anchor = helpButton.root`. |
| `placement?` | `MiliUI.AnchorPlacement` | Preferred side of the anchor: `'top'`, `'bottom'`, `'left'`, `'right'`, or `'auto'` to choose where space fits. |
| `align?` | `MiliUI.AnchorAlign` | Position within that side: `'start'`, `'center'` or `'end'`. Example: `align = 'center'` centers the popover beside its anchor. |
| `gap?` | `number` | Empty distance from the anchor to the popover. Example: `gap = 8`. |
| `margin?` | `number` | Minimum room to leave between the popover and the edge of its parent overlay. |
| `flip?` | `boolean` | If the requested side has too little room, try the opposite side. Example: `'right'` can switch to `'left'`. Default true. |
| `width?` | `MiliUI.Dimension` | Width of this popup in UI units. Example: `width = 320`. Default: `320`. |
| `height?` | `MiliUI.Dimension` | Height of this popup in UI units. Example: `height = 180`. Default: `180`. |
| `interactive?` | `boolean` | Keep pointer clicks on blank space inside the popup from passing through to UI behind it. Default true. |
| `closeOnOutsideClick?` | `boolean` | Let players click outside the popup to close it. Useful for tooltips and menus. Default false. |
| `open?` | `boolean` | Choose whether the popup is visible when first created. Example: `open = true` shows it immediately. Default: `false`. |
| `onOpen?` | `fun(popover:MiliUI.Popover)` | Run a function just after this popup opens. Example: `onOpen = function(popover) print('Opened') end`. |
| `onClose?` | `fun(popover:MiliUI.Popover)` | Run a function just after this popup closes. Example: `onClose = function(popover) print('Closed') end`. |

### `MiliUI.AnchorPlacementResult`

| Field | Declared type | Description |
| --- | --- | --- |
| `x` | `number` | Horizontal position or offset for x, in UI units. |
| `y` | `number` | Vertical position or offset for y, in UI units. |
| `placement` | `'top'\|'bottom'\|'left'\|'right'\|'inside-left'\|'inside-right'` | Side MiliUI actually chose after checking the available space. It may differ from the requested side if flipping was allowed. |
| `align` | `MiliUI.AnchorAlign` | Where the items line up inside their available space. |
| `anchorBounds` | `table` | Measured left, right, top and bottom of the anchor, used to place the popup. |
| `overflow` | `table` | How much the popup would extend beyond each edge of its parent if left at that position. |

### `MiliUI.Popover`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `content` | `MiliUI.ContainerControl` | Container where you can add custom child UI. |
| `panel` | `MiliUI.Panel` | Visual panel that draws the component's background and border. |
| `backdrop?` | `MiliUI.Hitbox` | Invisible area outside the popup used to detect clicks that should close it. |
| `inputGuard?` | `MiliUI.Hitbox` | Invisible area over the popup that prevents clicks from reaching controls behind it. |
| `anchor` | `MiliUI.Control` | Anchor used by this popover. |
| `overlayParent` | `MiliUI.Control` | Overlay parent used by this popover. |
| `placement?` | `'top'\|'bottom'\|'left'\|'right'` | The placement associated with this popover. |

### `MiliUI.TooltipProps`

**Inherits from:** [`MiliUI.SurfaceProps`](aliases.md#miliuisurfaceprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `anchor` | `MiliUI.Parent` | The Button or other UI control that this tooltip will appear beside. Example: `anchor = helpButton.root` places it beside the existing `helpButton`. |
| `trigger?` | `MiliUI.Parent\|false` | Control whose pointer events display the tooltip. Usually the `anchor`; use `false` to disable automatic hover handling. |
| `text?` | `MiliUI.TextSpec` | Short helpful message shown when the player hovers over the target. Example: `{ text = 'Open Settings' }`. |
| `placement?` | `MiliUI.AnchorPlacement` | Preferred side of the tooltip relative to its anchor. `'auto'` chooses the side with room. |
| `align?` | `MiliUI.AnchorAlign` | Choose how the tooltip lines up beside its Button: `'start'`, `'center'`, or `'end'`. Default: `'center'`. |
| `gap?` | `number` | Empty space between the tooltip and the Button it describes, in UI units. Example: `gap = 7`. Default: `7`. |
| `margin?` | `number` | Minimum space to keep between the tooltip and the available screen edge, in UI units. Default: `8`. |
| `flip?` | `boolean` | If the chosen side has too little room, let the tooltip switch to the opposite side. Example: from `'right'` to `'left'`. Default: `true`. |
| `delay?` | `number` | How many seconds to wait after hovering before showing the tooltip. Example: `delay = 0.2`. |
| `width?` | `MiliUI.Dimension` | Width of the tooltip in UI units. Example: `width = 280`. Default: `280`. |
| `height?` | `MiliUI.Dimension` | Height of the tooltip in UI units. Example: `height = 56`. Default: `56`. |
| `padding?` | `number` | Empty space **inside** the tooltip, between its text and the edges. Example: `padding = 10`. |
| `paddingX?` | `number` | Empty space **inside** the tooltip on the left and right of the text. Default: `14` UI units. |
| `paddingY?` | `number` | Empty space **inside** the tooltip above and below the text. Default: `8` UI units. |
| `textSize?` | `MiliUI.TextSize` | Font size of the tooltip message. Default: `'xs'` (extra small theme text size). |
| `textColor?` | `MiliUI.ColorValue` | Color of the tooltip text. Example: `textColor = 'text'`. Default: `'text'`. |
| `adaptiveFontSize?` | `boolean` | Allow the tooltip text to become smaller if it does not fit. Default: `true`. |
| `minimumFontSize?` | `number` | Smallest font size the tooltip text is allowed to shrink to. Default: `10`. |
| `horizontalAlignment?` | `any` | Choose where the tooltip's text sits **left to right**. Uses Miliastra's `Enum.TextHorizontalAlignment` values. |
| `verticalAlignment?` | `any` | Choose where the tooltip's text sits **top to bottom**. Uses Miliastra's `Enum.TextVerticalAlignment` values. |

### `MiliUI.Tooltip`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `content` | `MiliUI.ContainerControl` | Container where you can add custom child UI. |
| `panel` | `MiliUI.Panel` | Visual panel that draws the component's background and border. |
| `label` | `MiliUI.TextControl` | Text control used to show this component's label. |
| `popover` | `MiliUI.Popover` | Popover used by this tooltip. |
| `anchor` | `MiliUI.Control` | Anchor used by this tooltip. |
| `placement?` | `'top'\|'bottom'\|'left'\|'right'` | The placement associated with this tooltip. |

## Type aliases and enum values

### `MiliUI.AnchorPlacement`

```lua
---@alias MiliUI.AnchorPlacement 'auto'|'top'|'bottom'|'left'|'right'|'inside-left'|'inside-right'
```

### `MiliUI.AnchorAlign`

```lua
---@alias MiliUI.AnchorAlign 'start'|'center'|'end'
```

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Popover:IsOpen()`

Return `true` if this popup is currently open, otherwise `false`.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | open |

**Original LuaLS annotations:**

```lua
---@return boolean open
```


### `Popover:Open()`

Show this popup.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Popover` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Popover
```


### `Popover:Close()`

Close or hide this popup.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Popover` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Popover
```


### `Popover:Toggle()`

Switch this popup between open and closed.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Popover` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Popover
```


### `Popover:RefreshPlacement()`

Recalculate where this popup or tooltip appears beside its target control.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.AnchorPlacementResult?` | result |

**Original LuaLS annotations:**

```lua
---@return MiliUI.AnchorPlacementResult? result
```


### `Popover:SetAnchor(anchor)`

Choose the Button or other control this popup should appear beside.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `anchor` | `MiliUI.Parent` | — |
| Returns | `MiliUI.Popover` | — |

**Original LuaLS annotations:**

```lua
---@param anchor MiliUI.Parent
---@return MiliUI.Popover
```


### `Popover:OnOpen(callback)`

Register a function that runs when this popup opens.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(popover:MiliUI.Popover)` | — |
| Returns | `MiliUI.Popover` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(popover:MiliUI.Popover)
---@return MiliUI.Popover
```


### `Popover:OnClose(callback)`

Register a function that runs when this popup closes.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(popover:MiliUI.Popover)` | — |
| Returns | `MiliUI.Popover` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(popover:MiliUI.Popover)
---@return MiliUI.Popover
```


### `Popover:Destroy()`

Remove this component from the UI and release its controls.


### `Tooltip:IsOpen()`

Return `true` if this popup is currently open, otherwise `false`.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | open |

**Original LuaLS annotations:**

```lua
---@return boolean open
```


### `Tooltip:Open()`

Show this popup.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Tooltip` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Tooltip
```


### `Tooltip:Close()`

Close or hide this popup.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Tooltip` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Tooltip
```


### `Tooltip:RefreshPlacement()`

Recalculate where this popup or tooltip appears beside its target control.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.AnchorPlacementResult?` | result |

**Original LuaLS annotations:**

```lua
---@return MiliUI.AnchorPlacementResult? result
```


### `Tooltip:SetText(spec)`

Change the text setting of this Tooltip.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Tooltip` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Tooltip
```


### `Tooltip:Destroy()`

Remove this component from the UI and release its controls.
