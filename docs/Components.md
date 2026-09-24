# MiliUI Components

Practical reference for the current public API. VS Code hover documentation contains the complete props/method signatures; this guide focuses on normal usage patterns.

## Initialization

A normal Control Group script configures the shared templates, attaches its own Host, then builds UI under that Host root:

```lua
local UI = require("MiliUI/init")

local HOST_ID = "Components Example"

function OnStart()
    UI.InitTemplates({
        container = script:GetParam("ContainerTemplateId"),
        image = script:GetParam("ImageTemplateId"),
        text = script:GetParam("TextTemplateId"),
        button = script:GetParam("ButtonTemplateId"),
        cursorArea = script:GetParam("CursorAreaTemplateId"),
    })

    UI.Hosts.Attach(HOST_ID, script.object)

    -- Build MiliUI controls here, after the Host is attached.
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

Do not instantiate MiliUI controls at Lua file scope. Client controls must be created after the native root exists and its MiliUI Host is attached, normally from `OnStart()` or a registered Page factory.

Optional native wrappers add their own shared templates:

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
```

`cursorArea` is required by `UI.Hitbox` and by composed controls that use invisible pointer regions such as Slider/Scrollbar interaction surfaces. Hitboxes use the native Cursor Event Area control so they do not inherit Preset Button click audio. `animation` is required only by `UI.Animation`, and `fullscreenAnimation` is required only by `UI.FullscreenAnimation`.

Repeated `InitTemplates(...)` calls are safe when they agree. Compatible entries are merged so a Host that supplies only the common primitive/interaction templates does not erase optional templates configured by another Host. Supplying a different ID for an already-configured template kind is treated as a configuration error.

`UI.Native(...)` does not require its template to be registered in `InitTemplates`; pass that template index directly.

For the recommended Control Group lifecycle and Layer model, see [ControlGroups.md](ControlGroups.md).

## Localized text

Raw text controls use `text`, `textId`, `needsTranslation`, and optional `args` directly:

```lua
UI.Text(parent, {
    text = "PLAY",
    textId = "MainMenu.Play",
})
```

Composed components use the same TextSpec shape under semantic fields:

```lua
UI.Button(parent, {
    label = {
        text = "PLAY",
        textId = "MainMenu.Play",
    },
})
```

```lua
UI.Alert(parent, {
    title = {
        text = "READY",
        textId = "Status.Ready",
    },
    message = {
        text = "Collected {count} items",
        textId = "Collection.Count",
        args = { count = 17 },
    },
})
```

See [Localization.md](Localization.md) for code-first fallback behavior, dynamic placeholders, and CSV generation.

## Theming

Themes are creation-time defaults. Apply a theme before constructing the controls that should use it:

```lua
UI.Theme.Apply({
    colors = {
        accent = Color.FromRGB(211, 126, 56),
        text = Color.FromRGB(255, 240, 211),
    },
    components = {
        card = { backgroundImage = 107020 },
        slider = {
            trackImage = 107062,
            fillImage = 107059,
            thumbImage = 107058,
        },
    },
})
```

Explicit constructor props override theme defaults. `UI.Theme.Reset()` restores the built-in theme for controls created afterward. See [Theming.md](Theming.md) for the full component-key and skin-field reference and the multi-Host theme rules.

## Screen

`UI.Screen` creates a canvas-sized root from `game.GetUICanvasSize()` and a padded `content` container for normal page UI.

```lua
local screen = UI.Screen(script.object, {
    padding = 48,
    background = "page",
})
```

Passing `screen` as a parent routes children into `screen.content`. Use `screen.root` for full-canvas overlays.

Useful methods:

```text
GetSize
GetContentSize
GetAspectRatio
GetOrientation
Matches
SetPadding
SetInsets
Refresh
OnResize
Destroy
```

## Text primitives

```lua
UI.Heading(parent, {
    text = "SETTINGS",
    textId = "Settings.Title",
    width = 400,
})

UI.Label(parent, {
    text = "Music",
    textId = "Settings.Music",
})

UI.Caption(parent, {
    text = "v1.0",
    needsTranslation = false,
})
```

