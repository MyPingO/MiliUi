# API reference: Components Data Views

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_data_views.lua`  
**Coverage:** 8 classes, 67 fields, 4 aliases, 34 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [DataViews](../DataViews.md) · [Components](../Components.md)

## Classes, component props and return types

### `MiliUI.DataViewSortSpec`

| Field | Declared type | Description |
| --- | --- | --- |
| `key` | `string\|fun(item:any):any` | Field to sort by (e.g. `key = 'score'`) or a function returning the value for each item. |
| `order?` | `MiliUI.DataViewSortOrder` | Sort low-to-high/alphabetical with ascending order, or reverse with descending order. |

### `MiliUI.DataViewComparatorSortSpec`

| Field | Declared type | Description |
| --- | --- | --- |
| `compare` | `fun(left:any, right:any):boolean` | Function that decides which of two items should come first when sorting. Return `true` if the first item should be placed before the second. Example: `compare = function(left, right) return left.score < right.score end` sorts smaller scores first. |
| `order?` | `MiliUI.DataViewSortOrder` | Choose the sorting direction. 'asc' uses the order from your comparison function; 'desc' reverses it. Example: `order = 'desc'`. |

### `MiliUI.RepeaterEntry`

| Field | Declared type | Description |
| --- | --- | --- |
| `key` | `MiliUI.RepeaterKey` | Stable value used to identify an entry when the list changes. |
| `item` | `any` | Data item represented by this entry. |
| `index` | `integer` | Position of this item in its list. Lua counts from 1. |
| `view` | `MiliUI.Parent` | UI control created to display this data item. |

### `MiliUI.RepeaterProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `items?` | `any[]` | Data to show as repeated UI items. Example: `items = { 'Sword', 'Bow', 'Shield' }`. |
| `sort?` | `MiliUI.DataViewSort` | Optional rule to keep entries sorted, even after items are added or changed. |
| `key?` | `string\|fun(item:any, index:integer):MiliUI.RepeaterKey` | Keep the same UI entry attached to the same data item when the list changes. Use `key = 'id'` for an item's `id` field, or a function that returns a stable ID from the item and index. Without a stable key, sorting can mix up entries. |
| `renderItem` | `fun(parent:MiliUI.Stack, item:any, index:integer, key:MiliUI.RepeaterKey):MiliUI.Parent` | Create the UI for **one item** in this list. MiliUI gives your function a container (`parent`), the item's data (`item`), its position starting at 1 (`index`), and its stable identifier (`key`). Return the UI element you create. See `UI.Repeater` for a complete example. |
| `updateItem?` | `fun(view:MiliUI.Parent, item:any, index:integer, entry:MiliUI.RepeaterEntry)` | Optional function for **updating an existing item on screen**, instead of deleting and recreating its UI. MiliUI gives you its already-created control (`view`), new data (`item`), position (`index`), and entry details (`entry`). Useful when a score or label changes. |
| `renderEmpty?` | `fun(parent:MiliUI.Stack):MiliUI.Parent` | Optional function that creates a message or other UI to show when this list has **no items**. Example: `renderEmpty = function(parent) return UI.Text(parent, { text = 'No items found' }) end`. |
| `direction?` | `MiliUI.DataViewDirection` | Choose how the items are arranged. For example, `'top-down'` puts the next item below the previous one. Default: `'top-down'`. |
| `gap?` | `number` | Empty space between neighboring items, in UI units. |
| `align?` | `MiliUI.StackAlign` | Choose how items line up **across** the direction of the list. In a vertical list, this means left, center, or right. |
| `justify?` | `MiliUI.StackJustify` | Choose where items sit **along** the list's direction: at the start, in the center, at the end, or spread apart. |
| `padding?` | `number` | Empty space **inside** this list's outer edges. Example: `padding = 12` adds 12 UI units on each side. |
| `paddingX?` | `number` | Empty space **inside** the list on its left and right sides. Example: `paddingX = 12`. |
| `paddingY?` | `number` | Empty space **inside** the list at its top and bottom. Example: `paddingY = 8`. |
| `paddingLeft?` | `number` | Empty space between the list's left edge and its items. |
| `paddingRight?` | `number` | Empty space between the list's right edge and its items. |
| `paddingTop?` | `number` | Empty space before the list's first row at the top. |
| `paddingBottom?` | `number` | Empty space after the list's last row at the bottom. |
| `fitContent?` | `boolean` | Let the Repeater size itself to fit the UI elements it contains instead of using a fixed size. Set `fitContent = true`. |
| `fitWidth?` | `boolean` | Let the Repeater choose its width from the combined widths of the items it contains. Set `fitWidth = true`. This is a **true/false setting**, not a numeric width. |
| `fitHeight?` | `boolean` | Let the Repeater choose its height from the combined heights of the items it contains. Set `fitHeight = true`. This is a **true/false setting**, not a numeric height. |

