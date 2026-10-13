# API reference: Components Screen

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_screen.lua`  
**Coverage:** 4 classes, 37 fields, 0 aliases, 13 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [ResponsiveLayout](../ResponsiveLayout.md) · [Components](../Components.md)

## Classes, component props and return types

### `MiliUI.ScreenProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `name?` | `string` | Runtime/debug control name. Default `Screen`. |
| `padding?` | `number` | Blank space between the edges of the entire screen and its content. Example: `padding = 20`. |
| `paddingX?` | `number` | Horizontal content inset; overrides `padding` for left/right. |
| `paddingY?` | `number` | Vertical content inset; overrides `padding` for top/bottom. |
| `paddingLeft?` | `number` | Leave empty space **inside the left edge** of this Screen before its contents begin. Example: `paddingLeft = 16`. |
| `paddingRight?` | `number` | Leave empty space **inside the right edge** of this Screen. Example: `paddingRight = 16`. |
| `paddingTop?` | `number` | Leave empty space **inside the top edge** of this Screen. Example: `paddingTop = 16`. |
| `paddingBottom?` | `number` | Leave empty space **inside the bottom edge** of this Screen. Example: `paddingBottom = 16`. |
| `background?` | `MiliUI.ColorValue` | Optional color covering the screen behind all its contents. |
| `backgroundImage?` | `integer` | Optional background image asset. Defaults to the square asset when background is set. |
| `backgroundStretch?` | `boolean` | Stretch the Screen background image to cover its available area. Default: `true`. |
| `showCursor?` | `boolean` | Ask Miliastra to show the mouse cursor while this screen is active. Set false when the screen should not change cursor visibility. |
| `disableKeyEventPassthrough?` | `boolean` | Advanced: stop keyboard events from passing through the native screen container to controls behind it. Leave unset for normal gameplay. |
| `disableCursorEventPassthrough?` | `boolean` | Advanced: stop pointer events from passing through this screen container. Use only for menus that intentionally capture clicks. |
| `isolateNavigation?` | `boolean` | Keep controller focus movement within this screen rather than jumping to unrelated controls. Useful for separate full-screen menus. |

### `MiliUI.ScreenQuery`

| Field | Declared type | Description |
| --- | --- | --- |
| `content?` | `boolean` | Query the padded content rectangle instead of the full canvas. |
| `minWidth?` | `number` | Only match this screen rule when the available screen width is **at least** this many UI units. Example: `minWidth = 600`. |
| `maxWidth?` | `number` | Only match this screen rule when the available screen width is **no more than** this many UI units. Example: `maxWidth = 600`. |
| `minHeight?` | `number` | Only match when the available screen height is at least this many UI units. |
| `maxHeight?` | `number` | Only match when the available screen height is no more than this many UI units. |
| `minAspect?` | `number` | Only match when the screen's **width divided by height** is at least this number. Example: `minAspect = 1.5` matches relatively wide screens. |
| `maxAspect?` | `number` | Only match when the screen's width divided by height is no more than this number. Useful for tall or narrow screens. |
| `orientation?` | `MiliUI.ScreenOrientation` | Only match screens with this shape. Choose `'landscape'` (wider than tall), `'portrait'` (taller than wide), or `'square'`. |

### `MiliUI.ScreenInputCapture`

| Field | Declared type | Description |
| --- | --- | --- |
| `keys?` | `boolean` | Control whether key presses should be stopped here rather than passed to UI behind this Screen. |
| `cursor?` | `boolean` | Control whether mouse/touch events should be stopped here rather than passed to UI behind this Screen. |
| `navigation?` | `boolean` | Keep controller D-pad and left-stick focus navigation within this Screen's controls. |

