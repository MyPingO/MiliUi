# MiliUI Theming

MiliUI themes are creation-time defaults. Apply a theme before creating the controls that should use it. Existing controls are not repainted when the active theme changes.

## Apply and reset

```lua
UI.Theme.Apply({
    colors = {
        surface = Color.FromRGB(66, 46, 32),
        surface2 = Color.FromRGB(92, 63, 40),
        text = Color.FromRGB(255, 240, 214),
        muted = Color.FromRGB(205, 174, 132),
        accent = Color.FromRGB(211, 126, 56),
        accentHover = Color.FromRGB(232, 150, 75),
        accentPressed = Color.FromRGB(176, 94, 39),
    },

    sounds = {
        buttonClick = 123456,
        sliderCommit = 123457,
    },

    components = {
        card = {
            backgroundImage = 107020,
            background = "white",
            border = false,
        },

        progressBar = {
            backgroundImage = 107062,
            fillImage = 107059,
        },

        checkbox = {
            boxImage = 107058,
            checkColor = "black",
        },
    },
})
```

`Theme.Apply` deep-merges only the sections supplied. `Theme.Reset()` restores the built-in theme for controls created afterward.

```lua
UI.Theme.Reset()
```

This makes it possible to create multiple independently styled UI regions in one script:

```lua
UI.Theme.Reset()
local defaultCard = UI.Card(parent, { x = -300 })

UI.Theme.Apply(warmTheme)
local warmCard = UI.Card(parent, { x = 300 })

UI.Theme.Reset()
```

The first card keeps its original appearance after the active theme changes.

## Multi-Host theme rule

The active `UI.Theme` table is **shared by every MiliUI Host in the same Lua runtime**. Hosts have independent native controls and lifecycle ownership, but they do not receive independent copies of the theme.

For most games, the simplest policy is to apply one project theme and let HUD, Menu, and Overlay all use it.

Be careful with independent Control Group scripts that call `Theme.Apply()` or `Theme.Reset()` during `OnStart`: the call changes the active defaults used by controls created afterward in **any** Host. Existing controls keep their already-resolved appearance, but later-created controls or restored Pages use whichever theme is active at that time.

If two Hosts intentionally need different visual styles, prefer one of these approaches:

- use explicit constructor props for the Host-specific differences;
- build a small game-side wrapper that supplies those props consistently;
- temporarily apply a theme only around a controlled creation step, then restore the expected shared theme before unrelated UI can be created.

Do not treat `UI.Theme` as Host-local state.

## Precedence

For normal component constructors, styling resolves in this order:

```text
built-in component fallback
    -> active Theme.components defaults
    -> utility class values
    -> explicit constructor props
```

Explicit Lua props are always authoritative.

`UI.Select` also consumes the shared scrollbar theme before its component-specific defaults:

```text
built-in fallback
    -> Theme.scrollbar
    -> Theme.components.select
    -> utility class values
    -> explicit Select props
```

This lets a project establish one general compact-scrollbar style while still allowing Select-specific or instance-specific overrides.

```lua
UI.Theme.Apply({
    components = {
        card = {
            backgroundImage = 107020,
        },
    },
})

-- This one card overrides the active card skin.
UI.Card(parent, {
    backgroundImage = 107051,
})
```

## Component defaults

`Theme.components` currently supports these component keys:

```text
surface
panel
screen
button
card
badge
stat
progressBar
slider
toggle
checkbox
stepper
segmentedControl
select
multipleChoiceWindow
tabs
alert
modal
playingCard
```

The values use the same property names as the public constructor for that component. This keeps theme definitions and normal component code consistent.

Examples:

```lua
UI.Theme.Apply({
    components = {
        slider = {
            trackImage = 107062,
            fillImage = 107059,
            thumbImage = 107058,
        },

        select = {
            maxVisibleItems = 6,
            selectedColor = "accentPressed",
            menuImage = 107020,
            itemImage = 107051,
        },

        tabs = {
            tabBarImage = 107055,
            tabImage = 107056,
        },

        alert = {
            backgroundImage = 107020,
            shellImage = 107061,
        },
    },
})
```

