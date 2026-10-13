# API reference: Variables

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `variables.lua`  
**Coverage:** 2 classes, 1 fields, 0 aliases, 2 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Subscriptions](../Subscriptions.md)

## Classes, component props and return types

### `MiliUI.VariableWatchOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `immediate?` | `boolean` | Read and deliver the current value immediately after subscribing. Default false. |

### `MiliUI.VariablesAPI`

*No fields are declared directly on this type.*

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Variables.Get(entityType, customVariableName)`

Read the current value of a Global Custom Variable from Miliastra's Node Graph system. `entityType` is an `Enum.CustomVariableEntityType`; `customVariableName` must match the editor.

Reads a global Custom Variable through game.GetGlobalCustomVariableValue.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `entityType` | `any` | Enum.CustomVariableEntityType value. |
| Parameter `customVariableName` | `string` | — |
| Returns | `any` | value |

**Original LuaLS annotations:**

```lua
---@param entityType any Enum.CustomVariableEntityType value.
---@param customVariableName string
---@return any value
```


### `Variables.Watch(hostId, entityType, customVariableName, callback, options)`

Call a function whenever a Global Custom Variable changes. Useful for keeping HP, scores or settings text up to date without manually polling.
Example: `UI.Variables.Watch('HUD', entityType, 'Score', function(score) print(score) end)` where `entityType` is your project's `Enum.CustomVariableEntityType` value.

Watches one global Custom Variable under an attached Host.
Miliastra's native changed callback does not contain the new value, so MiliUI
reads it once and passes it to every watcher.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `entityType` | `any` | Enum.CustomVariableEntityType value. |
| Parameter `customVariableName` | `string` | — |
| Parameter `callback` | `fun(value:any, entityType:any, customVariableName:string)` | — |
| Parameter `options?` | `MiliUI.VariableWatchOptions` | — |
| Returns | `MiliUI.Subscription` | subscription |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@param entityType any Enum.CustomVariableEntityType value.
---@param customVariableName string
---@param callback fun(value:any, entityType:any, customVariableName:string)
---@param options? MiliUI.VariableWatchOptions
---@return MiliUI.Subscription subscription
```
