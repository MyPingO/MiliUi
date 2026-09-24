# Intrinsic and Localization-Safe Sizing

MiliUI supports content-driven sizing for controls that should adapt to their actual localized content instead of relying on fixed English-sized rectangles.

The core rule is:

> Explicit geometry wins. Intrinsic sizing only fills dimensions the developer intentionally leaves open.

This keeps existing layouts deterministic while making dynamic/localized UI much easier to author.

## Fit-Content Buttons

A localized button can size itself from its icon, translated label, gap, and padding:

```lua
local back = UI.Button(parent, {
    fitContent = true,
    icon = 100104,
    iconSize = 20,
    gap = 8,
    paddingX = 14,
    paddingY = 8,

    label = {
        text = "BACK",
        textId = "Common.Back",
        needsTranslation = true,
    },
})
```

Do not provide `width` or `height` when you want that axis to follow content.

If the active language changes `BACK` into a longer phrase, call:

```lua
UI.RefreshLocalization()
```

MiliUI re-resolves the Text Mapping and refits intrinsic text/buttons. Buttons also refit after `SetLabel`, `SetIcon`, and `SetContentPadding`.

```lua
back:SetLabel({
    text = "RETURN TO MENU",
    textId = "Common.ReturnToMenu",
})

back:SetIcon(nil)
back:SetContentPadding(18, 10)
```

`GetNaturalSize()` returns the current preferred size at the requested font size. `GetMinimumNaturalSize()` returns the preferred size at the configured minimum adaptive font size.

## Automatic Upward Reflow

Rows and Columns now observe their direct children automatically. A size change propagates upward through nested layouts without manual `Refresh()` calls.

```text
localized text changes
    -> intrinsic Button refits
    -> parent Row reflows
    -> parent Column reflows
    -> page layout settles
```

This is important for localization: changing one label should move neighboring controls instead of letting the resized control grow through them or off-screen.

## Flex-Style Shrink

Intrinsic growth solves the normal case, but sometimes translated content is longer than the available layout region. Stack children can opt into main-axis shrinking:

```lua
local actions = UI.Row(parent, {
    fillWidth = true,
    gap = 12,
    justify = "start",
})

local back = UI.Button(actions, {
    fitContent = true,
    shrink = 1,

    icon = 100104,
    iconSize = 20,
    gap = 8,
    paddingX = 14,
    paddingY = 8,

    label = {
        text = "BACK",
        textId = "Common.Back",
    },

    textSize = 17,
    minimumFontSize = 12,
})
```

`shrink` behaves like a flex shrink weight on the Stack's main axis:

- `shrink = 0` or omitted: keep the resolved size.
- `shrink = 1`: participate normally in shortage reduction.
- larger values: give up proportionally more space than siblings.

Shrinking respects `minWidth` / `minHeight`. For intrinsic Buttons, when `shrink > 0` and no explicit minimum is supplied, MiliUI infers a localization-safe minimum using the current full label at `minimumFontSize`, plus icon, gap, and padding.

That gives three intended behaviors:

```text
short translation
    -> control shrinks naturally around content

longer translation
    -> control grows naturally

translation exceeds available row
    -> shrinkable controls yield space down to their minimum
```

If the combined minimum sizes still cannot fit, the layout has reached a real design breakpoint. Use a responsive presentation change rather than crushing text below its readable minimum.

## Text Width Fitting

For a single-line text element whose width should follow the current localized string:

```lua
UI.Label(parent, {
    fitWidth = true,
    text = "PAST UPDATE",
    textId = "Updates.PastUpdate",
    size = 18,
})
```

MiliUI uses the actual resolved localized string and a conservative, script-aware font-width estimate. Miliastra currently exposes font size and adaptive sizing but no documented native preferred-text-width API, so this is an intentionally safe estimate rather than a claim of pixel-perfect font measurement.

CJK, Hangul, Kana, Cyrillic, Greek, Thai, Arabic, Hebrew, Latin, digits, punctuation, spaces, and combining marks are handled separately. A small safety margin favors extra breathing room over clipping.

Use `maxWidth` when a localized element must stay inside a known region.

## Wrapped TextWindow Height

Long localized text should not require a manually guessed rectangle height. Use a full-width `TextWindow` and let MiliUI derive its height from the current resolved text and current width:

```lua
local description = UI.TextWindow(parent, {
    fillWidth = true,
    fitContentHeight = true,

    interactable = false,
    showScrollBar = false,

    text = "A longer description that may wrap onto multiple lines.",
    textId = "Updates.Description",
    needsTranslation = true,

    size = 16,
})
```

