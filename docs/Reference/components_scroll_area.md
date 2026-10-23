# API reference: Components Scroll Area

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_scroll_area.lua`  
**Coverage:** 2 classes, 50 fields, 0 aliases, 20 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [ScrollArea](../ScrollArea.md) · [ControllerSupport](../ControllerSupport.md)

## Classes, component props and return types

### `MiliUI.ScrollAreaProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `width?` | `MiliUI.Dimension` | Width of the scrolling viewport and scrollbar area. Example: `width = 480`. |
| `height?` | `MiliUI.Dimension` | Height of the visible scrolling area. Example: `height = 320`; content beyond that height can be scrolled. |
| `contentHeight?` | `number` | Total height of **all the content**, including the part that is currently off-screen. It must be larger than `height` if you want scrolling. Example: `height = 200, contentHeight = 600` displays 200 UI units at once from a 600-unit-tall list. |
| `scrollOffset?` | `number` | Initial distance scrolled downward from the top, in UI units. Example: `scrollOffset = 0` starts at the beginning. |
| `scrollStep?` | `number` | Distance scrolled when one scrollbar arrow is pressed. Example: `scrollStep = 48`. |
| `interactable?` | `boolean` | Allow the player to scroll this area using its scrollbar or by dragging the content. Set `false` to disable those interactions. Default: `true`. |
| `dragScroll?` | `boolean` | Allow a player to drag the contents up/down to scroll (mouse or touch). Default true. |
| `dragScrollMultiplier?` | `number` | Multiplier applied to viewport drag distance. Default 1. |
| `controllerScroll?` | `boolean` | Let players scroll this area using the controller's **right stick**. Set `false` to turn off right-stick scrolling. Default: `true`. |
| `controllerScrollStep?` | `number` | Controller right-stick event step. Defaults to scrollStep. |
| `controllerScrollFocus?` | `boolean` | Allow fallback controller focus when no eligible child remains. In a managed V2 Screen, a passive viewport proxy (not the ScrollArea root) owns this focus; it may also take focus when the selected row scrolls out of view. Default true. |
| `autoScrollOnControllerFocus?` | `boolean` | When controller navigation selects a Button that is outside the visible part of the list, move the scroll position until the Button can be seen. Default: `true`. |
| `controllerFocusPadding?` | `number` | Small vertical space MiliUI tries to leave between a newly focused Button and the viewport edge. Example: `controllerFocusPadding = 12`. |
| `focusIndicatorOverflow?` | `number` | Extra space **outside the left and right edges** of this scrolling area where the controller focus indicator is allowed to appear. Example: `focusIndicatorOverflow = 64` gives the indicator 64 UI units of extra room on each side, while keeping items hidden above and below the scrolling viewport. |
| `alwaysShowScrollbar?` | `boolean` | Show the scrollbar lane even when the content is short enough to fit without scrolling. Default false. |
| `viewportRadius?` | `MiliUI.Radius` | Round the corners of the visible scrolling area. Example: `viewportRadius = 'lg'`. Default: `'none'` (square corners). |
| `maskImage?` | `integer` | Choose the image used to hide content that falls outside the visible scrolling area. Usually leave this out: MiliUI automatically chooses a shape based on `viewportRadius`. |
| `maskStretch?` | `boolean` | Mask image stretch mode. Default true. |
| `scrollbarWidth?` | `number` | Scrollbar lane width. Default Theme.scrollbar.width. |
| `scrollbarGap?` | `number` | Gap between viewport and scrollbar lane. Default Theme.scrollbar.gap. |
| `scrollbarControllerFocus?` | `boolean` | Allow the scrollbar's up/down Buttons to receive controller focus. Default false inside managed V2 Screens; legacy/unmanaged ScrollAreas retain the true default. |
| `scrollbarTrackWidth?` | `number` | Set the thickness of the scrollbar's track (the narrow line behind the handle). Example: `scrollbarTrackWidth = 5`. |
| `scrollbarTrackEndInset?` | `number` | Leave this much space at the top and bottom ends of the scrollbar's track, without changing how far the handle can travel. |
| `scrollbarTrackColor?` | `MiliUI.ColorValue` | Choose the color of the scrollbar's track. Example: `scrollbarTrackColor = 'surface2'`. |
| `scrollbarTrackImage?` | `integer` | Use this image asset ID as the background of the scrollbar's track. |
| `scrollbarTrackStretch?` | `boolean` | Set `true` to stretch the track image to fit its scrollbar area. |
| `scrollbarTrackRadius?` | `MiliUI.Radius` | Choose how rounded the scrollbar track's corners are. Example: `scrollbarTrackRadius = 'sm'`. |
| `scrollbarTrackClipToRadius?` | `boolean` | Set `true` to trim the scrollbar track image to its chosen rounded-corner shape. |
| `scrollbarThumbWidth?` | `number` | Set the width of the movable scrollbar handle (also called the thumb). Example: `scrollbarThumbWidth = 11`. |
| `scrollbarThumbMinimumHeight?` | `number` | Set the minimum height of the movable scrollbar handle, so it does not become too small when content is long. |
| `scrollbarThumbColor?` | `MiliUI.ColorValue` | Choose the normal color of the movable scrollbar handle. Example: `scrollbarThumbColor = 'accent'`. |
| `scrollbarThumbHoverColor?` | `MiliUI.ColorValue` | Choose the handle's color when the player points at it or drags it. |
| `scrollbarThumbDisabledColor?` | `MiliUI.ColorValue` | Choose the handle's color when scrolling is disabled. |
| `scrollbarThumbImage?` | `integer` | Use this image asset ID for the draggable scrollbar handle. |
| `scrollbarThumbStretch?` | `boolean` | Set `true` to stretch the handle image to fit its current size. |
| `scrollbarThumbRadius?` | `MiliUI.Radius` | Choose how rounded the scrollbar handle's corners are. Example: `scrollbarThumbRadius = 'sm'`. |
| `scrollbarThumbClipToRadius?` | `boolean` | Set `true` to trim the handle image to its rounded-corner shape. |
| `scrollbarButtonSize?` | `number` | Set the size of the scrollbar's up/down arrow buttons. |
| `scrollbarButtonGap?` | `number` | Set the empty space between each up/down arrow button and the scrollbar track. |
| `scrollbarIndicatorImage?` | `integer` | Use this image asset ID for the scrollbar's up/down arrows. |
| `scrollbarIndicatorSize?` | `number` | Set the size of the scrollbar's up/down arrow images. |
| `scrollbarIconColor?` | `MiliUI.ColorValue` | Choose the color of enabled scrollbar arrow images. |
| `scrollbarIconDisabledColor?` | `MiliUI.ColorValue` | Choose the color of scrollbar arrow images when they cannot be used. |
| `onScroll?` | `fun(offset:number, ratio:number, control:MiliUI.ScrollArea)` | Run your code when this area's scroll position changes. `offset` is the distance scrolled down in UI units, `ratio` is scroll progress from 0 (top) to 1 (bottom), and `control` is the ScrollArea. Example: `onScroll = function(offset) print(offset) end`. |

