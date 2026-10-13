# API reference: Player

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `player.lua`  
**Coverage:** 1 classes, 0 fields, 0 aliases, 5 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Player](../Player.md)

## Classes, component props and return types

### `MiliUI.PlayerAPI`

*No fields are declared directly on this type.*

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Player.Configure(customVariableName)`

Tell MiliUI which Player Custom Variable contains the current player's own Entity. This is a variable you create in the Miliastra editor, not an automatically supplied name.
Example: `UI.Player.Configure('PlayerSelf')` if the variable is actually called PlayerSelf in your project.

Configures the Player Custom Variable that stores the current Player Entity reference.
The variable must belong to the Player Entity and contain a reference to that same Player Entity.
The name is project-defined; "PlayerSelf" is only a recommended example.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `customVariableName` | `string` | — |
| Returns | `string` | customVariableName |

**Original LuaLS annotations:**

```lua
---@param customVariableName string
---@return string customVariableName
```


### `Player.GetCustomVariableName()`

Returns the configured Player Custom Variable name, or nil if UI.Player has not been configured.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `string?` | customVariableName |

**Original LuaLS annotations:**

```lua
---@return string? customVariableName
```


### `Player.IsConfigured()`

Returns whether a Player Custom Variable name has been configured.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | configured |

**Original LuaLS annotations:**

```lua
---@return boolean configured
```


### `Player.GetEntity()`

Read your current Player Entity from the configured Custom Variable. Returns nil if missing; use `RequireEntity()` instead if missing configuration should be an error.

Reads and returns the current client's Player Entity reference from the configured
Player Custom Variable, or nil if UI.Player is not configured or the value is invalid.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer?` | entity |

**Original LuaLS annotations:**

```lua
---@return integer? entity
```


### `Player.RequireEntity()`

Reads and returns the current client's Player Entity reference from the configured
Player Custom Variable, or raises a clear error when configuration/value is missing.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | entity |

**Original LuaLS annotations:**

```lua
---@return integer entity
```
