# Control Groups and MiliUI Hosts

For most games, the easiest way to use MiliUI is to let **Miliastra own when a UI exists** and let **MiliUI own what happens inside that UI**.

The recommended setup is:

```text
Server Node Graph
    -> instantiates a UI Control Group from the Control Group Library
        -> Client Control Container is created
            -> the Lua script attached to that UI starts
                -> UI.Hosts.Attach(uiIndex, hostId, root)
                -> MiliUI builds or restores that host's UI
```

When the Control Group is removed, its attached script is destroyed and calls `UI.Hosts.Detach(...)`.

This means you normally **do not need a separate "Show Lua UI" signal** just to tell Lua that a UI should appear. Instantiating the Control Group is already the show operation.

## The mental model

There are four different things involved. Keeping them separate makes the system much easier to understand.

| Concept | Think of it as | Who owns it? |
| --- | --- | --- |
| **UI Control Group** | A prefab / packaged UI instance with a Layer and UI Index | Miliastra |
| **Client Control Container** | The native root MiliUI is allowed to build under | Miliastra |
| **MiliUI Host** | MiliUI's name and runtime ownership for that root | MiliUI |
| **MiliUI Page** | A logical screen inside one host | MiliUI |

A useful analogy is a building:

```text
Control Group = the building itself
UI Index      = the building's Miliastra ID
Layer         = which building is visually in front
Host          = MiliUI's name for one building
Pages         = rooms inside that building
```

MiliUI can reorder rooms inside one building. It cannot move one building in front of another. Cross-group ordering belongs to Miliastra's **Layer** setting.

## What is global and what is per Host?

A few pieces of MiliUI are shared across the Lua runtime, while live UI ownership is Host-local:

```text
Shared/global configuration
├── primitive template mapping from UI.InitTemplates(...)
├── Theme defaults
├── globally-unique Page registry
└── Host ID <-> UI Index metadata

Per Host
├── native root
├── created controls
├── listeners / tweens / delayed work
├── layout metadata
├── live persistence/localization bindings
└── ordered open Pages for that Host
```

This is why independently-instantiated Control Group scripts may each call `UI.InitTemplates(...)` when they use the same template mapping, but should not assume they each own a separate global Theme or Page registry.

## Recommended editor structure

A game might create these entries in the UI Control Group Library:

```text
HUD Control Group
UI Index: 1001
Layer: project-defined HUD layer
└── Client Control Container
    └── HUD UI.lua

Menu Control Group
UI Index: 1002
Layer: project-defined menu layer
└── Client Control Container
    └── Menu UI.lua

Overlay Control Group
UI Index: 1003
Layer: project-defined overlay layer
└── Client Control Container
    └── Overlay UI.lua
```

The numeric Layer values are a Miliastra concern. Choose them so the visual order in your project is:

```text
Overlay
Menu
HUD
```

if that is the behavior you want. MiliUI does not inspect or modify those Layer values.

## Simple example: HUD with no Pages

A HUD does not need `UI.Pages` if it is just one UI tree that should exist whenever the HUD Control Group exists.

Attach this script to the HUD Control Group's Client Control Container:

```lua
local UI = require("MiliUI/init")

local UI_INDEX = 1001
local HOST_ID = "HUD"

local function InitTemplates()
    UI.InitTemplates({
        container = script:GetParam("ContainerTemplateId"),
        image = script:GetParam("ImageTemplateId"),
        text = script:GetParam("TextTemplateId"),
        button = script:GetParam("ButtonTemplateId"),
        cursorArea = script:GetParam("CursorAreaTemplateId"),
    })
end

function OnStart()
    InitTemplates()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local card = UI.Card(script.object, {
        x = -560,
        y = 330,
        width = 360,
        height = 120,
    })

    UI.Heading(card.content, {
        text = "HUD",
        needsTranslation = false,
        y = 28,
    })

    UI.Label(card.content, {
        text = "This exists because the HUD Control Group exists.",
        needsTranslation = false,
        y = -22,
        width = 300,
    })
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

The Index does not need to be a script parameter. It can be written directly in Lua, stored in a local constant as above, loaded from shared configuration, or supplied by any other game-defined source.

The server graph does not need to send a second signal telling this script to show itself. It only needs to instantiate the HUD Control Group.

## Simple example: Menu with Pages

Use `UI.Pages` when one Control Group can contain multiple logical screens, or when open pages should be remembered across temporary root recreation.

```lua
local UI = require("MiliUI/init")

local UI_INDEX = 1002
local HOST_ID = "Menu"
local PAGE_ID = "Main Menu"

local function InitTemplates()
    UI.InitTemplates({
        container = script:GetParam("ContainerTemplateId"),
        image = script:GetParam("ImageTemplateId"),
        text = script:GetParam("TextTemplateId"),
        button = script:GetParam("ButtonTemplateId"),
        cursorArea = script:GetParam("CursorAreaTemplateId"),
    })