### `MiliUI.ScrollArea`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Outer UI container of this scrolling area, including its scrollbar and visible content region. |
| `viewport` | `MiliUI.ImageControl` | The visible region that hides the portions of the scrolling content above or below it. |
| `content` | `MiliUI.ContainerControl` | Parent arbitrary scrollable children here. |
| `scrollbar` | `MiliUI.Scrollbar` | Shared reusable scrollbar instance. |
| `dragHitbox` | `MiliUI.Hitbox` | Background viewport drag gesture surface. |
| `column?` | `MiliUI.Stack` | Automatically created inner Column, available when this ScrollArea was created with `UI.ScrollColumn`. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `ScrollArea:GetScrollOffset()`

Return the current scroll offset from this Scroll Area, so your script can read it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | offset Current top-relative scroll offset in UI units. |

**Original LuaLS annotations:**

```lua
---@return number offset Current top-relative scroll offset in UI units.
```


### `ScrollArea:GetMaxScrollOffset()`

Return the current max scroll offset from this Scroll Area, so your script can read it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | maximum Maximum top-relative scroll offset. |

**Original LuaLS annotations:**

```lua
---@return number maximum Maximum top-relative scroll offset.
```


### `ScrollArea:GetScrollRatio()`

Return the current scroll ratio from this Scroll Area, so your script can read it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | ratio Current normalized 0-1 scroll position. |

