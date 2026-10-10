# Controller Support

MiliUI uses Miliastra's built-in controller focus system. **Focus** is the Button the controller will activate when you press Confirm. **Selection** is a value your game has chosen, such as the selected menu option. A Button can be selected without being focused, and moving focus does not automatically change your game's selection.

## Focusable controls

`UI.Button` and `UI.IconButton` are controller-focusable by default unless `controllerFocus = false` is supplied.

When a focusable Button is created, MiliUI configures native controller navigation in all four directions with:

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

## Explicit navigation between regions

Nearest-control navigation is not always enough. A common layout has a navigation list on the left and a content region on the right.

Use Miliastra's native `SetControllerNavigation` when moving in one direction should always go to a specific control.

```lua
local navigationButton = UI.Button(sidebar, {
    label = { text = "SETTINGS", needsTranslation = false },
})

local firstSetting = UI.Button(content, {
    label = { text = "AUDIO", needsTranslation = false },
})

navigationButton.root:SetControllerNavigation(
    Enum.ControllerNavigationDir.Right,
    Enum.ControllerNavigationMode.Specified,
    firstSetting.root
)

firstSetting.root:SetControllerNavigation(
    Enum.ControllerNavigationDir.Left,
    Enum.ControllerNavigationMode.Specified,
    navigationButton.root
)
```

With that bridge:

```text
left list
    -- Left Stick Right -->
content controls

content controls
    -- Left Stick Left -->
left list
```

This is useful for menus with clear visual regions because it avoids depending on geometric nearest-neighbor guesses across the whole screen.

## Deterministic navigation inside a group

You can also make Up/Down ordering explicit:

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

Miliastra can move controller focus directly:

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

With `controllerNavigation=true`, MiliUI connects each Stack child group
to the nearest focusable target in the adjacent group along the Stack's main
axis: Up/Down in a Column, Left/Right in a Row. Nested rows preserve
cross-axis alignment rather than forming a flat zig-zag sequence. Edges retain
native nearest-control navigation. Offscreen scroll targets remain eligible
and are revealed on focus.

Disabled, hidden, and inactive targets are omitted when the graph is refreshed.
Re-enabling a MiliUI Button automatically updates its parent Stack.
After changing native visibility/focusability directly, call
`stack:RefreshControllerNavigation()` to rebuild the graph. Custom links
on a Stack-owned axis should be applied after mutations, or use
`controllerNavigation=false` to retain full manual control.

Navigation graph construction is deferred during `Stack:Batch()`, so large
dynamic lists get one final graph pass after layout settles.

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

Do not enable input capture or navigation isolation merely because a screen uses MiliUI. HUD-style interfaces should normally leave gameplay input alone.

## Practical pattern: sidebar enters a panel

A controller-friendly two-region menu can use:

```text
Up / Down      move within the current region
Right          enter the content region
Left           return to the sidebar
Confirm        activate the focused Button
```

The important part is not the exact direction scheme; it is defining explicit bridges at region boundaries while allowing normal nearest-control or explicit ordering inside each region.

For working controller examples, see [the Button and menu examples](../examples/getting-started/README.md).
