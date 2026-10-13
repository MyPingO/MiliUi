# API reference: Components Selection

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_selection.lua`  
**Coverage:** 11 classes, 145 fields, 1 aliases, 21 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Selection](../Selection.md) · [ControllerSupport](../ControllerSupport.md)

## Classes, component props and return types

### `MiliUI.SelectionSubmitField`

| Field | Declared type | Description |
| --- | --- | --- |
| `type` | `MiliUI.SelectionValueType` | Type of the submitted item value. Multiple mode aggregates to a matching *List parameter; single mode sends a scalar. |
| `source?` | `'item'\|'index'` | Use `'index'` to send choice positions starting at 1, or `'item'` to read values from each selected item. |
| `key?` | `string` | Required when source=`item`; reads this field from each item table. |

### `MiliUI.SelectionSubmit`

| Field | Declared type | Description |
| --- | --- | --- |
| `signal` | `string` | Exact Server Signal name that receives the player's chosen values. |
| `fields?` | `MiliUI.SelectionSubmitField[]` | Ordered parameter schema. Default sends a selected index as Int in single mode or selected indices as IntList in multiple mode. |

### `MiliUI.SelectionState`

| Field | Declared type | Description |
| --- | --- | --- |
| `selected` | `boolean` | Whether this item is currently chosen. |
| `hovered` | `boolean` | Whether the pointer or controller is currently focused over this item. |
| `enabled` | `boolean` | Whether this control currently accepts player interaction. |
| `selectionCount` | `integer` | Number of items currently selected. |
| `minimumSelected` | `integer` | Minimum for submission; also an interaction minimum when enforceMinimum=true or single-mode required=true. |
| `mode` | `'single'\|'multiple'` | Current selection behavior. |
| `appearance` | `'tiles'\|'segmented'` | Current item appearance. |
| `maximumSelected` | `integer` | Maximum count (always 1 in single mode). |

### `MiliUI.SelectionItemStyle`

| Field | Declared type | Description |
| --- | --- | --- |
| `background?` | `MiliUI.ColorValue` | Background color of a choice in its normal state. Example: `background = 'surface'`. |
| `hoverBackground?` | `MiliUI.ColorValue` | Background color of a choice while the mouse is over it. Example: `hoverBackground = 'surfaceHover'`. |
| `selectedBackground?` | `MiliUI.ColorValue` | Background color of a choice after the player selects it. Example: `selectedBackground = 'accent'`. |
| `selectedHoverBackground?` | `MiliUI.ColorValue` | Selected + hovered built-in item background. When omitted while selectedBackground is explicitly set through itemStyle, selectedBackground is reused instead of falling back to the global accent-hover color. |
| `disabledBackground?` | `MiliUI.ColorValue` | Background color for choices the player cannot select. |
| `textColor?` | `MiliUI.ColorValue` | Color of each choice's normal label. Example: `textColor = 'text'`. |
| `hoverTextColor?` | `MiliUI.ColorValue` | Color of the choice's label while the mouse is over it. |
| `selectedTextColor?` | `MiliUI.ColorValue` | Color of the label on a selected choice. |
| `disabledTextColor?` | `MiliUI.ColorValue` | Color of the label on a disabled choice. |
| `border?` | `boolean` | Show a visible outline around the choice tile. Set `border = true` to enable it. |
| `borderColor?` | `MiliUI.ColorValue` | Color of the normal outline around each choice tile. |
| `hoverBorderColor?` | `MiliUI.ColorValue` | Color of the outline while the mouse is over a choice. |
| `selectedBorderColor?` | `MiliUI.ColorValue` | Color of the outline for a selected choice. |
| `borderImage?` | `integer` | Image asset ID used to draw an outline around each selectable choice. Leave this setting out to use the default border, or provide your own image asset ID. |
| `borderStretch?` | `boolean` | Stretch the choice outline image to match the tile size. |
| `radius?` | `MiliUI.Radius` | How rounded the choice tile's corners are. Example: `radius = 'lg'`. |
| `backgroundImage?` | `integer` | Optional image asset ID to use as the background of each choice. |
| `backgroundStretch?` | `boolean` | Stretch the tile background image to fit each tile's size. |
| `clipToRadius?` | `boolean` | Clip backgroundImage through a native rounded mask matching radius. Useful for square textures under rounded selection tiles. |
| `selectionFrame?` | `boolean` | Display an extra outline around selected or hovered choices. Set `false` to hide it. |
| `selectionFrameImage?` | `integer` | Optional image asset ID to use for the selected/hovered outline. |
| `selectionFrameStretch?` | `boolean` | Stretch the selected/hovered outline image to fit each choice. |
| `hoverScale?` | `number` | How large a choice appears when the player points at it. Example: `hoverScale = 1.02` means 2% bigger than normal. |
| `pressScale?` | `number` | How small a choice appears while the player presses it. Example: `pressScale = 0.985` means about 1.5% smaller. |
| `hoverDuration?` | `number` | Time, in seconds, for the choice's hover animation. Example: `hoverDuration = 0.15`. |

### `MiliUI.SelectionItem`

| Field | Declared type | Description |
| --- | --- | --- |
| `label?` | `MiliUI.TextSpec` | Text shown on this choice tile. Example: `label = { text = 'Map One' }`. If omitted, MiliUI may use `name`. |
| `name?` | `string` | Convenience fallback label when label is omitted. |
| `disabled?` | `boolean` | Start this choice disabled. |
| `[string]` | `any` | Arbitrary game metadata used by renderers or submit fields. |

### `MiliUI.SelectionParameter`

| Field | Declared type | Description |
| --- | --- | --- |
| `type` | `string` | ServerSignal scalar type in single mode (for example `String`) or list type in multiple mode (for example `StringList`). |
| `valueType` | `MiliUI.SelectionValueType` | Type of each selected value expected by the Server Signal. |
| `key?` | `string` | Stable value used to identify an entry when the list changes. |
| `source` | `'item'\|'index'` | Whether the sent values came from item fields or from their positions in the list. |
| `value?` | `any` | Scalar value in single mode. |
| `values?` | `any[]` | Values from selected items in multiple mode. |

### `MiliUI.SelectionPayload`

| Field | Declared type | Description |
| --- | --- | --- |
| `signal` | `string` | The Server Signal name used by this Selection. |
| `index?` | `integer` | Single-mode 1-based selected index. |
| `item?` | `MiliUI.SelectionItem` | Single-mode selected item. |
| `indices?` | `integer[]` | Multiple-mode selected indices in ascending item order. |
| `items?` | `MiliUI.SelectionItem[]` | Multiple-mode selected item tables. |
| `parameters` | `MiliUI.SelectionParameter[]` | Ordered ServerSignal parameters. |

### `MiliUI.SelectionChoice`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Outer UI container for one selectable choice tile. |
| `visual?` | `MiliUI.Parent` | Value returned by renderItem. |
| `defaultPanel?` | `MiliUI.Panel` | Present when using the built-in renderer. |
| `defaultLabel?` | `MiliUI.TextControl` | Present when using the built-in renderer. |
| `frame?` | `MiliUI.ImageControl` | Optional image showing an outline when this choice is selected or hovered. |
| `hitbox` | `MiliUI.Hitbox` | Invisible input area that receives clicks and drag events. |
| `hover` | `MiliUI.Hover` | Object that manages hover and press visual feedback. |
| `item` | `MiliUI.SelectionItem` | Data item represented by this entry. |
| `index` | `integer` | Position of this item in its list. Lua counts from 1. |
| `hovered` | `boolean` | Whether the pointer or controller is over this item. |
| `controllerFocused` | `boolean` | Whether Miliastra controller focus is on this item. |

### `MiliUI.SelectionProps`

**Inherits from:** [`MiliUI.SurfaceProps`](aliases.md#miliuisurfaceprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `items` | `MiliUI.SelectionItem[]` | The choices players may select from, such as a list of maps or modifiers. |
| `mode?` | `'single'\|'multiple'` | Single mode replaces the previous choice automatically and returns a 1-based index. Multiple mode returns ascending index arrays. Default: 'multiple' (or 'single' for segmented appearance). |
| `appearance?` | `'tiles'\|'segmented'` | Display choices as customizable tiles or compact connected segments. Default: 'tiles'. |
| `selected?` | `integer\|integer[]` | Initial selection; one index in single mode or an index array in multiple mode. |
| `required?` | `boolean` | In single mode, select an initial item if needed and prevent clearing the final selection. Defaults to true. |
| `enforceMinimum?` | `boolean` | Prevent Clear, Deselect, or SetSelected from going below minimumSelected. Single-mode required=true also enforces the minimum. |
| `overselect?` | `'deny'\|'replaceOldest'\|'replaceNewest'` | Policy when clicking another item at the multiple-selection maximum. Default: 'deny'. Single mode always replaces the old selection. |
| `minimumSelected?` | `integer` | Minimum for submission; optionally enforced during interaction. Defaults to 1 in required single mode, otherwise 0. |
| `maximumSelected?` | `integer` | Most choices allowed at once in multiple mode. Single mode always caps at one. |
| `itemWidth?` | `number` | Width of each tile (default 220 UI units). Segmented appearance derives equal widths from container width and resolved column count. |
| `itemHeight?` | `number` | Height of each tile (default 72 UI units). Segmented appearance divides container height among the resolved rows. |
| `columns?` | `integer` | Number of choices in a row. Segmented defaults to one horizontal row; use columns=1 for vertically stacked segments. |
| `rows?` | `integer` | Fixed row count when columns is omitted. If both are supplied, rows*columns must fit all items. |
| `autoWrap?` | `boolean` | Automatically wrap choices to available width. In segmented appearance auto-wrap is off by default. |
| `gap?` | `number` | Cell spacing in both axes, default 12 for tiles and 4 for segmented appearance. |
| `gapX?` | `number` | Horizontal space between neighboring choice tiles, in UI units. Example: `gapX = 12`. |
| `gapY?` | `number` | Vertical space between rows of choice tiles, in UI units. Example: `gapY = 8`. |
| `padding?` | `number` | Inside spacing around the grid; default 16 for tiles and 4 for segmented appearance. |
| `paddingX?` | `number` | Inside space on the left and right sides of the choices grid. |
| `paddingY?` | `number` | Inside space above and below the choices grid. |
| `paddingLeft?` | `number` | Space inside the left edge before the first choice tile. |
| `paddingRight?` | `number` | Space inside the right edge after the last choice tile. |
| `paddingTop?` | `number` | Space inside the top edge above the first row. |
| `paddingBottom?` | `number` | Space inside the bottom edge below the last row. |
| `align?` | `'start'\|'center'\|'end'\|'left'\|'right'` | Horizontal grid alignment. Default center. |
| `verticalAlign?` | `'top'\|'center'\|'bottom'\|'start'\|'end'` | Vertical grid alignment. Default center. |
| `itemStyle?` | `MiliUI.SelectionItemStyle` | Grouped styling for built-in choice items. Explicit flat item props below remain authoritative. |
| `itemRadius?` | `MiliUI.Radius` | How rounded each choice's background corners are. Example: `itemRadius = 'lg'`. Default: `'lg'`. |
| `itemColor?` | `MiliUI.ColorValue` | Background color of a choice that is not selected or hovered. Example: `itemColor = 'surface'`. |
| `itemHoverColor?` | `MiliUI.ColorValue` | Background color of a choice when the player's mouse is over it. Example: `itemHoverColor = 'surfaceHover'`. |
| `selectedColor?` | `MiliUI.ColorValue` | Background color of a choice that the player selected. Example: `selectedColor = 'accent'`. |
| `selectedHoverColor?` | `MiliUI.ColorValue` | Background color of a choice that is both selected and under the player's mouse. |
| `disabledColor?` | `MiliUI.ColorValue` | Background color of a choice that is visible but cannot be selected. |
| `textColor?` | `MiliUI.ColorValue` | Color of a choice's label in its normal state. Example: `textColor = 'text'`. |
| `itemHoverTextColor?` | `MiliUI.ColorValue` | Color of a choice's label when the player's mouse is over it. |
| `selectedTextColor?` | `MiliUI.ColorValue` | Color of a selected choice's label. Example: `selectedTextColor = 'white'`. |
| `disabledTextColor?` | `MiliUI.ColorValue` | Color of the label for a disabled choice. |
| `selectionBorderColor?` | `MiliUI.ColorValue` | Color of the outline used to show which choices the player has selected. |
| `hoverBorderColor?` | `MiliUI.ColorValue` | Color of the outline that appears when the mouse is over a choice. |
| `selectionFrame?` | `boolean` | Show a separate outline around selected or hovered choices. Set `selectionFrame = false` to hide it. |
| `selectionFrameImage?` | `integer` | Optional image asset ID used as that outline around the selected or hovered choice. |
| `selectionFrameStretch?` | `boolean` | Stretch the selection-outline image to match each choice's size. Default: `true`. |
| `itemImage?` | `integer` | Optional image asset ID used as the background of each built-in choice. |
| `itemStretch?` | `boolean` | Stretch each choice's background image to match its size. Default: `true`. |
| `itemClipToRadius?` | `boolean` | Trim each choice's background image to match the rounded corners set by `itemRadius`. |
| `itemBorder?` | `boolean` | Show an outline around each choice. Set `itemBorder = true` to turn it on. |
| `itemBorderColor?` | `MiliUI.ColorValue` | Color of the outline around each choice when `itemBorder` is enabled. |
| `itemBorderImage?` | `integer` | Optional image asset ID used for the border drawn around each choice. |
| `itemBorderStretch?` | `boolean` | Stretch the image used for a choice's border to fit the choice's size. |
| `textSize?` | `MiliUI.TextSize` | Size of the displayed text. Use e.g. `'sm'`, `'md'`, or a number. |
| `adaptiveFontSize?` | `boolean` | Let the text on the choices become smaller if it does not fit inside them. Default: `true`. |
| `minimumFontSize?` | `number` | Smallest size that the choice label text is allowed to shrink to. Default: `16`. |
| `interactable?` | `boolean` | Allow the player to select and unselect choices. Set `interactable = false` to disable the choices. Default: `true`. |
| `controllerFocus?` | `boolean` | Enable native focus on each choice hitbox, default true. Press Confirm to activate the focused choice. Native focus must first initialize. |
| `controllerFocusIndicator?` | `boolean\|MiliUI.ControllerFocusIndicatorProps` | Show a chevron on the focused choice; set false to hide or supply placement/size/animation options. |
| `hoverScale?` | `number` | How much a choice grows when the mouse is over it. `hoverScale = 1.02` makes it appear 2% larger. Default: `1.02`. |
| `pressScale?` | `number` | How much a choice shrinks while being pressed. `pressScale = 0.985` makes it appear 1.5% smaller. Default: `0.985`. |
| `hoverDuration?` | `number` | Duration of the hover effect, in seconds. |
| `renderItem?` | `fun(parent:MiliUI.Parent, item:MiliUI.SelectionItem, index:integer, state:MiliUI.SelectionState, control:MiliUI.Selection):MiliUI.Parent?` | Creates a custom visual for each choice. MiliUI supplies focusable hitboxes and selection state. Return the visual component. |
| `updateItem?` | `fun(visual:MiliUI.Parent?, item:MiliUI.SelectionItem, index:integer, state:MiliUI.SelectionState, control:MiliUI.Selection)` | Optional function to update the appearance of a choice after it has been created, such as changing its color when the player selects it. |
| `submit?` | `MiliUI.SelectionSubmit` | Optional automatic action that sends the selected choices to a **Server Signal** in your project. Leave it out if you want to handle the selection with `onSubmit` instead. |
| `submitButton?` | `MiliUI.Button` | Existing Button whose click triggers Submit(); automatically disabled when CanSubmit() fails. |
| `onChange?` | `fun(selection:integer\|integer[]?, selectedItems:MiliUI.SelectionItem\|MiliUI.SelectionItem[]?, control:MiliUI.Selection)` | Runs on changes. Single mode receives one index and item (nil if optional/empty); multiple mode receives arrays of indices and items. |
| `onSubmit?` | `fun(selection:integer\|integer[]?, selectedItems:MiliUI.SelectionItem\|MiliUI.SelectionItem[]?, control:MiliUI.Selection)` | Runs on valid Submit. Single mode receives an index and item; multiple mode receives index and item arrays. |

### `MiliUI.SelectionLayoutInfo`

| Field | Declared type | Description |
| --- | --- | --- |
| `columns` | `integer` | Number of item columns actually used after layout, not necessarily the requested number. |
| `rows` | `integer` | Number of item rows actually used after layout. |
| `itemWidth` | `number` | Width of the item part in UI units. |
| `itemHeight` | `number` | Height of the item part in UI units. |
| `width?` | `number` | Width of this area, in Miliastra UI units. |
| `height?` | `number` | Height of this area, in Miliastra UI units. |
| `availableWidth?` | `number` | Width of the available part in UI units. |
| `availableHeight?` | `number` | Height of the available part in UI units. |

### `MiliUI.Selection`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `content` | `MiliUI.ContainerControl` | Container where you can add custom child UI. |
| `panel` | `MiliUI.Panel` | Visual panel that draws the component's background and border. |
| `choices` | `MiliUI.SelectionChoice[]` | Created UI entries corresponding to the available choices. |
| `items` | `MiliUI.SelectionItem[]` | List of data items used to build these entries. |
| `mode` | `'single'\|'multiple'` | Current selection behavior. |
| `appearance` | `'tiles'\|'segmented'` | Current item appearance. |
| `itemStyle?` | `MiliUI.SelectionItemStyle` | Resolved grouped style when provided through props/theme. |

## Type aliases and enum values

### `MiliUI.SelectionValueType`

```lua
---@alias MiliUI.SelectionValueType 'Int'|'Float'|'String'|'Bool'|'Guid'|'Entity'|'PrefabId'|'ConfigId'|'Vector3'
```

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Selection:GetSelected()`