Adaptive font sizing is opt-in for raw `UI.Text`. If `adaptiveFontSize = true` and no explicit `minimumFontSize` is supplied, the raw Text control derives a flexible minimum from the requested font size with a floor of 10. Composed components may provide their own explicit minimums.

## Button / IconButton

```lua
local button = UI.Button(parent, {
    label = {
        text = "PLAY",
        textId = "MainMenu.Play",
    },
    variant = "primary",
    width = 180,
    height = 54,
})

button:OnClick(function(eventData)
    local x, y = eventData:GetUIPos()
    print("clicked", x, y)
end)

button:SetLabel({
    text = "READY",
    textId = "Status.Ready",
})
button:SetEnabled(false)
```

A disabled Button is inert: click, enter, exit, down, and up callbacks are suppressed until `SetEnabled(true)` restores interaction.

Variants: `primary`, `secondary`, `ghost`, `success`, `danger`.

`UI.IconButton` adds `icon`, `iconSize`, and `iconColor` while forwarding Button props.

Controller-focusable Buttons show a small selector only while they have native
controller focus. The built-in selector sits to the left and points toward the
Button. Override its placement per control without changing mouse-hover behavior:

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

Supported placements are `auto`, `left`, `right`, `top`, and `bottom`;
cross-axis alignment is `start`, `center`, or `end`. The selector is
rendered above the Button's masked/scrolling ancestors, so it can sit outside a
ScrollArea viewport without being clipped. Explicit sides flip by default when
they would leave the overlay root; use `flip = false` to force the requested
side. A custom `image`, `size`, `color`, `margin`, `gap`, `offsetX`,
and `offsetY` may also be supplied.

While focused, the selector performs a subtle directional bob toward the Button.
The default full cycle is 0.46 seconds over 5 pixels. Override or disable it per
Button:

```lua
controllerFocusIndicator = {
    placement = "left",
    animation = {
        distance = 7,
        duration = 0.55,
    },
}
```

Set `animation = false` to keep a static selector, or
`controllerFocusIndicator = false` to disable the selector entirely.

Global creation-time defaults live under `UI.Theme.controllerFocusIndicator`:

```lua
UI.Theme.Apply({
    controllerFocusIndicator = {
        placement = "left",
        size = 24,
        gap = 10,
        color = "gold",
    },
})
```

## Badge / Chip

```lua
local badge = UI.Badge(parent, {
    label = {
        text = "NEW",
        textId = "Status.New",
    },
    background = "accent",
})

badge:SetLabel({
    text = "ACTIVE",
    textId = "Status.Active",
})
```

`UI.Chip` is an alias of `UI.Badge`.

## Stat

```lua
local stat = UI.Stat(parent, {
    label = {
        text = "WINS",
        textId = "Stats.Wins",
    },
    value = {
        text = "24",
        needsTranslation = false,
    },
})

stat:SetValue({ text = "25", needsTranslation = false })
```

## ProgressBar

```lua
local progress = UI.ProgressBar(parent, {
    value = 0.65,
    width = 300,
    showText = true,
})
```

The built-in ProgressBar silhouette uses rounded level `6` for the background and level `5` for the fill. Override them independently with `radius` and `fillRadius`. For backwards-compatible customization, supplying `radius` without `fillRadius` applies that radius to both surfaces. A custom `fillImage` overrides the radius-derived fill surface.

The default visible value template is `{value}%`. Supply a localized `label` to control the surrounding text:

```lua
UI.ProgressBar(parent, {
    value = 0.65,
    label = {
        text = "Progress: {value}%",
        textId = "Progress.Value",
    },
})
```

## Slider

```lua
local slider = UI.Slider(parent, {
    min = 0,
    max = 100,
    step = 1,
    value = 50,
    width = 340,
    showValue = true,
    valueSuffix = "%",
})

slider:OnChange(function(value)
    print("live", value)
end)

slider:OnCommit(function(value)
    print("finished", value)
end)
```

The built-in Slider track uses rounded level `6` and its filled portion uses level `5`. Override them with `radius` and `fillRadius`. Supplying `radius` alone keeps the older customization behavior by applying it to both track and fill. The draggable thumb remains separately controlled by `thumbRadius`.

