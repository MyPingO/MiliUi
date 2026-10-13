# API reference: Session

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `session.lua`  
**Coverage:** 3 classes, 0 fields, 0 aliases, 25 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Session](../Session.md)

## Classes, component props and return types

### `MiliUI.SessionValue`

*No fields are declared directly on this type.*

### `MiliUI.SessionState`

*No fields are declared directly on this type.*

### `MiliUI.SessionAPI`

*No fields are declared directly on this type.*

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `SessionValue:Get()`

Read the stored value identified by the key you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `any` | value |

**Original LuaLS annotations:**

```lua
---@return any value
```


### `SessionValue:Set(value)`

Save the value under the key you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `any` | — |
| Returns | `MiliUI.SessionValue` | — |

**Original LuaLS annotations:**

```lua
---@param value any
---@return MiliUI.SessionValue
```


### `SessionValue:Update(callback)`

Change a saved session value by running your callback with the **old value**. Return the **new value** from that function. Example: `counter:Update(function(value) return (value or 0) + 1 end)` increases the stored number.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(value:any):any` | — |
| Returns | `MiliUI.SessionValue` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(value:any):any
---@return MiliUI.SessionValue
```


### `SessionValue:Clear()`

Clear or reset the current stored values, depending on this object.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.SessionValue` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.SessionValue
```


### `SessionState:Clear()`

Clear or reset the current stored values, depending on this object.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.SessionState` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.SessionState
```


### `SessionState:Raw()`

Return the underlying Lua table holding this session state's values. This is a low-level option; use `Get` and `Set` for ordinary saved UI settings.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `table` | — |

**Original LuaLS annotations:**

```lua
---@return table
```


### `Session.OpenPage(hostId, pageId)`

Marks a page open in one host and places it at the front/top of that host's
remembered page order. Opening an already-open page moves it without duplication.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `pageId` | `string` | — |
| Returns | `MiliUI.SessionAPI` | — |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@param pageId string
---@return MiliUI.SessionAPI
```


### `Session.ClosePage(hostId, pageId)`

Removes one page from one host's remembered order without clearing page state.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `pageId` | `string` | — |
| Returns | `MiliUI.SessionAPI` | — |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@param pageId string
---@return MiliUI.SessionAPI
```


### `Session.IsPageOpen(hostId, pageId)`

Return `true` if the specified page is marked open in this Host's remembered page order; otherwise return `false`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `pageId` | `string` | — |
| Returns | `boolean` | open |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@param pageId string
---@return boolean open
```


### `Session.GetOpenPages(hostId)`

Returns one host's page IDs from back/bottom to front/top.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `string[]` | pageIds |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return string[] pageIds
```


### `Session.GetActivePage(hostId)`

Returns one host's front/top open page ID.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `string?` | pageId |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return string? pageId
```


### `Session.BringPageToFront(hostId, pageId)`

Moves an already-open page to the front/top of its host. No-op when closed.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `pageId` | `string` | — |
| Returns | `MiliUI.SessionAPI` | — |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@param pageId string
---@return MiliUI.SessionAPI
```


### `Session.GetCurrentScope()`

Return the name of the session scope currently in use, or `nil` when none is set.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `string?` | scope |

**Original LuaLS annotations:**

```lua
---@return string? scope
```


### `Session.SetCurrentScope(scope)`

Change this Session's current scope setting using the supplied value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `scope?` | `string` | — |
| Returns | `MiliUI.SessionAPI` | — |

**Original LuaLS annotations:**

```lua
---@param scope? string
---@return MiliUI.SessionAPI
```


### `Session.WithScope(scope, callback)`

Run the callback using a named storage area, so the same key can store separate values in different pages or hosts.

Temporarily use the named session scope while running your callback. Values with the same key can then be kept separate between pages or Hosts. The callback's return value is passed back to you.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `scope` | `string` | — |
| Parameter `callback` | `fun():T` | — |
| Returns | `T` | — |