Return the selected positions in the list. Lua counts the first item as `1`.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer\|integer[]\|nil` | selection One 1-based index (or nil) in single mode; ascending indices in multiple mode. |

**Original LuaLS annotations:**

```lua
---@return integer|integer[]|nil selection One 1-based index (or nil) in single mode; ascending indices in multiple mode.
```


### `Selection:GetSelectedItems()`

Return the data tables for the currently selected items.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.SelectionItem[]` | items Selected item tables in ascending item order. |

**Original LuaLS annotations:**

```lua
---@return MiliUI.SelectionItem[] items Selected item tables in ascending item order.
```


### `Selection:GetSelectedItem()`

Return the first selected data item, or nil when selection is empty.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.SelectionItem?` | item |

**Original LuaLS annotations:**

```lua
---@return MiliUI.SelectionItem? item
```


### `Selection:GetSelectionCount()`

Return the number of selected items.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | count |

**Original LuaLS annotations:**

```lua
---@return integer count
```


### `Selection:IsSelected(index)`

Return `true` if the item at the supplied position is selected.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Returns | `boolean` | selected |

**Original LuaLS annotations:**

```lua
---@param index integer
---@return boolean selected
```


### `Selection:CanSubmit()`

Return `true` if the current selection meets its minimum and maximum requirements.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | valid, string? reason |

**Original LuaLS annotations:**

```lua
---@return boolean valid, string? reason
```


### `Selection:GetLayoutInfo()`

Return the current layout details, such as the number of rows and columns.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.SelectionLayoutInfo` | info |

