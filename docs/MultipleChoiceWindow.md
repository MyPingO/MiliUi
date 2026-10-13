# `UI.MultipleChoiceWindow` was removed in beta.3

> **Outdated API:** The `UI.MultipleChoiceWindow(...)` constructor was removed in MiliUI **0.9.0-beta.3**. Do not copy examples using it into current projects. Use [`UI.Selection`](Selection.md) with `mode = "multiple"` instead.

## Current component: `UI.Selection`

![Multiple-selection tiles with Pyro and Cryo selected](images/components/selection-multiple-tiles.png)

```lua
local choices = UI.Selection(parent, {
    mode = "multiple",
    items = {
        { name = "Pyro" },
        { name = "Hydro" },
        { name = "Cryo" },
    },
    selected = { 1, 3 },
})

choices:OnChange(function(indices, selectedItems)
    print(indices[1], selectedItems[1].name)
end)
```

In multiple mode, selected indices are an ascending array of **1-based** positions. For visible single selection, `UI.Selection` also supports `mode = "single"`; for a compact segmented style use `appearance = "segmented"`. The old `UI.SegmentedControl(...)` constructor was also removed.

See the [beta.3 upgrade checklist](UpgradeBeta3.md), the [Selection guide](Selection.md), and the [complete API reference](Reference/README.md) for current behavior and signatures.

This page remains at its original URL so existing bookmarks and search results lead users to the supported API.