The width remains owned by the parent/layout. MiliUI estimates the native wrapped line count, changes only the omitted height, and lets normal Stack reflow propagate that change upward.

```text
parent width or localized text changes
    -> TextWindow re-measures wrapped lines
    -> TextWindow height changes
    -> parent Column reflows
    -> bound ScrollColumn content height updates
```

`fitContentHeight` automatically re-measures when:

- the TextWindow width changes,
- `TextWindow:SetText(...)` changes its content,
- `UI.SetText(...)` changes the raw control's localized content,
- `UI.RefreshLocalization()` resolves a different translation.

Useful inspection methods are available:

```lua
local height = description:GetNaturalHeight()
local lines = description:GetEstimatedLineCount()
description:RefreshContentHeight()
```

Explicit `height` / `fillHeight` remains authoritative. If either is supplied, `fitContentHeight` does not take ownership of the height axis.

Miliastra does not currently expose a documented native preferred wrapped-text height, so MiliUI uses a conservative script-aware estimate. The optional `fitContentHeightInsetX` adjusts the assumed native horizontal inset per side; its default is `8`.

`fitContentHeight` should be treated as a layout convenience, not an exact measurement contract. For arbitrary-length localized text where clipping would be a correctness failure, prefer a native wrapping `TextWindow` inside explicit/flexible bounds or a scrolling layout. Those structures remain usable even when the estimate differs slightly from Miliastra's actual line breaking.

For localized paragraphs inside a `ScrollColumn`, `fitContentHeight` can still remove the need to guess line counts or insert manual `\n` characters when the surrounding scroll layout can tolerate small measurement differences. The resolved language is allowed to wrap naturally and the surrounding scroll content grows with it.

## Fit-Content Rows and Columns

Rows and Columns can derive omitted dimensions from their visible children.

```lua
local action = UI.Row(parent, {
    fitContent = true,
    gap = 8,
    paddingX = 14,
    paddingY = 8,
    align = "center",
})

UI.Icon(action, {
    image = 100104,
    size = 20,
})

UI.Text(action, {
    fitWidth = true,
    text = "BACK",
    textId = "Common.Back",
    size = 17,
})
```

For a horizontal Row:

```text
natural width  = left/right padding + child widths + gaps
natural height = top/bottom padding + tallest visible child
```

For a vertical Column:

```text
natural width  = left/right padding + widest visible child
natural height = top/bottom padding + child heights + gaps
```

Useful partial fitting is also supported:

```lua
local form = UI.Column(parent, {
    fillWidth = true,
    fitHeight = true,
    gap = 12,
})
```

Here width belongs to the parent/layout while height follows the content.

If `width`, `height`, `fillWidth`, or `fillHeight` explicitly owns an axis, fit-content does not override it.

## Automatic Scroll Content Height

Manual duplicated arithmetic like:

```lua
contentHeight = 200 + #items * 66
```

is unnecessary for normal vertical flows.

Use a fit-height Column and bind the ScrollArea to it:

```lua
local area = UI.ScrollArea(parent, {
    fillWidth = true,
    fillHeight = true,
})

local content = UI.Column(area.content, {
    fillWidth = true,
    fitHeight = true,
    gap = 12,
    padding = 20,
    justify = "start",
})

area:BindContentHeight(content)
```

As children resize, the Column refits and the ScrollArea updates its logical content height.

For the common case, `UI.ScrollColumn` combines those pieces:

```lua
local notes = UI.ScrollColumn(parent, {
    fillWidth = true,
    fillHeight = true,

    column = {
        gap = 12,
        padding = 20,
        align = "stretch",
    },
})

UI.Heading(notes.column, {
    text = "WHAT'S NEW",
    textId = "Updates.WhatsNew",
})
```

`notes.column` is a normal MiliUI Column.

## Localization Strategy

Intrinsic sizing is designed around MiliUI's existing localization flow:

```text
TextSpec
    -> game.GetText(textId)
    -> localized resolved string
    -> intrinsic sizing
    -> parent Stack reflow
    -> optional flex shrink
    -> bound ScrollArea content-height update
```

`UI.RefreshLocalization()` repeats that sizing chain for live intrinsic elements.

Localization changes are therefore treated as layout changes rather than just text replacement.

For highly constrained designs, provide sensible adaptive-font limits and responsive breakpoints. Intrinsic sizing and shrink remove the assumption that English-sized rectangles are correct, but they cannot create infinite screen space.
