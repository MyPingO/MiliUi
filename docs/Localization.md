# MiliUI Localization

MiliUI treats Miliastra Script Text Variables as a first-class text source. The host API is:

```lua
game.GetText(textId)
```

`textId` is the Text Mapping ID configured in **Manage Multi-language Text** in the Sandbox editor.

## TextSpec

Every semantic MiliUI text slot uses the same shape:

```lua
{
    text = "English fallback",
    textId = "Some.Mapping.ID",
    needsTranslation = true,
    args = {
        value = 12,
    },
}
```

Fields:

- `text`: English/code-first fallback text.
- `textId`: Script Text Variable / Text Mapping ID passed to `game.GetText`.
- `needsTranslation`: export metadata for the editor CSV. It does not disable runtime lookup.
- `args`: named values substituted into `{placeholder}` tokens after localization.
- text-style fields such as `size`, `color`, `adaptiveFontSize`, and `minimumFontSize` may also be placed in the same table when a semantic slot needs local typography overrides.

## Raw text controls

`UI.Text`, `UI.Heading`, `UI.Label`, `UI.Caption`, and `UI.TextWindow` accept both inline localization fields and a nested TextSpec.

Inline fields remain convenient for authored UI:

```lua
UI.Text(parent, {
    text = "PLAY",
    textId = "MainMenu.Play",
    needsTranslation = true,
    fitWidth = true,
fitWidthPadding = 16,
})
```

For data-driven UI, the `text` field itself may be a complete TextSpec:

```lua
local title = {
    text = "August 17, 2026",
    textId = "Updates.2026_08_17.ListTitle",
}

UI.Heading(parent, {
    fillWidth = true,
    text = title,
    horizontalAlignment = Enum.TextHorizontalAlignment.Left,
})
```

The nested TextSpec supplies the localized content and may optionally override text-style fields such as `size`, `color`, `adaptiveFontSize`, or `minimumFontSize`. Outer layout props such as `fillWidth`, `height`, and alignment constraints remain intact. If the nested spec omits typography, semantic defaults from `Heading`, `Label`, or `Caption` continue to apply.

That makes application data reusable without manual calls to `UI.ResolveText`:

```lua
local item = {
    description = {
        text = "Added the Anemo DMR.",
        textId = "Updates.2026_08_17.AnemoDMR.Description",
    },
}

UI.TextWindow(parent, {
    fillWidth = true,
    fitContentHeight = true,
    text = item.description,
})
```

Literal/non-localized text simply omits `textId`:

```lua
UI.Caption(parent, {
    text = "v1.4.2",
    needsTranslation = false,
    fitWidth = true,
fitWidthPadding = 16,
})
```

`needsTranslation` only matters to extraction when a `textId` exists.

## Composed components

Composed components put the TextSpec under the semantic role name.

### Button

```lua
UI.Button(parent, {
    label = {
        text = "PLAY",
        textId = "MainMenu.Play",
    },
})
```

### Alert / Toast

```lua
UI.Alert(parent, {
    title = {
        text = "INVENTORY FULL",
        textId = "Inventory.Full.Title",
    },
    message = {
        text = "Remove an item before collecting another.",
        textId = "Inventory.Full.Message",
    },
})
```

### Stat

```lua
UI.Stat(parent, {
    label = {
        text = "WINS",
        textId = "Stats.Wins",
    },
    value = {
        text = "24",
        needsTranslation = false,
    },
})
```

### Tabs / SegmentedControl

Items are tables so the localized label can coexist with arbitrary game metadata:

```lua
UI.Tabs(parent, {
    items = {
        {
            label = {
                text = "MATCH",
                textId = "Tabs.Match",
            },
            page = "match",
        },
        {
            label = {
                text = "DECK",
                textId = "Tabs.Deck",
            },
            page = "deck",
        },
    },
})
```

### PlayingCard

```lua
UI.PlayingCard(parent, {
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
    title = {
        text = "Flamecaller",
        textId = "Cards.Flamecaller.Name",
    },
    back = {
        title = {
            text = "RIVAL CARD",
            textId = "Cards.RivalCard",
        },
    },
})
```

## Code-first fallback behavior

Runtime probing confirmed that Miliastra behaves like this:

```text
existing ID -> translated/current-language text
missing ID  -> the ID string itself
```

