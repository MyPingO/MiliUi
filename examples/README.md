# MiliUI examples

These are the examples **actually included in the public repository**. If you're new to MiliUI, start with the small examples and work your way down.

## Start here

1. [Install and set up MiliUI](../docs/Installation.md), or import the starter save.
2. Follow the [Quick Start](../QUICK_START.md) for a guided first interface.
3. Read the [Getting Started Examples](getting-started/README.md) for small scripts you can adapt.

| Example | What it shows |
| --- | --- |
| [MiliUIGlobal.lua](getting-started/MiliUIGlobal.lua) | Shared, one-time template setup |
| [HelloMiliUI.lua](getting-started/HelloMiliUI.lua) | A Screen, Column, Heading, and clickable Button |
| [PolishedHelloMiliUI.lua](getting-started/PolishedHelloMiliUI.lua) | Styling, translated text, controller-friendly input, and shared sounds |
| [SimpleMenu.lua](getting-started/SimpleMenu.lua) | A small menu with automatically sized Buttons |
| [SimpleSettings.lua](getting-started/SimpleSettings.lua) | A Toggle and Slider with callbacks |

**Important:** These UI examples assume the shared template setup is already running. Replace example UI Index values with the Index of your own Control Group.

## More examples

| Example | What it shows |
| --- | --- |
| [ControlGroupHud.lua](ControlGroupHud.lua) | A standalone HUD with its own Host and cleanup |
| [ControlGroupMenu.lua](ControlGroupMenu.lua) | A menu using Pages and remembered Session state |
| [NavigationLab.lua](NavigationLab.lua) | Moving between pages with Navigation history |
| [AccordionLab.lua](AccordionLab.lua) | Expandable sections, resizing, and remembered state |
| [SubscriptionsLab.lua](SubscriptionsLab.lua) | Host-owned incoming Server Signals and Custom Variable listeners |
| [PlayerEntitySignal.lua](PlayerEntitySignal.lua) | Reading the current Player Entity to send a client-to-server signal |

Additional component examples are in the [Components guide](../docs/Components.md). The full [Documentation Index](../docs/README.md) links to the relevant guides.

## Two common kinds of scripts

**A UI controller** belongs to a Client Control Container. It attaches its MiliUI Host when the native Control Group appears, then detaches it when that Control Group goes away.

```lua
local UI = require("MiliUI/init")
local UI_INDEX = 1001 -- Replace this with your Control Group's Index.
local HOST_ID = "My Menu"

function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)
    -- Create controls here, or open a registered Page.
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

The example assumes `UI.InitTemplates(...)` has already been called from shared setup. See [Installation](../docs/Installation.md) before using this pattern in a new project.

**A reusable builder** is just a Lua function that creates controls under an existing parent. It doesn't attach or detach a Host itself. You can call one from your controller or from a Page factory. See the [Project Structure guide](../docs/ProjectStructure.md) for that pattern.

## Things to remember

- Use a distinct Host ID and UI Index for each separate live Control Group. The fixed IDs in example scripts are placeholders.
- Do **not** call `UI.DestroyAll()` when one Control Group disappears; use `UI.Hosts.Detach(hostId)` so other interfaces remain intact.
- MiliUI Pages live **inside** a Host. [Pages](../docs/Pages.md) organize screens; [Navigation](../docs/Navigation.md) remembers where Back should go.
- Saved UI values with `remember = true` live in the current Lua Session, **not** in permanent game save data.
- For outgoing Server Signals, use Miliastra's `game.ServerSignal(...)` API. MiliUI's [Signals helpers](../docs/Subscriptions.md) are for listening and lifecycle management.

For more details, read [Control Groups and Hosts](../docs/ControlGroups.md) and [Common Mistakes](../docs/CommonMistakes.md).
