# API reference: Focus

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `focus.lua`  
**Coverage:** 2 classes, 8 fields, 1 aliases, 6 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

## Classes, component props and return types

### `MiliUI.FocusExplanation`

| Field | Declared type | Description |
| --- | --- | --- |
| `status` | `string` | 'managed', 'disposed', or 'unmanaged'. |
| `host?` | `string` | Owning attached Host identifier. |
| `focusedKey?` | `string` | Semantic identity of the native focus when within the managed Screen. |
| `nativeFocused?` | `MiliUI.Control` | Actual native control reported by game.GetControllerFocus(), possibly outside this scope. |
| `nativeReadReason?` | `string` | Reason native focus could not be read. |
| `indicatorActive?` | `boolean` | Whether a registered component indicator reports native activity. |
| `eligibleCount?` | `integer` | Number of currently eligible managed targets. |
| `lastRequest?` | `table` | Most recent native focus request and observed outcome. |

### `MiliUI.FocusAPI`

*No fields are declared directly on this type.*

## Type aliases and enum values

### `MiliUI.FocusDirection`

```lua
---@alias MiliUI.FocusDirection 'Up'|'Down'|'Left'|'Right'
```

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `FocusAPI.Get(scope)`

Return the current native focus as a registered component wrapper when it belongs to this active managed Screen.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `scope` | `MiliUI.Parent` | Any control or Screen contained in the managed scope. |
| Returns | `MiliUI.Parent?` | — |

**Original LuaLS annotations:**

```lua
---@param scope MiliUI.Parent Any control or Screen contained in the managed scope.
---@return MiliUI.Parent?
```


### `FocusAPI.Set(target)`

Request focus for a live target inside an active managed Screen, and verify it against game.GetControllerFocus().

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `target` | `MiliUI.Parent` | — |
| Returns | `boolean` | confirmed, string reason |

**Original LuaLS annotations:**

```lua
---@param target MiliUI.Parent
---@return boolean confirmed, string reason
```


### `FocusAPI.Refresh(scope)`

Recalculate managed navigation links after explicit native visibility/layout changes, and recover focus if needed.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `scope` | `MiliUI.Parent` | — |
| Returns | `boolean` | success, string? reason |

**Original LuaLS annotations:**

```lua
---@param scope MiliUI.Parent
---@return boolean success, string? reason
```


### `FocusAPI.Link(source, direction, destination)`

Give one directional link precedence over component and layout navigation. Both targets must belong to the same scope.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `source` | `MiliUI.Parent` | — |
| Parameter `direction` | `MiliUI.FocusDirection` | — |
| Parameter `destination` | `MiliUI.Parent` | — |
| Returns | `boolean` | success, string? reason |

**Original LuaLS annotations:**

```lua
---@param source MiliUI.Parent
---@param direction MiliUI.FocusDirection
---@param destination MiliUI.Parent
---@return boolean success, string? reason
```


### `FocusAPI.Block(source, direction)`

Block directional movement from a target, even when geometric neighbors are available.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `source` | `MiliUI.Parent` | — |
| Parameter `direction` | `MiliUI.FocusDirection` | — |
| Returns | `boolean` | success, string? reason |

**Original LuaLS annotations:**

```lua
---@param source MiliUI.Parent
---@param direction MiliUI.FocusDirection
---@return boolean success, string? reason
```


### `FocusAPI.Explain(scope)`

Read scoped controller focus diagnostics without producing per-frame logs.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `scope` | `MiliUI.Parent` | — |
| Returns | `MiliUI.FocusExplanation` | — |

**Original LuaLS annotations:**

```lua
---@param scope MiliUI.Parent
---@return MiliUI.FocusExplanation
```
