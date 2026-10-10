# Upgrading from beta.1 to beta.2

Already using MiliUI `0.9.0-beta.1`? This is a short checklist for updating an existing project. For the complete changes, see the [beta.2 release notes](../RELEASE_NOTES.md).

## 1. Update the runtime

1. Back up your Miliastra project.
2. Use [MiliUI Manager](Manager.md) to install `0.9.0-beta.2` into the correct project, or follow the [manual installation steps](Installation.md#manual-installation).
3. Make sure your project's `MiliUI/init.lua` has been updated.
4. Restart **Test Play**. An already-running Lua session does not automatically reload the replaced runtime.

If you're using [MiliUI IntelliSense](IntelliSense.md) in VS Code, the extension has its own version number: **0.1.8** for this release. Updating the runtime does not automatically update a manually installed VSIX.

## 2. Update `UI.Player` if you used Player registration

**This is a breaking change.** The following calls were removed:

- `UI.Player.SetEntity(...)`
- `UI.Player.IsRegistered()`
- `UI.Player.RegisterFromSignal(...)`

Instead, create a Custom Variable **on the Player Entity** with its type set to **Entity** and its value set to that same Player Entity. Give the variable a name such as `PlayerSelf` (you can use another name).

In your **shared client initialization script**, configure the variable name once:

```lua
local UI = require("MiliUI/init")

function OnInit()
    -- Keep your existing UI.InitTemplates(...) setup here too.
    UI.Player.Configure("PlayerSelf")
end
```

When another script needs the Player Entity:

```lua
local player = UI.Player.GetEntity()
if player ~= nil then
    -- Use the Player Entity here.
end
```

Or use `UI.Player.RequireEntity()` when a missing Player Entity should be treated as an error.

`PlayerSelf` in `UI.Player.Configure("PlayerSelf")` is the **Custom Variable name**. The engine's `Enum.CustomVariableEntityType.PlayerSelf` is the Player's variable scope; these are different things.

You no longer need a server-to-client Player registration signal. If your code never calls `UI.Player`, there is nothing to migrate here. See [Player Context](Player.md) for the full setup.

## 3. Check UI behavior that changed

These features are mostly improvements, but test them if your project uses them:

- **Select dropdowns:** `UI.Select` menus now open through an overlay in their Host, so they can extend beyond clipping ScrollAreas and Accordions. Check placement near screen edges.
- **Controller navigation:** Rows, Columns, and ScrollColumns have improved directional focus and scrolling behavior. Test Confirm, movement, and whether focused Buttons remain visible.
- **Controller focus indicators:** Placement and layering have changed. Check any custom `controllerFocusIndicator` settings.
- **New optional features:** [Navigation](Navigation.md), [Accordion](Accordion.md), and [Signals/Variables](Subscriptions.md) are available, but you don't have to adopt them to upgrade.

**Known controller limitation:** Some PC Test Play setups apply native safe-area padding. Switching to controller input mid-level can also require restarting the level before native focus becomes available. See [Controller Support](ControllerSupport.md).

## 4. Quick smoke test

Before replacing your game's working version, check these in a test copy:

- Your screens open and close without errors.
- Buttons respond to mouse/touch and controller where applicable.
- `OnDestroy()` still detaches only the current Host.
- Pages and remembered settings restore as expected after UI recreation.
- Any scripts using `UI.Player` have been updated.

If something fails, check [Common Mistakes](CommonMistakes.md), [Known Issues](../KNOWN_ISSUES.md), or [report a bug](../SUPPORT.md).

**Starter save:** The beta.2 release includes the same verified starter `.gil` save originally distributed with beta.1. After importing it, install the beta.2 runtime; the starter save itself was not rebuilt.
