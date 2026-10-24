# MiliUI IntelliSense

MiliUI IntelliSense helps you write Lua in **Visual Studio Code (VS Code)**. It suggests MiliUI function names while you type and explains settings when you hover over them. Think of it as a coding helper, not something that runs inside your game.

## Browse the API without VS Code

You can also read the [complete API reference](Reference/README.md) in your browser without installing VS Code. It lists the available functions and settings. For step-by-step examples, use the [Components guide](Components.md) instead.

## How it works

The IntelliSense extension is separate from MiliUI itself. Install the **runtime** in Miliastra to make the UI work, and install **IntelliSense** in VS Code if you want coding suggestions. The public beta.4 release currently provides **MiliUI IntelliSense v0.1.15**. Check the [release manifest](../manifest.json) for the latest editor version; IntelliSense can be updated without changing the game runtime.

Your game project still contains only:

```text
MiliUI/
└── init.lua
```

The extension keeps these description files inside VS Code. They cover public functions, component settings, return values, and object methods. They are not copied into `external_lua_file`, and Miliastra never runs them.

## Install MiliUI IntelliSense in VS Code

The **v0.1.15** installer is available in the [beta.4 GitHub Release](https://github.com/MyPingO/MiliUI/releases/tag/v0.9.0-beta.4). To install this confirmed version:

1. Download [**MiliUI-IntelliSense.vsix**](https://github.com/MyPingO/MiliUI/releases/download/v0.9.0-beta.4/MiliUI-IntelliSense.vsix).
2. In VS Code, open the **Extensions** view.
3. Open the Extensions **...** menu and choose **Install from VSIX...**.
4. Select the downloaded file.
5. Open a Lua file in your Miliastra project.

You can also install **MiliUI IntelliSense** by publisher **MyPing0** from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=MyPing0.miliui-intellisense). The Marketplace and GitHub Release may offer different extension versions. Check the installed version in VS Code if you specifically need the v0.1.15 features described below.

The VSIX is an editor extension only. It does not install or replace the Lua runtime in your game.

The extension depends on Lua Language Server (LuaLS). When MiliUI first adds or changes its declaration-library path, it automatically restarts LuaLS so autocomplete and hover information can refresh. It does **not** install or change the MiliUI runtime inside your Miliastra project.

The installed runtime includes a small type hint that lets VS Code recognize the value returned by `require("MiliUI/init")`:

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
UI.Dropdown
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

## Discover settings tables (v0.1.15)

Sometimes a function needs a **table**: a group of settings written between `{` and `}`. You do not need to know the table's type name in advance.

For example, type this much:

```lua
UI.Navigation.Reset("MainMenu", )
```

Put the cursor **after the comma** and press **Ctrl+Space**. Choose **Insert options settings table { ... }**. It inserts an editable example like:

```lua
UI.Navigation.Reset("MainMenu", {
    transition = "slideLeft",
    duration = 0.24,
})
```

Inside `{ ... }`, press **Ctrl+Space** again to explore properties such as `transition` and `duration`. The same table-start suggestion works for other MiliUI functions whose settings are described in the extension (for example, `UI.Button(parent, ...)`).

You can also omit optional options entirely: `UI.Navigation.Reset("MainMenu")` opens the page without a transition.

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
local text = UI.Text(parent, { text = "Hello", fitWidth = true, fitWidthPadding = 16 })
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

## Missing IntelliSense with a large runtime (v0.1.15)

**Symptoms:** `require("MiliUI/init")` opens the right file, but `UI.` suggestions disappear after reopening VS Code. Adding `---@type MiliUI` makes suggestions work temporarily.

One possible cause is that the project's real `external_lua_file/MiliUI/init.lua` is **larger than Lua Language Server's preload limit**. The usual default is **500 KB**. A formatted/beautified MiliUI bundle may exceed the limit even when the compact production bundle does not.

1. Press **Ctrl+Shift+P** and run **MiliUI: Diagnose IntelliSense**.
2. Find **MiliUI runtime**, **Runtime size**, **LuaLS preloadFileSize**, and **Runtime exceeds preload limit** in the report.
3. If the report says **YES**, the recommended fix is to use the compact/production MiliUI runtime. IntelliSense v0.1.15 also shows a warning once per runtime per VS Code session when it detects this problem.
4. If you need the larger formatted runtime, increase the LuaLS setting and restart **Lua: Restart Language Server**.

For a VS Code workspace **without** a `.luarc.json` / `.luarc.jsonc` file, add to `.vscode/settings.json`:

```json
{
    "Lua.workspace.preloadFileSize": 2048
}
```

If your project **has** a `.luarc.json` / `.luarc.jsonc`, put `"workspace.preloadFileSize": 2048` in **that file** instead (no `Lua.` prefix), because its configuration takes precedence.

The number is in KB, so choose a value large enough for your runtime. Raising it may increase LuaLS memory use. IntelliSense **does not automatically edit your runtime or these settings**, and file size is not the only possible cause of missing suggestions.

## Reload after declaration changes

MiliUI IntelliSense normally restarts Lua Language Server automatically when it first adds or changes its declaration-library path.

If hints still look stale after installing or updating the extension:

```text
Ctrl+Shift+P
→ Lua: Restart Language Server
```

Reloading the VS Code window is another fallback.

## Troubleshooting

If MiliUI fields appear as `unknown` or `any`, run:

```text
MiliUI: Diagnose IntelliSense
```

A healthy setup should report that the MiliUI library exists, that `Lua.workspace.library` contains MiliUI, and that the runtime is **not larger than the configured preload limit**.

A `.luarc.json` file is not required. If the declaration path exists but is not registered, use `MiliUI: Enable IntelliSense for Workspace` and then restart the Lua Language Server.

For normal API usage, the declaration package is only an editor aid; the Miliastra runtime remains the single production `MiliUI/init.lua`.
