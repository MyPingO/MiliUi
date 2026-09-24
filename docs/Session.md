# Session persistence

`UI.Session` stores logical UI state separately from Miliastra Client Controls. It can therefore survive temporary host/root recreation inside the same Lua session, including the Control Group/teleport lifecycle observed during MiliUI testing.

Session is the reason a replacement native UI root can rebuild the same logical page state instead of behaving like a completely unrelated menu.

For the recommended Control Group setup, see [ControlGroups.md](ControlGroups.md).

## What Session does and does not mean

Session can remember things such as:

```text
which Menu pages are logically open
which page is frontmost inside Menu
which Select item was chosen
which Toggle value was set
where a ScrollArea was scrolled
custom plain Lua page state
```

It does **not** permanently save player data. It is in-memory Lua module state.

## Host-scoped open pages

Open-page ordering belongs to a host:

```lua
UI.Session.OpenPage("Menu", "Inventory")
UI.Session.OpenPage("Menu", "Item Details")
UI.Session.OpenPage("Overlay", "Confirm Dialog")
```

Queries also name the host:

```lua
UI.Session.GetOpenPages("Menu")
UI.Session.GetActivePage("Menu")
```

Each result is independent. There is no global active page because separate Miliastra roots/Control Group Layers do not have one meaningful shared sibling order.

For normal game code, prefer `UI.Pages`; it keeps this lower-level logical registry synchronized with live page roots.

## Page scopes

`UI.Pages` builds every registered page inside an explicit Session scope matching its globally-unique page ID.

Outside `WithScope`, state falls back directly to the global Session scope. It does not infer a scope from an active page because active pages are host-specific.

```lua
UI.Session.WithScope("Inventory", function()
    UI.Select(parent, {
        id = "Sort Mode",
        remember = true,
        items = sortItems,
    })
end)
```

## Persistence IDs

`name` is the native/debug control name. It does not identify remembered state.

`id` is the stable MiliUI persistence identity:

```lua
UI.Toggle(parent, {
    id = "Music Enabled",
    name = "Toggle",
    remember = true,
})
```

With `remember = true`, a stable `id` is required. IDs must be unique among live remembered components in the same Session scope. The same component ID may be reused in different page scopes.

A custom persistence ID can also be supplied directly:

```lua
UI.Select(parent, {
    remember = "Selected Update",
    items = updateItems,
})
```

or with an explicit scope:

```lua
UI.Toggle(parent, {
    remember = {
        id = "Music Enabled",
        scope = "Settings",
    },
})
```

## Automatic component state

The current adapters remember:

- `Slider` value
- `Toggle` value
- `Checkbox` value
- `Stepper` value
- `SegmentedControl` selected index
- `Tabs` selected index
- `Select` selection
- `MultipleChoiceWindow` selected indices
- `Scrollbar` value
- `ScrollArea` scroll offset

When one host detaches, only live persistence bindings owned by that host are released. Saved Session values remain, and bindings belonging to other hosts remain valid.

That is why Menu and HUD can be recreated independently without resetting each other's state.

## Custom state

Use `UI.Session.State` for game-specific page data:

```lua
local state = UI.Session.State("Updates State", {
    SelectedEntryId = "september-13-2026",
})

state.SelectedEntryId = "august-30-2026"
```

Assignments update the Session-backed table immediately.

For one standalone value:

```lua
local selectedArticle = UI.Session.Value("Selected Article", 1)
selectedArticle:Set(2)
```

Keep Session values to logical data such as strings, numbers, booleans, and plain Lua tables. Do not store native Client Controls or callbacks.

## Closing versus host loss

Closing removes a page from its host's logical open-page order but leaves its saved values:

```lua
UI.Pages.Close("Updates")
```

Temporary native host loss preserves the logical page order as well as saved values:

```lua
UI.Hosts.Detach("Menu")
```

After a replacement Control Group/root is attached, restoration remains explicit:

```lua
UI.Hosts.Attach("Menu", newRoot)
UI.Pages.Restore("Menu")
```

Forget all state associated with a page ID:

```lua
UI.Session.ClearPage("Updates")
```

Clear one key:

```lua
UI.Session.Remove("Patch Notes", "Updates")
```

Clear all Session state and all host page orders:

```lua
UI.Session.Clear()
```

## Control Group removal is not automatically a logical close

When Miliastra removes a Control Group, the attached script normally calls `UI.Hosts.Detach(hostId)`. Detach preserves logical pages because the same UI may be recreated later.

If the game intends to forget that logical page as part of a real close flow, call `UI.Pages.Close(...)` or `UI.Pages.CloseAll(hostId)` deliberately before/while performing that game action.

This is a policy decision for the game. MiliUI does not guess whether native root loss means "temporarily recreated" or "the player is permanently done with this page."

## Lifetime

Session persistence is in-memory Lua module state. It is not permanent player save data. It does not survive leaving the game, reconnecting, or a complete Lua runtime restart.
