# API reference: Components Dropdown

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_dropdown.lua`  
**Coverage:** 8 classes, 151 fields, 1 aliases, 24 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Dropdown](../Dropdown.md) · [ControllerSupport](../ControllerSupport.md)

## Classes, component props and return types

### `MiliUI.DropdownSubmitField`

| Field | Declared type | Description |
| --- | --- | --- |
| `type` | `MiliUI.DropdownValueType` | Type expected by the receiving Server Signal, such as `Int`, for this selected value. |
| `source?` | `'item'\|'index'` | Send the selected item's data (`'item'`) or its position in the list (`'index'`). Position numbers start at 1. |
| `key?` | `string` | Required when source=`item`; reads this field from the selected item table. |

### `MiliUI.DropdownSubmit`

| Field | Declared type | Description |
| --- | --- | --- |
| `signal` | `string` | Exact name of the Server Signal configured in your Server Node Graph. |
| `fields?` | `MiliUI.DropdownSubmitField[]` | Ordered parameter schema. Default sends the selected 1-based index as one Int parameter. |

### `MiliUI.DropdownParameter`

| Field | Declared type | Description |
| --- | --- | --- |
| `type` | `MiliUI.DropdownValueType` | Scalar ServerSignal parameter type. |
| `valueType` | `MiliUI.DropdownValueType` | Value type used by this Dropdown parameter. |
| `key?` | `string` | Unique/stable identity for this entry. |
| `source` | `'item'\|'index'` | Source used by this select parameter. |
| `value` | `any` | Current value stored in this component. |

### `MiliUI.DropdownPayload`

| Field | Declared type | Description |
| --- | --- | --- |
| `signal` | `string` | Signal used by this Dropdown payload. |
| `index` | `integer` | Selected 1-based item index. |
| `item` | `MiliUI.DropdownItem` | Data table for the option the player selected, including any extra fields you supplied. |
| `parameters` | `MiliUI.DropdownParameter[]` | Ordered scalar ServerSignal parameters. |

### `MiliUI.DropdownItem`

| Field | Declared type | Description |
| --- | --- | --- |
| `label?` | `MiliUI.TextSpec` | Text displayed for this choice. Example: `label = { text = 'Hard' }`. |
| `name?` | `string` | Convenience fallback label when label is omitted. |
| `meta?` | `any` | Optional right-side metadata text shown by the built-in renderer. |
| `disabled?` | `boolean` | Set `true` to show this option but prevent the player from selecting it. |
| `[string]` | `any` | Arbitrary game metadata returned through GetSelectedItem/onChange or used by submit fields. |

### `MiliUI.DropdownProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `items` | `MiliUI.DropdownItem[]` | Choices displayed when the player opens this dropdown. For example, `items = { { label = { text = 'Easy' } }, { label = { text = 'Hard' } } }` gives the player Easy and Hard choices. See `UI.Dropdown` for a complete example. |
| `selected?` | `integer` | Choose which item is selected when this dropdown first appears. Lua counts items starting from **1**, so `selected = 2` selects the second entry in `items`. |
| `placeholder?` | `MiliUI.TextSpec` | Text displayed before the player makes a selection. Example: `placeholder = { text = 'Choose a map' }`. |
| `width?` | `MiliUI.Dimension` | Width of the Dropdown box the player clicks to open the choices, in UI units. Example: `width = 320`. Default: `320`. |
| `height?` | `MiliUI.Dimension` | Height of the Dropdown box the player clicks, in UI units. Example: `height = 56`. Default: `56`. |
| `itemHeight?` | `number` | Height of each choice inside the dropdown list, in UI units. Example: `itemHeight = 46`. Default: `46`. |
| `itemGap?` | `number` | Empty space between choices in the dropdown list, in UI units. Default: `4`. |
| `menuPadding?` | `number` | Empty space **inside** the dropdown menu around its choices, in UI units. Default: `8`. |
| `menuGap?` | `number` | Empty space between the clickable Dropdown box and its dropdown menu, in UI units. Default: `7`. |
| `menuMargin?` | `number` | Minimum empty space between the open menu and the edge of the available screen area, in UI units. Default: `8`. |
| `maxVisibleItems?` | `integer` | Maximum number of choices shown before the dropdown scrolls. Example: `maxVisibleItems = 5`. |
| `maxMenuHeight?` | `number` | Optional additional menu-height cap. The visible-item count is reduced as needed, with at least one visible option. |
| `openDirection?` | `'auto'\|'up'\|'down'` | Choose whether the options list opens **above** or **below** the Dropdown control. `'up'` opens upward, `'down'` opens downward, and `'auto'` lets MiliUI choose the side with room. |
| `open?` | `boolean` | Choose whether the choices menu is already open when the Dropdown appears. Default: `false` (starts closed). |
| `closeOnSelect?` | `boolean` | Close the list of choices as soon as the player selects one. Set `closeOnSelect = false` to keep the list open after a choice is made. |
| `interactable?` | `boolean` | Allow the player to open this Dropdown and change the chosen option. Set `interactable = false` to disable it. Default: `true`. |
| `controllerFocus?` | `boolean` | Allow native focus on the field and visible options (default true). Confirm on the field opens it and moves focus into the menu; closing returns focus to the field. |
| `controllerFocusIndicator?` | `boolean\|MiliUI.ControllerFocusIndicatorProps` | Show a controller chevron beside the focused field or option. Set false to hide or supply a custom placement/size. |
| `background?` | `MiliUI.ColorValue` | Background color of the clickable Dropdown box when not hovered. Example: `background = 'surface'`. |
| `hoverColor?` | `MiliUI.ColorValue` | Background color of the Dropdown box when the mouse is over it or the menu is open. Example: `hoverColor = 'surfaceHover'`. |
| `disabledColor?` | `MiliUI.ColorValue` | Background color of the Dropdown box when the player cannot use it. Example: `disabledColor = 'surfaceDisabled'`. |
| `textColor?` | `MiliUI.ColorValue` | Color of the currently chosen option's text inside the Dropdown box. Example: `textColor = 'text'`. |
| `placeholderTextColor?` | `MiliUI.ColorValue` | Color of the placeholder shown before an option is selected. Example: `placeholderTextColor = 'muted'`. |
| `disabledTextColor?` | `MiliUI.ColorValue` | Color of the Dropdown box's text when the Dropdown is disabled. Example: `disabledTextColor = 'disabled'`. |
| `radius?` | `MiliUI.Radius` | How rounded the clickable Dropdown box's corners are. Example: `radius = 'lg'`. Default: `'lg'`. |
| `border?` | `boolean` | Show an outline around the clickable Dropdown box. Default: `true`. |
| `borderColor?` | `MiliUI.ColorValue` | Color of the outline around the Dropdown box. Example: `borderColor = 'border'`. |
| `backgroundImage?` | `integer` | Field background asset; compatibility surface-style name. `fieldImage` wins when supplied. |
| `backgroundStretch?` | `boolean` | Stretch the Dropdown box's background image to match its width and height. Default depends on its theme. |
| `borderImage?` | `integer` | Field border asset; compatibility surface-style name. `fieldBorderImage` wins when supplied. |
| `borderStretch?` | `boolean` | Stretch the image used for the Dropdown box's border to fit its shape. |
| `clipToRadius?` | `boolean` | Clip the field background image through the field radius. |
| `fieldImage?` | `integer` | Optional image asset ID used as the clickable Dropdown box's background. This takes priority over `backgroundImage`. |
| `fieldStretch?` | `boolean` | Stretch the image provided with `fieldImage` to fit the Dropdown box. |
| `fieldBorderImage?` | `integer` | Optional image asset ID for the outline around the clickable Dropdown box. This takes priority over `borderImage`. |
| `fieldBorderStretch?` | `boolean` | Stretch the border image supplied through `fieldBorderImage` to fit the Dropdown box. |
| `fieldClipToRadius?` | `boolean` | Trim the Dropdown box's background image so it follows the rounded corners chosen with `radius`. |
| `textSize?` | `MiliUI.TextSize` | Font size of the chosen option's text in the Dropdown box. Default: `'sm'` (small). |
| `adaptiveFontSize?` | `boolean` | Let the selected option's text shrink to fit inside the Dropdown box. Default: `true`. |
| `minimumFontSize?` | `number` | Smallest font size the chosen option's text is allowed to shrink to. Default: `10`. |
| `indicatorImage?` | `integer` | Image asset ID for the little dropdown indicator next to the selected value. Default: `100111` (small downward triangle). |
| `indicatorWidth?` | `number` | Width of the dropdown indicator image, in UI units. Default: `16`. |
| `indicatorHeight?` | `number` | Height of the dropdown indicator image, in UI units. Default: `12`. |
| `indicatorInset?` | `number` | Empty space between the dropdown indicator and the right edge of the Dropdown control. Default: `18` UI units. |
| `indicatorColor?` | `MiliUI.ColorValue` | Color of the small dropdown indicator when the menu is closed. Example: `indicatorColor = 'muted'`. |
| `indicatorOpenColor?` | `MiliUI.ColorValue` | Color of the dropdown indicator while the list of choices is open. |
| `indicatorDisabledColor?` | `MiliUI.ColorValue` | Color of the dropdown indicator when the player cannot use the Dropdown. |
| `indicatorRotation?` | `number` | Angle of the dropdown indicator when the menu is closed, in degrees. Default: `0`. |
| `indicatorOpenRotation?` | `number` | Extra rotation applied to the dropdown indicator when the menu opens, in degrees. Default: `180`. |
| `indicatorStretch?` | `boolean` | Stretch the dropdown indicator image to its configured width and height. Default: `false`. |
| `menuBackground?` | `MiliUI.ColorValue` | Background color of the open list of choices. Example: `menuBackground = 'surface'`. |
| `menuRadius?` | `MiliUI.Radius` | How rounded the corners of the open dropdown menu are. Example: `menuRadius = 'lg'`. Default: `'lg'`. |
| `menuBorder?` | `boolean` | Draw an outline around the open dropdown menu. Default: `true`. |
| `menuBorderColor?` | `MiliUI.ColorValue` | Color of the outline around the open dropdown menu. Example: `menuBorderColor = 'border'`. |
| `menuImage?` | `integer` | Optional image asset ID used as the background of the open dropdown menu. |
| `menuStretch?` | `boolean` | Stretch the menu background image to fit the open list's shape. |
| `menuBorderImage?` | `integer` | Optional image asset ID used as the outline around the open dropdown menu. |
| `menuBorderStretch?` | `boolean` | Stretch the border image around the open menu to fit its shape. |
| `menuClipToRadius?` | `boolean` | Trim the menu background image to follow the rounded corners set by `menuRadius`. |
| `itemColor?` | `MiliUI.ColorValue` | Background color of each choice in its normal, unselected state. Example: `itemColor = 'surface'`. |
| `itemHoverColor?` | `MiliUI.ColorValue` | Background color of a choice when the mouse is over it. |
| `selectedColor?` | `MiliUI.ColorValue` | Background color of the choice currently selected in the dropdown. |
| `selectedHoverColor?` | `MiliUI.ColorValue` | Background color of the selected choice when the mouse is over it. |
| `itemDisabledColor?` | `MiliUI.ColorValue` | Background color of a choice that is visible but cannot be selected. |
| `itemTextColor?` | `MiliUI.ColorValue` | Color of the text for a normal, unselected choice. Example: `itemTextColor = 'text'`. |
| `itemHoverTextColor?` | `MiliUI.ColorValue` | Color of an option's text while the mouse is over that option. |
| `selectedTextColor?` | `MiliUI.ColorValue` | Color of the text for the currently selected option. |
| `itemDisabledTextColor?` | `MiliUI.ColorValue` | Color of text or extra information shown for a disabled option. |
| `itemRadius?` | `MiliUI.Radius` | How rounded each choice's background corners are. Example: `itemRadius = 'md'`. Default: `'md'`. |
| `itemImage?` | `integer` | Optional image asset ID for the background of each built-in dropdown choice. |
| `itemStretch?` | `boolean` | Stretch each choice's background image to fit its size. |
| `itemBorder?` | `boolean` | Draw an outline around each dropdown choice. Set `true` to enable outlines. |
| `itemBorderColor?` | `MiliUI.ColorValue` | Color of the outline around each dropdown choice. |
| `itemBorderImage?` | `integer` | Optional option border asset; implies a border when itemBorder is omitted. |
| `itemBorderStretch?` | `boolean` | Stretch each choice's border image to fit its size. |
| `itemClipToRadius?` | `boolean` | Trim each choice's background image to its rounded-corner shape. |
| `itemTextSize?` | `MiliUI.TextSize` | Font size of the text for each dropdown choice. Default: `'xs'` (extra small). |
| `itemAdaptiveFontSize?` | `boolean` | Allow long option names to shrink until they fit inside each choice. Default: `true`. |
| `minimumItemFontSize?` | `number` | Smallest font size a choice's label may shrink to. Default: `10`. |
| `metaTextColor?` | `MiliUI.ColorValue` | Color of the additional information displayed beside a normal dropdown choice. |
| `metaHoverTextColor?` | `MiliUI.ColorValue` | Color of that extra information when the mouse is over a choice. |
| `metaSelectedTextColor?` | `MiliUI.ColorValue` | Color of that extra information when its choice is selected. |
| `metaTextSize?` | `MiliUI.TextSize` | Font size of the extra information displayed beside each choice. Default: `'xs'`. |
| `metaAdaptiveFontSize?` | `boolean` | Allow an option's extra information text to shrink if it does not fit. Default: `true`. |
| `minimumMetaFontSize?` | `number` | Smallest font size the additional option information may shrink to. Default: `10`. |
| `scrollbarControllerFocus?` | `boolean` | Allow controller focus on the dropdown's scrollbar arrow buttons (default false). By default Up/Down on an option automatically scrolls to the next enabled choice, so scrollbar buttons remain mouse/touch-only and cannot strand controller focus at the ends. |
| `scrollbarWidth?` | `number` | Reserved scrollbar column width. Default from Theme.scrollbar.width (24 built-in). |
| `scrollbarGap?` | `number` | Gap between option column and scrollbar. Default from Theme.scrollbar.gap (8 built-in). |
| `scrollbarTrackWidth?` | `number` | Track width. Default from Theme.scrollbar.trackWidth (5 built-in). |
| `scrollbarThumbWidth?` | `number` | Thumb width. Default from Theme.scrollbar.thumbWidth (11 built-in) and never smaller than track width. |
| `scrollbarButtonSize?` | `number` | Up/down button size. Default from Theme.scrollbar.buttonSize (24 built-in). |
| `scrollbarButtonGap?` | `number` | Gap from each arrow button to the track. Default from Theme.scrollbar.buttonGap (4 built-in). |
| `scrollbarThumbMinimumHeight?` | `number` | Minimum thumb height. Default from Theme.scrollbar.thumbMinimumHeight (28 built-in). |
| `scrollbarTrackColor?` | `MiliUI.ColorValue` | Track tint. Default from Theme.scrollbar.trackColor (surface2 built-in). |
| `scrollbarThumbColor?` | `MiliUI.ColorValue` | Thumb tint. Default from Theme.scrollbar.thumbColor (accent built-in). |
| `scrollbarThumbHoverColor?` | `MiliUI.ColorValue` | Hover/drag thumb tint. Default from Theme.scrollbar.thumbHoverColor (accentHover built-in). |
| `scrollbarIconColor?` | `MiliUI.ColorValue` | Enabled arrow tint. Default from Theme.scrollbar.iconColor (muted built-in). |
| `scrollbarIconDisabledColor?` | `MiliUI.ColorValue` | Disabled arrow tint. Default from Theme.scrollbar.iconDisabledColor (disabled built-in). |
| `scrollbarIndicatorImage?` | `integer` | Up/down arrow asset. Default from Theme.scrollbar.indicatorImage (100111 built-in). |
| `scrollbarIndicatorSize?` | `number` | Arrow icon size. Default from Theme.scrollbar.indicatorSize (10 built-in). |
| `scrollbarRadius?` | `MiliUI.Radius` | Track radius used when the track is not image-skinned. |
| `scrollbarThumbRadius?` | `MiliUI.Radius` | Thumb radius used when the thumb is not image-skinned. |
| `scrollbarTrackImage?` | `integer` | Track background asset. Default from Theme.scrollbar.trackImage (100001 rectangular fill built-in). |
| `scrollbarTrackStretch?` | `boolean` | Track image stretch mode. Default from Theme.scrollbar.trackStretch (true built-in). |
| `scrollbarTrackClipToRadius?` | `boolean` | Clip scrollbarTrackImage through scrollbarRadius. |
| `scrollbarThumbImage?` | `integer` | Thumb background asset. Default from Theme.scrollbar.thumbImage (106007 light rounded rectangle built-in). |
| `scrollbarThumbStretch?` | `boolean` | Thumb image stretch mode. Default from Theme.scrollbar.thumbStretch (true built-in). |
| `scrollbarThumbClipToRadius?` | `boolean` | Clip scrollbarThumbImage through scrollbarThumbRadius. |
| `submit?` | `MiliUI.DropdownSubmit` | Optional server signal configuration for sending the chosen item to a Server Node Graph. |
| `submitButton?` | `MiliUI.Button` | Optional existing button to bind to Submit; automatically disabled while no item is selected or the Dropdown is disabled. |
| `onChange?` | `fun(index:integer?, item:MiliUI.DropdownItem?, control:MiliUI.Dropdown)` | Run your code when the player changes the selected option. `index` is its list position (starting at 1), `item` is the selected option, and `control` is the Dropdown. Both `index` and `item` can be `nil` when nothing is selected. Example: `onChange = function(index) print(index) end`. |
| `onOpen?` | `fun(control:MiliUI.Dropdown)` | Runs when the Dropdown dropdown opens. Receives the Dropdown control. |
| `onClose?` | `fun(control:MiliUI.Dropdown)` | Runs when the Dropdown dropdown closes. Receives the Dropdown control. |
| `onSubmit?` | `fun(index:integer, item:MiliUI.DropdownItem, control:MiliUI.Dropdown)` | Runs when the player confirms their selected option. Receives its 1-based index, the chosen item, and the Dropdown control. Use this for a Confirm/Submit action rather than every selection change. |