### `MiliUI.Screen`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Full canvas-sized root. Use this for full-screen overlays that must ignore content padding. |
| `content` | `MiliUI.ContainerControl` | Preferred parent; automatically inset by the configured padding. |
| `background?` | `MiliUI.ImageControl` | Optional image control covering this Screen's full background. |
| `width` | `number` | Current full width of the Screen, in Miliastra UI units. |
| `height` | `number` | Current full height of the Screen, in Miliastra UI units. |
| `contentWidth` | `number` | Current padded content width. |
| `contentHeight` | `number` | Current padded content height. |
| `paddingLeft` | `number` | Number used for padding left in this screen. |
| `paddingRight` | `number` | Number used for padding right in this screen. |
| `paddingTop` | `number` | Number used for padding top in this screen. |
| `paddingBottom` | `number` | Number used for padding bottom in this screen. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Screen:Refresh()`

Re-reads `game.GetUICanvasSize()` and reapplies the root/content geometry.
Call this if the game canvas can change while the screen remains alive.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Screen` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Screen
```


### `Screen:SetPadding(padding)`

Sets one uniform inset on all four content edges.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `padding` | `number` | — |
| Returns | `MiliUI.Screen` | — |

**Original LuaLS annotations:**

```lua
---@param padding number
---@return MiliUI.Screen
```


### `Screen:SetInsets(left, right, top, bottom)`

Sets individual content insets in Left, Right, Top, Bottom order.
Passing nil preserves the current value for that edge.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `left?` | `number` | — |
| Parameter `right?` | `number` | — |
| Parameter `top?` | `number` | — |
| Parameter `bottom?` | `number` | — |
| Returns | `MiliUI.Screen` | — |

**Original LuaLS annotations:**

```lua
---@param left? number
---@param right? number
---@param top? number
---@param bottom? number
---@return MiliUI.Screen
```


### `Screen:SetCursorVisible(visible)`

Requests or releases a visible cursor from this screen root.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `visible` | `boolean` | — |
| Returns | `MiliUI.Screen` | — |

**Original LuaLS annotations:**

```lua
---@param visible boolean
---@return MiliUI.Screen
```


### `Screen:SetInputCapture(options)`

Updates native input-capture flags on the screen root. Omitted fields are preserved.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `options?` | `MiliUI.ScreenInputCapture` | — |
| Returns | `MiliUI.Screen` | — |

**Original LuaLS annotations:**

```lua
---@param options? MiliUI.ScreenInputCapture
---@return MiliUI.Screen
```


### `Screen:ReleaseInput()`

Releases cursor visibility and all native input-capture flags without destroying the screen.
`Destroy()` calls this automatically before tearing down the native controls.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Screen` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Screen
```


### `Screen:GetSize()`

Return the current size from this Screen.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | width, number height |

**Original LuaLS annotations:**

```lua
---@return number width, number height
```


### `Screen:GetContentSize()`

Return the current content size from this Screen.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | width, number height |

**Original LuaLS annotations:**

```lua
---@return number width, number height
```


### `Screen:GetAspectRatio()`

Return the current aspect ratio from this Screen.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | aspectRatio Returns 0 when height is 0. |

**Original LuaLS annotations:**

```lua
---@return number aspectRatio Returns 0 when height is 0.
```


### `Screen:GetOrientation()`

Return the current orientation from this Screen.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ScreenOrientation` | orientation |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ScreenOrientation orientation
```


### `Screen:Matches(query)`

Evaluates a user-defined responsive/breakpoint query against the current canvas.
Dimension thresholds are Miliastra UI units, not physical monitor pixels.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `query?` | `MiliUI.ScreenQuery` | — |
| Returns | `boolean` | — |

**Original LuaLS annotations:**

```lua
---@param query? MiliUI.ScreenQuery
---@return boolean
```


### `Screen:OnResize(callback)`

Registers a callback fired by `Refresh()` only when the canvas dimensions changed.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback?` | `fun(width:number, height:number, contentWidth:number, contentHeight:number, screen:MiliUI.Screen)` | — |
| Returns | `MiliUI.Screen` | — |

**Original LuaLS annotations:**

```lua
---@param callback? fun(width:number, height:number, contentWidth:number, contentHeight:number, screen:MiliUI.Screen)
---@return MiliUI.Screen
```


### `Screen:Destroy()`

Releases input/cursor ownership, then destroys the screen control subtree.
