# Repeater and ListView

`UI.Repeater` and `UI.ListView` remove manual create/destroy/reorder
boilerplate from data-driven UI.

They deliberately do **not** own selection semantics. Rows remain normal MiliUI
controls and can use Button, Checkbox, custom interaction, or game-specific
state without forcing every list into one selection model.

## Direction and logical order

The canonical flow values are:

```text
top-down     -- default
bottom-up
left-right
right-left
```

`SetItems(items)` always treats the array as the logical sequence. MiliUI maps
that sequence onto the configured visual direction. For example, with
`bottom-up`, logical item 1 appears at the bottom and later items extend
upward.

`AddItem(item)` appends to the logical sequence, so it naturally appears at the
visual end of the configured direction. `AddItem(item, index)` remains the
explicit override for uncommon insertion logic.

`UI.ListView` is currently vertically scrollable and therefore supports
`top-down` and `bottom-up`. `UI.Repeater` supports all four directions.
Legacy `vertical` and `horizontal` Repeater values remain accepted as aliases
for `top-down` and `left-right`.

Direction can also change at runtime:

```lua
list:SetDirection("bottom-up")

repeater:SetDirection("right-left")
```

ListView can switch between its two vertical directions. Repeater can reverse
within its existing axis at runtime (`top-down ↔ bottom-up` or
`left-right ↔ right-left`). Switching a Repeater between vertical and
horizontal after creation is rejected because that would also change its
intrinsic sizing contract.


## Repeater

```lua
local weapons = UI.Repeater(parent, {
    items = weaponData,
    key = "id",
    fillWidth = true,
    gap = 10,

    renderItem = function(parent, weapon)
        local row = UI.Button(parent, {
            fillWidth = true,
            height = 64,
            label = {
                text = weapon.name,
                needsTranslation = false,
            },
        })

        return row
    end,

    updateItem = function(row, weapon)
        row:SetLabel({
            text = weapon.name,
            needsTranslation = false,
        })
    end,
})
```

Update it without rebuilding unchanged keyed rows:

```lua
weapons:SetItems(nextWeaponData)
```

For ordinary mutations, MiliUI also provides convenience methods:

```lua
weapons:AddItem(newWeapon)       -- append to logical end
weapons:AddItem(newWeapon, 3)    -- explicit insert at logical position 3
weapons:RemoveItem("weapon-17")  -- remove by resolved stable key
```

The explicit APIs stay public for complex application logic: `SetItems` can
replace the whole exact sequence, and indexed `AddItem` can insert anywhere.
MiliUI never invents sorting from IDs, names, timestamps, or other game-specific
fields.

A key may be a field name:

```lua
key = "weaponId"
```

or a function:

```lua
key = function(item)
    return item.weaponId
end
```

When `key` is omitted, the current 1-based index is used. That is convenient
for simple static lists, but an explicit stable key should be used when items
can be inserted, removed, or reordered.

Keys must be unique strings or numbers.

## Persistent sorting vs one-time sorting

Direction and sorting are separate concepts. `direction` controls where the
logical sequence flows visually; sorting controls the logical sequence itself.

For the common case, configure a persistent sort policy:

```lua
local list = UI.ListView(parent, {
    items = players,
    key = "id",
    sort = {
        key = "score",
        order = "descending",
    },
    -- ...
})
```

Persistent sorting is reapplied by `SetItems`, `AddItem`, and later list
mutations. Adding a higher-scoring item therefore moves it directly into its
sorted position rather than blindly staying at the physical end.

Change the policy at runtime. Common field sorting has a shorthand:

```lua
list:SetSort("name", "asc")
list:SetSort("score", "desc")
list:ClearSort()
```

The full form is equivalent:

```lua
list:SetSort({
    key = "name",
    order = "ascending",
})
```

Complex ordering can use a comparator directly:

```lua
list:SetSort(function(left, right)
    if left.rarity ~= right.rarity then
        return left.rarity > right.rarity
    end
    return left.name < right.name
end)
```

For a one-time reorder that should **not** become the ongoing policy:

```lua
list:SortOnce("score", "desc")

-- Equivalent full form:
list:SortOnce({
    key = "score",
    order = "descending",
})
```