end

local function BuildMainMenu(parent, page)
    local screen = UI.Screen(parent, {
        padding = 48,
        background = "page",
        showCursor = true,
        disableKeyEventPassthrough = true,
    })

    local card = UI.Card(screen, {
        width = 520,
        height = 300,
    })

    UI.Heading(card.content, {
        text = "MAIN MENU",
        needsTranslation = false,
        y = 80,
    })

    UI.Label(card.content, {
        text = "This page belongs to the Menu host.",
        needsTranslation = false,
        y = 20,
        width = 420,
    })

    return screen
end

local function RegisterPages()
    -- The Lua module state may survive a native UI recreation, so registration
    -- must not blindly run twice.
    if not UI.Pages.IsRegistered(PAGE_ID) then
        UI.Pages.Register(PAGE_ID, {
            host = HOST_ID,
            create = BuildMainMenu,
        })
    end
end

function OnStart()
    InitTemplates()
    RegisterPages()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local openPages = UI.Pages.GetOpenPages(HOST_ID)

    if #openPages > 0 then
        -- The host disappeared temporarily, for example during UI recreation.
        UI.Pages.Restore(HOST_ID)
    else
        -- This Control Group was instantiated with no remembered open page.
        UI.Pages.Open(PAGE_ID)
    end
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

The important part is that `Attach` is deliberately passive. The script chooses whether this particular appearance of the host should `Open` a default page or `Restore` pages that were already logically open.

One script can also attach multiple Hosts if it owns multiple roots:

```lua
UI.Hosts.Attach(1001, "HUD", hudRoot)
UI.Hosts.Attach(1002, "Menu", menuRoot)
```

Each Host keeps its own root and UI Index mapping.

## Why registration uses `IsRegistered`

Miliastra may recreate the native Client UI hierarchy while the Lua modules that contain MiliUI's logical state are still alive.

That can produce this sequence:

```text
first Control Group instance
    -> Register("Main Menu")
    -> Attach(1002, "Menu", root)

native UI is recreated
    -> old host Detach("Menu")
    -> new script OnStart runs
    -> MiliUI registry may still remember "Main Menu"
```

Calling `Register("Main Menu")` again would correctly be treated as a duplicate programming error.

Therefore host/bootstrap scripts that may run again should use:

```lua
if not UI.Pages.IsRegistered("Main Menu") then
    UI.Pages.Register("Main Menu", definition)
end
```

## Showing and hiding from Server Node Graphs

For a Control Group-based UI, the normal high-level flow is:

```text
SHOW
Server graph instantiates Menu Control Group
    -> Menu UI.lua OnStart()
    -> Attach(1002, "Menu", root)
    -> Open or Restore

HIDE / REMOVE
Server graph removes Menu Control Group
    -> Menu UI.lua OnDestroy()
    -> Detach("Menu")
```

When client Lua needs to request that operation from the server, `UI.Hosts.RequireIndex("Menu")` provides the corresponding Miliastra UI Index even after Menu has detached, provided that Host was successfully attached at least once in the current client runtime.

You can still use ServerSignals for real application events, such as updating data, submitting a selection, or requesting server-owned UI activation/removal.

## Re-showing a Control Group: resume or start fresh?

`Detach` preserves logical Page state. That is required for temporary native recreation, but it also means a Control Group removed now and re-instantiated later can resume the same open Page stack.

That can be exactly what you want:

```text
remove Menu Control Group
    -> Detach("Menu")
    -> logical Inventory page remains remembered

later instantiate Menu again
    -> Attach(1002, "Menu", root)
    -> Restore("Menu")
    -> Inventory comes back
```

If the game wants a fresh menu next time instead, deliberately close the logical Pages before removing the Control Group:

```lua
UI.Pages.CloseAll("Menu")
```

Then the next Menu instance sees an empty Page stack and can open its normal default Page.

The key idea is:

```text
Detach = native root disappeared; keep logical navigation state
Close  = user/game is logically done with that Page
```

MiliUI does not guess which policy your game wants.

## Layering: the most important boundary

There are two different kinds of ordering.

### Inside one Host

Pages under the same host are siblings under the same Client UI root:

```text
Menu Host
├── Inventory
├── Settings
└── Confirm Page  <- frontmost Menu page
```

MiliUI can manage this with:

```lua
UI.Pages.BringToFront("Inventory")
```

That changes sibling order **inside Menu**.

### Between Hosts

HUD, Menu, and Overlay are separate native roots:

```text
HUD Control Group      -> Host "HUD"
Menu Control Group     -> Host "Menu"
Overlay Control Group  -> Host "Overlay"
```

Their relative visual order comes from the Miliastra Control Group **Layer** setting, not `BringToFront`.

This is why MiliUI does not implement a fake global z-index.

## When to make an Overlay Host

A normal `UI.Modal` is created inside its current host. That is perfect when it only needs to cover other content in the same host.

