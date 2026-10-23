# Upgrading from beta.3 to beta.4

MiliUI `0.9.0-beta.4` introduces **optional Controller Navigation V2** and several native-tested stability fixes. Managed controller navigation is **opt-in**, not a forced conversion of existing Screens.

## 1. Install matching versions

1. Back up your Miliastra project or use a disposable test copy.
2. Update the MiliUI runtime to **beta.4** using MiliUI Manager or manual installation. Verify `print(UI.VERSION)`.
3. Update **MiliUI IntelliSense to 0.1.10** if you use VS Code, so the new Screen and `UI.Focus` APIs are described correctly.
4. Restart Test Play. Changing a Lua file while Test Play is running does not reload the runtime.

Manager minimum version remains **0.2.0**. Reinstalling the Manager is not required solely for this runtime update.

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

V2 builds directional navigation from Rows, Columns, and parent ancestry; ordinary menus no longer need handcrafted native direction links. Use `UI.Focus.Link` or `UI.Focus.Block` only for intentional exceptions. Direct native `SetControllerNavigation` calls can conflict with V2-managed Screens.

Refer to the [V2 guide](ControllerNavigationV2.md) and [migration checklist](ControllerNavigationV2Migration.md) for details.

## 3. ScrollArea and controller behavior

With V2 enabled, the **left stick/D-pad** navigate controls and the **right stick** scrolls the currently focused ScrollArea. A focused Button retains its chevron while visible; after it scrolls out of view, focus shifts to a passive proxy and the chevron appears beside that list's scrollbar.

Press **Left** from the focused scrollbar to return into that same list. Nested and adjacent ScrollAreas manage their focus and scroll ownership independently. Auto-reveal occurs only on confirmed focus changes, reducing previously observed scroll resets.

## 4. Fixed bugs

- **#104:** Unsupported `fitContentHeight` on `UI.Text` no longer suppresses the calibrated safe intrinsic height. Supported `UI.TextWindow` content-height sizing is unchanged.
- **#105:** Destroying a Repeater during `SetItems()` or `Refresh()` no longer triggers deferred Stack layout/navigation access to an invalid native root.
- **#106:** Large virtualized ListViews avoid repeated full-data scans during scrolling and promptly release stale row registrations. Native 2,400-row repeated-jump tests no longer exhibited progressive slowdown.
- **#107:** Managed ScrollArea fallback now uses a passive viewport focus proxy, with immediate eligibility updates after child destruction.
- **#108:** Focus-indicator collision handling is improved for inside placement; very unusual localized/composite layouts may still warrant project-specific visual tests.

## 5. Native upgrade test

Start PC Test Play in **Controller mode**; switching from Keyboard/Mouse after the level loads may not initialize native focus.

Check a standard menu, nested ScrollAreas, last-child destruction, a Dropdown in a Page, and one long/localized label. Also check a 2,400-row ListView if your project depends heavily on virtualization.

The beta.4 package and public release must be validated as a single runtime/IntelliSense/documentation set. Before 1.0, breaking changes remain possible and are documented per release.

**Upgrading from beta.2 or earlier?** Complete the [beta.2→beta.3 guide](UpgradeBeta3.md) and any earlier applicable migration before applying beta.4 changes.