The current persistent policy, if any, is retained and will apply again on the
next normal data mutation. Built-in key sorting is stable for equal values.

### Reverse the actual sequence

`Reverse()` is intentionally different from `SortOnce()`. It permanently
reverses the **current logical sequence** and clears any persistent sort policy:

```lua
-- Current logical order: 1, 2, 3, 4
list:Reverse()
-- Now: 4, 3, 2, 1

list:AddItem(item5)
-- Now: 4, 3, 2, 1, 5
```

Use `Reverse()` when the reversed sequence itself should become the new source
order. Use `SetSort(...)` when future additions should continue being placed by
an ordering rule. `SortOnce(...)` remains available for the uncommon case where
only the current presentation should be reordered temporarily.

## Reconciliation behavior

For an existing key:

- When `updateItem` exists, the existing view is retained and `updateItem`
  receives the new item/index.
- Without `updateItem`, the view is retained only when the item value/table is
  the same. A changed item is safely rebuilt so stale content is not displayed.

New keys call `renderItem` and then immediately call `updateItem` when one is
configured, so construction and later reconciliation share the same data/state
synchronization path. Removed keys are destroyed. Reordering changes Stack order
without recreating reusable views.

`renderItem` must create and return one direct child of the supplied Stack.

## Empty state

```lua
renderEmpty = function(parent)
    return UI.Caption(parent, {
        text = "No items available.",
        fillWidth = true,
        height = 44,
    })
end
```

The empty view exists only while the item array is empty.

## ListView

`UI.ListView` is the scrolling data view. Unlike Repeater, it is **virtualized**:
the complete logical item list stays in Lua, while only rows intersecting the
current viewport window are actual native controls under the ScrollArea mask.

That distinction is intentional. Runtime testing showed Miliastra can leave
image-backed controls visually stale when a large tree of row controls moves
through one native mask. Keeping only the current render window under that mask
avoids that engine behavior and scales better for long lists.

```lua
local players = UI.ListView(parent, {
    items = playerData,
    key = "playerId",

    fillWidth = true,
    height = 500,
    itemHeight = 58,
    gap = 8,

    renderItem = function(parent, player)
        local row = UI.Button(parent, {
            height = 58,
            label = {
                text = player.name,
                needsTranslation = false,
            },
        })

        row:OnClick(function()
            OpenPlayer(player.playerId)
        end)

        return row
    end,

    updateItem = function(row, player)
        row:SetLabel({
            text = player.name,
            needsTranslation = false,
        })
    end,
})
```

### Row height

For the most deterministic virtualized layout, provide `itemHeight`:

```lua
itemHeight = 58
```

Variable-height data can provide a resolver:

```lua
itemHeight = function(item)
    return item.expanded and 96 or 54
end
```

If `itemHeight` is omitted, ListView measures the first rendered row and uses
that as the uniform row height. Until that measurement exists,
`estimatedItemHeight` (default `48`) is used.

### Virtualized row identity

Stable **data identity** is preserved by `key`, but off-screen row controls are
destroyed and recreated as they leave/re-enter the render window. Therefore:

- keep persistent application state in the item/key, not only on the native row;
- `GetEntry(key)` still returns logical metadata for off-screen items;
- `entry.view` is `nil` when that row is not currently rendered;
- `renderItem` can run again for the same key after scrolling.

`windowOverscan` optionally renders extra distance above/below the viewport.
The default is `0`, which is the safest setting for Miliastra's native mask.
Increase it only when runtime testing shows the extra pre-rendered rows are
useful.

ListView exposes `scrollArea` when lower-level scrolling control is needed.

## Repeater vs ListView

Use **Repeater** when every row should stay alive and stable, and the collection
does not need a scrolling virtual window.

Use **ListView** for scrollable collections. It preserves keyed logical data but
virtualizes native row controls so the mask only owns a small active subtree.

## Methods

Both components provide the same high-level data operations:

```text
SetItems
GetItems
GetEntry
GetEntryAt
GetEntries
SetDirection
GetDirection
SetSort
GetSort
ClearSort
SortOnce
Reverse
Refresh
AddItem
RemoveItem
Clear
Destroy
```

For ListView, `Refresh()` updates currently rendered rows, recomputes virtual
layout metadata, and refreshes the viewport window.