### `MiliUI.DropdownOption`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying native UI control created for this component. |
| `panel` | `MiliUI.Panel` | Background panel for this individual choice in the open dropdown. |
| `label` | `MiliUI.TextControl` | Text control showing the name of this choice. |
| `meta?` | `MiliUI.TextControl` | Optional text control showing extra information beside this choice. |
| `hitbox` | `MiliUI.Hitbox` | Invisible area that receives clicks when the player selects this choice. |
| `item` | `MiliUI.DropdownItem` | Data item associated with this UI entry. |
| `index` | `integer` | Position of this entry in its list, starting from 1. |
| `hovered` | `boolean` | Whether the pointer is currently over this control. |

### `MiliUI.Dropdown`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying native UI control created for this component. |
| `field` | `MiliUI.Panel` | The main Dropdown box that the player clicks to open its options. |
| `label` | `MiliUI.TextControl` | Text control showing the currently selected option or placeholder. |
| `indicator?` | `MiliUI.ImageControl` | Image control showing the small dropdown indicator beside the selected value. |
| `trigger` | `MiliUI.Hitbox` | Invisible clickable area that opens or closes the dropdown menu. |
| `menu` | `MiliUI.Panel` | Portaled menu rendered outside masked ancestors. |
| `backdrop` | `MiliUI.Hitbox` | Portaled outside-click blocker sharing the menu overlay parent. |
| `options` | `MiliUI.DropdownOption[]` | Options used by this Dropdown. |
| `items` | `MiliUI.DropdownItem[]` | Array of the data/choices displayed by this component. |
| `scrollbar?` | `MiliUI.Scrollbar` | Present only when the item list exceeds the resolved visible-item limit. |