The Slider interaction region is silent by default. It uses `UI.Hitbox`/Cursor Event Area rather than an invisible Preset Button, so pressing or dragging the track does not trigger native button-click audio. Set `commitAudioId` (or `UI.Theme.sounds.sliderCommit`) when a project deliberately wants a sound after a changed value is committed.

Use `valueLabel` for a localized display template:

```lua
valueLabel = {
    text = "Volume {value}",
    textId = "Settings.VolumeValue",
}
```

Slider drag math compensates for nested MiliUI scaling.

## Repeater / ListView

`UI.Repeater` reconciles keyed data into Row/Column children. `UI.ListView`
combines the same keyed renderer with `UI.ScrollColumn` for scrolling lists.

They intentionally leave selection and row interaction to the rendered controls.

See [DataViews.md](DataViews.md) for keyed reconciliation, empty states, and
ListView behavior.

## Popover / Tooltip

Use `UI.Popover` for interactive content positioned next to another control and
`UI.Tooltip` for passive hover information. Both use the shared anchored
placement system, including nested anchors, automatic edge flipping, and
parent-boundary clamping.

See [AnchoredOverlays.md](AnchoredOverlays.md) for placement and lifecycle
details.

## Toggle

```lua
local toggle = UI.Toggle(parent, {
    label = {
        text = "Music",
        textId = "Settings.Music",
    },
    value = true,
})

toggle:OnChange(function(value)
    print("Music", value)
end)
```

Use `SetLabel`, `SetValue`, `GetValue`, `Toggle`, `SetEnabled`, and `OnChange`.

## Checkbox

```lua
local checkbox = UI.Checkbox(parent, {
    label = {
        text = "Controller Hints",
        textId = "Settings.ControllerHints",
    },
    value = true,
})
```

The default marker is the image asset in `UI.Theme.assets.checkboxCheck` (`100102` in the built-in theme). Use `checkIcon` / `SetCheckIcon(...)` to choose another image, or supply `check = { ... }` / `SetCheck(...)` to deliberately switch to a custom text marker.

## Stepper

```lua
local partySize = UI.Stepper(parent, {
    min = 1,
    max = 8,
    step = 1,
    value = 4,
    valueLabel = {
        text = "{value}",
        needsTranslation = false,
    },
})
```

The default decrease/increase controls use image assets `UI.Theme.assets.minus` (`100108`) and `UI.Theme.assets.plus` (`100107`) instead of font symbols. Use `decreaseIcon` / `increaseIcon` to replace the images, or explicitly supply `decreaseLabel` / `increaseLabel` when a textual control is intentional.

## SegmentedControl

Items are tables with a localized `label`; additional fields are preserved as game metadata.

```lua
local difficulty = UI.SegmentedControl(parent, {
    items = {
        {
            label = {
                text = "Easy",
                textId = "Difficulty.Easy",
            },
            difficulty = 1,
        },
        {
            label = {
                text = "Normal",
                textId = "Difficulty.Normal",
            },
            difficulty = 2,
        },
        {
            label = {
                text = "Hard",
                textId = "Difficulty.Hard",
            },
            difficulty = 3,
        },
    },
    selected = 2,
    width = 420,
})

difficulty:OnChange(function(index, item)
    print(index, item.difficulty)
end)
```

## Select

`UI.Select` is a single-selection dropdown with stable 1-based indices, arbitrary item metadata, automatic above/below placement, theming, disabled items, long-list scrolling, and optional scalar ServerSignal submission.

```lua
local element = UI.Select(parent, {
    items = {
        { name = "Pyro", meta = "BURST", elementId = 1 },
        { name = "Hydro", meta = "CONTROL", elementId = 2 },
        { name = "Cryo", meta = "PRECISION", elementId = 3 },
        { name = "Electro", meta = "PRESSURE", elementId = 4 },
    },
    selected = 2,
    width = 360,
})

element:OnChange(function(index, item)
    if item ~= nil then
        print(index, item.name, item.elementId)
    end
end)
```

The default dropdown indicator is `UI.Theme.assets.selectIndicator` (`100111`). Only one MiliUI Select stays open at a time, and outside clicks close the active menu.

Long lists automatically receive a built-in scrollbar after eight visible rows by default. Change the window with `maxVisibleItems` or `maxMenuHeight`:

