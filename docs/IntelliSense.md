# MiliUI IntelliSense

MiliUI uses Lua Language Server (LuaLS / LuaCATS) annotations to provide completion, signature help, props-table suggestions, and hover documentation.

## Design

There is one declaration source:

```text
library/*.lua
```

It contains editor-only classes for:

- the main `MiliUI` API;
- named Hosts and host-owned timers;
- Pages and Page contexts;
- Session state/persistence helpers;
- component props;
- component return objects and methods;
- theme tokens;
- layout, interaction, motion, style, surface, stack, and core APIs;
- the native UI-control surface needed by MiliUI return values;
- `CursorEventData` used by cursor callbacks.

`library/api.lua` owns the single top-level `MiliUI` class declaration, including
fields such as `Hosts`, `Pages`, `Session`, and `Player`, plus top-level methods
such as `InitTemplates`.

Specialized declaration files remain split by responsibility:

```text
library/hosts.lua
library/pages.lua
library/session.lua
library/player.lua
```

Those files define the detailed API types referenced by the top-level class
(`MiliUI.HostsAPI`, `MiliUI.PagesAPI`, and so on) instead of reopening the
`MiliUI` class. Keeping one authoritative top-level declaration avoids LuaLS
losing hover/signature metadata when class fragments are resolved differently.

The actual runtime modules bind their implementation tables to those types:

```lua
---@type MiliUI
local UI = { ... }
```

or:

```lua
---@type MiliUI.MotionAPI
local Motion = {}
```

This is intentional. The old shadow-module approach was removed because multiple files claiming to represent the same `require(...)` path can make LuaLS resolve the wrong table and show fields as `unknown`.

## VS Code extension

The repository's `library/*.lua` files are packaged into the separate **MiliUI
IntelliSense** VS Code extension. They are not installed into
`external_lua_file` and never become part of the Miliastra runtime payload.

The production `init.lua` keeps one editor-only return-type bridge:

```lua
---@type MiliUI
local runtime = ...
return runtime
```

The generated local name may differ, but the annotation lets LuaLS connect
`require("MiliUI/init")` to the declarations supplied by the extension.

The extension detects MiliUI whether VS Code is opened directly at
`external_lua_file` or at a parent folder containing it.

If the workspace has no LuaLS config file, enabling adds the bundled declaration
folder to VS Code's `Lua.workspace.library` setting. If `.luarc.json` or
`.luarc.jsonc` exists at the workspace root, the extension also adds MiliUI to
that config's `workspace.library` array while preserving existing entries.
This matters because LuaLS gives its workspace config file precedence over normal
VS Code Lua settings.

The extension does not modify the MiliUI runtime.

The extension also exposes:

```text
MiliUI: Enable IntelliSense for Workspace
MiliUI: Disable IntelliSense for Workspace
MiliUI: Diagnose IntelliSense
```

## Expected editor behavior

```lua
local UI = require("MiliUI/init")
```

Typing:

```lua
UI.
```

should autocomplete component APIs plus lifecycle/state APIs such as:

```text
UI.InitTemplates
UI.Hosts
UI.Pages
UI.Session
UI.Modal
UI.Select
UI.ScrollArea
```

For example:

```lua
UI.InitTemplates({
    container = script:GetParam("ContainerTemplateId"),
    image = script:GetParam("ImageTemplateId"),
    text = script:GetParam("TextTemplateId"),
    button = script:GetParam("ButtonTemplateId"),
    cursorArea = script:GetParam("CursorAreaTemplateId"),
})

UI.Hosts.Attach("Menu", script.object)
UI.Pages.Open("Inventory")
```

Hovering `UI.Hosts.Attach` should explain that attachment is passive. Hovering `UI.Pages.Restore` should explain that restoration is explicit and host-scoped.

The removed single-root call:

```lua
UI.Init(root, templates)
```

remains declared only as a deprecated migration aid because the runtime intentionally throws a migration error. New code should autocomplete toward `UI.InitTemplates(...)` + `UI.Hosts.Attach(...)`.

## Component props and return objects

Hovering:

```lua
UI.Alert
```

should show its description, signature, and example.

Inside:

```lua
UI.Alert(parent, {
    -- cursor here
})
```

LuaLS should suggest fields such as `variant`, `title`, `message`, `radius`, and shell options.

Returned objects are typed too:

```lua
local modal = UI.Modal(parent, {})
modal:Open()
modal:Close()

local slider = UI.Slider(parent, {})
slider:SetValue(50, true)
```

Primitive return values expose native control methods:

```lua
local text = UI.Text(parent, { text = "Hello" })
text:SetAnchoredPosition(20, -10)
text:GetSizeDelta()
```

## Host-aware timer help

IntelliSense should also make the timer ownership distinction visible:

```lua
-- Valid inside a MiliUI-owned Host callback/context:
UI.After(0.25, function() end)

-- Preferred from bootstrap code such as OnStart:
UI.Hosts.After("Menu", 0.25, function() end)
```

This matters because a simultaneous multi-host runtime cannot safely guess a global current root.

## Reload after declaration changes

If VS Code was already open when MiliUI declarations changed:

```text
Ctrl+Shift+P
→ Lua: Restart Language Server
```

or reload the VS Code window.

## Maintenance rule

Every public runtime API change must update `library/*.lua` in the same commit. Lifecycle changes should also update [ControlGroups.md](ControlGroups.md), [Hosts.md](Hosts.md), [Pages.md](Pages.md), or [RuntimeLifecycle.md](RuntimeLifecycle.md) when behavior visible to game code changes.

See [Architecture.md](Architecture.md) for ownership rules.
