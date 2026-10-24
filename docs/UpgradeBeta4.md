# Upgrading from beta.3 to beta.4

Beta.4 adds easier controller movement for menus and fixes several bugs. **You do not have to rewrite your existing menus.** Controller Navigation V2 is optional: it only turns on when you ask for it on a Screen.

## 1. Install matching versions

1. Back up your Miliastra project or use a disposable test copy.
2. Update MiliUI to **beta.4** with MiliUI Manager or manual installation. In your Lua script, run `print(UI.VERSION)` and look for `0.9.0-beta.4` in the Sandbox Log.
3. If you use VS Code, install **MiliUI IntelliSense v0.1.15** from the [beta.4 release](https://github.com/MyPingO/MiliUI/releases/tag/v0.9.0-beta.4), or check the [release manifest](../manifest.json) for later updates. It includes the Screen and `UI.Focus` APIs; the editor extension can update without changing the runtime.
4. Restart Test Play. Changing a Lua file while Test Play is running does not reload the runtime.

MiliUI Manager `0.2.0` still works with beta.4. You do not need a newer Manager just for this update.

## 2. Existing projects: no required controller migration

Old Screens and HUDs keep their previous controller behavior until you explicitly opt in. To enable V2 for a conventional menu:

```lua
local screen = UI.Screen(parent, {
    controllerNavigation = "auto",
    isolateNavigation = true,
})

local column = UI.Column(screen.content, { gap = 12 })
local first = UI.Button(column, {
    focusKey = "menu.start",
    label = { text = "START", needsTranslation = false },
})
UI.Button(column, {
    focusKey = "menu.settings",
    label = { text = "SETTINGS", needsTranslation = false },
})
screen:SetInitialFocus(first)
```

V2 looks at how you arranged Buttons in Rows and Columns to decide where the controller moves next. Most menus no longer need manual navigation links. If your layout needs a special direction, use `UI.Focus.Link` or `UI.Focus.Block` instead of native `SetControllerNavigation` calls.

Refer to the [V2 guide](ControllerNavigationV2.md) and [migration checklist](ControllerNavigationV2Migration.md) for details.

## 3. ScrollArea and controller behavior

With V2 enabled, the **left stick/D-pad** navigate controls and the **right stick** scrolls the currently focused ScrollArea. The little focus arrow stays beside a focused Button while you can see it. If the Button scrolls out of view, the arrow moves beside that list's scrollbar.

Press **Left** from the focused scrollbar to return into that same list. Each list scrolls independently, even if one list is inside another. MiliUI also avoids jumping back to an old scroll position when focus briefly changes.

## 4. Fixed bugs

- **#104, Text sizing:** `UI.Text` keeps a safe height even if you accidentally give it an unsupported `fitContentHeight` setting. `UI.TextWindow` behavior is unchanged.
- **#105, Repeater cleanup:** Removing a Repeater while it updates no longer leaves a broken UI control behind.
- **#106, Large lists:** `UI.ListView` runs more smoothly with thousands of items. Tests with 2,400 rows did not show the earlier slowdown.
- **#107, ScrollArea focus:** Scrolling still works when a list has no Buttons left, and focus updates when the last Button is removed.
- **#108, Focus arrow:** The focus arrow is less likely to overlap controls when placed inside them. Check unusual layouts and long translated labels in your own game.

## 5. Native upgrade test

Start PC Test Play in **Controller mode**; switching from Keyboard/Mouse after the level loads may not initialize native focus.

Check a standard menu, nested ScrollAreas, last-child destruction, a Dropdown in a Page, and one long/localized label. Also check a 2,400-row ListView if your project depends heavily on virtualization.

Use the matching beta.4 runtime and IntelliSense together. MiliUI is still a beta, so some APIs may change before version 1.0.

**Upgrading from beta.2 or earlier?** Complete the [beta.2→beta.3 guide](UpgradeBeta3.md) and any earlier applicable migration before applying beta.4 changes.