## Type aliases and enum values

### `MiliUI.DropdownValueType`

```lua
---@alias MiliUI.DropdownValueType 'Int'|'Float'|'String'|'Bool'|'Guid'|'Entity'|'PrefabId'|'ConfigId'|'Vector3'
```

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Dropdown:GetSelected()`

Return the currently selected choice or selection index, depending on this component.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer?` | index 1-based selected item index, or nil. |

**Original LuaLS annotations:**

```lua
---@return integer? index 1-based selected item index, or nil.
```


### `Dropdown:GetSelectedItem()`

Return the current selected item from this Dropdown, so your script can read it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.DropdownItem?` | item |

**Original LuaLS annotations:**

```lua
---@return MiliUI.DropdownItem? item
```


### `Dropdown:IsOpen()`

Return `true` if this component is currently open or expanded, or `false` if it is closed.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | open |

**Original LuaLS annotations:**

```lua
---@return boolean open
```


### `Dropdown:GetOpenDirection()`

Return the current open direction from this Dropdown, so your script can read it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `'up'\|'down'` | direction |

**Original LuaLS annotations:**

```lua
---@return 'up'|'down' direction
```


### `Dropdown:GetVisibleRange()`

Returns the current inclusive visible item window. Non-scrollable Selects return 1..#items.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | firstIndex, integer lastIndex |

**Original LuaLS annotations:**

```lua
---@return integer firstIndex, integer lastIndex
```


### `Dropdown:IsScrollable()`

Return `true` or `false` to indicate whether this Dropdown is scrollable.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | scrollable |

**Original LuaLS annotations:**

```lua
---@return boolean scrollable
```


### `Dropdown:CanSubmit()`

Return `true` when the current selection satisfies the rules and can be submitted.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | valid, string? reason |

**Original LuaLS annotations:**

```lua
---@return boolean valid, string? reason
```


### `Dropdown:ScrollTo(index)`

Ensures the requested item is inside the current visible window without changing selection.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param index integer
---@return MiliUI.Dropdown
```


