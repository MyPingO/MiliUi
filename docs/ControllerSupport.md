# Controller Support

MiliUI uses Miliastra's native controller-focus system. Focus and selection are separate concepts: a control may be visually selected without holding controller focus, and controller focus can move without changing application selection state.

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

Supported placements are `auto`, `left`, `right`, `top`, and `bottom`. Cross-axis alignment is `start`, `center`, or `end`.

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

If application code changes layout while a Button remains focused, `RefreshControllerFocusIndicator()` repositions the selector against the Button.

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

The documentation runtime harness includes this pattern in `COMP-02 — Controller navigation & focus`.
