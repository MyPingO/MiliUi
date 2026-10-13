# API reference: Pages

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `pages.lua`  
**Coverage:** 4 classes, 6 fields, 0 aliases, 29 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Pages](../Pages.md) · [Navigation](../Navigation.md)

## Classes, component props and return types

### `MiliUI.PageContext`

| Field | Declared type | Description |
| --- | --- | --- |
| `id` | `string` | Stable globally-unique page ID used by Session scoping. |
| `host` | `string` | Host ID assigned by the page registration. |

### `MiliUI.PageDefinition`

| Field | Declared type | Description |
| --- | --- | --- |
| `host` | `string` | Named MiliUI host that owns this page. |
| `create` | `fun(parent:MiliUI.Parent, context:MiliUI.PageContext):MiliUI.Parent` | Factory returning a page root directly parented to the host root. |

### `MiliUI.PageHandle`

| Field | Declared type | Description |
| --- | --- | --- |
| `id` | `string` | Unique name that identifies this page when you register or open it. Example: `'SettingsPage'`. |
| `host` | `string` | Name of the MiliUI Host this page belongs to. Pages belonging to the same Host can share navigation history. |

### `MiliUI.PagesAPI`

*No fields are declared directly on this type.*

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `PageContext:Close()`

Close the current page from inside its own callbacks; no need to repeat its page ID.

Hide this PageContext.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | closed |

**Original LuaLS annotations:**

```lua
---@return boolean closed
```


### `PageContext:BringToFront()`

Move this page or Host to the front of its stack so it appears above other content.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | opened |
| Returns | `MiliUI.Parent\|string` | result |

**Original LuaLS annotations:**

```lua
---@return boolean opened
---@return MiliUI.Parent|string result
```


### `PageContext:Push(pageId, options)`

Pushes another registered page in the same Host onto navigation history.

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


### `PageContext:Replace(pageId, options)`

Replaces this Host's current navigation entry with another registered page.

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


### `PageContext:Back(options)`

Returns to this Host's previous navigation entry.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `options?` | `MiliUI.NavigationTransitionOptions` | — |
| Returns | `boolean` | opened |
| Returns | `MiliUI.Parent\|string` | result |

**Original LuaLS annotations:**

```lua
---@param options? MiliUI.NavigationTransitionOptions
---@return boolean opened
---@return MiliUI.Parent|string result
```


### `PageContext:Reset(pageId, options)`

Clears this Host's navigation history and makes pageId the new root/current page.

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


### `PageContext:CanGoBack()`

Return `true` if this page has an earlier page in navigation history that it can go back to. Otherwise return `false`.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | canGoBack |

**Original LuaLS annotations:**

```lua
---@return boolean canGoBack
```


### `PageHandle:Register()`

Register this page so MiliUI knows it can be opened. Returns `true` when registration succeeds.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | registered |

**Original LuaLS annotations:**

```lua
---@return boolean registered
```


### `PageHandle:Unregister()`

Unregister this page so MiliUI stops treating it as an available page. Returns `true` when unregistration succeeds.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | unregistered |

**Original LuaLS annotations:**

```lua
---@return boolean unregistered
```


### `PageHandle:IsRegistered()`

Return `true` when this page or Host is currently registered with MiliUI.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | registered |

**Original LuaLS annotations:**

```lua
---@return boolean registered
```


### `PageHandle:Open()`

Show this PageHandle.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | opened |
| Returns | `MiliUI.Parent\|string` | result |

**Original LuaLS annotations:**

```lua
---@return boolean opened
---@return MiliUI.Parent|string result
```


### `PageHandle:Close()`

Hide this PageHandle.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | closed |

**Original LuaLS annotations:**

```lua
---@return boolean closed
```


### `PageHandle:BringToFront()`

Move this page or Host to the front of its stack so it appears above other content.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | opened |
| Returns | `MiliUI.Parent\|string` | result |

**Original LuaLS annotations:**

```lua
---@return boolean opened
---@return MiliUI.Parent|string result
```


