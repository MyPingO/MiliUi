# Hosts

A **Host** is MiliUI's name for one Miliastra Client UI root together with the Miliastra **UI Index** that identifies that UI entry on the server.

The recommended real-game setup is to put that root inside a **UI Control Group Library** entry. Miliastra decides when the Control Group exists and what Layer it uses; MiliUI manages the controls created under that root.

For a beginner-friendly setup guide, start with [ControlGroups.md](ControlGroups.md).

## The short version

Think of the relationship like this:

```text
Miliastra UI entry
    -> has an integer UI Index used by server UI nodes
    -> owns existence + Layer
    -> contains a Client UI root
        -> attached Lua script starts with the UI
            -> UI.Hosts.Attach(uiIndex, "Menu", script.object)
                -> MiliUI remembers "Menu" -> uiIndex
                -> MiliUI owns runtime work under that root
```

Typical hosts might be:

```text
HUD       -> Host "HUD"       -> UI Index 1001
Menu      -> Host "Menu"      -> UI Index 1002
Overlay   -> Host "Overlay"   -> UI Index 1003
```

MiliUI does **not** emulate cross-root layers. If Menu should appear above HUD, set the corresponding Miliastra Layers appropriately.

## Template setup

Primitive templates are shared by every host:

```lua
UI.InitTemplates({
    container = script:GetParam("ContainerTemplateId"),
    image = script:GetParam("ImageTemplateId"),
    text = script:GetParam("TextTemplateId"),
    button = script:GetParam("ButtonTemplateId"),
    cursorArea = script:GetParam("CursorAreaTemplateId"),
    keyHint = script:GetParam("KeyHintTemplateId"),
    textWindow = script:GetParam("TextWindowTemplateId"),
    gridScroller = script:GetParam("GridScrollerTemplateId"),
})
```

It is fine for independently-instantiated UI scripts to call `InitTemplates` during their own `OnStart`.

Repeated calls **merge compatible entries**. A HUD script that supplies only `container`, `image`, `text`, `button`, and `cursorArea` therefore does not erase an optional `textWindow` or `gridScroller` mapping previously configured by Menu. If two calls supply different IDs for the same template kind, MiliUI raises a configuration error instead of silently changing the shared mapping.

The old single-root `UI.Init(root, templates)` lifecycle is intentionally removed. Stale calls raise a migration error directing the game to `InitTemplates` plus `Hosts.Attach`.

## Attach and Detach

Every Host attachment requires three values:

```lua
UI.Hosts.Attach(uiIndex, hostId, root)
```

For example:

```lua
local MENU_UI_INDEX = 12345
local MENU_HOST_ID = "Menu"

UI.Hosts.Attach(MENU_UI_INDEX, MENU_HOST_ID, script.object)
```

MiliUI does not prescribe where the Index comes from. A game can use a literal, local constant, shared config module, script parameter, or any other source that produces the correct integer.

The values have different jobs:

```text
uiIndex -> Miliastra's integer identity for activating/removing that UI entry
hostId  -> MiliUI's logical identity, such as "Menu"
root    -> the currently-live Client UI root
```

`uiIndex` is required and must be an integer.

One script may attach multiple Hosts when it owns multiple roots:

```lua
UI.Hosts.Attach(1001, "HUD", hudRoot)
UI.Hosts.Attach(1002, "Menu", menuRoot)
UI.Hosts.Attach(1003, "Overlay", overlayRoot)
```

When Miliastra tears a native root down:

```lua
UI.Hosts.Detach("Menu")
```

A normal UI script therefore ends with:

```lua
function OnDestroy()
    if UI.Hosts.IsAttached("Menu") then
        UI.Hosts.Detach("Menu")
    end
end
```

Do **not** use `UI.DestroyAll()` as normal per-Host teardown. `DestroyAll` affects all currently attached hosts; `Detach("Menu")` releases only Menu-owned runtime state.

## UI Index metadata survives detach

The native root is temporary, but the Host's UI Index is persistent MiliUI metadata for the current client runtime.

After:

```lua
UI.Hosts.Attach(12345, "Menu", root)
UI.Hosts.Detach("Menu")
```

