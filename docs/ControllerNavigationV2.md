# Controller Navigation V2

**Available in MiliUI beta.4 and later.** Controller Navigation V2 helps players move around a menu with a controller without you having to connect every Button by hand. It is **optional**: existing screens keep working as before until you turn it on. Beta.3 does not include V2.

**What is focus?** Focus is the Button or other control that will respond when the player presses Confirm. The small arrow beside it is called the *focus chevron*. It shows which control is focused.

[Controller Support](ControllerSupport.md) | [Upgrade an existing menu](#upgrading-an-existing-menu) | [Troubleshooting](#troubleshooting) | [Complete menu example](../examples/ControllerNavigationV2Menu.lua) | [Focus API details](Reference/focus.md)

## Opt in to managed navigation

Start with a Screen, put Buttons inside a Column or Row, and choose the Button that should be focused first:

```lua
local screen = UI.Screen(parent, {
    controllerNavigation = "auto",
    isolateNavigation = true,
    padding = 32,
})
local sidebar = UI.Column(screen.content, { gap = 12 })
local play = UI.Button(sidebar, {
    focusKey = "play",
    label = { text = "PLAY", needsTranslation = false },
})
UI.Button(sidebar, {
    focusKey = "settings",
    label = { text = "SETTINGS", needsTranslation = false },
})
screen:SetInitialFocus(play)
```

Here is what matters:

- `controllerNavigation = "auto"` turns V2 on for this Screen.
- `isolateNavigation = true` keeps focus inside this menu. Use it for a full-screen menu, not for every HUD.
- `focusKey` gives a Button a stable name so focus can find it again if the Page is rebuilt.
- `screen:SetInitialFocus(play)` chooses the first focused Button. Call it **after** creating that Button.

For a normal Row or Column, MiliUI works out where Up, Down, Left, and Right should go. No manual links are needed.

## Upgrading an existing menu

You do not need to rebuild every menu when upgrading to beta.4. V2 only changes a Screen after you enable it on that Screen.

1. **Install beta.4 or later.** If you use VS Code, the current beta.4 release includes **IntelliSense v0.1.15**. Check the [release manifest](../manifest.json) for newer editor updates.
2. **Enable V2:** Add `controllerNavigation = "auto"` to the Screen's settings table.
3. **Keep focus inside a full-screen menu if needed:** Add `isolateNavigation = true`. Most HUDs do not need this.
4. **Arrange controls in Rows and Columns:** V2 uses the UI layout to work out where directional input should go.
5. **Give important Buttons a stable `focusKey`:** Call `screen:SetInitialFocus(button)` after creating the Button. Stable keys also help restore focus after Page recreation.
6. **Remove manual native navigation links for that Screen:** Do not use `SetControllerNavigation` with V2-managed controls. Use `UI.Focus.Link` or `UI.Focus.Block` when you need a special direction.
7. **Test with a controller:** Start Test Play in Controller mode, then check Buttons, Dropdowns, Pages, long lists, and what happens when focused controls are hidden or removed.

The [example above](#opt-in-to-managed-navigation) shows the required code. You do not need a different implementation just for an upgraded menu. For the rest of the runtime upgrade, see [Upgrading to beta.4](UpgradeBeta4.md).

### Differences from older controller navigation

| What happens? | Older navigation | Controller V2 |
| --- | --- | --- |
| Moving between Buttons | Uses native or component-managed direction links | Follows the Screen's Rows, Columns, and control hierarchy |
| Special direction rules | Native `SetControllerNavigation` | `UI.Focus.Link` or `UI.Focus.Block` |
| Right-stick scrolling | Depends on the control setup | Scrolls the list that currently owns focus |
| Focused Button leaves a scrollable area | Focus can be hard to follow | Focus moves to a proxy beside that list's scrollbar |
| Returning from the scrollbar | Native navigation decides | Press Left to return to the same list |
| Switching Pages and opening Dropdowns | Controls manage focus separately | MiliUI coordinates focus within the active Page or open Dropdown |

## Central focus ownership

When V2 is on, MiliUI manages controller movement for that Screen. It looks for Buttons and other focusable controls that are visible, enabled, and part of the active Page. It normally moves between nearby controls in the same Row or Column before moving to another section of the Screen.

**Important:** Do not call native `SetControllerNavigation` on controls in a V2 Screen. MiliUI manages those links and may replace yours. For an unusual layout, use `UI.Focus.Link` to choose a destination or `UI.Focus.Block` to stop movement in one direction.

The chevron follows the control that Miliastra **actually** focused. This keeps the visual indicator and controller input in sync.

## Right-stick scrolling

Think of a long list of Buttons that does not fit on the screen:

- **Left stick or D-pad:** Move between Buttons.
- **Right stick:** Move the list up or down. If two lists are side by side, it scrolls the one that owns focus.
- **Focused Button is visible:** The chevron stays beside that Button.
- **Focused Button scrolls out of view:** The chevron moves beside that list’s scrollbar. This is expected, not a lost focus bug.
- **Press Left while the scrollbar has focus:** Return to a Button in the same list. MiliUI prefers a visible one.
- **Reach the very top or bottom:** An extra right-stick movement may move focus outside that list.

This also works with a ScrollArea inside another ScrollArea. The controller should scroll the list the player is using, not a different list. MiliUI waits for native focus to settle before changing the chevron or revealing a focused Button, which helps prevent sudden jumps back to an old position.

The small scrollbar arrow Buttons are still usable with mouse or touch. By default, they are not separate controller focus targets.

## Pages, Dropdowns and lifecycle

- **Pages:** When you open another Page in the same Host, focus moves to that Page. Returning to the earlier Page restores a valid focus target when possible. Stable `focusKey` names help.
- **Dropdowns:** Opening a Dropdown keeps controller focus inside its list of choices. Closing it normally returns focus to the Dropdown field.
- **Hidden, disabled, or removed controls:** MiliUI normally moves focus to a usable control instead of leaving it on one that no longer works.

If you change a **native** control directly (for example, by changing its position or visibility without a MiliUI method), call `UI.Focus.Refresh(screen)` afterward so MiliUI can check the controls again. Do not reuse old control references after the UI Control Group has been removed and recreated.

## Public API

You can build most menus without these extra functions. They are here when you need more control or want to check what is happening.

| Function | What it does |
| --- | --- |
| `screen:SetInitialFocus(button)` | Chooses the Button to focus first. |
| `UI.Focus.Get(screen)` | Gets the control that currently has focus in this Screen. |
| `UI.Focus.Set(button)` | Asks Miliastra to focus a specific Button. |
| `UI.Focus.Link(from, "Down", to)` | Makes Down move to a specific control. |
| `UI.Focus.Block(button, "Up")` | Stops movement in that direction. |
| `UI.Focus.Refresh(screen)` | Updates focus after a direct native change. |
| `screen:RefreshControllerNavigation()` | Another way to refresh this Screen. |
| `UI.Focus.Explain(screen)` | Returns useful information for debugging focus. |

Directions are `"Up"`, `"Down"`, `"Left"`, and `"Right"`. `UI.Focus.Set` may return `false, "not-yet-confirmed"` while Miliastra is still changing focus. That message alone does not mean the request failed permanently.

## Troubleshooting

**No Button has focus:** Start PC Test Play with Controller mode already selected. Switching to a controller after the level loads may not initialize native focus.

**Down or Right goes somewhere unexpected:** Check how your Buttons are arranged in Rows and Columns. If you intentionally want a different route, add `UI.Focus.Link`.

**The list will not scroll:** Make sure `contentHeight` is taller than the visible ScrollArea and `controllerScroll` is not `false`.

**The chevron appears beside the scrollbar:** This is normal when the focused Button scrolls out of view. Keep scrolling with the right stick, or press Left to go back into the same list.

**The list jumps back to an earlier Button:** MiliUI reveals a Button when it actually receives focus. Use `UI.Focus.Explain(screen)` to check the focused control before changing your scrolling logic.

**Focus gets stuck after a direct native change:** If you change a control's visibility, active state, focusability, or position without using MiliUI, call `UI.Focus.Refresh(screen)` afterward.

## Testing and availability

In PC Test Play, **start the level in Controller mode**. Switching from keyboard to controller after the level starts may leave native focus unavailable on some builds.

Check that Buttons, Dropdowns, Pages, and long lists behave correctly in your own game. beta.4 was tested in Miliastra, but not every device and screen layout has been tested.

If something acts strangely, use the [troubleshooting steps above](#troubleshooting).
