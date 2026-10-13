# API reference: Components Native

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_native.lua`  
**Coverage:** 10 classes, 44 fields, 0 aliases, 39 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Components](../Components.md) · [ControlGroups](../ControlGroups.md)

## Classes, component props and return types

### `MiliUI.AnimationProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `animation?` | `integer` | Another name for `animationId`, the ID of a UI animation created in Miliastra. |
| `animationId?` | `integer` | ID of an animation asset you created in Miliastra. Leave blank to use the animation already configured in the UI template. |
| `playSoundEffect?` | `boolean` | Play the sounds attached to this authored UI animation when it runs. |
| `layer?` | `any` | Choose which Miliastra UI animation layer this animation plays on. Use an `Enum.UIAnimationLayer` value. |
| `autoPlay?` | `boolean` | Start this animation automatically as soon as the UI is created. Default: `false`. |

### `MiliUI.Animation`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.AnimationControl` | Underlying Miliastra UI control for this component. |

### `MiliUI.FullscreenAnimationProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `animation?` | `integer` | Another name for `animationId`, the full-screen animation asset ID. |
| `animationId?` | `integer` | ID of a fullscreen UI animation asset. If omitted, MiliUI keeps the asset already assigned to its template. |
| `playSoundEffect?` | `boolean` | Whether sound effects authored into the animation should play. |
| `autoPlay?` | `boolean` | Start the full-screen animation immediately when it is created. Default: `false`. |

### `MiliUI.FullscreenAnimation`

Miliastra renders this native control at the bottom of all UI layers.
Its render layer cannot be changed; sibling order and Host/Page layering do not move it above normal UI.

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.FullscreenAnimationControl` | Underlying Miliastra UI control for this component. |

### `MiliUI.KeyHintProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `keyboardKey?` | `any` | Which keyboard key picture to display in the hint. Use the corresponding `Enum.KeyboardKeyCode` value. |
| `controllerKey?` | `any` | Which controller button picture to display when the player uses a controller. Use `Enum.ControllerKeyCode`. |
| `keyboardKeyCode?` | `any` | Another name for `keyboardKey`, which controls the key picture shown for keyboard players. |
| `controllerKeyCode?` | `any` | Another name for `controllerKey`, which controls the button picture shown for controller players. |

### `MiliUI.KeyHint`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.KeyHintControl` | Underlying Miliastra UI control for this component. |

### `MiliUI.TextWindowProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `text?` | `any` | Content inside the scrolling text box. Example: `text = 'Game Rules'`, or use a TextSpec for translation. |
| `textId?` | `string` | Sandbox Text Mapping ID used with game.GetText. |
| `needsTranslation?` | `boolean` | Mark this text for your localization/export tools. This does **not** turn translated-text lookup on or off while the game runs. |
| `args?` | `table<string, any>` | Values to insert into placeholders inside the displayed text. Example: `text = 'Wave {wave}', args = { wave = 3 }` displays **Wave 3**. |
| `interactable?` | `boolean` | Allow the player to interact with this scrolling text window. Default: `true`. |
| `showScrollBar?` | `boolean` | Show a scrollbar when the text is too long for the window. Use for long descriptions or patch notes. |
| `textSize?` | `MiliUI.TextSize` | Size of the displayed text. Use e.g. `'sm'`, `'md'`, or a number. |
| `size?` | `MiliUI.TextSize` | Another name for `textSize`, which sets the font size. Example: `size = 'md'`. |
| `textColor?` | `MiliUI.ColorValue` | Color of the displayed text. Example: `'white'` or `'accent'`. |
| `color?` | `MiliUI.ColorValue` | Another name for `textColor`, which sets the color of the letters. |
| `background?` | `MiliUI.ColorValue` | Color or appearance of the component's main background. |
| `bgColor?` | `MiliUI.ColorValue` | Another name for `background`, the color behind the text window. |
| `outline?` | `boolean` | Enable or disable the outline behavior of this text window. |
| `outlineColor?` | `MiliUI.ColorValue` | Color used for the outline appearance of this text window. Example: `'accent'` or `'white'`. |
| `horizontalAlignment?` | `any` | Place text on the left, center, or right of the window. Use a value from Miliastra's `Enum.TextHorizontalAlignment`. |
| `verticalAlignment?` | `any` | Place text at the top, center, or bottom of the window. Use a value from Miliastra's `Enum.TextVerticalAlignment`. |
| `adaptiveFontSize?` | `boolean` | Let the text become smaller if it does not fit inside the window. Set `true` to enable automatic text resizing. |
| `minimumFontSize?` | `MiliUI.TextSize` | Smallest font size this TextWindow is allowed to shrink to when automatic resizing is enabled. Default: `16`. |
| `allowSmallAdaptiveText?` | `boolean` | Allow automatic text resizing to go **below 16** if necessary. Useful only when you explicitly want very small text. |
| `fitContentHeight?` | `boolean` | Automatically resize the text window's height to fit all wrapped lines at its current width, unless a fixed height is set. |
| `fitContentHeightInsetX?` | `number` | Horizontal native-wrap safety inset per side. Default 8. |

