# API reference: Stack Extensions

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `stack_extensions.lua`  
**Coverage:** 5 classes, 23 fields, 0 aliases, 6 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [ResponsiveLayout](../ResponsiveLayout.md)

## Classes, component props and return types

### `MiliUI.StackResponsiveWhen`

| Field | Declared type | Description |
| --- | --- | --- |
| `minWidth?` | `number` | Apply this rule only when the space available to the Row/Column is at least this many UI units. Example: `minWidth = 800` for wide layouts. |
| `maxWidth?` | `number` | Apply this rule only when the space available to the Row/Column is at most this many UI units. Example: `maxWidth = 600` for narrow layouts. |
| `minHeight?` | `number` | Only apply this rule if the available height is **at least** this many UI units. |
| `maxHeight?` | `number` | Only apply this rule if the available height is **no more than** this many UI units. |
| `minAspect?` | `number` | Only apply this rule when the available area is wide enough. This number is **width divided by height**. |
| `maxAspect?` | `number` | Only apply this rule when the available area's width divided by its height is no more than this number. |
| `orientation?` | `MiliUI.ResponsiveOrientation` | Only apply this rule in the chosen layout direction: `'landscape'` for wider-than-tall, `'portrait'` for taller-than-wide, or `'square'`. |

### `MiliUI.StackResponsiveProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `direction?` | `'horizontal'\|'vertical'` | Change how children are arranged while the condition matches: `'horizontal'` places them side by side; `'vertical'` stacks them. |
| `gap?` | `number` | Change the space between children while this responsive rule applies. Example: use a smaller gap on narrow screens. |
| `align?` | `MiliUI.StackAlign` | Change where children sit across the Row/Column while this rule applies. See Row/Column `align` for directions. |
| `justify?` | `MiliUI.StackJustify` | Change how children are spread along the Row/Column while this rule applies. See Row/Column `justify` for options. |
| `padding?` | `number` | Replace the usual space **inside all four edges** of the Row/Column while this rule matches. Example: `padding = 12`. |
| `paddingX?` | `number` | Replace the usual left-and-right inner space while this rule matches. Example: `paddingX = 12`. |
| `paddingY?` | `number` | Replace the usual top-and-bottom inner space while this rule matches. Example: `paddingY = 8`. |
| `paddingLeft?` | `number` | Replace the empty space inside the **left** edge while this rule matches. |
| `paddingRight?` | `number` | Replace the empty space inside the **right** edge while this rule matches. |
| `paddingTop?` | `number` | Replace the empty space inside the **top** edge while this rule matches. |
| `paddingBottom?` | `number` | Replace the empty space inside the **bottom** edge while this rule matches. |

### `MiliUI.StackResponsiveRule`

| Field | Declared type | Description |
| --- | --- | --- |
| `when?` | `MiliUI.StackResponsiveWhen` | The available-size test for this layout rule. Example: `when = { maxWidth = 600 }` activates the rule in narrow space. Omit it to always apply. |
| `props` | `MiliUI.StackResponsiveProps` | The changes to use while `when` matches. Example: `props = { direction = 'vertical', gap = 8 }`. If several rules match, later ones take priority. |

### `MiliUI.StackChildResponsiveProps`

**Inherits from:** [`MiliUI.StackChildOptions`](helpers.md#miliuistackchildoptions). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `shrink?` | `number` | When a Row/Column runs out of room, allow this child to become smaller. Higher positive weights give it a larger share of the needed size reduction. Default 0 disables shrinking. |

### `MiliUI.StackChildResponsiveRule`

Dimension fields may use false to reset that field while the rule matches.

| Field | Declared type | Description |
| --- | --- | --- |
| `when?` | `MiliUI.StackResponsiveWhen` | Only apply this child-specific layout change when its Row/Column's inside space meets the specified size condition. |
| `props` | `MiliUI.StackChildResponsiveProps` | Changes to this child's size or layout while the condition matches; later matching rules win. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Stack:SetDirection(direction)`

Changes the default Row/Column direction used when no responsive rule overrides it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `direction` | `'horizontal'\|'vertical'` | — |
| Returns | `MiliUI.Stack` | — |

**Additional annotations:** `@type MiliUI.Stack`

**Original LuaLS annotations:**

```lua
---@type MiliUI.Stack
---@param direction 'horizontal'|'vertical'
---@return MiliUI.Stack
```


### `Stack:RefreshControllerNavigation()`

Rebuilds native main-axis links after dynamic child changes.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Stack
```


### `Stack:SetControllerNavigationEnabled(enabled)`

Enables or disables Stack-owned linear controller navigation.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Stack
```


### `Stack:SetResponsive(rules)`

Replaces this Stack's responsive behavior rules.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `rules?` | `MiliUI.StackResponsiveRule[]` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param rules? MiliUI.StackResponsiveRule[]
---@return MiliUI.Stack
```


### `Stack:SetChildResponsive(value, rules)`

Adds or replaces responsive layout rules for one existing direct child.
Rules are evaluated against this Stack's current inner content size.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `MiliUI.Parent` | — |
| Parameter `rules?` | `MiliUI.StackChildResponsiveRule[]` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param value MiliUI.Parent
---@param rules? MiliUI.StackChildResponsiveRule[]
---@return MiliUI.Stack
```


### `Stack:ReplaceChildren(builder)`

Destroys every current direct child, invokes builder with this Stack as the
parent, then settles intrinsic/layout work once through Stack:Batch().

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `builder` | `fun(stack:MiliUI.Stack)` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param builder fun(stack:MiliUI.Stack)
---@return MiliUI.Stack
```