```lua
local mapSelect = UI.Select(parent, {
    items = maps,
    maxVisibleItems = 5,
})
```

Use `IsScrollable`, `GetVisibleRange`, `ScrollTo`, and `ScrollBy` when game code needs explicit scrolling. The built-in scrollbar does not require a native GridScroller template.

Optional automatic submission sends scalar ServerSignal parameters for the selected item:

```lua
submit = {
    signal = "ChooseElement",
    fields = {
        { source = "index", type = "Int" },
        { key = "elementId", type = "Int" },
        { key = "name", type = "String" },
    },
}
```

The Server Node Graph must declare matching scalar parameter types in the same order. Client-submitted gameplay values remain untrusted; authoritative server logic should prefer stable IDs and derive sensitive values server-side.

See [Select.md](Select.md) for long-list behavior, surface/image theming, disabled-state semantics, submit payloads, and security guidance. A runnable example is under `examples/Components/Select.lua`.

## MultipleChoiceWindow

`UI.MultipleChoiceWindow` is a checkbox-like multi-selection grid with stable 1-based indices, arbitrary item metadata, selection limits, auto-wrap, custom rendering, theming, and optional typed ServerSignal submission.

```lua
local choices = UI.MultipleChoiceWindow(parent, {
    items = {
        { name = "Pyro", amount = 3 },
        { name = "Hydro", amount = 5 },
        { name = "Cryo", amount = 2 },
        { name = "Electro", amount = 7 },
    },

    selected = { 1, 3 },
    minimumSelected = 1,
    maximumSelected = 3,

    autoWrap = true,
    itemWidth = 220,
    itemHeight = 82,
    gap = 12,
    padding = 16,

    itemStyle = {
        background = "surface2",
        hoverBackground = "surfaceHover",
        selectedBackground = "accentPressed",
        selectedTextColor = "white",
        border = true,
        borderColor = "border",
        selectedBorderColor = "accent",
        radius = "lg",
    },
})

choices:OnChange(function(indices, selectedItems)
    print(indices[1], selectedItems[1].name)
end)
```

Use `renderItem` / `updateItem` for fully custom cards while MiliUI continues to own the grid hitbox, selection state, hover handling, limits, and controller focus.

For rectangular image skins on rounded choices:

```lua
itemStyle = {
    backgroundImage = 107033,
    backgroundStretch = true,
    radius = "xl",
    clipToRadius = true,
}
```

Optional automatic submission aggregates selected fields into typed ServerSignal lists:

```lua
submit = {
    signal = "SubmitChoices",
    fields = {
        { source = "index", type = "Int" },
        { key = "name", type = "String" },
        { key = "amount", type = "Int" },
    },
}
```

The Server Node Graph must declare matching parameter types in the same order. Client-submitted gameplay values are not automatically trustworthy; authoritative server logic should prefer stable IDs and look up sensitive values server-side.

See [MultipleChoiceWindow.md](MultipleChoiceWindow.md) for the full grid, styling, custom renderer, disabled-state, submit, and security guide. A runnable example is under `examples/Components/MultipleChoiceWindow.lua`.

## Tabs

```lua
local tabs = UI.Tabs(parent, {
    items = {
        {
            label = {
                text = "Overview",
                textId = "Tabs.Overview",
            },
        },
        {
            label = {
                text = "Stats",
                textId = "Tabs.Stats",
            },
        },
        {
            label = {
                text = "Settings",
                textId = "Tabs.Settings",
            },
        },
    },
    selected = 1,
    width = 720,
    height = 380,
})

UI.Text(tabs:GetContent(1), {
    text = "Overview page",
    textId = "Tabs.Overview.Page",
})
```

Tab content is persistent. Switching tabs changes visibility instead of rebuilding content.

## PlayingCard

`UI.PlayingCard` is a reusable front/back game-card builder with a stationary hit-test slot and independently animated visual card.

```lua
local card = UI.PlayingCard(parent, {
    frameColor = "danger",
    header = {
        icon = 103002,
        label = {
            text = "FIRE",
            textId = "Elements.Fire",
        },
    },
    value = {
        text = "7",
        needsTranslation = false,
    },
    artwork = {
        image = 112022,
    },
    title = {
        text = "Flamecaller",
        textId = "Cards.Flamecaller.Name",
    },
    back = {
        frameColor = "success",
        title = {
            text = "RIVAL CARD",
            textId = "Cards.RivalCard",
        },
    },
})

card:SetSelected(true)
card:Flip("back")
```

