# API reference: Components Scrollbar

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_scrollbar.lua`  
**Coverage:** 2 classes, 42 fields, 0 aliases, 11 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Scrollbar](../Scrollbar.md) · [ScrollArea](../ScrollArea.md)

## Classes, component props and return types

### `MiliUI.ScrollbarProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `min?` | `number` | Smallest scroll position, usually 0. |
| `max?` | `number` | Largest scroll position. Example: `max = 100`. |
| `value?` | `number` | Where the scrollbar starts between `min` and `max`. Example: `min = 0, max = 100, value = 25` starts one quarter down. |
| `step?` | `number` | Optional amount the scrollbar snaps to when moved. Example: `step = 5` uses multiples of 5. |
| `buttonStep?` | `number` | How much the scrollbar moves when a player presses an arrow button. |
| `pageSize?` | `number` | How much of the list is visible compared with the total scrollable length; MiliUI uses this to size the thumb. |
| `thumbFraction?` | `number` | Set the fraction of the scrollbar track covered by its draggable thumb, from 0 (tiny) to 1 (full). Overrides `pageSize` when provided. |
| `width?` | `MiliUI.Dimension` | Lane width. Default Theme.scrollbar.width (24 built-in). |
| `height?` | `MiliUI.Dimension` | Total height of this vertical scrollbar, in UI units. Example: `height = 240`. Default: `240`. |
| `interactable?` | `boolean` | Let the player move the scrollbar by dragging its handle or pressing its arrows. Set `false` to disable it. Default: `true`. |
| `controllerFocus?` | `boolean` | Allow the scrollbar's buttons to be selected by controller navigation. Default true. |
| `trackWidth?` | `number` | Thickness of the visible scrollbar track (the line behind the movable handle). |
| `trackEndInset?` | `number` | Visual inset removed from each end of the track without changing thumb travel. Default 1. |
| `trackColor?` | `MiliUI.ColorValue` | Color of the line behind the draggable scrollbar handle. Default: `Theme.scrollbar.trackColor`. |
| `trackImage?` | `integer` | Image asset ID used for the scrollbar's background track. Default: `Theme.scrollbar.trackImage`. |
| `trackStretch?` | `boolean` | Stretch the background track image to fit its height. Default: `Theme.scrollbar.trackStretch`. |
| `trackRadius?` | `MiliUI.Radius` | Radius used when the track is not image-skinned. Default none. |
| `trackClipToRadius?` | `boolean` | Trim the track's background image to the rounded corners set by `trackRadius`. |
| `thumbWidth?` | `number` | Thickness of the draggable scrollbar handle. |
| `thumbMinimumHeight?` | `number` | Minimum thumb height. Default Theme.scrollbar.thumbMinimumHeight. |
| `thumbColor?` | `MiliUI.ColorValue` | Normal color of the draggable scrollbar handle. Default: `Theme.scrollbar.thumbColor`. |
| `thumbHoverColor?` | `MiliUI.ColorValue` | Color of the draggable handle while the mouse points at it or drags it. Default: `Theme.scrollbar.thumbHoverColor`. |
| `thumbDisabledColor?` | `MiliUI.ColorValue` | Color of the handle when scrolling is disabled. Default: `'disabled'`. |
| `thumbImage?` | `integer` | Image asset ID for the draggable scrollbar handle. Default: `Theme.scrollbar.thumbImage`. |
| `thumbStretch?` | `boolean` | Stretch the scrollbar handle's image to its current size. Default: `Theme.scrollbar.thumbStretch`. |
| `thumbRadius?` | `MiliUI.Radius` | Radius used when the thumb is not image-skinned. Default sm. |
| `thumbClipToRadius?` | `boolean` | Trim the draggable handle's image to the rounded corners set by `thumbRadius`. |
| `buttonSize?` | `number` | Width and height of the scrollbar's up/down Buttons, in UI units. Default: `Theme.scrollbar.buttonSize`. |
| `buttonGap?` | `number` | Space between each up/down Button and the scrollbar track. Default: `Theme.scrollbar.buttonGap`. |
| `indicatorImage?` | `integer` | Up/down arrow image. Default Theme.scrollbar.indicatorImage. |
| `indicatorSize?` | `number` | Arrow icon size. Default Theme.scrollbar.indicatorSize. |
| `iconColor?` | `MiliUI.ColorValue` | Color of the up/down arrow icons when their Buttons can be pressed. Default: `Theme.scrollbar.iconColor`. |
| `iconDisabledColor?` | `MiliUI.ColorValue` | Color of the up/down arrows when those Buttons cannot be pressed. Default: `Theme.scrollbar.iconDisabledColor`. |
| `onChange?` | `fun(value:number, control:MiliUI.Scrollbar)` | Runs when the scrollbar's position changes. The function receives the new position and the Scrollbar control; use it to update another scrollable view. |

