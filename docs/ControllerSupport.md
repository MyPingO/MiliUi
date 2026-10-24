# Controller Support

MiliUI lets players use a controller to move between Buttons and choose options. **Focus** means "where the controller is pointing right now." The focused Button responds when the player presses Confirm. **Selection** means "what the player has chosen." Moving focus does not automatically change a chosen setting.

## Controller Navigation V2 (opt-in)

**Available in MiliUI beta.4 and later.** Controller Navigation V2 automatically handles navigation between controls in a menu without requiring manual links between every Button. It is **optional**: older Screens keep their existing navigation behavior until you turn it on. Beta.3 does not include V2.

The small arrow beside the focused control is called the *focus chevron*. It shows which control will respond when the player presses Confirm.

[Start using V2](#opt-in-to-managed-navigation) | [Upgrade an existing menu](#upgrading-an-existing-menu) | [Troubleshooting](#troubleshooting) | [Complete menu example](../examples/ControllerNavigationV2Menu.lua) | [Focus API reference](Reference/focus.md)

### Opt in to managed navigation

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

### Upgrading an existing menu

You do not need to rebuild every menu when upgrading to beta.4. V2 only changes a Screen after you enable it on that Screen.

1. **Install beta.4 or later.** If you use VS Code, the current beta.4 release includes **IntelliSense v0.1.15**. Check the [release manifest](../manifest.json) for newer editor updates.
2. **Enable V2:** Add `controllerNavigation = "auto"` to the Screen's settings table.
3. **Keep focus inside a full-screen menu if needed:** Add `isolateNavigation = true`. Most HUDs do not need this.
4. **Arrange controls in Rows and Columns:** V2 uses the UI layout to work out where directional input should go.
5. **Give important Buttons a stable `focusKey`:** Call `screen:SetInitialFocus(button)` after creating the Button. Stable keys also help restore focus after Page recreation.
6. **Remove manual native navigation links for that Screen:** Do not use `SetControllerNavigation` with V2-managed controls. Use `UI.Focus.Link` or `UI.Focus.Block` when you need a special direction.
7. **Test with a controller:** Start Test Play in Controller mode, then check Buttons, Dropdowns, Pages, long lists, and what happens when focused controls are hidden or removed.

The [example above](#opt-in-to-managed-navigation) shows the required code. You do not need a different implementation just for an upgraded menu. For the rest of the runtime upgrade, see [Upgrading to beta.4](UpgradeBeta4.md).

#### Differences from older controller navigation

| What happens? | Older navigation | Controller V2 |
| --- | --- | --- |
| Moving between Buttons | Uses native or component-managed direction links | Follows the Screen's Rows, Columns, and control hierarchy |
| Special direction rules | Native `SetControllerNavigation` | `UI.Focus.Link` or `UI.Focus.Block` |
| Right-stick scrolling | Depends on the control setup | Scrolls the list that currently owns focus |
| Focused Button leaves a scrollable area | Focus can be hard to follow | Focus moves to a proxy beside that list's scrollbar |
| Returning from the scrollbar | Native navigation decides | Press Left to return to the same list |
| Switching Pages and opening Dropdowns | Controls manage focus separately | MiliUI coordinates focus within the active Page or open Dropdown |

### Central focus ownership

When V2 is on, MiliUI manages controller movement for that Screen. It looks for Buttons and other focusable controls that are visible, enabled, and part of the active Page. It normally moves between nearby controls in the same Row or Column before moving to another section of the Screen.

**Important:** Do not call native `SetControllerNavigation` on controls in a V2 Screen. MiliUI manages those links and may replace yours. For an unusual layout, use `UI.Focus.Link` to choose a destination or `UI.Focus.Block` to stop movement in one direction.

The chevron follows the control that Miliastra **actually** focused. This keeps the visual indicator and controller input in sync.

### Right-stick scrolling

Think of a long list of Buttons that does not fit on the screen:

- **Left stick or D-pad:** Move between Buttons.
- **Right stick:** Move the list up or down. If two lists are side by side, it scrolls the one that owns focus.
- **Focused Button is visible:** The chevron stays beside that Button.
- **Focused Button scrolls out of view:** The chevron moves beside that list’s scrollbar. This is expected, not a lost focus bug.
- **Press Left while the scrollbar has focus:** Return to a Button in the same list. MiliUI prefers a visible one.
- **Reach the very top or bottom:** An extra right-stick movement may move focus outside that list.

This also works with a ScrollArea inside another ScrollArea. The controller should scroll the list the player is using, not a different list. MiliUI waits for native focus to settle before changing the chevron or revealing a focused Button, which helps prevent sudden jumps back to an old position.

The small scrollbar arrow Buttons are still usable with mouse or touch. By default, they are not separate controller focus targets.

### Pages, Dropdowns and lifecycle

- **Pages:** When you open another Page in the same Host, focus moves to that Page. Returning to the earlier Page restores a valid focus target when possible. Stable `focusKey` names help.
- **Dropdowns:** Opening a Dropdown keeps controller focus inside its list of choices. Closing it normally returns focus to the Dropdown field.
- **Hidden, disabled, or removed controls:** MiliUI normally moves focus to a usable control instead of leaving it on one that no longer works.

If you change a **native** control directly (for example, by changing its position or visibility without a MiliUI method), call `UI.Focus.Refresh(screen)` afterward so MiliUI can check the controls again. Do not reuse old control references after the UI Control Group has been removed and recreated.

### Public API

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

### Troubleshooting

**No Button has focus:** Start PC Test Play with Controller mode already selected. Switching to a controller after the level loads may not initialize native focus.

**Down or Right goes somewhere unexpected:** Check how your Buttons are arranged in Rows and Columns. If you intentionally want a different route, add `UI.Focus.Link`.

**The list will not scroll:** Make sure `contentHeight` is taller than the visible ScrollArea and `controllerScroll` is not `false`.

**The chevron appears beside the scrollbar:** This is normal when the focused Button scrolls out of view. Keep scrolling with the right stick, or press Left to go back into the same list.

**The list jumps back to an earlier Button:** MiliUI reveals a Button when it actually receives focus. Use `UI.Focus.Explain(screen)` to check the focused control before changing your scrolling logic.

**Focus gets stuck after a direct native change:** If you change a control's visibility, active state, focusability, or position without using MiliUI, call `UI.Focus.Refresh(screen)` afterward.

### Testing and availability

For PC Test Play, **start the level in Controller mode**. Changing input mode after the level starts may leave native focus unavailable in some builds. See [Miliastra Test Play limitations](#miliastra-test-play-limitations) below for the tested workaround and platform-specific behavior.

Controller Navigation V2 was tested in Miliastra for beta.4, but not every device or unusual layout has been exhaustively tested.

## Controller basics, native input, and appearance

The following topics explain focusable controls, native controller behavior, focus indicators, and manual navigation. Some apply to both modes; **native directional links are for legacy/unmanaged Screens only**.

## Focusable controls

`UI.Button` and `UI.IconButton` are controller-focusable by default. `UI.Hitbox` is not focusable by default, but `controllerFocus = true` enables controller focus and Confirm. Composed controls such as `UI.Selection` choices and `UI.Dropdown` options opt in automatically. Use `controllerFocus = false` when a focus target must be excluded.

In **legacy/unmanaged Screens**, MiliUI normally configures native controller navigation in all four directions with:

```lua
Enum.ControllerNavigationMode.NearestControl
```

That works well for simple layouts where the nearest visible control is the intended destination.

A disabled Button is removed from controller focus:

```lua
button:SetEnabled(false)
```

Re-enabling it restores normal interaction and controller focusability.

## Controller Confirm activates Buttons

MiliUI maps Miliastra's native controller `Confirm` navigation event to the Button's normal click path.

This means normal application code stays input-agnostic:

```lua
local playButton = UI.Button(parent, {
    label = {
        text = "PLAY",
        textId = "MainMenu.Play",
    },
    fitContent = true,
})

playButton:OnClick(function()
    StartGame()
end)
```

Mouse click and controller Confirm both reach the same `OnClick` callback.

## Visible selection groups

`UI.Selection` uses controller-focusable choice hitboxes by default, including custom-rendered visuals. Each focused hitbox also shows the shared controller chevron, with `controllerFocusIndicator = false` available to hide it. Moving focus does **not** change the selected item; use Confirm to select it. A focused choice receives the same hover/outline styling as pointer hover, and `updateItem` receives `state.hovered = true` while controller focused.

```lua
local choices = UI.Selection(parent, {
    items = items,
    mode = "single",
    appearance = "segmented",
    selected = 1,
})

-- After the Host/page and its UI have been created:
game.SetControllerFocus(choices.choices[1].hitbox.root)
```

For debugging in Test Play, first inspect `game.GetControllerFocus()`. If it remains `nil` after switching to Controller and restarting the level, the native controller system may not have initialized. Do not equate a missing visual focus indicator with a confirmed missing focus event.

## Controller behavior in Selection and Dropdown

`UI.Selection` explicitly links neighboring tiles and segments in all four directions. Inside a `ScrollColumn`, MiliUI navigates within the current group before following the column into another section, so moving Down in a vertical selector does not immediately escape to the next section.

`UI.Dropdown` moves focus from the trigger into its selected visible option (or first enabled option) when opened with Confirm. Up/Down traverses options and automatically scrolls one row when moving beyond the visible list boundary, without needing to focus the scrollbar arrows. At the actual first or last item, native focus stays on the option. By default the scrollbar arrows accept mouse/touch only (`scrollbarControllerFocus = false`), avoiding navigation traps when a scroll arrow disables itself. Controller Cancel or choosing an option closes the popup and restores focus to its trigger. If mouse/other scrolling pushes a focused option offscreen, focus moves to a visible enabled option. Popup chevrons render in the popup's own overlay.

Hitbox focus indicators use the same `controllerFocusIndicator` settings as Buttons. Only focusable hitboxes receive them. A hitbox's `SetEnabled(true)` does not reset existing directional links when the value was already true.

## Explicit navigation overrides

**Managed V2 Screens ordinarily need no directional links.** A Row, Column, or other container gives the automatic navigator its parent-child structure; moving from a sidebar toward an adjacent content region should work without writing navigation code.

When a design truly requires a non-geometric destination, use the central focus API:

```lua
UI.Focus.Link(navigationButton, "Right", firstSetting)
UI.Focus.Link(firstSetting, "Left", navigationButton)
-- To deliberately prevent movement at a boundary:
UI.Focus.Block(navigationButton, "Up")
```

These overrides win over the automatic hierarchy. **Do not call native `SetControllerNavigation` directly for controls in a managed Screen**: the V2 graph writer owns their native edges and can overwrite unmanaged changes during refresh. Native `SetControllerNavigation` remains appropriate for legacy/unmanaged layouts.

## Deterministic navigation inside a group

**For legacy/unmanaged Screens only**, you can make Up/Down ordering explicit with native navigation links. Managed V2 Screens should use `UI.Focus.Link` instead:

```lua
firstSetting.root:SetControllerNavigation(
    Enum.ControllerNavigationDir.Down,
    Enum.ControllerNavigationMode.Specified,
    secondSetting.root
)

secondSetting.root:SetControllerNavigation(
    Enum.ControllerNavigationDir.Up,
    Enum.ControllerNavigationMode.Specified,
    firstSetting.root
)
```

Use `NearestControl` when geometry naturally describes navigation. Use `Specified` where the intended destination is part of the interaction design.

Use `None` when movement in a direction should do nothing:

```lua
button.root:SetControllerNavigation(
    Enum.ControllerNavigationDir.Right,
    Enum.ControllerNavigationMode.None,
    nil
)
```

## Programmatic focus

In a managed V2 Screen, prefer `UI.Focus.Set(button)` so the focus manager can verify the request. In a legacy/unmanaged Screen, Miliastra can move controller focus directly:

```lua
game.SetControllerFocus(playButton.root)
```

Read the current native focus with:

```lua
local focusedControl = game.GetControllerFocus()
```

MiliUI component wrappers expose their native control through `.root`, so pass the root rather than the wrapper object.

## Focus indicator

Controller-focusable Buttons show MiliUI's controller-focus indicator while focused.

### Visual examples

![Controller focus chevron highlighting the Play button](images/components/controller-focus.png)

```lua
UI.Button(parent, {
    label = { text = "OPTIONS", needsTranslation = false },
    controllerFocusIndicator = {
        placement = "right",
        align = "center",
        gap = 10,
    },
})
```

Supported placements are `auto`, `left`, `right`, `top`, `bottom`, `inside-left`, and `inside-right`. Cross-axis alignment is `start`, `center`, or `end`.

Focus chevrons render on a visually higher overlay layer rather than underneath other Buttons. Inside ScrollArea, a **wide, vertically clipped focus mask** sits above the content and scrollbar, following the same scroll offset. It allows focus chevrons to extend beyond the viewport horizontally while clipping at the top and bottom edges. `focusIndicatorOverflow` (default 64 UI units per side) controls the allowed horizontal overhang. Increase it for unusually large custom indicators. Outside ScrollArea, chevrons use the page-level overlay. Explicit `left`/`right` placements sit outside the Button edge, while `inside-left`/`inside-right` remain inset.

For narrow Buttons or localized text, you can opt in to label-aware
collision avoidance while keeping `inside-left`/`inside-right` as the
preferred placement:

```lua
controllerFocusIndicator = {
    placement = "inside-left",
    avoidLabelOverlap = true,
}
```

When the estimated rendered label would overlap the inset chevron, MiliUI
moves the indicator to the matching outside edge for that Button. The decision
is re-evaluated when focus enters, after `button:SetLabel(...)`, and on
Button root resizing. This uses **estimated Unicode glyph widths** because
native Miliastra glyph bounds are not exposed; always visually test large-font,
long localized and wrapped labels. The option defaults to `false` to preserve
explicit inside placement for existing games.

The indicator may also be static:

```lua
controllerFocusIndicator = {
    placement = "left",
    animation = false,
}
```

Or disabled for one Button:

```lua
controllerFocusIndicator = false
```

Inside ScrollArea, the focus overlay scrolls together with its content without requiring a per-frame update. Call `RefreshControllerFocusIndicator()` if an already-focused Button changes its position independently of the ScrollArea's scroll offset (for example, after a manual position change).

## Scrollable controller focus

`UI.ScrollArea` and `UI.ScrollColumn` automatically scroll a newly focused
descendant into view by default. This follows nested Row/Column geometry and
uses a small safe inset, rather than assuming the focused control is a direct
child of the scroll viewport.

```lua
local list = UI.ScrollColumn(parent, {
    width = 480,
    height = 320,
    controllerFocusPadding = 12,
    autoScrollOnControllerFocus = true,
})

-- Explicitly reveal a descendant without changing native focus:
list:ScrollControlIntoView(button.root)
```

In managed Screens, ScrollArea auto-reveal listens to **committed focus changes** from ControllerFocus, not raw native Focus events. This prevents queued or transient Focus events from snapping a right-stick-scrolled list back to a previously visible Button. Explicitly navigating to a new Button still reveals it. Unmanaged ScrollAreas retain their native Focus-event behavior.

The focus overlay shares the content's centered coordinate system and
moves in lockstep with scrolling. It is drawn after the list and scrollbar.
Its rectangular mask spans the viewport height, with configurable horizontal
room beyond the content edges. The Core overlay-layer registry lets focus
indicators find the correct parent without a ScrollArea-specific lookup.

`UI.ScrollColumn` enables main-axis controller navigation across its
focusable children by default, including Buttons nested inside Row groups. Standard Rows and Columns can opt in explicitly:

```lua
local buttons = UI.Row(parent, {
    gap = 12,
    controllerNavigation = true,
})

UI.Button(buttons, { label = { text = "YES", needsTranslation = false } })
UI.Button(buttons, { label = { text = "NO", needsTranslation = false } })
```

In **unmanaged** layouts, `controllerNavigation=true` lets the Stack author native links along its main axis: Up/Down in a Column, Left/Right in a Row. Nested Stacks use groups of focusable controls and prefer cross-axis alignment. Native nearest-control fallback remains available at boundaries.

In a **managed V2 Screen**, Row/Column ancestry is already used by the Screen-level hierarchical navigator. Stack layout contributes structure, but its legacy authored main-axis edges do not override V2 automatically. Offscreen scroll targets stay eligible and reveal on confirmed focus. For directional exceptions, use `UI.Focus.Link` / `UI.Focus.Block`, not native edges.

Disabled, hidden and inactive controls are excluded when the relevant graph refreshes. Use `UI.Focus.Refresh(screen)` after directly changing native visibility, active state, or geometry. `Stack:Batch()` still coalesces large Stack layout changes.

## Miliastra Test Play limitations

On current PC Test Play builds, controller focus only initializes if the level
**starts in Controller mode**. Switching PC to Controller after a level starts
can report Controller from `game.GetDevice()` while native focus remains nil.
The supported testing workaround is to switch to Controller inside Test Play,
then restart the level **without leaving Test Play**. MiliUI cannot repair this
native controller initialization behavior.

Additional native quirks observed in controller mode:

- `game.GetCursorUIPos()` can return an unchanged position even when the
  always-on cursor moves. Do not use it to position controller focus.
- `game.GetUICanvasSize()` reports the safe-area-adjusted controller UI
  canvas, smaller than the full editor viewport. MiliUI uses the reported
  canvas, not guessed multipliers to reconstruct the unavailable outer size.

## Screen navigation isolation

`UI.Screen` exposes Miliastra's native navigation isolation through `isolateNavigation`.

Use it when controller navigation should remain inside that screen/root instead of escaping to unrelated native controls outside it.

For a self-contained full-screen menu or controller test page, use `isolateNavigation = true` so focus cannot leave the MiliUI screen for unrelated native/Genshin UI. Do not force isolation on HUD-style interfaces that should allow normal gameplay input.

## Practical pattern: sidebar enters a panel

A controller-friendly two-region menu can use:

```text
Up / Down      move within the current region
Right          enter the content region
Left           return to the sidebar
Confirm        activate the focused Button
```

In a managed Screen, the hierarchy normally provides these transitions automatically. Test the actual layout before adding explicit overrides; use `UI.Focus.Link` only when the intended destination cannot be inferred from the structure.

For working controller examples, see [the Button and menu examples](../examples/getting-started/README.md).