**Original LuaLS annotations:**

```lua
---@return number ratio Current normalized 0-1 scroll position.
```


### `ScrollArea:GetViewportSize()`

Return the current viewport size from this Scroll Area, so your script can read it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | width, number height |

**Original LuaLS annotations:**

```lua
---@return number width, number height
```


### `ScrollArea:GetContentHeight()`

Return the current content height from this Scroll Area, so your script can read it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | height |

**Original LuaLS annotations:**

```lua
---@return number height
```


### `ScrollArea:ScrollControlIntoView(target, padding, fireEvent)`

Reveal a descendant control with the smallest necessary scroll movement.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `target` | `MiliUI.Parent` | — |
| Parameter `padding?` | `number` | Optional preferred margin in UI units. |
| Parameter `fireEvent?` | `boolean` | Whether to dispatch onScroll when offset changes. |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param target MiliUI.Parent
---@param padding? number Optional preferred margin in UI units.
---@param fireEvent? boolean Whether to dispatch onScroll when offset changes.
---@return MiliUI.ScrollArea
```


### `ScrollArea:IsScrollable()`

Return `true` or `false` to indicate whether this Scroll Area is scrollable.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | scrollable |

**Original LuaLS annotations:**

```lua
---@return boolean scrollable
```


### `ScrollArea:ScrollTo(offset, fireEvent)`

Move the scroll position of this Scroll Area.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `offset` | `number` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param offset number
---@param fireEvent? boolean
---@return MiliUI.ScrollArea
```


### `ScrollArea:ScrollBy(delta, fireEvent)`

Move the scroll position of this Scroll Area.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `delta` | `number` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param delta number
---@param fireEvent? boolean
---@return MiliUI.ScrollArea
```


### `ScrollArea:ScrollToRatio(ratio, fireEvent)`

Move the scroll position of this Scroll Area.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `ratio` | `number` | Normalized 0-1 position. |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param ratio number Normalized 0-1 position.
---@param fireEvent? boolean
---@return MiliUI.ScrollArea
```


### `ScrollArea:ScrollToStart(fireEvent)`

Move the scroll position of this Scroll Area.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param fireEvent? boolean
---@return MiliUI.ScrollArea
```


### `ScrollArea:ScrollToEnd(fireEvent)`

Move the scroll position of this Scroll Area.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param fireEvent? boolean
---@return MiliUI.ScrollArea
```


### `ScrollArea:SetContentHeight(height, fireEvent)`

Resizes the logical content container and updates scrollbar range/thumb sizing.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `height` | `number` | — |
| Parameter `fireEvent?` | `boolean` | Fires onScroll only if the current offset must clamp. |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param height number
---@param fireEvent? boolean Fires onScroll only if the current offset must clamp.
---@return MiliUI.ScrollArea
```


### `ScrollArea:SetEnabled(enabled)`

Turn player interaction on or off. Pass `true` to enable this component, or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.ScrollArea
```


### `ScrollArea:SetDragScrollEnabled(enabled)`

Enables or disables direct viewport grab-to-scroll without changing the scrollbar.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.ScrollArea
```


### `ScrollArea:RegisterDragTarget(control)`

Adds another interactive descendant as a source for the scroll drag gesture.
Buttons and ordinary click/tap Hitboxes inside area.content register automatically.
Drag-owning controls such as Slider and Scrollbar intentionally opt out.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@return MiliUI.ScrollArea
```


### `ScrollArea:SetControllerScrollEnabled(enabled)`

Enables or disables Right Stick scrolling without changing mouse/touch dragging.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.ScrollArea
```


### `ScrollArea:RegisterControllerScrollTarget(control)`

Adds another descendant as a Right Stick scroll source while it has controller focus.
Focusable Buttons and ordinary Hitboxes inside area.content register automatically
unless they opt out of parent scrolling.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@return MiliUI.ScrollArea
```


### `ScrollArea:OnScroll(callback)`

Register a function that runs when the player scrolls this area.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(offset:number, ratio:number, control:MiliUI.ScrollArea)` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(offset:number, ratio:number, control:MiliUI.ScrollArea)
---@return MiliUI.ScrollArea
```


### `ScrollArea:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.
