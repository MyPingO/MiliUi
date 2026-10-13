# API reference: Native

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `native.lua`  
**Coverage:** 12 classes, 68 fields, 1 aliases, 59 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Components](../Components.md)

## Classes, component props and return types

### `MiliUI.CursorEventData`

| Field | Declared type | Description |
| --- | --- | --- |
| `dragging` | `boolean` | Whether the pointer is currently dragging. |
| `touchId` | `integer` | Touch/pointer ID. Keyboard/mouse commonly reports -1. |

### `MiliUI.Control`

| Field | Declared type | Description |
| --- | --- | --- |
| `alive` | `boolean` | Whether this native UI control still exists and can be used. A destroyed control has `alive = false`. |
| `id` | `integer` | Unique numeric ID Miliastra gives to this UI control while it exists. Mostly useful for debugging. |
| `prefabIndex` | `integer` | ID of the UI template used to create this control. It identifies which template in your project was used. |
| `active` | `boolean` | Whether this control itself is active. Set to `false` to deactivate it; the parent can also affect whether it is usable. |
| `activeInHierarchy` | `boolean` | Whether this control **and all its parent controls** are active. If a parent is inactive, this is `false` even when `active` is `true`. |
| `visible` | `boolean` | Whether this native UI control is currently shown. Set to `false` to hide it. |
| `name` | `string` | Name assigned to this native UI control. Useful for recognizing it when debugging your UI. |
| `parent` | `MiliUI.Control\|nil` | The native UI container this control belongs to. Can be `nil` (nothing) if it has no parent. |
| `anchoredPositionX` | `number` | Horizontal position of the control relative to its anchor, in UI units. Positive values move it to the right. You can animate this value. |
| `anchoredPositionY` | `number` | Vertical position of the control relative to its anchor, in UI units. Positive values move it upward. You can animate this value. |
| `sizeDeltaX` | `number` | Extra width set on this native control relative to its anchors, in UI units. You can animate this value. |
| `sizeDeltaY` | `number` | Extra height set on this native control relative to its anchors, in UI units. You can animate this value. |
| `anchorMinX` | `number` | Left end of the control's horizontal anchor range inside its parent (often between `0` and `1`). Usually handled automatically by MiliUI layout. |
| `anchorMinY` | `number` | Lower end of the control's vertical anchor range inside its parent (often between `0` and `1`). Usually handled automatically by MiliUI layout. |
| `anchorMaxX` | `number` | Right end of the control's horizontal anchor range inside its parent (often between `0` and `1`). Usually handled automatically by MiliUI layout. |
| `anchorMaxY` | `number` | Upper end of the control's vertical anchor range inside its parent (often between `0` and `1`). Usually handled automatically by MiliUI layout. |
| `pivotX` | `number` | The horizontal point inside the control used as its position/rotation center. Usually from `0` (left) to `1` (right). |
| `pivotY` | `number` | The vertical point inside the control used as its position/rotation center. Usually from `0` (bottom) to `1` (top). |
| `localScaleX` | `number` | Visual width multiplier. `1` is the normal width, `1.2` looks 20% wider. You can animate it. |
| `localScaleY` | `number` | Visual height multiplier. `1` is the normal height, `0.8` looks 20% shorter. You can animate it. |
| `localScaleZ` | `number` | Visual depth-scale multiplier of this native control. In most flat 2D layouts you can leave it unchanged. |
| `localRotationX` | `number` | Native rotation around the horizontal X axis, in degrees. Most flat 2D interfaces do not need this. |
| `localRotationY` | `number` | Native rotation around the vertical Y axis, in degrees. Most flat 2D interfaces do not need this. |
| `localRotationZ` | `number` | Rotate the control in the flat 2D screen, in degrees. Example: `localRotationZ = 45` turns it 45 degrees. |
| `canControllerFocus` | `boolean` | Whether a controller is allowed to select this control when navigating with the D-pad or left stick. |