MiliUI uses that behavior to support code-first localization.

```lua
UI.Button(parent, {
    label = {
        text = "PLAY AGAIN",
        textId = "Results.PlayAgain",
    },
})
```

The mapping does not need to exist in the editor yet. If `game.GetText("Results.PlayAgain")` returns the same ID, MiliUI displays the fallback `PLAY AGAIN`. Once the mapping is imported, the same code automatically displays the player's translation.

If a TextSpec contains a `textId` but no fallback `text`, MiliUI leaves the unresolved ID visible rather than silently rendering a blank string.

## Dynamic localized text

Do not build localized sentences by concatenating translated fragments with runtime values. Word order differs between languages.

Use named placeholders:

```lua
UI.Text(parent, {
    text = "Collected {count} items",
    textId = "Collection.CollectedItems",
    args = {
        count = 17,
    },
    fitWidth = true,
fitWidthPadding = 16,
})
```

The English spreadsheet value may be:

```text
Collected {count} items
```

while another language may place `{count}` elsewhere. MiliUI calls `game.GetText` first, then substitutes named placeholders.

Unknown placeholders are preserved literally so mistakes remain visible:

```text
Collected {missing} items
```

## Updating text after creation

Component setters accept TextSpecs:

```lua
button:SetLabel({
    text = "REMATCH",
    textId = "Results.Rematch",
})

alert:SetMessage({
    text = "Round {round}",
    textId = "Match.Round",
    args = { round = 3 },
})
```

For a raw/native text-bearing control:

```lua
UI.SetText(control, {
    text = "READY",
    textId = "Status.Ready",
})
```

To resolve without binding a control:

```lua
local text = UI.ResolveText({
    text = "READY",
    textId = "Status.Ready",
})
```

`UI.RefreshLocalization()` re-resolves every live localization binding. Normal Miliastra gameplay does not need this for language switching because the player's language is not changed mid-session; the helper remains useful for debugging or explicit refresh workflows.

## Generating the editor CSV

MiliUI includes the public [localization extraction utility](../tools/extract_localization.py):

```text
tools/extract_localization.py
```

Scan one file:

```bash
python tools/extract_localization.py test.lua -o Localization.csv
```

Scan a directory recursively:

```bash
python tools/extract_localization.py Scripts -o Localization.csv
```

Print discovered IDs and source locations:

```bash
python tools/extract_localization.py Scripts -o Localization.csv --list
```

The output uses UTF-8 with BOM and the editor-compatible columns:

```text
Text Mapping ID
Need translation?
English
Simplified Chinese
Traditional Chinese
Korean
Japanese
Spanish
French
Russian
Thai
Vietnamese
German
Indonesian
Portuguese
Turkish
Italian
```

The extractor discovers literal `textId = "..."` TextSpecs recursively, including nested `label`, `title`, `message`, `value`, card fields, and item labels.

`needsTranslation` defaults to `TRUE` when omitted.

## Preserving existing translations

After translators have filled non-English columns, regenerate with `--merge`:

```bash
python tools/extract_localization.py Scripts \
    --merge ExistingLocalization.csv \
    -o Localization.csv
```

For every Text Mapping ID still present in source code:

- English is refreshed from the Lua fallback `text`;
- `Need translation?` is refreshed from `needsTranslation`;
- existing non-English cells are preserved.

This lets code remain authoritative for mapping IDs and English text without discarding completed translations.

## Duplicate mapping IDs

Reusing the same `textId` in multiple places is valid when the English fallback and `needsTranslation` metadata agree.

The extractor rejects conflicting definitions such as:

```lua
{ text = "PLAY", textId = "MainMenu.Play" }
{ text = "START", textId = "MainMenu.Play" }
```

That is intentional. One Text Mapping ID should describe one source string; conflicting English text would make the spreadsheet ambiguous.

## What should not be translated

A mapping may still be useful while `Need translation?` is false:

```lua
{
    text = "v1.4.2",
    textId = "Build.Version",
    needsTranslation = false,
}
```

`needsTranslation = false` affects the generated CSV only. At runtime, if the mapping exists, MiliUI still uses `game.GetText(textId)`, matching Miliastra's normal Script Text Variable behavior.

For text that does not need a mapping at all, omit `textId` entirely.