this still works:

```lua
local uiIndex = UI.Hosts.GetIndex("Menu")
-- 12345
```

Use `GetIndex` when an unknown Host is acceptable:

```lua
local uiIndex = UI.Hosts.GetIndex("Menu")
if uiIndex ~= nil then
    -- use the index
end
```

Use `RequireIndex` when the operation cannot proceed without it:

```lua
local uiIndex = UI.Hosts.RequireIndex("Menu")
```

`RequireIndex` raises a clear error if that Host has never been successfully attached in this client runtime.

This is useful when client Lua needs to ask the server to activate or remove the corresponding Miliastra UI entry after its native Host root has disappeared.

## Attach is passive

`Attach` only makes a root available and registers its UI Index. It does not open a page, restore a page, or execute deferred work.

```lua
UI.Hosts.Attach(12345, "Menu", newRoot)
-- Nothing opens here.

UI.Pages.Restore("Menu")
-- Explicit restoration happens here.
```

Likewise, `UI.Pages.Open("Updates")` while its host is unavailable returns:

```lua
false, "host-unavailable"
```

The failed open is not remembered and will not happen later merely because the host appears.

## Identity rules

Host IDs are exact and case-sensitive. Only one root may be attached under a host ID at a time:

```lua
UI.Hosts.Attach(12345, "Menu", firstRoot)
UI.Hosts.Attach(12345, "Menu", secondRoot) -- error: already attached
```

Replacement is explicit:

```lua
UI.Hosts.Detach("Menu")
UI.Hosts.Attach(12345, "Menu", replacementRoot)
```

Once a Host ID has successfully registered a UI Index, later attachments of that same Host ID must use the same Index:

```lua
UI.Hosts.Attach(12345, "Menu", firstRoot)
UI.Hosts.Detach("Menu")
UI.Hosts.Attach(99999, "Menu", replacementRoot) -- configuration error
```

Likewise, one UI Index cannot be registered to two different Host IDs:

```lua
UI.Hosts.Attach(12345, "Menu", menuRoot)
UI.Hosts.Attach(12345, "HUD", hudRoot) -- configuration error
```

A root already owned by another MiliUI host also cannot be attached again.

This means a UI prefab using a fixed host ID such as `"Menu"` should normally have only one live instance at a time.

## Runtime ownership

Controls, listeners, tweens, resize hooks, persistence bindings, and layout metadata are owned by the host in which they were created. Detaching one host releases only that host's live runtime references. Other attached hosts continue running normally.

Callbacks registered by MiliUI re-enter their owning host context, so a later click/timer can safely create more controls without falling back to whichever host happened to be used most recently.

Target-based motion helpers infer ownership from their target control. `UI.After(seconds, callback)` and `UI.Motion.After(seconds, callback)` are valid while execution is already inside a host-owned page, listener, resize callback, or timer.

Game/bootstrap code outside one of those contexts must name the host explicitly:

```lua
UI.Hosts.After("Menu", 0.25, function()
    -- Cancelled automatically if Menu detaches first.
end)
```

## Layering boundary

Inside one host, pages are siblings. MiliUI can reorder them with:

```lua
UI.Pages.BringToFront("Inventory")
```

Between separate hosts, MiliUI cannot reorder the native roots:

```text
HUD Host  <-> Menu Host  <-> Overlay Host
```

Use Miliastra Layer values for that ordering.

A modal created inside Menu can cover Menu content. If something must always sit above independent HUD/Menu roots, a dedicated higher-layer Overlay UI/Host is the clean solution.

## Detach versus close

Host detach means the native hierarchy is temporarily unavailable. It preserves logical page state **and the Host's registered UI Index**:

```lua
UI.Hosts.Detach("Menu")
```

Actual page closure is separate:

```lua
UI.Pages.Close("Updates")
```

This distinction allows teleport/native-root recreation to preserve open pages and remembered component state without making host attachment perform hidden work.

See [RuntimeLifecycle.md](RuntimeLifecycle.md) for the full teardown/recreation sequence and [Pages.md](Pages.md) for page behavior inside a host.
