# Upgrading from beta.2 to beta.3

MiliUI `0.9.0-beta.3` changes the constructors for selections and dropdowns. **This is a breaking API migration.** Existing beta.2 scripts will fail if they still call the removed constructors. Make these edits on a backup or disposable Miliastra project before updating your working game.

## 1. Install and restart

1. Back up your project.
2. Use [MiliUI Manager](Manager.md) or the [manual installation steps](Installation.md#manual-installation) to install beta.3.
3. Restart Miliastra **Test Play** to load the new `MiliUI/init.lua`; an already-running Lua session will not reload a replaced runtime.
4. Install the beta.3 IntelliSense VSIX (version 0.1.9) separately if you use the editor integration.

The minimum compatible Manager remains 0.2.0. The optional starter `.gil` has been refreshed using the asset uploaded to the beta.2 release; it is verified by a new pinned SHA-256. After importing, check the bundled `MiliUI/init.lua` version and install beta.3 if needed.

## 2. Replace `UI.SegmentedControl` with single-mode `UI.Selection`

**Before (beta.2):**

```lua
local difficulty = UI.SegmentedControl(parent, {
    items = {
        { label = { text = "Easy" } },
        { label = { text = "Normal" } },
        { label = { text = "Hard" } },
    },
    selected = 2,
    width = 420,
})
```

**After (beta.3):**

```lua
local difficulty = UI.Selection(parent, {
    items = {
        { label = { text = "Easy" } },
        { label = { text = "Normal" } },
        { label = { text = "Hard" } },
    },
    mode = "single",
    appearance = "segmented",
    selected = 2,
    width = 420,
    height = 60,
})

difficulty:OnChange(function(index, item)
    print(index, item.label.text)
end)
```

Single mode defaults to `required = true`: one enabled choice is selected and clicking the active choice does not clear it. Set `required = false` if your UI must permit no selection. `GetSelected()` returns one 1-based integer (or `nil` when optional), not an array.

## 3. Replace `UI.MultipleChoiceWindow` with multiple-mode `UI.Selection`

**Before (beta.2):**

```lua
local elements = UI.MultipleChoiceWindow(parent, {
    items = {
        { name = "Pyro" },
        { name = "Hydro" },
        { name = "Cryo" },
    },
    selected = { 1, 3 },
    maximumSelected = 2,
    columns = 2,
})
```

**After (beta.3):**

```lua
local elements = UI.Selection(parent, {
    items = {
        { name = "Pyro" },
        { name = "Hydro" },
        { name = "Cryo" },
    },
    mode = "multiple",
    selected = { 1, 3 },
    maximumSelected = 2,
    columns = 2,
})

elements:OnChange(function(indices, items)
    print(indices[1], items[1].name)
end)
```

Multiple mode is the default, but explicitly specifying `mode = "multiple"` makes migrated examples easier to understand. `GetSelected()` and the callback receive an ascending array of 1-based indices, not a single value. `minimumSelected` is normally checked on submission rather than blocking temporary deselection; use `enforceMinimum = true` if you require enforcement during interaction.

## 4. Replace `UI.Select` with `UI.Dropdown`

**Before (beta.2):**

```lua
local elementPicker = UI.Select(parent, {
    items = {
        { name = "Pyro", elementId = 1 },
        { name = "Hydro", elementId = 2 },
    },
    selected = 2,
})
```

**After (beta.3):**

```lua
local elementPicker = UI.Dropdown(parent, {
    items = {
        { name = "Pyro", elementId = 1 },
        { name = "Hydro", elementId = 2 },
    },
    selected = 2,
})

elementPicker:OnChange(function(index, item)
    print(index, item.elementId)
end)
```

Dropdown keeps a single selected item and supports the same general menu, overlay, and long-list controls. Item metadata is preserved. Review each call rather than renaming unrelated uses of `select` in Lua.

## 5. Audit selection behavior

Check these differences in your project:

- **Constructors:** Search active scripts for `UI.SegmentedControl`, `UI.MultipleChoiceWindow`, and `UI.Select`. Do not modify historical beta.2 examples or changelogs intended to describe that version.
- **Indexes:** New Selection/Dropdown examples use 1-based item indexes. Review any old `selectedIndex` props; do not assume they are equivalent to the new `selected` field.
- **Callbacks:** Single mode sends a scalar index and item; multiple mode sends arrays. Update uses of `GetSelected()`, `OnChange`, and `onSubmit` accordingly.
- **Submission:** Single Selection uses scalar ServerSignal parameter types such as `Int` or `String`. Multiple Selection aggregates matching list types such as `IntList` or `StringList`. Verify the receiving Server Node Graph parameters.
- **Appearance and focus:** For the old segmented look, use `appearance = "segmented"` on single-mode Selection. Exercise mouse, touch, controller navigation, Confirm, Cancel, and disabled items.

See the detailed [Selection](Selection.md) and [Dropdown](Dropdown.md) guides before migrating custom renderers or advanced selection limits.

## 6. Verify in Miliastra

On a test copy of your game:

1. Open and close each Host and Page; verify that page switching, session state, signals, and cleanup still work.
2. Change choices in a segmented Selection, optional and required single-mode Selection, and multi-mode Selection.
3. Open a Dropdown in a ScrollArea or Accordion, navigate a long list, close it with Cancel or an outside click, and confirm the value.
4. Test controller focus in both dropdowns and visible choices.
5. Check a fresh Manager install and a beta.2 to beta.3 update, including backup creation.
6. Verify that release documentation images and code examples match what appears in Test Play.

See the [published beta.3 release notes](../RELEASE_NOTES.md) for complete release details.