### `MiliUI.Scrollbar`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying native UI control created for this component. |
| `upButton` | `MiliUI.Button` | Up button used by this scrollbar. |
| `upIcon` | `MiliUI.ImageControl` | Image control displaying the up arrow on the scrollbar's upper Button. |
| `downButton` | `MiliUI.Button` | Down button used by this scrollbar. |
| `downIcon` | `MiliUI.ImageControl` | Image control displaying the down arrow on the scrollbar's lower Button. |
| `track` | `MiliUI.Panel` | Visual background behind the scrollbar's movable handle. |
| `thumb` | `MiliUI.Panel` | The draggable handle that shows the current position in the list. |
| `thumbHitbox` | `MiliUI.Hitbox` | Invisible area that detects when the player presses or drags the scrollbar's handle. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Scrollbar:GetValue()`

Return the current value this control holds.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | value |

**Original LuaLS annotations:**

```lua
---@return number value
```


### `Scrollbar:GetRatio()`

Return the scrollbar's current position from `0` at one end to `1` at the other.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | ratio Current normalized 0-1 position. |

**Original LuaLS annotations:**

```lua
---@return number ratio Current normalized 0-1 position.
```


### `Scrollbar:GetRange()`

Return the minimum and maximum values allowed by this scrollbar.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | minimum, number maximum |

**Original LuaLS annotations:**

```lua
---@return number minimum, number maximum
```


### `Scrollbar:SetValue(value, fireEvent)`

Change the current value of this control. Some setters also let you choose whether a change callback should run.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `number` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Scrollbar` | — |

**Original LuaLS annotations:**

```lua
---@param value number
---@param fireEvent? boolean
---@return MiliUI.Scrollbar
```


### `Scrollbar:ScrollBy(delta, fireEvent)`

Move the scrollbar by an amount relative to its current position.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `delta` | `number` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Scrollbar` | — |

**Original LuaLS annotations:**

```lua
---@param delta number
---@param fireEvent? boolean
---@return MiliUI.Scrollbar
```


### `Scrollbar:SetRange(minimum, maximum, fireEvent)`

Change the range of this Scrollbar.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `minimum` | `number` | — |
| Parameter `maximum` | `number` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Scrollbar` | — |

**Original LuaLS annotations:**

```lua
---@param minimum number
---@param maximum number
---@param fireEvent? boolean
---@return MiliUI.Scrollbar
```


### `Scrollbar:SetPageSize(pageSize)`

Switches to page-size-derived thumb sizing.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageSize` | `number` | — |
| Returns | `MiliUI.Scrollbar` | — |

**Original LuaLS annotations:**

```lua
---@param pageSize number
---@return MiliUI.Scrollbar
```


### `Scrollbar:SetThumbFraction(fraction)`

Switches to an explicit 0-1 thumb-length fraction.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fraction` | `number` | — |
| Returns | `MiliUI.Scrollbar` | — |

**Original LuaLS annotations:**

```lua
---@param fraction number
---@return MiliUI.Scrollbar
```


### `Scrollbar:SetEnabled(enabled)`

Allow or block player interaction. Pass `true` to enable this component or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Scrollbar` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Scrollbar
```


### `Scrollbar:OnChange(callback)`

Register a function that runs when the player changes this component's value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(value:number, control:MiliUI.Scrollbar)` | — |
| Returns | `MiliUI.Scrollbar` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(value:number, control:MiliUI.Scrollbar)
---@return MiliUI.Scrollbar
```


### `Scrollbar:Destroy()`

Remove this component from the screen and release its UI controls.
