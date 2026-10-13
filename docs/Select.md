# `UI.Select` was removed in beta.3

> **Outdated API:** The `UI.Select(...)` constructor was removed in MiliUI **0.9.0-beta.3**. Do not copy examples using it into current projects. Use [`UI.Dropdown`](Dropdown.md) instead.

## Current component: `UI.Dropdown`

The current dropdown looks like the examples below. It supports single selection, disabled choices, long-list scrolling, and optional Server Signal submission.

| Closed dropdown | Open dropdown |
| --- | --- |
| ![A closed single-choice dropdown showing Hydro](images/components/dropdown-closed.png) | ![Dropdown open with Pyro, Hydro, Cryo and Electro](images/components/dropdown-open.png) |

```lua
local dropdown = UI.Dropdown(parent, {
    items = {
        { name = "Pyro" },
        { name = "Hydro" },
        { name = "Cryo" },
    },
    selected = 2,
})

dropdown:OnChange(function(index, item)
    print(index, item and item.name)
end)
```

Existing beta.2 calls to `UI.Select(parent, props)` must be changed to `UI.Dropdown(parent, props)`. See the [beta.3 upgrade checklist](UpgradeBeta3.md#4-replace-uiselect-with-uidropdown) and [complete API reference](Reference/README.md) for the current signatures, props, and methods.

This page remains at its original URL so existing bookmarks and search results lead users to the supported API.