**Original LuaLS annotations:**

```lua
---@return MiliUI.SelectionLayoutInfo info
```


### `Selection:SetSelected(indices, fireEvent)`

Replace the selection using the list positions you supply. Lua item positions start at `1`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `indices` | `integer\|integer[]\|nil` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param indices integer|integer[]|nil
---@param fireEvent? boolean
---@return MiliUI.Selection
```


### `Selection:Select(index, fireEvent)`

Programmatic selection may modify disabled choices; disabled only blocks player interaction.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param index integer
---@param fireEvent? boolean
---@return MiliUI.Selection
```


### `Selection:Deselect(index, fireEvent)`

Programmatic selection may modify disabled choices; disabled only blocks player interaction.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param index integer
---@param fireEvent? boolean
---@return MiliUI.Selection
```


### `Selection:Toggle(index, fireEvent)`

Programmatic selection may modify disabled choices; disabled only blocks player interaction.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param index integer
---@param fireEvent? boolean
---@return MiliUI.Selection
```


### `Selection:Clear(fireEvent)`

Remove the currently selected items, list entries, or notifications, depending on this component.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param fireEvent? boolean
---@return MiliUI.Selection
```


### `Selection:SelectAll(fireEvent)`

Selects enabled choices only, in ascending item order, up to maximumSelected.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param fireEvent? boolean
---@return MiliUI.Selection
```