**Additional annotations:** `@generic T`

**Original LuaLS annotations:**

```lua
---@generic T
---@param scope string
---@param callback fun():T
---@return T
```


### `Session.Has(key, scope)`

Return `true` when the supplied key currently has a saved value in this session scope.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `string` | — |
| Parameter `scope?` | `string` | — |
| Returns | `boolean` | — |

**Original LuaLS annotations:**

```lua
---@param key string
---@param scope? string
---@return boolean
```


### `Session.Get(key, defaultValue, scope)`

Read a saved UI value from the current session. If it has not been saved yet, return `defaultValue`.
Example: `local volume = UI.Session.Get('volume', 50)`. This is not permanent disk storage.

Read the stored value identified by the key you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `string` | — |
| Parameter `defaultValue?` | `any` | — |
| Parameter `scope?` | `string` | — |
| Returns | `any` | value |

**Original LuaLS annotations:**

```lua
---@param key string
---@param defaultValue? any
---@param scope? string
---@return any value
```


### `Session.Set(key, value, scope)`

Remember a UI value while this Lua session is running. Example: `UI.Session.Set('volume', 50)`. Useful when recreating UI pages.

Save the value under the key you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `string` | — |
| Parameter `value` | `any` | — |
| Parameter `scope?` | `string` | — |
| Returns | `any` | value |

**Original LuaLS annotations:**

```lua
---@param key string
---@param value any
---@param scope? string
---@return any value
```


### `Session.Remove(key, scope)`

Remove the stored value associated with the supplied key from this session scope.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `string` | — |
| Parameter `scope?` | `string` | — |
| Returns | `MiliUI.SessionAPI` | — |

**Original LuaLS annotations:**

```lua
---@param key string
---@param scope? string
---@return MiliUI.SessionAPI
```


### `Session.ClearScope(scope)`

Remove all values saved under the specified session scope. If no scope is supplied, use the currently active scope.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `scope?` | `string` | — |
| Returns | `MiliUI.SessionAPI` | — |

**Original LuaLS annotations:**

```lua
---@param scope? string
---@return MiliUI.SessionAPI
```


### `Session.ClearPage(pageId)`

Clears remembered state for a globally-unique page ID and removes that page
from whichever host order currently contains it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Returns | `MiliUI.SessionAPI` | — |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@return MiliUI.SessionAPI
```


### `Session.Clear()`

Erase all MiliUI session state. This resets remembered page/value information; it does not delete files.

Clear or reset the current stored values, depending on this object.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.SessionAPI` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.SessionAPI
```


### `Session.Value(key, defaultValue, scope)`

Get a convenient object for reading/updating one named UI value. Example: `local volume = UI.Session.Value('volume', 50)`; then `volume:Get()` or `volume:Set(75)`.

Get a **session-value object** for a particular key. You can then use its `Get`, `Set`, or `Update` methods, and MiliUI remembers the value during the current Lua session.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `string` | — |
| Parameter `defaultValue?` | `any` | — |
| Parameter `scope?` | `string` | — |
| Returns | `MiliUI.SessionValue` | — |

**Original LuaLS annotations:**

```lua
---@param key string
---@param defaultValue? any
---@param scope? string
---@return MiliUI.SessionValue
```


### `Session.State(key, defaults, scope)`

Returns a proxy table backed directly by session state. Reading/writing fields
automatically reads/writes the remembered table; no explicit Set call is needed.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `string` | — |
| Parameter `defaults?` | `table` | — |
| Parameter `scope?` | `string` | — |
| Returns | `MiliUI.SessionState` | — |

**Original LuaLS annotations:**

```lua
---@param key string
---@param defaults? table
---@param scope? string
---@return MiliUI.SessionState
```


### `Session.GetScopeName(scope)`

Return the current scope name from this Session.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `scope?` | `string` | — |
| Returns | `string` | scope |

**Original LuaLS annotations:**

```lua
---@param scope? string
---@return string scope
```