Standard `headerLeft`, `headerRight`, `artwork`, `footer`, and `back` slots can be replaced with arbitrary MiliUI renderers.

## Alert / Shell

```lua
local alert = UI.Alert(parent, {
    variant = "warning",
    title = {
        text = "WARNING",
        textId = "Alert.Warning",
    },
    message = {
        text = "Inventory is almost full.",
        textId = "Inventory.AlmostFull",
    },
})
```

Variants: `info`, `success`, `warning`, `danger`.

Alerts automatically select the directional shell with the same rounded-pair index as the alert surface.

For custom decorative use:

```lua
UI.Shell(panel, {
    radius = "lg",
    mode = "gradient",
    width = "65%",
    height = "100%",
    color = "accent",
    opacity = 0.25,
})
```

## ToastManager

```lua
local toasts = UI.ToastManager(page, {
    x = 720,
    y = 400,
    width = 380,
})

toasts:Show({
    title = {
        text = "SAVED",
        textId = "Toast.Saved.Title",
    },
    message = {
        text = "Settings updated.",
        textId = "Toast.Saved.Message",
    },
    variant = "success",
    duration = 3,
})
```

Toast text uses the same `title` / `message` TextSpecs as Alert.

## Modal

```lua
local modal = UI.Modal(page, {
    title = {
        text = "Settings",
        textId = "Settings.Title",
    },
    width = 620,
    height = 420,
    open = false,
})

UI.Text(modal.content, {
    text = "Build any MiliUI content here.",
    textId = "Modal.Example.Body",
})

modal:Open()
```

The default close control uses the image asset in `UI.Theme.assets.close` (`100101`). Use `closeIcon` to replace it. `closeLabel` remains available for intentionally textual close controls and automatically switches to wider text-button geometry.

The modal owns a full-screen hit blocker beneath the card, preventing clicks from reaching UI behind it. Set `closeOnBackdrop = true` if the blocked backdrop should close the modal.

## Audio

MiliUI exposes the native 2D audio lifecycle without hiding the returned instance ID:

```lua
local instanceId = UI.Audio.Play(123456)

if UI.Audio.IsPlaying(instanceId) then
    UI.Audio.Stop(instanceId)
end
```

Buttons use MiliUI-managed click audio. `clickAudioId` overrides the sound for one Button; a theme can provide shared semantic defaults:

```lua
UI.Theme.Apply({
    sounds = {
        buttonClick = 123456,
        sliderCommit = 123457,
    },
})
```

MiliUI does not guess built-in sound IDs. When `buttonClick` is absent, a Button captures the click audio configured in its Preset Button template, disables native playback, and replays that sound only after MiliUI accepts the click. This lets ScrollArea cancel a press that became a drag without producing either a click callback or click sound. Set `clickAudioId = false` to make one Button silent. Slider commit audio remains opt-in.

## Native UI Animation

`UI.Animation` wraps Miliastra's native UI Animation control. It is separate from `UI.Motion`, which animates ordinary control properties through tweens.

```lua
local effect = UI.Animation(parent, {
    animationId = 234567,
    layer = Enum.UIAnimationLayer.AboveAllControls,
    playSoundEffect = true,
    autoPlay = true,
})

effect:Stop()
effect:SetAnimation(234568)
effect:Play()
```

Calling `Play()` while the native animation is already playing restarts it. MiliUI keeps animation configuration inactive while stopped and defers active setter changes until the next `Play()`, avoiding Miliastra property-write side effects that can retrigger animation or sound.

### Fullscreen UI Animation

`UI.FullscreenAnimation` wraps Miliastra's Fullscreen Animation control and requires `templates.fullscreenAnimation`.

```lua
local fullscreenEffect = UI.FullscreenAnimation(parent, {
    animationId = 234569,
    playSoundEffect = true,
    autoPlay = false,
})

fullscreenEffect:Play()
fullscreenEffect:SetSoundEnabled(false) -- applied safely on the next Play/Stop
fullscreenEffect:Play()                 -- restarts from the beginning
fullscreenEffect:Stop()
```

