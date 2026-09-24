# MiliUI examples

The examples use two different patterns. This distinction is important.

## Start here

If you are completely new to MiliUI, begin with the deliberately small [getting-started examples](getting-started/README.md):

1. [`getting-started/HelloMiliUI.lua`](getting-started/HelloMiliUI.lua) — one Screen, Card, heading, and Button.
2. [`getting-started/SimpleMenu.lua`](getting-started/SimpleMenu.lua) — a small vertical menu.
3. [`getting-started/SimpleSettings.lua`](getting-started/SimpleSettings.lua) — a Toggle and Slider with callbacks.
4. [`../QUICK_START.md`](../QUICK_START.md) — installation and editor setup from zero.

After that, the framework-level examples are:

1. [`ControlGroupHud.lua`](ControlGroupHud.lua) — a complete Control Group + Host example.
2. [`ControlGroupMenu.lua`](ControlGroupMenu.lua) — Control Group + Host + Page + Session.
3. [`../docs/ControlGroups.md`](../docs/ControlGroups.md) — the full lifecycle explanation.

The recommended game architecture is:

```text
Server Node Graph
    -> instantiate UI Control Group
        -> Client Control Container
            -> attached Lua script OnStart
                -> UI.InitTemplates(...)
                -> UI.Hosts.Attach(uiIndex, hostId, root)
                -> build UI or Open/Restore Pages
```

When that Control Group is removed, its script calls `UI.Hosts.Detach(...)` in `OnDestroy`.

You normally do not need a second "Show Lua UI" signal just to tell the newly-instantiated UI to appear.

## Pattern A: standalone Control Group scripts

These examples include their own `OnStart` / `OnDestroy` Host lifecycle and can be adapted into scripts attached to a Client Control Container:

```text
ControlGroupHud.lua
ControlGroupMenu.lua
MultipleChoiceWindow.lua
ResponsiveFoundation.lua
ResponsiveStress.lua
ScrollArea.lua
Scrollbar.lua
Select.lua
SessionPersistence.lua
```

Their basic shape is:

```lua
local UI = require("MiliUI/init")
local UI_INDEX = 1001 -- Replace with the Miliastra UI Index for this UI entry.
local HOST_ID = "Example"

function OnStart()
    UI.InitTemplates({ ... })
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    -- Build UI, or Open/Restore registered Pages.
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

The Index does not need to come from a script parameter. It can be typed directly, kept in a Lua constant, or loaded from game-defined configuration.

In a real project, give each independent root a meaningful stable Host ID such as `"HUD"`, `"Menu"`, or `"Overlay"`, and give each Host the matching Miliastra UI Index.

Do not replace that `Detach` with `UI.DestroyAll()`. `DestroyAll()` is global across attached Hosts and can destroy another Control Group's MiliUI controls.

## Pattern B: reusable builders

Some examples are modules that only build UI under a parent supplied by the caller:

```text
AdvancedGallery.lua
ComponentGallery.lua
ResponsiveComponentGallery.lua
IntelliSenseSmokeTest.lua
```

They do **not** own the Control Group or Host lifecycle.

Typical use:

```lua
local UI = require("MiliUI/init")
local Gallery = require("Game UI/ComponentGallery")

local UI_INDEX = 1005
local HOST_ID = "Gallery"

function OnStart()
    UI.InitTemplates({ ... })
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    Gallery.Build(script.object)
end

function OnDestroy()
    UI.Hosts.Detach(HOST_ID)
end
```

A registered Page factory is another good place to call a reusable builder because the factory already runs inside the owning Host/Page context.

## Multiple Hosts in one script

A single Lua script may own more than one Host when it has multiple roots available:

```lua
UI.Hosts.Attach(1001, "HUD", hudRoot)
UI.Hosts.Attach(1002, "Menu", menuRoot)
```

Host IDs and UI Indexes are both unique identities. MiliUI rejects a Host ID mapped to a different Index and also rejects the same Index being mapped to two different Host IDs.

## Control Group Layer versus MiliUI Page order

If two examples are instantiated as different Miliastra Control Groups, their cross-root visual order comes from the Control Group **Layer** setting.

```text
HUD Control Group      -> Layer decides its cross-root position
Menu Control Group     -> Layer decides its cross-root position
```

Inside one Host, `UI.Pages.BringToFront(...)` changes Page sibling order.

MiliUI intentionally does not provide one fake z-index that crosses separate Control Groups.

## Fixed example Host IDs

Standalone examples use fixed Host IDs such as `"Select Example"`. Do not instantiate two live copies of the same fixed-ID example at once unless you first change the IDs to be unique.

Duplicate attached Host IDs intentionally error; silently merging two native roots would make cleanup and ownership unpredictable.

## Timers

Inside a MiliUI-owned callback, the short timer form is correct:

```lua
button:OnClick(function()
    UI.After(0.25, function()
    end)
end)
```

From bootstrap code such as `OnStart`, name the Host explicitly:

```lua
UI.Hosts.After(HOST_ID, 0.25, function()
end)
```

This lets MiliUI cancel delayed work if that Host disappears first.

## Pages and remembered state

Use Pages when one Host has logical screens or should recover its open screens after temporary native root recreation.

```lua
UI.Pages.Register("Settings", {
    host = "Menu",
    create = BuildSettings,
})
```

Use `remember = true` plus a stable `id` for component state that should rebuild with the same value:

```lua
UI.Toggle(parent, {
    id = "Music Enabled",
    remember = true,
    value = true,
})
```

Session persistence is in-memory Lua state, not permanent player save data.
