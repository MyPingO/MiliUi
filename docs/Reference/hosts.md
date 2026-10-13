# API reference: Hosts

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `hosts.lua`  
**Coverage:** 1 classes, 0 fields, 0 aliases, 8 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Hosts](../Hosts.md) · [ControlGroups](../ControlGroups.md)

## Classes, component props and return types

### `MiliUI.HostsAPI`

*No fields are declared directly on this type.*

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Hosts.Attach(uiIndex, hostId, root)`

Connect MiliUI to an existing, active Miliastra Client UI root. `uiIndex` is the same numeric UI Index used in server-side UI activation/removal nodes. `hostId` is your own name, such as `'Menu'`.

Attaches a named MiliUI Host to a currently available Client UI root.
The required uiIndex is the Miliastra UI entry Index used by server-side UI
activation/removal nodes. Attachment is passive: it never opens or restores Pages.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `uiIndex` | `integer` | — |
| Parameter `hostId` | `string` | — |
| Parameter `root` | `MiliUI.Parent` | — |
| Returns | `MiliUI.HostsAPI` | — |

**Original LuaLS annotations:**

```lua
---@param uiIndex integer
---@param hostId string
---@param root MiliUI.Parent
---@return MiliUI.HostsAPI
```


### `Hosts.Detach(hostId)`

Tell MiliUI that this native UI has been removed. Native listeners/timers are cleaned up, while remembered logical page state stays available for reattachment.

Detaches one temporarily unavailable Host. Live native references and runtime
resources are released. Logical Page state and the registered UI Index remain.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `boolean` | detached |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return boolean detached
```


### `Hosts.IsAttached(hostId)`

Return `true` or `false` to describe whether this Hosts is attached.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `boolean` | attached |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return boolean attached
```


### `Hosts.GetRoot(hostId)`

Return the current root of this Hosts.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `MiliUI.Control?` | root |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return MiliUI.Control? root
```


### `Hosts.GetIndex(hostId)`

Returns the registered Miliastra UI Index, including while the Host is detached.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `integer?` | uiIndex |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return integer? uiIndex
```


### `Hosts.RequireIndex(hostId)`

Returns the registered Miliastra UI Index or raises if none was registered.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `integer` | uiIndex |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return integer uiIndex
```


### `Hosts.GetAttachedHosts()`

Return the current attached hosts of this Hosts.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `string[]` | hostIds |

**Original LuaLS annotations:**

```lua
---@return string[] hostIds
```


### `Hosts.After(hostId, seconds, callback)`

Run code after a delay even when called from bootstrap, specifying which UI Host owns the task.
Example: `UI.Hosts.After('Menu', 1, function() print('Ready') end)`.

Schedules delayed work owned by one attached Host.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `seconds` | `number` | — |
| Parameter `callback` | `fun()` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@param seconds number
---@param callback fun()
---@return any tween
```