### `MiliUI.TextWindow`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.TextWindowControl` | Underlying Miliastra UI control for this component. |

### `MiliUI.GridScrollerProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `itemPrefabIndex?` | `integer` | Template index of the repeating item this built-in Miliastra grid should create. |
| `raycastTarget?` | `boolean` | Let mouse/touch input detect this native grid area. Default: `true`. |
| `showScrollBar?` | `boolean` | Display the built-in scrollbar when the grid has more items than will fit. Default: `true`. |
| `interactable?` | `boolean` | Let the player scroll or interact with the native grid. Default: `true`. |
| `scrollProgress?` | `number` | Initial native progress; MiliUI clamps to 0-1. Runtime-confirmed for Vertical: 0=bottom/end, 1=top/start. |

### `MiliUI.GridScroller`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.GridScrollerControl` | Underlying Miliastra UI control for this component. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Animation:Play()`

Plays the configured UI animation. Calling this while it is already playing restarts it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Animation` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Animation
```


### `Animation:Stop()`

Stops the configured UI animation.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Animation` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Animation
```


### `Animation:SetAnimation(animationId)`

Change the animation asset ID this control will play.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `animationId` | `integer` | — |
| Returns | `MiliUI.Animation` | — |

**Original LuaLS annotations:**

```lua
---@param animationId integer
---@return MiliUI.Animation
```


### `Animation:SetSoundEnabled(enabled)`