### `Selection:SetItemEnabled(index, enabled)`

Controls player interaction/disabled styling without forcing a selection change.
Select/Deselect/Toggle/SetSelected may still modify the item programmatically.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param index integer
---@param enabled boolean
---@return MiliUI.Selection
```


### `Selection:SetEnabled(enabled)`

Allow or prevent the player from interacting with this component. Pass `true` to enable or `false` to disable.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Selection
```


### `Selection:SetSubmitButton(button)`

Use an existing Button to trigger Submit for this selection window.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `button?` | `MiliUI.Button` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param button? MiliUI.Button
---@return MiliUI.Selection
```


### `Selection:BuildSubmitPayload()`

Build the data that would be sent through the configured Server Signal without actually sending it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.SelectionPayload?` | payload |

**Original LuaLS annotations:**

```lua
---@return MiliUI.SelectionPayload? payload
```


### `Selection:Submit()`

Validates selection constraints, calls OnSubmit, then sends the configured ServerSignal when submit is present.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | sentOrHandled, string? reason |

**Original LuaLS annotations:**

```lua
---@return boolean sentOrHandled, string? reason
```


### `Selection:OnChange(callback)`

Register a function that runs when the player changes the selection. Use it to respond immediately to a change.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(selection:integer\|integer[]?, selectedItems:MiliUI.SelectionItem\|MiliUI.SelectionItem[]?, control:MiliUI.Selection)` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(selection:integer|integer[]?, selectedItems:MiliUI.SelectionItem|MiliUI.SelectionItem[]?, control:MiliUI.Selection)
---@return MiliUI.Selection
```


### `Selection:OnSubmit(callback)`

Register a function that runs when the player confirms the selected choices.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(selection:integer\|integer[]?, selectedItems:MiliUI.SelectionItem\|MiliUI.SelectionItem[]?, control:MiliUI.Selection)` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(selection:integer|integer[]?, selectedItems:MiliUI.SelectionItem|MiliUI.SelectionItem[]?, control:MiliUI.Selection)
---@return MiliUI.Selection
```


### `Selection:Destroy()`

Remove this component from the UI and release its controls.
