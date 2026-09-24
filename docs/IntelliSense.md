# MiliUI IntelliSense

MiliUI uses Lua Language Server (LuaLS / LuaCATS) annotations to provide completion, signature help, props-table suggestions, and hover documentation.

## How it works

The MiliUI IntelliSense extension ships editor-only LuaLS declarations separately from the runtime installed in your Miliastra project.

Your game project still contains only:

```text
MiliUI/
└── init.lua
```

The declaration files live in VS Code's extension storage and describe MiliUI's public APIs, props, return objects, native control methods, lifecycle helpers, and theme fields. They are not copied into `external_lua_file` and do not run in Miliastra.

## VS Code extension

The editor declarations are packaged into the separate **MiliUI IntelliSense** VS Code extension. They are not installed into `external_lua_file` and never become part of the Miliastra runtime payload.

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

A `.luarc.json` file is **not required**. When MiliUI is detected, the extension
automatically adds its bundled declaration folder to VS Code's
`Lua.workspace.library` setting. In a normal single-folder project this is a
workspace setting; in a multi-root workspace it is scoped to the matching
workspace folder.

If `.luarc.json` or `.luarc.jsonc` already exists at the workspace root, the
extension also adds MiliUI to that config's `workspace.library` array while
preserving existing entries. This matters because LuaLS gives its workspace
config file precedence over normal VS Code Lua settings.

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
    animation = script:GetParam("UIAnimationTemplateId"),
    fullscreenAnimation = script:GetParam("FullscreenAnimationTemplateId"),
    keyHint = script:GetParam("KeyHintTemplateId"),
    textWindow = script:GetParam("TextWindowTemplateId"),
    gridScroller = script:GetParam("GridScrollerTemplateId"),
})

UI.Hosts.Attach(1002, "Menu", script.object)
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

## Troubleshooting

If MiliUI fields appear as `unknown` or `any`, run:

```text
MiliUI: Diagnose IntelliSense
```

A healthy setup should report that the MiliUI library exists and that `Lua.workspace.library` contains MiliUI.

A `.luarc.json` file is not required. If the declaration path exists but is not registered, use `MiliUI: Enable IntelliSense for Workspace` and then restart the Lua Language Server.

For normal API usage, the declaration package is only an editor aid; the Miliastra runtime remains the single production `MiliUI/init.lua`.