Fullscreen controls do not expose regular UI Animation's native `PlayAnimation()` / `StopAnimation()` methods. Runtime testing confirms that deactivation stops playback and activation starts the configured fullscreen animation from the beginning, so MiliUI uses inactive configuration plus activation as the normalized playback lifecycle. Setter changes made while active are deferred to avoid native property writes replaying authored sound by themselves.

## Native escape hatch

Use `UI.Native` when an editor-created Client UI template has specialized behavior that MiliUI should not pretend to normalize.

```lua
local effect = UI.Native(
    parent,
    script:GetParam("UIAnimationTemplateId"),
    {
        name = "SparkleEffect",
        x = 120,
        y = 20,
    }
)
```

For a text-bearing native control:

```lua
UI.SetText(nativeText, {
    text = "READY",
    textId = "Status.Ready",
})
```

## Native KeyHint

Requires `templates.keyHint`:

```lua
local hint = UI.KeyHint(parent, {
    keyboardKey = Enum.KeyboardKeyCode.InteractKey,
    controllerKey = Enum.ControllerKeyCode.InteractKey,
})
```

The native control displays the binding appropriate to the active input device.

## Native TextWindow

Requires `templates.textWindow`:

```lua
local textWindow = UI.TextWindow(parent, {
    width = 520,
    height = 320,
    text = "Long localized text",
    textId = "Help.LongText",
    showScrollBar = true,
})
```

`UI.ScrollText` is an alias.

## Native GridScroller

Requires `templates.gridScroller`:

```lua
local grid = UI.GridScroller(parent, {
    width = 700,
    height = 440,
    itemPrefabIndex = 12,
    scrollProgress = 1,
})

grid:Refresh(50, function(control, runtimeIndex)
    -- Use runtimeIndex exactly as supplied by the host.
end)
```

`SetProgress` clamps to `0-1` and preserves native direction. Runtime testing confirms a vertical GridScroller uses `1 = top/start` and `0 = bottom/end`.

## Layout

Persistent stack:

```lua
local column = UI.Column(parent, { gap = 12 })
column:Add(UI.Button(column, {
    label = { text = "A", needsTranslation = false },
}))
column:Add(UI.Button(column, {
    label = { text = "B", needsTranslation = false },
}))
column:SetGap(20)
```

One-shot layout:

```lua
UI.HStack({ buttonA, buttonB }, { gap = 12 })
UI.VStack({ cardA, cardB }, { gap = 16 })
UI.Grid(cards, { columns = 3, gap = 14 })
UI.Fan(cards, { spacing = 145, curve = 12, rotation = 5 })
```

Native controls and component wrappers can be mixed in these helpers.

## Interaction / Motion

`UI.Hitbox` requires `templates.cursorArea` and creates a native Cursor Event Area. It is intentionally silent and should be used for drag regions, invisible click targets, and other interaction geometry that is not visually a button.


```lua
local hitbox = UI.Hitbox(parent, {
    width = 200,
    height = 80,
})

hitbox:Bind({
    OnClick = function(eventData) end,
    OnEnter = function(eventData) end,
    OnExit = function(eventData) end,
    OnDown = function(eventData) end,
    OnUp = function(eventData) end,
    OnBeginDrag = function(eventData) end,
    OnDrag = function(eventData) end,
    OnEndDrag = function(eventData) end,
})

UI.Hover(card, {
    hitTarget = hitbox,
    raise = 28,
    scale = 1.08,
})

UI.Motion.PopIn(card)
UI.Motion.Pulse(card)
UI.Motion.Shake(card)
```

## Cleanup

For one control/component:

```lua
UI.Destroy(componentOrControl)
```

For normal Control Group teardown, detach only that Control Group's Host:

```lua
function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

Do not use `UI.DestroyAll()` as the normal `OnDestroy` path. It intentionally destroys MiliUI-created controls across **all currently attached Hosts**. It is a global reset tool, not per-Control-Group cleanup. Host roots remain attached, and logical Page/Session state is preserved so Pages can be explicitly restored if that global reset is used.
