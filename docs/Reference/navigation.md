# API reference: Navigation

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `navigation.lua`  
**Coverage:** 2 classes, 2 fields, 0 aliases, 7 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Navigation](../Navigation.md)

## Classes, component props and return types

### `MiliUI.NavigationTransitionOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `transition?` | `'none'\|'slideLeft'\|'slideRight'` | Directional page slide; omitted means no animation. |
| `duration?` | `number` | Transition duration in seconds; default 0.24. |

### `MiliUI.NavigationAPI`

*No fields are declared directly on this type.*

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Navigation.Push(pageId, options)`

Use Push when moving from one menu to another AND you want Back to return to the first. Example: `UI.Navigation.Push('Settings')`.

Pushes a registered page onto its Host's navigation history. The previous
navigation page is closed only after the target page opens successfully.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Parameter `options?` | `MiliUI.NavigationTransitionOptions` | — |
| Returns | `boolean` | opened |
| Returns | `MiliUI.Parent\|string` | result |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@param options? MiliUI.NavigationTransitionOptions
---@return boolean opened
---@return MiliUI.Parent|string result
```


### `Navigation.Replace(pageId, options)`

Show a new page IN PLACE of the current page. Unlike Push, this does not add a new Back step. Useful after completing a setup screen.

Replaces the current navigation entry for the target page's Host. When no
history exists, behaves like Reset(pageId).

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Parameter `options?` | `MiliUI.NavigationTransitionOptions` | — |
| Returns | `boolean` | opened |
| Returns | `MiliUI.Parent\|string` | result |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@param options? MiliUI.NavigationTransitionOptions
---@return boolean opened
---@return MiliUI.Parent|string result
```


### `Navigation.Back(hostId, options)`

Go back to the previous page for the given Host. Example: `UI.Navigation.Back('Menu')`. It returns false if there is no previous page.

Returns to the previous page in one Host's navigation history.
Returns false, "no-history" when there is no previous entry.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `options?` | `MiliUI.NavigationTransitionOptions` | — |
| Returns | `boolean` | opened |
| Returns | `MiliUI.Parent\|string` | result |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@param options? MiliUI.NavigationTransitionOptions
---@return boolean opened
---@return MiliUI.Parent|string result
```


### `Navigation.Reset(pageId, options)`

Start a new navigation history at this page, clearing previous Back steps. Useful when returning to a main menu after finishing a flow.

Clears one Host's navigation history and makes pageId its new root/current page.
Unrelated Pages opened manually in the same Host are not closed.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Parameter `options?` | `MiliUI.NavigationTransitionOptions` | — |
| Returns | `boolean` | opened |
| Returns | `MiliUI.Parent\|string` | result |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@param options? MiliUI.NavigationTransitionOptions
---@return boolean opened
---@return MiliUI.Parent|string result
```


### `Navigation.CanGoBack(hostId)`

Check whether the given Host has a previous page. Use it to hide or disable a Back button when history is empty.

Return `true` when this Host has a previous page in its navigation history.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `boolean` | canGoBack |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return boolean canGoBack
```


### `Navigation.GetCurrent(hostId)`

Returns the current navigation page ID for one Host, independent of unrelated
Pages that may be layered above it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `string?` | pageId |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return string? pageId
```


### `Navigation.GetHistory(hostId)`

Returns a copy of one Host's navigation history from root to current page.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `string[]` | pageIds |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return string[] pageIds
```
