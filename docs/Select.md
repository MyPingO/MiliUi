# Select / Dropdown

`UI.Select` is a single-selection dropdown with stable 1-based indices, arbitrary item metadata, automatic above/below placement, disabled options, long-list scrolling, theming, and optional typed ServerSignal submission.

## Basic usage

```lua
local elementSelect = UI.Select(parent, {
    items = {
        { name = "Pyro", meta = "BURST" },
        { name = "Hydro", meta = "CONTROL" },
        { name = "Cryo", meta = "PRECISION" },
    },
    selected = 2,
    width = 360,
})
```

The canonical selected value is the 1-based item index:

```lua
print(elementSelect:GetSelected())
print(elementSelect:GetSelectedItem().name)
```

For the example above, those values are `2` and `Hydro`.

## Item metadata

Every item is an ordinary Lua table. MiliUI reserves only the optional display fields `label`, `name`, `meta`, and `disabled`; other fields are left untouched.

```lua
items = {
    {
        name = "Pyro",
        meta = "BURST",
        elementId = 1,
        amount = 3,
        unlocked = true,
    },
    {
        name = "Hydro",
        meta = "CONTROL",
        elementId = 2,
        amount = 5,
        unlocked = false,
    },
}
```

`GetSelectedItem()` and `onChange` return the original item table, so game-specific metadata remains directly available:

```lua
local select = UI.Select(parent, {
    items = items,
    onChange = function(index, item)
        if item ~= nil then
            print(index, item.elementId, item.amount, item.unlocked)
        end
    end,
})
```

## Selection API

```lua
select:GetSelected()
select:GetSelectedItem()
select:SetSelected(4, true)
select:Clear(true)
```

`SetSelected` is intentionally programmatic. It may select an option that is disabled for player input.

Disabling an already-selected item does not silently clear the selection:

```lua
select:SetItemEnabled(4, false)
```

Disable the complete control with:

```lua
select:SetEnabled(false)
```

## Opening and placement

By default, Select chooses whether to open above or below based on available parent space:

```lua
openDirection = "auto"
```

You can force a direction with `"up"` or `"down"`.

Useful methods:

```lua
select:Open()
select:Close()
select:Toggle()
select:IsOpen()
select:GetOpenDirection()
```

Only one MiliUI Select remains open at a time. Clicking outside the active Select closes it.

The built-in indicator is `UI.Theme.assets.selectIndicator` (`100111` in the default theme). It rotates while the menu is open. Use `indicatorImage`, `indicatorRotation`, `indicatorOpenRotation`, and the indicator sizing/color props to override it without relying on font glyphs.

## Long lists

Select shows at most eight options by default. A longer list automatically receives the shared `UI.Scrollbar` component with image-backed up/down controls and a draggable thumb.

```lua
local mapSelect = UI.Select(parent, {
    items = maps,
    maxVisibleItems = 5,
})
```

`maxMenuHeight` can impose an additional height cap. MiliUI reduces the number of simultaneously visible rows as needed while keeping at least one visible option.

Long-list scrolling is composed from `UI.Scrollbar` and does not require a `GridScrollerTemplateId` in `UI.Init`. The returned Select exposes that shared component as `select.scrollbar` when scrolling is required.

Useful methods:

```lua
select:IsScrollable()

local firstIndex, lastIndex = select:GetVisibleRange()

select:ScrollBy(1)
select:ScrollBy(-1)
select:ScrollTo(12)
```

`ScrollTo(index)` ensures that item is inside the current visible window without changing the selection.

Opening a Select intentionally ensures the current selection is visible. While the menu remains open, manual scrolling may move that selected item off-screen. Closing and reopening the menu brings the current selection back into view again. Programmatically selecting an off-screen item while open also scrolls enough to reveal the new selection.

The shared scrollbar supports its arrow buttons and thumb dragging. The current Miliastra cursor-event API does not expose a mouse-wheel event, so Select does not invent wheel behavior that the host cannot provide reliably.

### Default scrollbar appearance

The built-in theme uses a subtle dark rectangular rail with a blue interactive thumb:

```text
track image      100001  rectangular fill
track color      surface2
thumb image      106007  light rounded rectangle
thumb color      accent
thumb hover      accentHover
```

