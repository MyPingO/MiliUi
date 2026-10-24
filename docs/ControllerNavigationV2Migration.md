# Adopting Controller Navigation V2

**Controller V2 is available in MiliUI beta.4 and later.** You do not have to change old menus. This guide shows how to turn it on for one Screen if you want easier controller movement.

[Full V2 guide](ControllerNavigationV2.md) | [Controller basics](ControllerSupport.md) | [Working menu example](../examples/ControllerNavigationV2Menu.lua)

## Migration checklist

1. **Update MiliUI to beta.4 or later.** If you use VS Code IntelliSense, install the current version from the [release manifest](../manifest.json).
2. **Turn V2 on for your menu:** Add `controllerNavigation = "auto"` to `UI.Screen(...)`.
3. **Keep focus inside a full-screen menu:** Add `isolateNavigation = true` if that is what your menu needs.
4. **Give Buttons names:** Set `focusKey`, then call `screen:SetInitialFocus(first)` after creating the first Button.
5. **Keep Buttons in Rows or Columns:** MiliUI follows the layout to decide what comes next.
6. **Remove old manual native navigation links inside this Screen:** Use `UI.Focus.Link` only when you want a special direction.
7. **Test in Controller mode:** Check long lists, Dropdowns, switching Pages, and what happens if a focused Button is disabled or removed.

Here is a small example. It assumes that `UI` is loaded and `parent` is the UI container you are building in:

```lua
local screen = UI.Screen(parent, {
    controllerNavigation = "auto",
    isolateNavigation = true,
})
local menu = UI.Column(screen.content, { gap = 12 })
local first = UI.Button(menu, {
    focusKey = "first",
    label = { text = "FIRST", needsTranslation = false },
})
UI.Button(menu, {
    focusKey = "second",
    label = { text = "SECOND", needsTranslation = false },
})
screen:SetInitialFocus(first)
```

## Differences from legacy navigation

| What happens? | Earlier controller navigation | Controller V2 |
| --- | --- | --- |
| Moving between Buttons | Often uses the nearest native control | Follows Rows, Columns, and the Screen layout |
| Special direction rules | Native `SetControllerNavigation` | `UI.Focus.Link` or `UI.Focus.Block` |
| Scrolling with the right stick | Depends on the control setup | Scrolls the list that owns focus |
| Focused Button leaves the visible area | Focus can be harder to follow | Focus moves to that list’s scrollbar area |
| Returning from the scrollbar | Native navigation decides | Press Left to return to the same list |
| Changing Pages or opening Dropdowns | Controls handle focus separately | MiliUI keeps focus in the active Page or open Dropdown |

## Troubleshooting

**No Button has focus:** Start PC Test Play with Controller mode already selected. Switching to a controller later may not initialize native focus.

**Down or Right moves somewhere unexpected:** Put the Buttons in a clear Row or Column first. Add `UI.Focus.Link` only if you want a different route.

**The list will not scroll:** Make sure `contentHeight` is taller than the visible ScrollArea and `controllerScroll` is not `false`.

**The chevron appears next to the scrollbar:** This is normal if the focused Button has scrolled out of view. Keep scrolling with the right stick, or press Left to return to that list.

**The list jumps to an earlier Button:** MiliUI reveals a Button when it truly receives focus. Check what is focused with `UI.Focus.Explain(screen)` before changing the scroll settings.

**Focus gets stuck after a direct native change:** Try `UI.Focus.Refresh(screen)` after changing visibility, enabled state, or position outside MiliUI methods.

## Version compatibility

Controller V2 starts with **MiliUI `0.9.0-beta.4`**. It is not available in beta.3. You can keep using older controller behavior until you choose to enable V2. See the [beta.4 upgrade guide](UpgradeBeta4.md) for the matching install steps.