### `MiliUI.Repeater`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `content` | `MiliUI.ContainerControl` | Container where you can add custom child UI. |
| `stack` | `MiliUI.Stack` | Row or Column responsible for arranging the items. |
| `entries` | `MiliUI.RepeaterEntry[]` | Created UI entries corresponding to the displayed data. |
| `emptyView?` | `MiliUI.Parent` | UI shown when there are no items to display. |

### `MiliUI.ListViewEntry`

| Field | Declared type | Description |
| --- | --- | --- |
| `key` | `MiliUI.RepeaterKey` | Stable value used to identify an entry when the list changes. |
| `item` | `any` | Data item represented by this entry. |
| `index` | `integer` | Position of this item in the list, counting from **1** (the first item). |
| `view?` | `MiliUI.Parent` | Present only while the row is in the rendered viewport window. |
| `visualIndex?` | `integer` | Current visual 1-based index after direction is applied. |
| `height?` | `number` | Height calculated for this row, in UI units. |
| `layoutStart?` | `number` | Distance from the top of the logical scroll content. |
| `layoutEnd?` | `number` | Distance from the top of the full list content to the **end** of this row, in UI units. |

### `MiliUI.ListViewProps`

**Inherits from:** [`MiliUI.ScrollAreaProps`](components_scroll_area.md#miliuiscrollareaprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `direction?` | `'top-down'\|'bottom-up'` | Vertical flow direction. Default top-down. |
| `items?` | `any[]` | Data shown as a scrollable list. Each entry is created from one item in this array. |
| `sort?` | `MiliUI.DataViewSort` | Persistent sort policy applied by SetItems/AddItem and later mutations. |
| `key?` | `string\|fun(item:any, index:integer):MiliUI.RepeaterKey` | Stable ID for each item so sorting and updates preserve the correct row. Use `key = 'id'` or a function receiving the item and its index and returning a stable ID. |
| `itemHeight?` | `number\|fun(item:any, index:integer, key:MiliUI.RepeaterKey):number` | Height of list entries in UI units. Set a number for equal-height rows, or provide a function receiving the item, index, and key when different rows need different heights. |
| `estimatedItemHeight?` | `number` | Approximate height of one row, used before MiliUI knows its exact size. Example: `estimatedItemHeight = 48` helps the list estimate its total scrollable height. |
| `windowOverscan?` | `number` | How many extra rows to create just **outside the visible part** of the list, so the next rows are ready when the player scrolls. A larger value may make quick scrolling smoother, but uses more UI controls. |
| `gap?` | `number` | Empty space between consecutive list rows, in UI units. Example: `gap = 8`. Default: `0`. |
| `padding?` | `number` | Empty space **inside** the outer edges of the scrolling list. Example: `padding = 12`. |
| `paddingX?` | `number` | Empty space **inside** the scrolling list on its left and right sides. |
| `paddingY?` | `number` | Empty space **inside** the scrolling list at its top and bottom. |
| `paddingLeft?` | `number` | Empty space between the list's left edge and each row. |
| `paddingRight?` | `number` | Empty space between the list's right edge and each row. |
| `paddingTop?` | `number` | Empty space before the first row of the scrolling list. |
| `paddingBottom?` | `number` | Empty space after the last row of the scrolling list. |
| `renderItem` | `fun(parent:MiliUI.Parent, item:any, index:integer, key:MiliUI.RepeaterKey):MiliUI.Parent` | Function that creates the UI for one list row. It receives a parent control, the item, its 1-based index, and its key; create a child under that parent and return the row's root control. |
| `updateItem?` | `fun(view:MiliUI.Parent, item:any, index:integer, entry:MiliUI.ListViewEntry)` | Optional function that updates an already-created list row after its data changes. MiliUI passes the existing row control, new item data, list position, and entry details. |
| `renderEmpty?` | `fun(parent:MiliUI.Parent):MiliUI.Parent` | Optional function that creates a message to show when the list has no items. Example: `renderEmpty = function(parent) return UI.Text(parent, { text = 'Nothing found' }) end`. |

### `MiliUI.ListView`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `content` | `MiliUI.ContainerControl` | Container where you can add custom child UI. |
| `viewport` | `MiliUI.ContainerControl` | Visible part of the scrolling content; material outside is clipped. |
| `scrollbar?` | `MiliUI.Scrollbar` | Scrollbar used to move through the content. |
| `scrollArea` | `MiliUI.ScrollArea` | Underlying scrollable region that moves list content. |
| `entries` | `MiliUI.ListViewEntry[]` | Logical entries. Off-screen entries normally have view=nil. |
| `direction` | `'top-down'\|'bottom-up'` | The direction associated with this list view. |
| `emptyView?` | `MiliUI.Parent` | UI shown when there are no items to display. |

## Type aliases and enum values

### `MiliUI.RepeaterKey`

```lua
---@alias MiliUI.RepeaterKey string|number
```

### `MiliUI.DataViewDirection`

```lua
---@alias MiliUI.DataViewDirection 'top-down'|'bottom-up'|'left-right'|'right-left'
```

### `MiliUI.DataViewSortOrder`

```lua
---@alias MiliUI.DataViewSortOrder 'ascending'|'descending'|'asc'|'desc'
```

### `MiliUI.DataViewSort`

```lua
---@alias MiliUI.DataViewSort string|fun(left:any, right:any):boolean|MiliUI.DataViewSortSpec|MiliUI.DataViewComparatorSortSpec
```

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Repeater:SetItems(items)`

Replace this component's items with the new Lua list you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `items` | `any[]` | — |
| Returns | `MiliUI.Repeater` | — |

**Original LuaLS annotations:**

```lua
---@param items any[]
---@return MiliUI.Repeater
```


### `Repeater:GetItems()`

Return the current Lua list of items.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `any[]` | items |

**Original LuaLS annotations:**

```lua
---@return any[] items
```


### `Repeater:GetDirection()`

Return the current direction from this Repeater.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.DataViewDirection` | direction |

**Original LuaLS annotations:**

```lua
---@return MiliUI.DataViewDirection direction
```


### `Repeater:SetDirection(direction)`

Changes flow direction without changing logical item order. Runtime changes must stay on the existing axis.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `direction` | `MiliUI.DataViewDirection` | — |
| Returns | `MiliUI.Repeater` | — |

**Original LuaLS annotations:**

```lua
---@param direction MiliUI.DataViewDirection
---@return MiliUI.Repeater
```


### `Repeater:GetSort()`

Return the sorting rule this component is currently using.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.DataViewSort?` | sort |

**Original LuaLS annotations:**

```lua
---@return MiliUI.DataViewSort? sort
```


### `Repeater:SetSort(sort, order)`

Sets or replaces the persistent sort policy and immediately reapplies it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `sort` | `MiliUI.DataViewSort` | Field-name strings are shorthand for ascending key sort. |
| Parameter `order?` | `MiliUI.DataViewSortOrder` | Optional shorthand order, e.g. SetSort("score", "desc"). |
| Returns | `MiliUI.Repeater` | — |

**Original LuaLS annotations:**

```lua
---@param sort MiliUI.DataViewSort Field-name strings are shorthand for ascending key sort.
---@param order? MiliUI.DataViewSortOrder Optional shorthand order, e.g. SetSort("score", "desc").
---@return MiliUI.Repeater
```


### `Repeater:ClearSort()`

Disables persistent sorting without changing the current item order.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Repeater` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Repeater
```


### `Repeater:SortOnce(sort, order)`

Reorders current items once without replacing the persistent sort policy.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `sort` | `MiliUI.DataViewSort` | — |
| Parameter `order?` | `MiliUI.DataViewSortOrder` | Optional shorthand order, e.g. SortOnce("score", "desc"). |
| Returns | `MiliUI.Repeater` | — |

**Original LuaLS annotations:**

```lua
---@param sort MiliUI.DataViewSort
---@param order? MiliUI.DataViewSortOrder Optional shorthand order, e.g. SortOnce("score", "desc").
---@return MiliUI.Repeater
```


### `Repeater:Reverse()`

Permanently reverses the current logical sequence and clears persistent sorting.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Repeater` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Repeater
```


### `Repeater:GetEntry(key)`

Find a list entry by its stable key.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `MiliUI.RepeaterKey` | — |
| Returns | `MiliUI.RepeaterEntry?` | entry |

**Original LuaLS annotations:**

```lua
---@param key MiliUI.RepeaterKey
---@return MiliUI.RepeaterEntry? entry
```


### `Repeater:GetEntryAt(index)`

Find an entry by its position in the list, starting from `1`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Returns | `MiliUI.RepeaterEntry?` | entry |

**Original LuaLS annotations:**

```lua
---@param index integer
---@return MiliUI.RepeaterEntry? entry
```


### `Repeater:GetEntries()`

Return the UI entries currently associated with the data items.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.RepeaterEntry[]` | entries |

**Original LuaLS annotations:**

```lua
---@return MiliUI.RepeaterEntry[] entries
```


### `Repeater:Refresh()`

Re-runs updateItem for every current entry when configured, then refreshes layout.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Repeater` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Repeater
```


### `Repeater:AddItem(item, index)`

Appends an item by default, or inserts it at the supplied 1-based index.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `item` | `any` | — |
| Parameter `index?` | `integer` | — |
| Returns | `MiliUI.Repeater` | — |

**Original LuaLS annotations:**

```lua
---@param item any
---@param index? integer
---@return MiliUI.Repeater
```


### `Repeater:RemoveItem(key)`

Removes the item with the resolved stable key. Returns false when absent.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `MiliUI.RepeaterKey` | — |
| Returns | `boolean` | removed |

**Original LuaLS annotations:**

```lua
---@param key MiliUI.RepeaterKey
---@return boolean removed
```


### `Repeater:Clear()`

Remove the currently selected items, list entries, or notifications, depending on this component.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Repeater` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Repeater
```


### `Repeater:Destroy()`

Remove this component from the UI and release its controls.


### `ListView:SetItems(items)`

Replace this component's items with the new Lua list you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `items` | `any[]` | — |
| Returns | `MiliUI.ListView` | — |

**Original LuaLS annotations:**

```lua
---@param items any[]
---@return MiliUI.ListView
```


### `ListView:GetItems()`

Return the current Lua list of items.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `any[]` | items |

**Original LuaLS annotations:**

```lua
---@return any[] items
```


### `ListView:GetDirection()`

Return the current direction from this ListView.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `'top-down'\|'bottom-up'` | direction |

**Original LuaLS annotations:**

```lua
---@return 'top-down'|'bottom-up' direction
```


### `ListView:SetDirection(direction)`

Changes vertical flow direction without changing logical item order.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `direction` | `'top-down'\|'bottom-up'` | — |
| Returns | `MiliUI.ListView` | — |

**Original LuaLS annotations:**

```lua
---@param direction 'top-down'|'bottom-up'
---@return MiliUI.ListView
```


### `ListView:GetSort()`

Return the sorting rule this component is currently using.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.DataViewSort?` | sort |

**Original LuaLS annotations:**

```lua
---@return MiliUI.DataViewSort? sort
```


### `ListView:SetSort(sort, order)`

Sets or replaces the persistent sort policy and immediately reapplies it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `sort` | `MiliUI.DataViewSort` | Field-name strings are shorthand for ascending key sort. |
| Parameter `order?` | `MiliUI.DataViewSortOrder` | Optional shorthand order, e.g. SetSort("score", "desc"). |
| Returns | `MiliUI.ListView` | — |

**Original LuaLS annotations:**

```lua
---@param sort MiliUI.DataViewSort Field-name strings are shorthand for ascending key sort.
---@param order? MiliUI.DataViewSortOrder Optional shorthand order, e.g. SetSort("score", "desc").
---@return MiliUI.ListView
```


### `ListView:ClearSort()`

Disables persistent sorting without changing the current item order.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ListView` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ListView
```


### `ListView:SortOnce(sort, order)`

Reorders current items once without replacing the persistent sort policy.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `sort` | `MiliUI.DataViewSort` | — |
| Parameter `order?` | `MiliUI.DataViewSortOrder` | Optional shorthand order, e.g. SortOnce("score", "desc"). |
| Returns | `MiliUI.ListView` | — |

**Original LuaLS annotations:**

```lua
---@param sort MiliUI.DataViewSort
---@param order? MiliUI.DataViewSortOrder Optional shorthand order, e.g. SortOnce("score", "desc").
---@return MiliUI.ListView
```


### `ListView:Reverse()`

Permanently reverses the current logical sequence and clears persistent sorting.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ListView` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ListView
```


### `ListView:GetEntry(key)`

Find a list entry by its stable key.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `MiliUI.RepeaterKey` | — |
| Returns | `MiliUI.ListViewEntry?` | entry |

**Original LuaLS annotations:**

```lua
---@param key MiliUI.RepeaterKey
---@return MiliUI.ListViewEntry? entry
```


### `ListView:GetEntryAt(index)`

Find an entry by its position in the list, starting from `1`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Returns | `MiliUI.ListViewEntry?` | entry |

**Original LuaLS annotations:**

```lua
---@param index integer
---@return MiliUI.ListViewEntry? entry
```


### `ListView:GetEntries()`

Return the UI entries currently associated with the data items.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ListViewEntry[]` | entries |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ListViewEntry[] entries
```


### `ListView:Refresh()`

Updates currently rendered rows, recomputes virtual layout, and refreshes the rendered window.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ListView` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ListView
```


### `ListView:AddItem(item, index)`

Appends an item by default, or inserts it at the supplied logical 1-based index.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `item` | `any` | — |
| Parameter `index?` | `integer` | — |
| Returns | `MiliUI.ListView` | — |

**Original LuaLS annotations:**

```lua
---@param item any
---@param index? integer
---@return MiliUI.ListView
```


### `ListView:RemoveItem(key)`

Removes the item with the resolved stable key. Returns false when absent.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `key` | `MiliUI.RepeaterKey` | — |
| Returns | `boolean` | removed |

**Original LuaLS annotations:**

```lua
---@param key MiliUI.RepeaterKey
---@return boolean removed
```


### `ListView:Clear()`

Remove the currently selected items, list entries, or notifications, depending on this component.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ListView` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ListView
```


### `ListView:Destroy()`

Remove this component from the UI and release its controls.
