# Controller Navigation V2

**Available in MiliUI beta.4 and later.** Controller Navigation V2 helps players move around a menu with a controller without you having to connect every Button by hand. It is **optional**: existing screens keep working as before until you turn it on.

**What is focus?** Focus is the Button or other control that will respond when the player presses Confirm. The small arrow beside it is called the *focus chevron*. It shows which control is focused.

[Controller Support](ControllerSupport.md) | [Upgrade an existing menu](ControllerNavigationV2Migration.md) | [Complete menu example](../examples/ControllerNavigationV2Menu.lua) | [Focus API details](Reference/focus.md)

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

## Testing and availability

In PC Test Play, **start the level in Controller mode**. Switching from keyboard to controller after the level starts may leave native focus unavailable on some builds.

Check that Buttons, Dropdowns, Pages, and long lists behave correctly in your own game. beta.4 was tested in Miliastra, but not every device and screen layout has been tested.

If something acts strangely, start with the [short migration and troubleshooting guide](ControllerNavigationV2Migration.md).