### `PageHandle:Get()`

Read the stored value identified by the key you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Parent?` | page |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Parent? page
```


### `PageHandle:IsOpen()`

Return `true` if this page is currently open and visible in its Host; otherwise return `false`.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | open |

**Original LuaLS annotations:**

```lua
---@return boolean open
```


### `Pages.Define(pageId, definition)`

Describe a page once, then open it later by its ID. `create(parent, context)` builds and returns the page's root UI.
Example: `UI.Pages.Define('Settings', { host = 'Menu', create = function(parent) return UI.Box(parent, { fillWidth = true, fillHeight = true }) end })`.

Creates a lightweight reusable handle around one page definition. Registration
is lazy: Register/Open/BringToFront register it the first time they need it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Parameter `definition` | `MiliUI.PageDefinition` | — |
| Returns | `MiliUI.PageHandle` | — |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@param definition MiliUI.PageDefinition
---@return MiliUI.PageHandle
```


### `Pages.Register(pageId, definition)`

Registers a globally-unique page ID. Duplicate IDs fail instead of replacing
the previous registration.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Parameter `definition` | `MiliUI.PageDefinition` | — |
| Returns | `MiliUI.PagesAPI` | — |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@param definition MiliUI.PageDefinition
---@return MiliUI.PagesAPI
```


### `Pages.Unregister(pageId)`

Removes a closed page registration. Logically-open detached pages must be
closed before they can be unregistered.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Returns | `MiliUI.PagesAPI` | — |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@return MiliUI.PagesAPI
```


### `Pages.IsRegistered(pageId)`

Return `true` when this page or Host is currently registered with MiliUI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Returns | `boolean` | registered |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@return boolean registered
```


### `Pages.GetHost(pageId)`

Return the current host from this Pages.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Returns | `string?` | hostId |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@return string? hostId
```


### `Pages.Open(pageId)`

Open a registered page by its ID. Example: `UI.Pages.Open('Settings')`. The target Host must already be attached.

Opens a page on its registered host. If that host is unavailable, returns
false, "host-unavailable" and does not mutate logical page state. Opening an
already-live page brings the existing instance to the front without rebuilding.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Returns | `boolean` | opened |
| Returns | `MiliUI.Parent\|string` | result |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@return boolean opened
---@return MiliUI.Parent|string result
```


### `Pages.Close(pageId)`

Close the named page without unregistering its definition, so it can be opened again later.

Closes one logical/live page without clearing its remembered Session values.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Returns | `boolean` | closed |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@return boolean closed
```


### `Pages.CloseAll(hostId)`

Closes all pages belonging to one host, topmost first.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `boolean` | closed |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return boolean closed
```


### `Pages.Restore(hostId)`

Explicitly rebuilds remembered pages for one attached host in stored
bottom-to-top order. Attachment itself never calls Restore automatically.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `boolean` | restored |
| Returns | `MiliUI.Parent[]\|string` | result |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return boolean restored
---@return MiliUI.Parent[]|string result
```


### `Pages.BringToFront(pageId)`

Moves an open page to the front using native sibling order. A closed page is
opened. No page rebuild occurs merely to change ordering.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Returns | `boolean` | opened |
| Returns | `MiliUI.Parent\|string` | result |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@return boolean opened
---@return MiliUI.Parent|string result
```


### `Pages.Get(pageId)`

Read the stored value identified by the key you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Returns | `MiliUI.Parent?` | page |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@return MiliUI.Parent? page
```


### `Pages.IsOpen(pageId)`

Return `true` if the requested page is currently open, or `false` when it is closed.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `pageId` | `string` | — |
| Returns | `boolean` | — |

**Original LuaLS annotations:**

```lua
---@param pageId string
---@return boolean
```


### `Pages.GetOpenPages(hostId)`

Returns one host's page IDs ordered bottom-to-top.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `string[]` | pageIds |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return string[] pageIds
```


### `Pages.GetActivePage(hostId)`

Returns the frontmost open page in one host.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `string?` | pageId |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return string? pageId
```