Turn the animation's sound effects on or off. Pass `true` to enable them.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Animation` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Animation
```


### `Animation:SetLayer(layer)`

Choose the Miliastra animation layer this animation uses.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `layer` | `any` | Enum.UIAnimationLayer value. |
| Returns | `MiliUI.Animation` | — |

**Original LuaLS annotations:**

```lua
---@param layer any Enum.UIAnimationLayer value.
---@return MiliUI.Animation
```


### `Animation:Destroy()`

Remove this component from the screen and release its UI controls.


### `FullscreenAnimation:Play()`

Plays the configured fullscreen animation from the beginning. Calling Play again restarts it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.FullscreenAnimation` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.FullscreenAnimation
```


### `FullscreenAnimation:Stop()`

Stops the fullscreen animation and leaves the native control inactive.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.FullscreenAnimation` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.FullscreenAnimation
```


### `FullscreenAnimation:SetAnimation(animationId)`

Updates the animation used by the next playback. Active playback is not disturbed until Play is called again.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `animationId` | `integer` | — |
| Returns | `MiliUI.FullscreenAnimation` | — |

**Original LuaLS annotations:**

```lua
---@param animationId integer
---@return MiliUI.FullscreenAnimation
```


### `FullscreenAnimation:SetSoundEnabled(enabled)`

Updates the sound setting used by the next playback. Active playback is not disturbed until Play is called again.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.FullscreenAnimation` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.FullscreenAnimation
```


### `FullscreenAnimation:Destroy()`

Remove this component from the screen and release its UI controls.


### `KeyHint:SetKeys(keyboardKey, controllerKey)`

Updates one or both native bindings. Nil leaves that binding unchanged.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `keyboardKey?` | `any` | Enum.KeyboardKeyCode value. |
| Parameter `controllerKey?` | `any` | Enum.ControllerKeyCode value. |
| Returns | `MiliUI.KeyHint` | — |

**Original LuaLS annotations:**

```lua
---@param keyboardKey? any Enum.KeyboardKeyCode value.
---@param controllerKey? any Enum.ControllerKeyCode value.
---@return MiliUI.KeyHint
```


### `KeyHint:SetKeyboardKey(key)`

Change the keyboard key of this KeyHint.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `any` | Enum.KeyboardKeyCode value. |
| Returns | `MiliUI.KeyHint` | — |

**Original LuaLS annotations:**

```lua
---@param key any Enum.KeyboardKeyCode value.
---@return MiliUI.KeyHint
```


### `KeyHint:SetControllerKey(key)`

Change the controller key of this KeyHint.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `any` | Enum.ControllerKeyCode value. |
| Returns | `MiliUI.KeyHint` | — |

**Original LuaLS annotations:**

```lua
---@param key any Enum.ControllerKeyCode value.
---@return MiliUI.KeyHint
```


### `KeyHint:GetKeyboardKey()`

Return the current keyboard key from this KeyHint.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `any` | keyboardKey Enum.KeyboardKeyCode value. |

**Original LuaLS annotations:**

```lua
---@return any keyboardKey Enum.KeyboardKeyCode value.
```


### `KeyHint:GetControllerKey()`

Return the current controller key from this KeyHint.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `any` | controllerKey Enum.ControllerKeyCode value. |

**Original LuaLS annotations:**

```lua
---@return any controllerKey Enum.ControllerKeyCode value.
```


### `KeyHint:Destroy()`

Remove this component from the screen and release its UI controls.


### `TextWindow:SetText(spec)`

Change the words currently shown in this TextWindow.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.TextWindow` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.TextWindow
```


### `TextWindow:SetEnabled(enabled)`

Allow or block player interaction. Pass `true` to enable this component or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.TextWindow` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.TextWindow
```


### `TextWindow:SetScrollBarVisible(visible)`

Show or hide the TextWindow's built-in scrollbar.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `visible` | `boolean` | — |
| Returns | `MiliUI.TextWindow` | — |

**Original LuaLS annotations:**

```lua
---@param visible boolean
---@return MiliUI.TextWindow
```


### `TextWindow:Destroy()`

Remove this component from the screen and release its UI controls.


### `GridScroller:Refresh(itemCount, callback)`

Refreshes the recycled native items. Use runtimeIndex as provided; do not assume 0/1 base.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `itemCount` | `integer` | — |
| Parameter `callback` | `fun(control:MiliUI.Control, runtimeIndex:integer)` | — |
| Returns | `MiliUI.GridScroller` | — |

**Original LuaLS annotations:**

```lua
---@param itemCount integer
---@param callback fun(control:MiliUI.Control, runtimeIndex:integer)
---@return MiliUI.GridScroller
```


### `GridScroller:ScrollTo(index, alignType)`

Move the scrollbar to the position you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | Runtime item index. |
| Parameter `alignType` | `any` | Enum.ScrollAlignType value. |
| Returns | `MiliUI.GridScroller` | — |

**Original LuaLS annotations:**

```lua
---@param index integer Runtime item index.
---@param alignType any Enum.ScrollAlignType value.
---@return MiliUI.GridScroller
```


### `GridScroller:SetProgress(progress)`

Sets native scroll progress without inverting the host's direction.
For a Vertical GridScroller, runtime testing confirms 0=bottom/end, 0.5=middle, 1=top/start.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `progress` | `number` | Clamped to 0-1. |
| Returns | `MiliUI.GridScroller` | — |

**Original LuaLS annotations:**

```lua
---@param progress number Clamped to 0-1.
---@return MiliUI.GridScroller
```


### `GridScroller:GetProgress()`

Returns native scroll progress. For Vertical, 0=bottom/end and 1=top/start.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | progress |

**Original LuaLS annotations:**

```lua
---@return number progress
```


### `GridScroller:SetItemPrefabIndex(index)`

Change the item prefab index of this GridScroller.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Returns | `MiliUI.GridScroller` | — |

**Original LuaLS annotations:**

```lua
---@param index integer
---@return MiliUI.GridScroller
```


### `GridScroller:GetItemPrefabIndex()`

Return the current item prefab index from this GridScroller.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | index |

**Original LuaLS annotations:**

```lua
---@return integer index
```


### `GridScroller:GetItemCount()`

Return the current item count from this GridScroller.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | count |

**Original LuaLS annotations:**

```lua
---@return integer count
```


### `GridScroller:GetScrollDirection()`

Return the current scroll direction from this GridScroller.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `any` | scrollDirection Enum.ScrollDirection value. |

**Original LuaLS annotations:**

```lua
---@return any scrollDirection Enum.ScrollDirection value.
```


### `GridScroller:GetLayoutConstraint()`

Return the current layout constraint from this GridScroller.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `any` | layoutConstraint Enum.ScrollLayoutConstraint value. |

**Original LuaLS annotations:**

```lua
---@return any layoutConstraint Enum.ScrollLayoutConstraint value.
```


### `GridScroller:GetLayoutConstraintFixedCount()`

Return the current layout constraint fixed count from this GridScroller.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | count |

**Original LuaLS annotations:**

```lua
---@return number count
```


### `GridScroller:GetContentLength()`

Return the current content length from this GridScroller.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | length |

**Original LuaLS annotations:**

```lua
---@return number length
```


### `GridScroller:GetItemIndex(itemControl)`

Return the current item index from this GridScroller.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `itemControl` | `MiliUI.Parent` | — |
| Returns | `integer` | index |

**Original LuaLS annotations:**

```lua
---@param itemControl MiliUI.Parent
---@return integer index
```


### `GridScroller:GetItemSize()`

Return the current item size from this GridScroller.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | width, number height |

**Original LuaLS annotations:**

```lua
---@return number width, number height
```


### `GridScroller:GetItemSpacing()`

Return the current item spacing from this GridScroller.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | x, number y |

**Original LuaLS annotations:**

```lua
---@return number x, number y
```


### `GridScroller:GetPadding()`

Return four numbers giving the empty space inside the GridScroller's left, right, top, and bottom edges, in that order.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | left, number right, number top, number bottom |

**Original LuaLS annotations:**

```lua
---@return number left, number right, number top, number bottom
```


### `GridScroller:SetEnabled(enabled)`

Allow or block player interaction. Pass `true` to enable this component or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.GridScroller` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.GridScroller
```


### `GridScroller:SetScrollBarVisible(visible)`

Show or hide the TextWindow's built-in scrollbar.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `visible` | `boolean` | — |
| Returns | `MiliUI.GridScroller` | — |

**Original LuaLS annotations:**

```lua
---@param visible boolean
---@return MiliUI.GridScroller
```


### `GridScroller:Destroy()`

Remove this component from the screen and release its UI controls.