If some UI must always render above multiple independent Control Groups, put that UI in a dedicated higher-layer Control Group and attach it as a separate host such as `"Overlay"`.

Think of the rule this way:

```text
same native root?        -> MiliUI sibling/page ordering can handle it
separate Control Groups? -> Miliastra Layer must handle it
```

## What happens during teleport or native UI recreation

The tested lifecycle is:

```text
Menu is open
HUD is open

Miliastra tears down the native UI
    -> Menu script OnDestroy -> Detach("Menu")
    -> HUD script OnDestroy  -> Detach("HUD")

MiliUI keeps logical Session state
    -> remembered open Menu pages remain recorded
    -> remembered component values remain recorded
    -> Host UI Index mappings remain recorded
    -> HUD state is independent from Menu state

Miliastra creates replacement Control Groups
    -> Menu OnStart -> Attach(1002, "Menu", root) -> Restore("Menu")
    -> HUD OnStart  -> Attach(1001, "HUD", root)  -> rebuild/restore its own UI
```

Detach does not mean "the user closed this page." It means "this native host is temporarily unavailable."

That distinction is what allows replacement UI roots to recover their logical state.

## Close versus Detach

These operations intentionally mean different things:

```lua
UI.Pages.Close("Settings")
```

means the logical page is no longer open. It is removed from that host's open-page list.

```lua
UI.Hosts.Detach("Menu")
```

means the native Menu root is gone. MiliUI releases live native references, listeners, tweens, input ownership, and bindings, but keeps logical open-page state and the Host's UI Index mapping.

Do not use `Close` as a substitute for native host teardown, and do not use `Detach` as a substitute for a logical page close.

## Remembered component values

Inside a registered page, `remember = true` automatically uses that page's Session scope:

```lua
UI.Toggle(parent, {
    id = "Music Enabled",
    remember = true,
    value = true,
})
```

After host recreation, rebuilding the same page with the same stable `id` restores the remembered value.

Session state is in-memory Lua state. It is not permanent player save data.

## Multiple Hosts are independent

This is valid:

```text
Host "HUD"  attached and showing HUD content
Host "Menu" attached and showing Menu pages
```

Closing or detaching Menu does not close HUD. Opening a Menu page does not rebuild HUD. Host-owned timers/listeners are also cleaned up independently.

Host IDs and UI Indexes are both one-to-one identities. Reusing the same Host ID with a different UI Index, or the same UI Index with a different Host ID, is a configuration error.

With fixed IDs like `"Menu"` and `"HUD"`, only one live instance of each host may be attached at a time. Accidentally instantiating two copies of a fixed `"Menu"` prefab at once produces a duplicate-host error instead of silently mixing the two roots.

## Template setup in multiple host scripts

Primitive template IDs are shared by all MiliUI hosts. It is fine for each independently-instantiated Control Group script to call `UI.InitTemplates(...)` before attaching, as long as they all provide the same template mapping.

This is often simpler than requiring a separate permanent global bootstrap script.

## A practical project layout

One possible game-side structure is:

```text
MiliUI/
├── init.lua
├── Systems/Core.lua
├── Systems/Hosts.lua
├── Systems/Pages.lua
├── Systems/Session.lua
└── ...

Client UI Logic/
├── Menu UI.lua
└── HUD UI.lua

Game UI/
├── Main Menu Page.lua
├── Inventory Page.lua
└── UI Data.lua
```

The important distinction is not the folder name. It is that the scripts attached to the instantiated Client Control Containers own `Attach` / `Detach`, while reusable page modules only build content.

## Beginner checklist

For each Control Group:

1. Put a **Client Control Container** inside the Control Group.
2. Attach one Lua bootstrap/UI script to that container.
3. In `OnStart`, call `UI.InitTemplates(...)`.
4. Register any Pages with an `IsRegistered` guard.
5. Call `UI.Hosts.Attach(uiIndex, "YourHostName", script.object)` using that UI entry's Miliastra Index.
6. Explicitly `Open` a default page or `Restore` remembered pages.
7. In `OnDestroy`, call `UI.Hosts.Detach("YourHostName")`.
8. Use the Control Group's **Layer** for ordering against other Control Groups.
9. Let the Server Node Graph instantiate/remove the Control Group to control whether it exists.
10. Decide whether later re-instantiation should resume the old Page stack or start fresh; call `CloseAll(hostId)` first when a fresh start is desired.
11. Do not add a second "show UI" signal unless the game actually needs a separate event for some other reason.

For runnable patterns, see [`../examples/README.md`](../examples/README.md), [`../examples/ControlGroupHud.lua`](../examples/ControlGroupHud.lua), and [`../examples/ControlGroupMenu.lua`](../examples/ControlGroupMenu.lua).

For the underlying API rules, also read [Hosts.md](Hosts.md), [Pages.md](Pages.md), [RuntimeLifecycle.md](RuntimeLifecycle.md), and [Session.md](Session.md).