The different track/thumb shapes are intentional: the rail stays visually quiet and structural while the movable thumb reads as the interactive element.

## Theming

`Theme.components.select` uses the same properties as the normal constructor. Apply themes before creating the Selects that should use them:

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
            maxVisibleItems = 6,
        },
    },
})
```

Explicit constructor props override theme defaults.

Scrollbar styling has a shared theme section used by both standalone `UI.Scrollbar` controls and Select's internal composition:

```lua
UI.Theme.Apply({
    scrollbar = {
        trackImage = 100001,
        trackColor = "surface2",
        thumbImage = 106007,
        thumbColor = "accent",
        thumbHoverColor = "accentHover",
    },
})
```

For `UI.Select`, precedence is:

```text
Theme.scrollbar
    -> Theme.components.select
    -> explicit Select props
```

That means a project can establish one general scrollbar style and still override one component family or one individual Select.

Select also supports image skins for its composed surfaces:

```lua
UI.Theme.Apply({
    components = {
        select = {
            fieldImage = 107033,
            fieldStretch = true,
            fieldClipToRadius = true,

            menuImage = 107020,
            menuStretch = true,
            menuClipToRadius = true,

            itemImage = 107051,
            itemStretch = true,
            itemClipToRadius = true,
        },
    },
})
```

Available specialized image fields include:

```text
fieldImage / fieldBorderImage
menuImage / menuBorderImage
itemImage / itemBorderImage
scrollbarTrackImage
scrollbarThumbImage
```

The field also accepts the normal surface-style aliases `backgroundImage`, `backgroundStretch`, `borderImage`, `borderStretch`, and `clipToRadius`.

## ServerSignal submission

Select uses scalar ServerSignal parameters because exactly one item is selected. This mirrors `MultipleChoiceWindow`, which aggregates multiple selections into list parameters.

```lua
local submitButton = UI.Button(parent, {
    label = {
        text = "SEND",
        needsTranslation = false,
    },
})

local select = UI.Select(parent, {
    items = {
        {
            name = "Pyro",
            elementId = 1,
            amount = 3,
            unlocked = true,
        },
        {
            name = "Hydro",
            elementId = 2,
            amount = 5,
            unlocked = false,
        },
    },

    submit = {
        signal = "ChooseElement",
        fields = {
            { source = "index", type = "Int" },
            { key = "elementId", type = "Int" },
            { key = "name", type = "String" },
            { key = "amount", type = "Int" },
            { key = "unlocked", type = "Bool" },
        },
    },

    submitButton = submitButton,
})
```

If Hydro is selected, the Server Node Graph must expect these scalar parameters in the same order:

```text
Int     2
Int     2
String  Hydro
Int     5
Bool    false
```

Supported scalar types are:

```text
Int
Float
String
Bool
Guid
Entity
PrefabId
ConfigId
Vector3
```

If `fields` is omitted, the default contract sends only the selected 1-based index as one `Int` parameter.

The submit button is automatically disabled while there is no selection or while the Select is disabled.

For manual control:

```lua
local valid, reason = select:CanSubmit()
local payload = select:BuildSubmitPayload()
local sent, submitReason = select:Submit()

select:OnSubmit(function(index, item)
    print(index, item.name)
end)
```

## Server authority

A ServerSignal sent by a client is still client-provided input. MiliUI validates the local payload shape, but that does not make gameplay-sensitive values authoritative.

Prefer sending a stable ID, ConfigId, or another lookup key and deriving prices, damage, rewards, ownership, or other authoritative values on the server.

For example, this is safer:

```lua
fields = {
    { key = "elementId", type = "Int" },
}
```

than trusting a client-submitted damage or reward amount as the server's source of truth.

## Events

```lua
select:OnChange(function(index, item, control)
end)

select:OnOpen(function(control)
end)

select:OnClose(function(control)
end)

select:OnSubmit(function(index, item, control)
end)
```

`onChange` also accepts `nil, nil` when the selection is cleared.

## Current scope

Select v1 intentionally does not include search/filter input, dynamic `SetItems`, or custom item renderers. Those can be added later if real interfaces require them without complicating the normal dropdown path.
