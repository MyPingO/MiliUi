# API reference: Intrinsic

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `intrinsic.lua`  
**Coverage:** 2 classes, 14 fields, 0 aliases, 11 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [IntrinsicSizing](../IntrinsicSizing.md)

## Classes, component props and return types

### `MiliUI.ScrollAreaBindContentOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `padding?` | `number` | Added to both top and bottom of the bound content height. |
| `paddingTop?` | `number` | Additional logical top content padding. |
| `paddingBottom?` | `number` | Additional logical bottom content padding. |

### `MiliUI.ScrollColumnProps`

**Inherits from:** [`MiliUI.ScrollAreaProps`](components_scroll_area.md#miliuiscrollareaprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `column?` | `MiliUI.StackProps` | Settings for the Column created **inside** this scrolling list. Example: `column = { gap = 8, controllerNavigation = true }`. Controller navigation is on by default; use `column = { controllerNavigation = false }` to turn off automatic directional links. |
| `gap?` | `number` | Vertical space between items inside the automatically created Column. Example: `gap = 8`. |
| `align?` | `MiliUI.StackAlign` | Line up the items in the ScrollColumn left, center, or right. This adjusts the **inner Column**, not the outer scrolling area. |
| `justify?` | `MiliUI.StackJustify` | Choose whether the ScrollColumn's items start at the top, stay centered, or spread out vertically. |
| `padding?` | `number` | Empty space **inside** the scrolling Column on all four sides. Example: `padding = 12`. |
| `paddingX?` | `number` | Empty space inside the ScrollColumn on its left and right edges. |
| `paddingY?` | `number` | Empty space inside the ScrollColumn on its top and bottom edges. |
| `paddingLeft?` | `number` | Empty space inside the ScrollColumn before its content begins on the left. |
| `paddingRight?` | `number` | Empty space inside the ScrollColumn after its content ends on the right. |
| `paddingTop?` | `number` | Empty space inside the ScrollColumn above its first item. |
| `paddingBottom?` | `number` | Empty space inside the ScrollColumn below its last item. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `IntrinsicTextWindow:RefreshContentHeight()`

Re-measures wrapped text at the current width and updates the TextWindow height.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.TextWindow` | — |

**Additional annotations:** `@meta`, `@type MiliUI.TextWindow`

**Original LuaLS annotations:**

```lua
---@meta
---@type MiliUI.TextWindow
---@return MiliUI.TextWindow
```


### `IntrinsicTextWindow:GetNaturalHeight()`

Returns the current localization-aware natural wrapped height.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | height |

**Original LuaLS annotations:**

```lua
---@return number height
```


### `IntrinsicTextWindow:GetEstimatedLineCount()`

Returns MiliUI's current estimated wrapped line count.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | lineCount |

**Original LuaLS annotations:**

```lua
---@return integer lineCount
```


### `IntrinsicBadge:GetNaturalSize()`

Returns the current constrained localized-label + optional-icon natural size,
including Badge gap and padding.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | width, number height |

**Additional annotations:** `@type MiliUI.Badge`

**Original LuaLS annotations:**

```lua
---@type MiliUI.Badge
---@return number width, number height
```


### `IntrinsicButton:SetIcon(image)`

Adds, replaces, or removes the optional leading icon. Passing nil removes it
and causes a fit-content Button to shrink to its remaining localized content.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `image?` | `integer` | — |
| Returns | `MiliUI.Button` | — |

**Additional annotations:** `@type MiliUI.Button`

**Original LuaLS annotations:**

```lua
---@type MiliUI.Button
---@param image? integer
---@return MiliUI.Button
```


### `IntrinsicButton:SetContentPadding(horizontal, vertical)`

Changes symmetric horizontal/vertical intrinsic content padding and refits.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `horizontal` | `number` | — |
| Parameter `vertical?` | `number` | Defaults to horizontal. |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param horizontal number
---@param vertical? number Defaults to horizontal.
---@return MiliUI.Button
```


### `IntrinsicButton:GetNaturalSize()`

Returns the current unconstrained icon + localized-label natural size.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | width, number height |

**Original LuaLS annotations:**

```lua
---@return number width, number height
```


### `IntrinsicStack:GetNaturalSize()`

Returns current visible-child natural size including gaps and padding.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | width, number height |

**Additional annotations:** `@type MiliUI.Stack`

**Original LuaLS annotations:**

```lua
---@type MiliUI.Stack
---@return number width, number height
```


### `IntrinsicStack:IsFittingContent()`

Returns whether width and height are currently content-fitted.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | fitWidth, boolean fitHeight |

**Original LuaLS annotations:**

```lua
---@return boolean fitWidth, boolean fitHeight
```


### `IntrinsicStack:SetFitContent(width, height)`

Changes content fitting at runtime. Explicit width/height/fill props remain authoritative.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `width` | `boolean` | — |
| Parameter `height?` | `boolean` | Defaults to width. |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param width boolean
---@param height? boolean Defaults to width.
---@return MiliUI.Stack
```


### `IntrinsicScrollArea:BindContentHeight(source, options)`

Binds ScrollArea logical contentHeight to another control/Stack's live height.
Designed for a fitHeight Column so lists and localized note flows no longer
need duplicated manual content-height arithmetic.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `source` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.ScrollAreaBindContentOptions` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Additional annotations:** `@type MiliUI.ScrollArea`

**Original LuaLS annotations:**

```lua
---@type MiliUI.ScrollArea
---@param source MiliUI.Parent
---@param options? MiliUI.ScrollAreaBindContentOptions
---@return MiliUI.ScrollArea
```