## Sound defaults

`Theme.sounds` stores optional semantic audio resource IDs. MiliUI does not ship guessed sound IDs; projects opt in with their own configured audio resources.

```lua
UI.Theme.Apply({
    sounds = {
        buttonClick = 123456,
        sliderCommit = 123457,
    },
})
```

`buttonClick` controls the MiliUI-managed click sound for Buttons created afterward. MiliUI captures the Preset Button template's configured `clickAudioId` as the fallback, silences native playback, and plays that audio only after an accepted click. This prevents a drag-to-scroll gesture from making a premature button sound. `sliderCommit` is opt-in and plays only after an interaction actually changed the Slider value and then committed it.

Per-instance `clickAudioId` and `commitAudioId` props override these shared sound defaults.

## Shared scrollbar defaults

`Theme.scrollbar` defines reusable defaults for compact MiliUI scrollbars. `UI.Select` is the first component to consume this shared section; future scrollable components can adopt the same contract without copying a visual style into every component theme.

The built-in style intentionally uses different silhouettes for the track and thumb:

```text
track      rectangular fill, asset 100001, surface2
thumb      light rounded rectangle, asset 106007, accent
hover      accentHover
```

That keeps the rail visually quiet while making the movable thumb read as the interactive element.

Override the shared style like this:

```lua
UI.Theme.Apply({
    scrollbar = {
        trackWidth = 4,
        trackImage = 100001,
        trackColor = "surface2",
        thumbWidth = 10,
        thumbImage = 106007,
        thumbColor = "accent",
        thumbHoverColor = "accentHover",
    },
})
```

The shared scrollbar section also controls lane width/gap, arrow size/image/colors, button spacing, and minimum thumb height. See `library/theme.lua` for the full typed field list.

## Select themes

`select` themes can control the field, menu, built-in options, indicator, long-list limits, and scrollbar with the same property names accepted by `UI.Select`.

```lua
UI.Theme.Apply({
    components = {
        select = {
            background = "surface2",
            hoverColor = "surfaceHover",
            selectedColor = "accentPressed",
            selectedHoverColor = "accentHover",
            menuBackground = "surface",
            itemColor = "surface2",
            itemHoverColor = "surfaceHover",
            maxVisibleItems = 5,
        },
    },
})
```

Specialized Select image fields include:

```text
fieldImage / fieldBorderImage
menuImage / menuBorderImage
itemImage / itemBorderImage
scrollbarTrackImage
scrollbarThumbImage
```

A Select-specific scrollbar value under `Theme.components.select` overrides the corresponding shared `Theme.scrollbar` value. Explicit constructor props override both.

The field also accepts the normal surface-style aliases `backgroundImage`, `backgroundStretch`, `borderImage`, `borderStretch`, and `clipToRadius`. Use the matching `...Stretch` and `...ClipToRadius` fields for the specialized menu/item/scrollbar surfaces.

See [Select.md](Select.md) for long-list behavior, metadata, ServerSignal submission, and the full theming examples.

## Multiple Choice Window item themes

`multipleChoiceWindow` can theme both the outer component and the built-in item renderer. Group normal item-state styling under `itemStyle`:

```lua
UI.Theme.Apply({
    components = {
        multipleChoiceWindow = {
            itemStyle = {
                background = "surface2",
                hoverBackground = "surfaceHover",
                selectedBackground = "accentPressed",

                textColor = "muted",
                hoverTextColor = "text",
                selectedTextColor = "white",

                border = true,
                borderColor = "border",
                hoverBorderColor = "borderStrong",
                selectedBorderColor = "accent",

                radius = "lg",
            },
        },
    },
})
```

Projects can still override any of those values on one specific Multiple Choice Window. Explicit flat item props such as `selectedColor` also remain authoritative over grouped `itemStyle` defaults.