### `MiliUI.ContainerControl`

**Inherits from:** [`MiliUI.Control`](native.md#miliuicontrol). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `isolateNavigation` | `boolean` | Limit controller focus navigation to this container instead of allowing movement into surrounding controls. |
| `disableKeyEventPassthrough` | `boolean` | Stop keyboard or controller key presses received here from continuing to UI controls behind this container. |
| `disableCursorEventPassthrough` | `boolean` | Stop mouse/touch input received here from continuing to controls behind this container. |
| `showCursor` | `boolean` | Show the persistent pointer cursor while using this UI container. |

### `MiliUI.ImageControl`

**Inherits from:** [`MiliUI.Control`](native.md#miliuicontrol). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `imageSource` | `any` | Miliastra setting that chooses the kind of source used for this image. It expects an `Enum.ImageSource` value. |
| `imageId` | `integer` | Image asset ID currently displayed by this control. Example: `100103` is the built-in right-chevron image. |
| `imageColor` | `any` | Color applied over the image. You can change or animate this color. |
| `imageType` | `any` | Miliastra setting controlling how this image is drawn. It expects an `Enum.ImageType` value. |
| `fillAmount` | `number` | Amount of the image that is filled, where supported by its image type. A value near `0` shows very little; `1` means fully filled. |

### `MiliUI.TextControl`

**Inherits from:** [`MiliUI.Control`](native.md#miliuicontrol). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `text` | `string` | The words currently shown by this native Text control. |
| `fontSize` | `integer` | Size of the letters in this native Text control. |
| `fontColor` | `any` | Color of the letters. You can change or animate this color. |
| `bgColor` | `any` | Color behind the text, if a background is enabled. |
| `horizontalAlignment` | `any` | Place the text toward the left, middle, or right of its box. Use a value from Miliastra's `Enum.TextHorizontalAlignment`. |
| `verticalAlignment` | `any` | Place the text toward the top, middle, or bottom of its box. Use a value from Miliastra's `Enum.TextVerticalAlignment`. |
| `enableOutline` | `boolean` | Show or hide an outline around the letters. |
| `outlineColor` | `any` | Color of the outline around the letters. You can animate it. |
| `adaptiveFontSize` | `boolean` | Allow text to shrink when needed to fit inside the available space. |
| `minimumFontSize` | `integer` | Smallest font size the text can shrink to when `adaptiveFontSize` is enabled. |

### `MiliUI.CursorAreaControl`

**Inherits from:** [`MiliUI.Control`](native.md#miliuicontrol). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `raycastTarget` | `boolean` | Whether the mouse or touch pointer can detect this otherwise invisible clickable area. |

### `MiliUI.ButtonControl`

**Inherits from:** [`MiliUI.Control`](native.md#miliuicontrol). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `interactable` | `boolean` | Whether the player can activate this native Button. `false` disables clicking. |
| `raycastTarget` | `boolean` | Whether mouse or touch input can detect this Button. Set `false` to let pointer input ignore it. |
| `clickAudioId` | `integer` | ID of the sound to play when this native Button is activated. |

### `MiliUI.AnimationControl`

**Inherits from:** [`MiliUI.Control`](native.md#miliuicontrol). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `animationId` | `integer` | Configured UI animation asset ID. |
| `playSoundEffect` | `boolean` | Whether sound effects authored into the animation are played. |
| `layer` | `any` | The Miliastra animation layer this control uses. The value comes from `Enum.UIAnimationLayer`. |

### `MiliUI.FullscreenAnimationControl`

Native Fullscreen UI Animation control. Miliastra fixes its rendering at the bottom of all UI layers; the layer cannot be changed.

**Inherits from:** [`MiliUI.Control`](native.md#miliuicontrol). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `animationId` | `integer` | Configured fullscreen UI animation asset ID. |
| `playSoundEffect` | `boolean` | Whether sound effects authored into the animation are played. |

### `MiliUI.KeyHintControl`

**Inherits from:** [`MiliUI.Control`](native.md#miliuicontrol). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `keyboardKeyCode` | `any` | Read/write Enum.KeyboardKeyCode binding. The native control displays the appropriate keyboard/mouse binding for the active input device. |
| `controllerKeyCode` | `any` | Read/write Enum.ControllerKeyCode binding. The native control displays the appropriate controller binding for the active input device. |

### `MiliUI.TextWindowControl`

**Inherits from:** [`MiliUI.TextControl`](native.md#miliuitextcontrol). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `interactable` | `boolean` | Whether the player can click or interact with this control. |
| `showScrollBar` | `boolean` | Show a scrollbar when there is more content than fits. |

### `MiliUI.GridScrollerControl`

**Inherits from:** [`MiliUI.Control`](native.md#miliuicontrol). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `itemCount` | `integer` | Read-only runtime item count. |
| `itemPrefabIndex` | `integer` | Current beta list-item template property. |
| `raycastTarget` | `boolean` | Allow this native control to receive pointer hit-testing, such as clicks. |
| `showScrollBar` | `boolean` | Show a scrollbar when there is more content than fits. |
| `interactable` | `boolean` | Whether the player can click or interact with this control. |
| `scrollDirection` | `any` | Read-only scrolling direction chosen in Miliastra's GridScroller settings. Uses `Enum.ScrollDirection`. |
| `layoutConstraint` | `any` | Read-only grid arrangement rule chosen in the editor. Uses `Enum.ScrollLayoutConstraint`. |
| `layoutConstraintFixedCount` | `number` | Read-only fixed-layout item count. |
| `scrollProgress` | `number` | Tweenable read/write progress; runtime clamps to 0-1. |

## Type aliases and enum values

### `MiliUI.CursorCallback`

```lua
---@alias MiliUI.CursorCallback fun(eventData:MiliUI.CursorEventData)
```

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `CursorEventData:GetUIPos()`

Returns the current UI position in lower-left-origin canvas coordinates.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y |

**Original LuaLS annotations:**

```lua
---@return number x, number y
```


### `CursorEventData:GetPressUIPos()`

Returns the UI position where the current press began.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y |

**Original LuaLS annotations:**

```lua
---@return number x, number y
```


### `CursorEventData:GetUIPosDelta()`

Returns this cursor event's UI-space displacement.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y |

**Original LuaLS annotations:**

```lua
---@return number x, number y
```


### `Control:GetChildren()`

Return the child controls directly inside this UI container as a Lua table (list).

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Control[]` | children |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Control[] children
```


### `Control:GetChild(name)`

Find a direct child control by the name you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `name` | `string` | — |
| Returns | `MiliUI.Control\|nil` | child |

**Original LuaLS annotations:**

```lua
---@param name string
---@return MiliUI.Control|nil child
```


### `Control:FindChild(path)`

Find a nested child control using its name or path.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `path` | `string` | — |
| Returns | `MiliUI.Control\|nil` | child |

**Original LuaLS annotations:**

```lua
---@param path string
---@return MiliUI.Control|nil child
```


### `Control:SetActive(active)`

Activate or deactivate this native UI control. Pass `true` to activate it or `false` to deactivate it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `active` | `boolean` | — |

**Original LuaLS annotations:**

```lua
---@param active boolean
```


### `Control:SetVisible(visible)`

Show or hide this native UI control. Pass `true` to show it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `visible` | `boolean` | — |

**Original LuaLS annotations:**

```lua
---@param visible boolean
```


### `Control:GetSiblingIndex()`

Return this control's current position among its parent's children.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | index Zero-based sibling index. |

**Original LuaLS annotations:**

```lua
---@return integer index Zero-based sibling index.
```


### `Control:SetSiblingIndex(index)`

Change this control's position among its parent's children.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | Zero-based sibling index. |
| Returns | `boolean` | succeeded |

**Original LuaLS annotations:**

```lua
---@param index integer Zero-based sibling index.
---@return boolean succeeded
```


### `Control:SetAsFirstSibling()`

Move this control to the first position among the children of its parent.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | succeeded |

**Original LuaLS annotations:**

```lua
---@return boolean succeeded
```


### `Control:SetAsLastSibling()`

Move this control to the last position among the children of its parent.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | succeeded |

**Original LuaLS annotations:**

```lua
---@return boolean succeeded
```


### `Control:GetAnchoredPosition()`

Return this control's horizontal and vertical positions relative to its anchors.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y |

**Original LuaLS annotations:**

```lua
---@return number x, number y
```


### `Control:SetAnchoredPosition(x, y)`

Move this control by changing its horizontal (`x`) and vertical (`y`) position relative to its anchors, in UI units.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `x` | `number` | — |
| Parameter `y` | `number` | — |

**Original LuaLS annotations:**

```lua
---@param x number
---@param y number
```


### `Control:GetSizeDelta()`

Return this control's current native width and height adjustments.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | width, number height |

**Original LuaLS annotations:**

```lua
---@return number width, number height
```


### `Control:SetSizeDelta(width, height)`

Change this control's native width and height adjustments relative to its anchors.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `width` | `number` | — |
| Parameter `height` | `number` | — |

**Original LuaLS annotations:**

```lua
---@param width number
---@param height number
```


### `Control:GetAnchorMin()`

Return the current anchor min from this Control.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y |

**Original LuaLS annotations:**

```lua
---@return number x, number y
```


### `Control:SetAnchorMin(x, y)`

Change this Control's anchor min setting using the supplied value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `x` | `number` | — |
| Parameter `y` | `number` | — |

**Original LuaLS annotations:**

```lua
---@param x number
---@param y number
```


### `Control:GetAnchorMax()`

Return the current anchor max from this Control.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y |

**Original LuaLS annotations:**

```lua
---@return number x, number y
```


### `Control:SetAnchorMax(x, y)`

Change this Control's anchor max setting using the supplied value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `x` | `number` | — |
| Parameter `y` | `number` | — |

**Original LuaLS annotations:**

```lua
---@param x number
---@param y number
```


### `Control:GetPivot()`

Return the control's horizontal and vertical pivot positions.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y |

**Original LuaLS annotations:**

```lua
---@return number x, number y
```


### `Control:SetPivot(x, y)`

Change which point inside the control is used as the center for positioning and rotation.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `x` | `number` | — |
| Parameter `y` | `number` | — |

**Original LuaLS annotations:**

```lua
---@param x number
---@param y number
```


### `Control:GetLocalScale()`

Return this native control's current visual size multipliers.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y, number z |

**Original LuaLS annotations:**

```lua
---@return number x, number y, number z
```


### `Control:SetLocalScale(x, y, z)`

Change the visual size multipliers of this native control. `1` means normal size.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `x` | `number` | — |
| Parameter `y` | `number` | — |
| Parameter `z` | `number` | — |

**Original LuaLS annotations:**

```lua
---@param x number
---@param y number
---@param z number
```


### `Control:GetLocalRotation()`

Return this native control's current X, Y, and Z rotation angles.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y, number z |

**Original LuaLS annotations:**

```lua
---@return number x, number y, number z
```


### `Control:SetLocalRotation(x, y, z)`

Rotate this native control by the specified X, Y, and Z angles, in degrees.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `x` | `number` | — |
| Parameter `y` | `number` | — |
| Parameter `z` | `number` | — |

**Original LuaLS annotations:**

```lua
---@param x number
---@param y number
---@param z number
```


### `Control:GetScript(scriptPrefabIndex)`

Return the current script from this Control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `scriptPrefabIndex` | `integer` | — |
| Returns | `any` | script |

**Original LuaLS annotations:**

```lua
---@param scriptPrefabIndex integer
---@return any script
```


### `Control:GetScriptByPath(scriptPath)`

Return the current script by path from this Control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `scriptPath` | `string` | — |
| Returns | `any` | script |

**Original LuaLS annotations:**

```lua
---@param scriptPath string
---@return any script
```


### `Control:GetScripts()`

Return the current scripts from this Control.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `any[]` | scripts |

**Original LuaLS annotations:**

```lua
---@return any[] scripts
```


### `Control:AddKeyEventListener(eventType, callback)`

Registers a key-event listener. Key callbacks receive no arguments; return true to mark handled.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.KeyEventType value. Never hardcode numeric enum values. |
| Parameter `callback` | `fun():boolean` | — |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.KeyEventType value. Never hardcode numeric enum values.
---@param callback fun():boolean
```


### `Control:RemoveKeyEventListener(eventType, callback)`

Remove key event listener from this Control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.KeyEventType value. |
| Parameter `callback` | `fun():boolean` | — |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.KeyEventType value.
---@param callback fun():boolean
```


### `Control:RemoveKeyEventListeners(eventType)`

Remove key event listeners from this Control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.KeyEventType value. |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.KeyEventType value.
```


### `Control:RemoveAllKeyEventListeners()`

Stop every key-event callback registered on this control.


### `Control:AddNavigationEventListener(eventType, callback)`

Add navigation event listener to this Control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.ControllerNavigationEventType value. |
| Parameter `callback` | `fun(...)` | Official API does not specify callback arguments. |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.ControllerNavigationEventType value.
---@param callback fun(...) Official API does not specify callback arguments.
```


### `Control:RemoveNavigationEventListener(eventType, callback)`

Remove navigation event listener from this Control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.ControllerNavigationEventType value. |
| Parameter `callback` | `fun(...)` | — |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.ControllerNavigationEventType value.
---@param callback fun(...)
```


### `Control:RemoveNavigationEventListeners(eventType)`

Remove navigation event listeners from this Control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.ControllerNavigationEventType value. |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.ControllerNavigationEventType value.
```


### `Control:RemoveAllNavigationEventListeners()`

Stop every controller-navigation callback registered on this control.


### `Control:GetControllerNavigation(direction)`

Return the focus-navigation setting for the direction you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `direction` | `any` | Enum.ControllerNavigationDir value. |
| Returns | `any` | mode Enum.ControllerNavigationMode value. |
| Returns | `MiliUI.Control\|nil` | target |

**Original LuaLS annotations:**

```lua
---@param direction any Enum.ControllerNavigationDir value.
---@return any mode Enum.ControllerNavigationMode value.
---@return MiliUI.Control|nil target
```


### `Control:SetControllerNavigation(direction, mode, target)`

Configure which control should receive controller focus when the player presses a direction.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `direction` | `any` | Enum.ControllerNavigationDir value. |
| Parameter `mode` | `any` | Enum.ControllerNavigationMode value. |
| Parameter `target?` | `MiliUI.Control` | — |

**Original LuaLS annotations:**

```lua
---@param direction any Enum.ControllerNavigationDir value.
---@param mode any Enum.ControllerNavigationMode value.
---@param target? MiliUI.Control
```


### `ImageControl:SetImage(imageSource, imageId)`

Change this ImageControl's image setting using the supplied value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `imageSource` | `any` | Enum.ImageSource value. |
| Parameter `imageId` | `integer` | — |

**Original LuaLS annotations:**

```lua
---@param imageSource any Enum.ImageSource value.
---@param imageId integer
```


### `CursorAreaControl:AddCursorEventListener(eventType, callback)`

Add cursor event listener to this CursorAreaControl.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.CursorEventType value. |
| Parameter `callback` | `MiliUI.CursorCallback` | — |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.CursorEventType value.
---@param callback MiliUI.CursorCallback
```


### `CursorAreaControl:RemoveCursorEventListener(eventType, callback)`

Remove cursor event listener from this CursorAreaControl.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.CursorEventType value. |
| Parameter `callback` | `MiliUI.CursorCallback` | — |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.CursorEventType value.
---@param callback MiliUI.CursorCallback
```


### `CursorAreaControl:RemoveCursorEventListeners(eventType)`

Remove cursor event listeners from this CursorAreaControl.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.CursorEventType value. |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.CursorEventType value.
```


### `CursorAreaControl:RemoveAllCursorEventListeners()`

Stop every mouse/touch callback registered on this control.


### `CursorAreaControl:SimulateCursorClick()`

Trigger this control's cursor-click behavior using code, as if the player clicked it.


### `ButtonControl:AddCursorEventListener(eventType, callback)`

Add cursor event listener to this ButtonControl.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.CursorEventType value. |
| Parameter `callback` | `MiliUI.CursorCallback` | — |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.CursorEventType value.
---@param callback MiliUI.CursorCallback
```


### `ButtonControl:RemoveCursorEventListener(eventType, callback)`

Remove cursor event listener from this ButtonControl.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.CursorEventType value. |
| Parameter `callback` | `MiliUI.CursorCallback` | — |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.CursorEventType value.
---@param callback MiliUI.CursorCallback
```


### `ButtonControl:RemoveCursorEventListeners(eventType)`

Remove cursor event listeners from this ButtonControl.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `eventType` | `any` | Enum.CursorEventType value. |

**Original LuaLS annotations:**

```lua
---@param eventType any Enum.CursorEventType value.
```


### `ButtonControl:RemoveAllCursorEventListeners()`

Stop every mouse/touch callback registered on this control.


### `ButtonControl:SimulateCursorClick()`

Trigger this control's cursor-click behavior using code, as if the player clicked it.


### `AnimationControl:PlayAnimation()`

Plays the configured UI animation. Calling while already playing restarts it.


### `AnimationControl:StopAnimation()`

Stops the configured UI animation.


### `GridScrollerControl:RefreshItems(itemCount, callback)`

Update the items managed by this GridScrollerControl.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `itemCount` | `integer` | — |
| Parameter `callback` | `fun(control:MiliUI.Control, runtimeIndex:integer)` | — |

**Original LuaLS annotations:**

```lua
---@param itemCount integer
---@param callback fun(control:MiliUI.Control, runtimeIndex:integer)
```


### `GridScrollerControl:ScrollToItemAt(index, alignType)`

Scroll the native GridScroller until the item at the supplied runtime index is visible. The index is provided by Miliastra; do **not** assume it starts at `0` or `1`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | Runtime item index. |
| Parameter `alignType` | `any` | Enum.ScrollAlignType value. |

**Original LuaLS annotations:**

```lua
---@param index integer Runtime item index.
---@param alignType any Enum.ScrollAlignType value.
```


### `GridScrollerControl:GetItemIndex(control)`

Return the current item index from this GridScrollerControl.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Control` | — |
| Returns | `integer` | index |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Control
---@return integer index
```


### `GridScrollerControl:GetItemSize()`

Return the current item size from this GridScrollerControl.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | width, number height |

**Original LuaLS annotations:**

```lua
---@return number width, number height
```


### `GridScrollerControl:GetItemSpacing()`

Return the current item spacing from this GridScrollerControl.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y |

**Original LuaLS annotations:**

```lua
---@return number x, number y
```


### `GridScrollerControl:GetPadding()`

Returns padding in Left, Right, Top, Bottom order.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | left, number right, number top, number bottom |

**Original LuaLS annotations:**

```lua
---@return number left, number right, number top, number bottom
```


### `GridScrollerControl:GetContentLength()`

Return the current content length from this GridScrollerControl.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | length |

**Original LuaLS annotations:**

```lua
---@return number length
```
