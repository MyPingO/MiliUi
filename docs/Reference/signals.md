# API reference: Signals

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `signals.lua`  
**Coverage:** 2 classes, 0 fields, 0 aliases, 3 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Subscriptions](../Subscriptions.md)

## Classes, component props and return types

### `MiliUI.Subscription`

*No fields are declared directly on this type.*

### `MiliUI.SignalsAPI`

*No fields are declared directly on this type.*

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Subscription:Disconnect()`

Stops this subscription. Returns true only when this call actually disconnected it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | disconnected |

**Original LuaLS annotations:**

```lua
---@return boolean disconnected
```


### `Subscription:IsConnected()`

Returns whether this subscription is still active.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | connected |

**Original LuaLS annotations:**

```lua
---@return boolean connected
```


### `Signals.Listen(hostId, signalName, callback)`

Run a Lua callback whenever a named Server Signal arrives from your Server Node Graph. MiliUI automatically stops listening when the Host closes.
Example: `UI.Signals.Listen('Menu', 'ScoreChanged', function(params) print(params[1]) end)`.

Listens for one server-to-client signal under an attached Host.
MiliUI multiplexes subscribers so several Hosts/callbacks can safely listen to
the same signal name through one native script handler.
The callback receives signalParams first and the received signal name second.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `signalName` | `string` | — |
| Parameter `callback` | `fun(signalParams:any[]?, signalName:string)` | — |
| Returns | `MiliUI.Subscription` | subscription |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@param signalName string
---@param callback fun(signalParams:any[]?, signalName:string)
---@return MiliUI.Subscription subscription
```