Use `renderItem` / `updateItem` for genuinely custom card layouts rather than trying to encode a whole custom composition into theme values. See [MultipleChoiceWindow.md](MultipleChoiceWindow.md) for the styling progression and custom renderer contract.

## Custom surface assets

Normal `Panel`-style surfaces may use:

```text
backgroundImage
backgroundStretch
borderImage
borderStretch
```

If no custom image is supplied, MiliUI continues using the existing radius-based rounded assets from `Systems/Surface.lua`.

This means custom and standard surfaces can be mixed freely.

```lua
UI.Card(parent, {
    backgroundImage = 107020,
    background = "white",
    border = false,
})

UI.Card(parent, {
    radius = "xl",
    background = "surface",
})
```

Many decorative assets are intended to stretch, but not every image will look good at every aspect ratio. Theme authors should choose assets whose silhouettes and edge details fit the component dimensions they are assigned to.

When a rectangular custom texture needs to fit a rounded surface, use `clipToRadius = true` so MiliUI applies native ImageControl masking instead of leaving the square corners visible:

```lua
UI.Panel(parent, {
    backgroundImage = 107033,
    backgroundStretch = true,
    radius = "xl",
    clipToRadius = true,
})
```

See [Masking.md](Masking.md) for direct image-mask properties and the current host limitation around inverted masks.

## Button image states

Buttons can skin each interaction state independently:

```lua
UI.Theme.Apply({
    buttonVariants = {
        primary = {
            background = "white",
            text = "black",
            backgroundImage = 107060,
            hoverImage = 107060,
            pressedImage = 107060,
            disabledImage = 107060,
        },
    },
})
```

Available image fields are:

```text
backgroundImage
hoverImage
pressedImage
disabledImage
borderImage
```

Omitted state images fall back toward the normal `backgroundImage`. Using the same silhouette for all states is usually preferable; color and scale can still provide hover/press feedback without visually changing the button shape.

## Specialized skin fields

Some composed components expose their internal visual surfaces separately:

```text
ProgressBar          radius, fillRadius, fillImage
Slider               radius, fillRadius, trackImage, fillImage, thumbImage
Toggle               trackImage, thumbImage
Checkbox             boxImage
SegmentedControl     itemImage
Select               fieldImage, menuImage, itemImage, scrollbarTrackImage, scrollbarThumbImage
MultipleChoiceWindow itemImage, itemBorderImage, selectionFrameImage, itemStyle
Tabs                 tabBarImage, tabImage
Alert                shellImage
Modal                overlayImage
```

Most of these also have matching `...Stretch`, `...BorderImage`, or `...BorderStretch` fields where applicable. ProgressBar and Slider use rounded level `6` for the default background/track and level `5` for the default fill; `fillRadius` can override the fill independently. When `radius` is explicitly supplied and `fillRadius` is omitted, the fill follows that explicit radius for compatibility. VS Code/LuaLS declarations under `library/` contain the exact property list.

## Colors and assets remain extensible

Themes can also add named color, asset, and sound tokens:

```lua
UI.Theme.Apply({
    colors = {
        rarityLegendary = Color.FromRGB(245, 190, 70),
    },
    assets = {
        menuFrame = 107020,
    },
    sounds = {
        menuOpen = 123458,
    },
})
```

Color-token strings continue to work anywhere MiliUI accepts a `MiliUI.ColorValue`.

## Architecture

`Systems/Theme.lua` owns theme data, defaults, `Apply`, and `Reset`.

Most components receive their component-specific defaults through `Components/ThemeWrapper.lua`. `UI.Select` resolves its shared `Theme.scrollbar` values and `Theme.components.select` defaults through `Style.Merge` because its field, menu, option, and scrollbar surfaces are composed internally and are then built through the already-themed `UI.Panel`/`UI.Button` constructors.

The theme system remains creation-time only: changing the active theme does not repaint controls that already exist. The active theme is global to the MiliUI Lua runtime, not scoped per Host.
