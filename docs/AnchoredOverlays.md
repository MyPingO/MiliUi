# Anchored overlays

MiliUI provides one shared anchored-placement foundation for lightweight UI that
must appear next to another control without being clipped by that control's
immediate parent.

The first public components using it are:

- `UI.Popover` for interactive anchored content.
- `UI.Tooltip` for passive hover information.

## Popover

Create the popover under an overlay-capable ancestor such as a Screen root and
point `anchor` at the nested control it should follow:

```lua
local popover = UI.Popover(screen.root, {
    anchor = settingsButton,
    placement = "auto",
    align = "center",
    gap = 8,
    width = 340,
    height = 220,
    closeOnOutsideClick = true,
})

UI.Button(popover.content, {
    label = { text = "Equip", needsTranslation = false },
})

settingsButton:OnClick(function()
    popover:Toggle()
end)
```

Placement values are `auto`, `top`, `bottom`, `left`, and `right`.
Cross-axis alignment is `start`, `center`, or `end`.

`auto` tries bottom, top, right, then left and picks the first side that fits.
If none fits completely, the least-overflowing candidate is chosen and clamped
inside the overlay parent's `margin`.

An explicit side flips to its opposite side when it does not fit unless
`flip = false`.

## Tooltip

Tooltips use the same placement system but are passive and non-interactive:

```lua
local tooltip = UI.Tooltip(screen.root, {
    anchor = modifierButton,
    text = {
        text = "Randomizes your loadout each life.",
        textId = "Modifier.RandomLoadout.Tooltip",
    },
    placement = "auto",
})
```

The tooltip listens to cursor enter/exit on `trigger`, which defaults to
`anchor`. Set `trigger = false` when opening and closing it manually.

The default hover delay is 0.2 seconds.

## Nested anchors

The anchor does not need to share the popover's parent. MiliUI walks the native
Client UI parent chain and transforms the anchor bounds into the overlay
parent's coordinate space. Local scale and Z rotation are included.

The overlay parent **must be an ancestor of the anchor**. This keeps ownership,
coordinate conversion, and Host lifecycle deterministic.

## Refreshing placement

Opening an overlay always refreshes placement. MiliUI also refreshes an open
overlay when the anchor itself or the overlay parent resizes.

Miliastra does not expose a generic movement event for every control. If game
code moves an anchor while its overlay stays open, call:

```lua
popover:RefreshPlacement()
tooltip:RefreshPlacement()
```

This is preferable to per-frame polling.

## Outside-click behavior

`closeOnOutsideClick = true` gives a Popover a sibling input backdrop. The
backdrop sits behind the popover and closes it when clicked.

Tooltips never create an outside-click backdrop and do not intentionally capture
pointer input.