### `Dropdown:ScrollBy(delta)`

Moves the first visible item by delta and clamps to the available range.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `delta` | `integer` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param delta integer
---@return MiliUI.Dropdown
```


### `Dropdown:SetSelected(index, fireEvent)`

Programmatic selection may select a player-disabled item. When open, a scrollable Dropdown brings the selection into view.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer?` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param index integer?
---@param fireEvent? boolean
---@return MiliUI.Dropdown
```


### `Dropdown:Clear(fireEvent)`

Clear the component's current selection or contents, depending on the type of component.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param fireEvent? boolean
---@return MiliUI.Dropdown
```


### `Dropdown:SetItemEnabled(index, enabled)`

Controls player interaction/disabled styling without forcing a selection change.
SetSelected may still select this item programmatically.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param index integer
---@param enabled boolean
---@return MiliUI.Dropdown
```


### `Dropdown:SetEnabled(enabled)`

Turn player interaction on or off. Pass `true` to enable this component, or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Dropdown
```


### `Dropdown:Open()`

Open or display this component. Use `Close()` to hide it again.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Dropdown
```


### `Dropdown:Close()`

Close or hide this component.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Dropdown
```


### `Dropdown:Toggle()`

Switch between open and closed. An open component closes; a closed component opens.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Dropdown
```


### `Dropdown:OnChange(callback)`

Register a function to run whenever this component's selected option or value changes. This is useful for updating other UI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(index:integer?, item:MiliUI.DropdownItem?, control:MiliUI.Dropdown)` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(index:integer?, item:MiliUI.DropdownItem?, control:MiliUI.Dropdown)
---@return MiliUI.Dropdown
```


### `Dropdown:OnOpen(callback)`

Register a function to run when this component opens.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(control:MiliUI.Dropdown)` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(control:MiliUI.Dropdown)
---@return MiliUI.Dropdown
```


### `Dropdown:OnClose(callback)`

Register a function to run when this component closes.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(control:MiliUI.Dropdown)` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(control:MiliUI.Dropdown)
---@return MiliUI.Dropdown
```


### `Dropdown:OnSubmit(callback)`

Register a function to run when the player confirms the current selection.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(index:integer, item:MiliUI.DropdownItem, control:MiliUI.Dropdown)` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(index:integer, item:MiliUI.DropdownItem, control:MiliUI.Dropdown)
---@return MiliUI.Dropdown
```


### `Dropdown:SetSubmitButton(button)`

Connect an existing Button to the component's Submit action.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `button?` | `MiliUI.Button` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param button? MiliUI.Button
---@return MiliUI.Dropdown
```


### `Dropdown:BuildSubmitPayload()`

Returns the scalar ServerSignal payload for the current selection.
Returns nil when submit is not configured or no item is selected.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.DropdownPayload?` | payload |

**Original LuaLS annotations:**

```lua
---@return MiliUI.DropdownPayload? payload
```


### `Dropdown:Submit()`

Requires a selected item, calls OnSubmit, then sends the configured ServerSignal when submit is present.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | sentOrHandled, string? reason |

**Original LuaLS annotations:**

```lua
---@return boolean sentOrHandled, string? reason
```


### `Dropdown:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.
