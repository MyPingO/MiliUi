# API reference: Api

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `api.lua`  
**Coverage:** 1 classes, 20 fields, 0 aliases, 71 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [APIAtAGlance](../APIAtAGlance.md) · [Components](../Components.md) · [ControlGroups](../ControlGroups.md)

## Classes, component props and return types

### `MiliUI`

| Field | Declared type | Description |
| --- | --- | --- |
| `VERSION` | `string` | Current MiliUI runtime version. |
| `Theme` | `MiliUI.Theme` | Theme tokens and variants. |
| `Layout` | `MiliUI.LayoutAPI` | Tools for arranging **existing** UI controls in rows, columns, grids, or fans. Unlike `UI.Row` and `UI.Column`, many of these arrange items only once. |
| `Surface` | `MiliUI.SurfaceAPI` | Rounded/shell asset helpers. |
| `Style` | `MiliUI.StyleAPI` | Utility-style parser and theme helpers. |
| `Motion` | `MiliUI.MotionAPI` | Tools for making UI controls move, grow, shrink, rotate, or shake with animations. For example, `UI.Motion.Pulse(button)` plays a quick size pulse. |
| `Audio` | `MiliUI.AudioAPI` | 2D UI audio playback helpers. |
| `Interaction` | `MiliUI.InteractionAPI` | Cursor interaction helpers. |
| `Localization` | `MiliUI.LocalizationAPI` | Text Mapping ID resolution and refresh helpers. |
| `Hosts` | `MiliUI.HostsAPI` | Named Client UI roots with independent runtime ownership. |
| `Signals` | `MiliUI.SignalsAPI` | Host-owned server-to-client signal subscriptions. |
| `Variables` | `MiliUI.VariablesAPI` | Host-owned global Custom Variable reads/watchers. |
| `Pages` | `MiliUI.PagesAPI` | Host-aware ordered page registry backed by UI.Session. |
| `Navigation` | `MiliUI.NavigationAPI` | Optional per-Host sequential page history built on UI.Pages. |
| `Focus` | `MiliUI.FocusAPI` | Opt-in Screen-scoped native controller focus coordination, directional links and diagnostics. |
| `Session` | `MiliUI.SessionAPI` | In-memory logical UI state that survives Host recreation in the same Lua session. |
| `Player` | `MiliUI.PlayerAPI` | Optional local Player Entity lookup through a project-defined Player Custom Variable. |
| `ResponsiveLayout` | `MiliUI.ResponsiveClass` | Responsive layout class for layouts that adapt to available space. |
| `Diagnostics` | `MiliUI.DiagnosticsAPI` | Tools for finding controls that overflow their available area. |
| `TextMetrics` | `MiliUI.TextMetricsAPI` | Helpers for measuring text dimensions and detecting text that does not fit. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `UI.InitTemplates(templates)`

Configures the shared editor-created primitive/native templates used by every Host.
Repeated calls merge compatible template entries; conflicting IDs for an already
configured template kind are treated as configuration errors.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `templates` | `MiliUI.Templates` | — |
| Returns | `MiliUI` | — |

**Original LuaLS annotations:**

```lua
---@param templates MiliUI.Templates
---@return MiliUI
```


### `UI.Init(root, templates)`

Removed single-root lifecycle entry point. Calling this at runtime raises a
migration error. Configure shared templates with `UI.InitTemplates(...)`, then
attach each currently available Client UI root with `UI.Hosts.Attach(...)`.
```lua
UI.InitTemplates({
container = script:GetParam('ContainerTemplateId'),
image = script:GetParam('ImageTemplateId'),
text = script:GetParam('TextTemplateId'),
button = script:GetParam('ButtonTemplateId'),
cursorArea = script:GetParam('CursorAreaTemplateId'),
})
UI.Hosts.Attach('Menu', script.object)
```

**Deprecated:** Use UI.InitTemplates(...) and UI.Hosts.Attach(...).

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `root` | `MiliUI.Control` | — |
| Parameter `templates` | `MiliUI.Templates` | — |
| Returns | `MiliUI` | — |

**Original LuaLS annotations:**

```lua
---@deprecated Use UI.InitTemplates(...) and UI.Hosts.Attach(...).
---@param root MiliUI.Control
---@param templates MiliUI.Templates
---@return MiliUI
```


### `UI.DestroyAll()`

Destroys MiliUI-created controls/resources across every currently attached Host.
This is global teardown, not the normal `OnDestroy` path for one Control Group.
Prefer `UI.Hosts.Detach(hostId)` when one Host/root disappears.


### `UI.Destroy(value)`

Destroys a MiliUI component object or raw native control.
Component objects use their own Destroy method when available.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `MiliUI.Parent` | — |

**Original LuaLS annotations:**

```lua
---@param value MiliUI.Parent
```


### `UI.ResolveText(spec)`

Resolves a localized text specification without creating a control.
Unknown Text Mapping IDs return their fallback `text` because Miliastra
returns the mapping ID itself when game.GetText cannot find it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec?` | `MiliUI.TextSpec\|any` | — |
| Returns | `string` | — |

**Original LuaLS annotations:**

```lua
---@param spec? MiliUI.TextSpec|any
---@return string
```


### `UI.SetText(control, spec)`

Binds/updates a native text-bearing control with a localized text spec.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `spec?` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Control` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param spec? MiliUI.TextSpec|any
---@return MiliUI.Control
```


### `UI.RefreshLocalization()`

Re-runs game.GetText for every live localized text binding.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | count |

**Original LuaLS annotations:**

```lua
---@return integer count
```


### `UI.Screen(parent, props)`

Creates a canvas-sized responsive root with a padded `content` area.
Children parented to the returned Screen automatically use `screen.content`;
use `screen.root` for full-canvas overlays that should ignore padding.
```lua
local screen = UI.Screen(parent, { padding = 48 })
UI.Card(screen, { width = 480, height = 280 })
```

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ScreenProps` | — |
| Returns | `MiliUI.Screen` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ScreenProps
---@return MiliUI.Screen
```


### `UI.Box(parent, props)`

Creates a plain Client UI Container control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.BoxProps` | — |
| Returns | `MiliUI.ContainerControl` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.BoxProps
---@return MiliUI.ContainerControl
```


### `UI.Image(parent, props)`

Show an **image** inside an existing UI container.

**Example:**
```lua
local icon = UI.Image(parent, {
image = 100103,
width = 32,
height = 32,
})
```

`100103` is the right-chevron image asset ID in the Miliastra Image Library. `parent` is where the image appears.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ImageProps` | — |
| Returns | `MiliUI.ImageControl` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ImageProps
---@return MiliUI.ImageControl
```


### `UI.Text(parent, props)`

Show **text** in your UI. Use `text` for the message and `size` for the font size.

**Example:**
```lua
local message = UI.Text(parent, {
text = 'Welcome to the game',
size = 24,
color = 'text',
})
```

Here, `parent` is the existing container where the text should appear.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.TextProps` | — |
| Returns | `MiliUI.TextControl` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.TextProps
---@return MiliUI.TextControl
```


### `UI.Heading(parent, props)`

Semantic large text; defaults to size='xl', color='text'.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.TextProps` | — |
| Returns | `MiliUI.TextControl` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.TextProps
---@return MiliUI.TextControl
```


### `UI.Label(parent, props)`

Semantic normal label; defaults to size='sm', color='text'.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.TextProps` | — |
| Returns | `MiliUI.TextControl` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.TextProps
---@return MiliUI.TextControl
```


### `UI.Caption(parent, props)`

Semantic secondary text; defaults to size='xs', color='muted'.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.TextProps` | — |
| Returns | `MiliUI.TextControl` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.TextProps
---@return MiliUI.TextControl
```


### `UI.Icon(parent, props)`

Creates a square image icon. Default size is 48.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.IconProps` | — |
| Returns | `MiliUI.ImageControl` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.IconProps
---@return MiliUI.ImageControl
```


### `UI.SurfaceControl(parent, props)`

Creates a rounded surface with background/border/content handles.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.SurfaceProps` | — |
| Returns | `MiliUI.Panel` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.SurfaceProps
---@return MiliUI.Panel
```


### `UI.Panel(parent, props)`

Create a **Panel**: a rectangle that groups other UI elements on a shared background.
Use `padding` for space between its edges and its contents.

**Example:**
```lua
local panel = UI.Panel(parent, {
width = 320,
padding = 16,
background = 'surface',
radius = 'lg',
})
local button = UI.Button(panel.content, {
label = { text = 'Confirm' },
})
```

Here, `parent` is an existing container. Add children to `panel.content` to put them **inside** the Panel.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.SurfaceProps` | — |
| Returns | `MiliUI.Panel` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.SurfaceProps
---@return MiliUI.Panel
```


### `UI.Button(parent, props)`

Create a **Button** the player can click with a mouse, tap, or activate with a controller.

**Example:**
```lua
local button = UI.Button(parent, {
label = { text = 'Play' },
width = 200,
height = 56,
onClick = function()
print('Play button pressed')
end,
})
```

Here, `parent` is an existing UI container, such as a Column or Panel's content. `button` is the new Button saved in a variable so you can change it later.

**Example: add a controller focus indicator to a Button.**
```lua
local playButton = UI.Button(parent, {
label = { text = 'Play' },
controllerFocusIndicator = {
placement = 'inside-right',
gap = 8,
size = 20,
animation = false,
},
})
```

The focus indicator shows which Button is selected using a controller. `'inside-right'` places it inside the right edge of that Button; `animation = false` keeps it from moving.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ButtonProps` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ButtonProps
---@return MiliUI.Button
```


### `UI.Hitbox(parent, props)`

Creates an invisible Cursor Event Area interaction target. Hitboxes do not inherit native Preset Button click audio.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.HitboxProps` | — |
| Returns | `MiliUI.Hitbox` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.HitboxProps
---@return MiliUI.Hitbox
```


### `UI.Hover(control, options)`

Adds reusable hover/press motion. Wrapper objects are accepted directly.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.HoverProps` | — |
| Returns | `MiliUI.Hover` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.HoverProps
---@return MiliUI.Hover
```


### `UI.Bind(control, callbacks)`

Binds multiple cursor callbacks to a native control or wrapper.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `callbacks?` | `MiliUI.HitboxCallbacks` | — |
| Returns | `MiliUI.Binding` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param callbacks? MiliUI.HitboxCallbacks
---@return MiliUI.Binding
```


### `UI.BindKeys(control, eventTypes, callback)`

Binds several native key-event types to one host-owned action callback.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `eventTypes` | `any[]` | Enum.KeyEventType values. |
| Parameter `callback` | `fun(...):boolean?` | — |
| Returns | `MiliUI.KeyBinding` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param eventTypes any[] Enum.KeyEventType values.
---@param callback fun(...):boolean?
---@return MiliUI.KeyBinding
```


### `UI.Divider(parent, props)`

Add a visible **divider line** to separate sections of your interface.
**Example:** `local divider = UI.Divider(parent, { width = 250, height = 2 })` creates a 250-unit-wide line inside an existing `parent` container.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ImageProps` | — |
| Returns | `MiliUI.ImageControl` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ImageProps
---@return MiliUI.ImageControl
```


### `UI.ScrollArea(parent, props)`

Create a **scrolling area** for a list that is taller than the space you want to show.
Only the content within the visible area can be seen; players can scroll to reach the rest.

**Example:**
```lua
local area = UI.ScrollArea(parent, {
width = 360,
height = 200,
contentHeight = 600,
})
local button = UI.Button(area.content, {
label = { text = 'First option' },
})
```

`parent` is an existing UI container. Add child elements to `area.content`, **not** directly to `area`. Here, 200 UI units are visible at a time from content that is 600 units tall.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ScrollAreaProps` | — |
| Returns | `MiliUI.ScrollArea` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ScrollAreaProps
---@return MiliUI.ScrollArea
```


### `UI.Scrollbar(parent, props)`

Creates a vertical scrollbar using the shared Theme.scrollbar defaults.
Lower values are at the top; higher values move the thumb downward.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ScrollbarProps` | — |
| Returns | `MiliUI.Scrollbar` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ScrollbarProps
---@return MiliUI.Scrollbar
```


### `UI.Dropdown(parent, props)`

Create a **Dropdown**: the player clicks it to open a list and pick one option.

**Example:**
```lua
local difficultySelect = UI.Dropdown(parent, {
width = 300,
placeholder = { text = 'Choose difficulty' },
items = {
{ label = { text = 'Easy' } },
{ label = { text = 'Normal' } },
{ label = { text = 'Hard' } },
},
onChange = function(index, item)
if item then
print('Selected option:', index)
end
end,
})
```

`parent` is an existing UI container. The new dropdown is stored in `difficultySelect`, so it can be updated later.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props` | `MiliUI.DropdownProps` | — |
| Returns | `MiliUI.Dropdown` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props MiliUI.DropdownProps
---@return MiliUI.Dropdown
```


### `UI.Popover(parent, props)`

Creates an interactive anchored surface. The anchor may be nested below the
overlay parent; MiliUI resolves its bounds into the overlay parent's space.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props` | `MiliUI.PopoverProps` | — |
| Returns | `MiliUI.Popover` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props MiliUI.PopoverProps
---@return MiliUI.Popover
```


### `UI.Tooltip(parent, props)`

Creates a passive hover tooltip using the same anchored-placement foundation
as Popover. The tooltip itself does not capture pointer input.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props` | `MiliUI.TooltipProps` | — |
| Returns | `MiliUI.Tooltip` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props MiliUI.TooltipProps
---@return MiliUI.Tooltip
```


### `UI.Repeater(parent, props)`

Create a **Repeater** to display the same kind of UI for every item in a table (a Lua list).
Use `renderItem` to describe one item; MiliUI calls it for each item.

**Example:**
```lua
local inventory = UI.Repeater(parent, {
items = {
{ id = 'sword', name = 'Sword' },
{ id = 'bow', name = 'Bow' },
},
key = 'id',
renderItem = function(itemParent, item)
return UI.Text(itemParent, { text = item.name })
end,
})
```

The `itemParent` value is the container provided by MiliUI for each entry. `item` is the data for one entry. `inventory` is the finished Repeater.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props` | `MiliUI.RepeaterProps` | — |
| Returns | `MiliUI.Repeater` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props MiliUI.RepeaterProps
---@return MiliUI.Repeater
```


### `UI.ListView(parent, props)`

Create a **scrolling list** that can efficiently show many items without creating every off-screen row at once.
Give it a table of items, a height for each row, and a `renderItem` function that creates one row.

**Example:**
```lua
local inventoryList = UI.ListView(parent, {
width = 360,
height = 240,
items = {
{ id = 'sword', name = 'Sword' },
{ id = 'bow', name = 'Bow' },
},
key = 'id',
itemHeight = 48,
renderItem = function(itemParent, item)
return UI.Text(itemParent, { text = item.name })
end,
})
```

Here, `parent` is an existing container and `inventoryList` is the new scrolling list. Each row displays one item's `name` value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props` | `MiliUI.ListViewProps` | — |
| Returns | `MiliUI.ListView` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props MiliUI.ListViewProps
---@return MiliUI.ListView
```


### `UI.Responsive(parent, props)`

Creates one responsive control tree that automatically changes grid density
and can fall back to focus mode instead of crushing children below their
minimum useful size. Descendant overflow does not silently change the
responsive presentation unless `validateOverflow = true` is explicitly set.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ResponsiveProps` | — |
| Returns | `MiliUI.ResponsiveLayout` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ResponsiveProps
---@return MiliUI.ResponsiveLayout
```


### `UI.CheckLayout(root, options)`

Convenience wrapper for UI.Diagnostics.Check.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `root` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.LayoutDiagnosticOptions` | — |
| Returns | `MiliUI.LayoutIssue[]` | — |

**Original LuaLS annotations:**

```lua
---@param root MiliUI.Parent
---@param options? MiliUI.LayoutDiagnosticOptions
---@return MiliUI.LayoutIssue[]
```


### `UI.SafeTextHeight(fontSize)`

Returns the calibrated safe single-line height for a normal UI.Text control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fontSize` | `MiliUI.TextSize` | — |
| Returns | `integer` | height |

**Original LuaLS annotations:**

```lua
---@param fontSize MiliUI.TextSize
---@return integer height
```


### `UI.SafeTextWindowHeight(fontSize)`

Returns the calibrated safe first-line height for UI.TextWindow.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fontSize` | `MiliUI.TextSize` | — |
| Returns | `integer` | height |

**Original LuaLS annotations:**

```lua
---@param fontSize MiliUI.TextSize
---@return integer height
```


### `UI.CheckTextGeometry(root, options)`

Checks MiliUI-created Text/TextWindow controls against calibrated safe-height
rules. This is separate from CheckLayout so layout issue counts stay stable.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `root` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.TextGeometryOptions` | — |
| Returns | `MiliUI.TextGeometryIssue[]` | — |

**Original LuaLS annotations:**

```lua
---@param root MiliUI.Parent
---@param options? MiliUI.TextGeometryOptions
---@return MiliUI.TextGeometryIssue[]
```


### `UI.ScrollColumn(parent, props)`

Create a **ScrollColumn**: a vertical list that players can scroll when its contents are taller than the visible area.
You do not need to calculate the full list height yourself. MiliUI creates an inner Column and updates the scrollable height when its content changes.

**Example:**
```lua
local list = UI.ScrollColumn(parent, {
width = 360,
height = 240,
gap = 8,
column = { controllerNavigation = true },
})

local firstButton = UI.Button(list.column, {
label = { text = 'First option' },
fillWidth = true,
})
local secondButton = UI.Button(list.column, {
label = { text = 'Second option' },
fillWidth = true,
})
```

`parent` is the existing UI container that holds the list. `list.column` is the Column **inside** the scrolling area: add your Buttons to `list.column`, not directly to `list`.
`gap = 8` puts 8 UI units between list items. The list scrolls automatically when its contents are too tall.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | Existing container where this scrolling list should appear. |
| Parameter `props?` | `MiliUI.ScrollColumnProps` | Settings for the visible area, spacing, and inner Column. |
| Returns | `MiliUI.ScrollArea` | list Scrolling area whose `column` contains the items you add. |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent Existing container where this scrolling list should appear.
---@param props? MiliUI.ScrollColumnProps Settings for the visible area, spacing, and inner Column.
---@return MiliUI.ScrollArea list Scrolling area whose `column` contains the items you add.
```


### `UI.Row(parent, props)`

Create a **Row**, a container that puts child elements **side by side**, from left to right.
Set `gap` for space between children and `grow` on a child to give it extra width.

**Example:**
```lua
local row = UI.Row(parent, { width = 500, height = 60, gap = 10 })
local firstButton = UI.Button(row, {
label = { text = 'First' },
width = 120,
})
local secondButton = UI.Button(row, {
label = { text = 'Uses the remaining width' },
grow = 1,
})
```

Here, `parent` is an existing UI container. `row` is the new Row, and both Buttons are created **inside that Row**.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.StackProps` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.StackProps
---@return MiliUI.Stack
```


### `UI.Column(parent, props)`

Create a **Column**, a container that puts child elements **one below another**, from top to bottom.
Set `gap` for space between children. Use `fillWidth = true` on a Button to make it fill the available width of the Column.

**Example:**
```lua
local column = UI.Column(parent, {
width = 300,
height = 160,
gap = 8,
})
local playButton = UI.Button(column, {
label = { text = 'Play' },
fillWidth = true,
})
local settingsButton = UI.Button(column, {
label = { text = 'Settings' },
fillWidth = true,
})
```

Here, `parent` is an existing UI container. `column` is your new Column, and the Buttons are placed **inside it**.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.StackProps` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.StackProps
---@return MiliUI.Stack
```


### `UI.HStack(children, options)`

Position an EXISTING list of controls horizontally one time. Unlike `UI.Row`, this is not a live parent container that automatically rearranges children later.

Arrange UI controls you **already created** in a horizontal line, from left to right.
**Example:** `UI.HStack({ firstButton, secondButton }, { gap = 12 })` places the two existing Buttons side by side with 12 UI units between them. This is a one-time arrangement; use `UI.Row` if you need a container that continues managing the layout.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `children` | `MiliUI.Parent[]` | — |
| Parameter `options?` | `MiliUI.LayoutOptions` | — |
| Returns | `MiliUI.Parent[]` | children |

**Original LuaLS annotations:**

```lua
---@param children MiliUI.Parent[]
---@param options? MiliUI.LayoutOptions
---@return MiliUI.Parent[] children
```


### `UI.VStack(children, options)`

Position an EXISTING list of controls vertically one time. Use `UI.Column` instead when children may be added/removed later.

Arrange UI controls you **already created** one below the other, from top to bottom.
**Example:** `UI.VStack({ firstButton, secondButton }, { gap = 12 })` stacks those existing Buttons vertically with 12 UI units between them. Use `UI.Column` when you want a container that keeps managing the layout.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `children` | `MiliUI.Parent[]` | — |
| Parameter `options?` | `MiliUI.LayoutOptions` | — |
| Returns | `MiliUI.Parent[]` | children |

**Original LuaLS annotations:**

```lua
---@param children MiliUI.Parent[]
---@param options? MiliUI.LayoutOptions
---@return MiliUI.Parent[] children
```


### `UI.Fan(children, options)`

Arrange existing UI elements in a slightly curved **fan shape**, like a hand of playing cards.
**Example:** `UI.Fan({ firstCard, secondCard, thirdCard }, { spacing = 120, rotation = 5 })` spreads three already-created card controls with 120 UI units between their positions and a small rotation.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `children` | `MiliUI.Parent[]` | — |
| Parameter `options?` | `MiliUI.FanLayoutOptions` | — |
| Returns | `MiliUI.Parent[]` | children |

**Original LuaLS annotations:**

```lua
---@param children MiliUI.Parent[]
---@param options? MiliUI.FanLayoutOptions
---@return MiliUI.Parent[] children
```


### `UI.Grid(children, options)`

Position an existing list of controls into rows and columns. For a responsive container that can switch layout modes, see `UI.Responsive`.

Arrange existing UI controls in a **grid of rows and columns**.
**Example:** `UI.Grid({ firstButton, secondButton, thirdButton }, { columns = 2, gap = 12 })` places two controls in the first row and starts another row for the third. Pass controls you have already created.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `children` | `MiliUI.Parent[]` | — |
| Parameter `options?` | `MiliUI.GridLayoutOptions` | — |
| Returns | `MiliUI.Parent[]` | children |

**Original LuaLS annotations:**

```lua
---@param children MiliUI.Parent[]
---@param options? MiliUI.GridLayoutOptions
---@return MiliUI.Parent[] children
```


### `UI.Center(value)`

Centers a raw control or MiliUI wrapper and returns the original value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `T` | — |
| Returns | `T` | value |

**Additional annotations:** `@generic T`

**Original LuaLS annotations:**

```lua
---@generic T
---@param value T
---@return T value
```


### `UI.Tween(target, properties, duration, ease)`

**Animate** one or more numeric properties of a UI control over time. A tween smoothly changes the values instead of jumping to the result immediately.
**Example:** `UI.Tween(button.root, { localScaleX = 1.1, localScaleY = 1.1 }, 0.2)` makes the existing Button's native root gradually appear 10% larger over 0.2 seconds.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `target` | `MiliUI.Parent` | — |
| Parameter `properties` | `table<string, any>` | — |
| Parameter `duration?` | `number` | — |
| Parameter `ease?` | `any` | Enum.EaseType value. |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param target MiliUI.Parent
---@param properties table<string, any>
---@param duration? number
---@param ease? any Enum.EaseType value.
---@return any tween
```


### `UI.After(seconds, callback)`

Run code after a short delay in seconds, as long as the current UI Host is still active.
Example: `UI.After(1, function() print('One second later') end)`.

Schedules delayed work owned by the current Host context. Use this inside a
MiliUI Page/listener/resize/timer callback. From bootstrap code such as
`OnStart`, use `UI.Hosts.After(hostId, seconds, callback)` instead.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `seconds` | `number` | — |
| Parameter `callback` | `fun()` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param seconds number
---@param callback fun()
---@return any tween
```


### `UI.Spacer(parent, props)`

Add **invisible empty space** inside a Row or Column without drawing anything.

**Example:**
```lua
local column = UI.Column(parent, { width = 300 })
local firstButton = UI.Button(column, { label = { text = 'First' } })
local space = UI.Spacer(column, { height = 20 })
local secondButton = UI.Button(column, { label = { text = 'Second' } })
```

This leaves 20 UI units of vertical space between the two Buttons.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.BoxProps` | — |
| Returns | `MiliUI.ContainerControl` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.BoxProps
---@return MiliUI.ContainerControl
```


### `UI.Card(parent, props)`

Create a **Card**, a Panel-style container that can hold other UI elements.
**Example:** `local card = UI.Card(parent, { width = 280, height = 160, padding = 12 })` creates the Card inside the existing `parent`. Add children to `card.content`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.CardProps` | — |
| Returns | `MiliUI.Panel` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.CardProps
---@return MiliUI.Panel
```


### `UI.PlayingCard(parent, props)`

Creates a polished front/back game card with stable interaction geometry.
Every standard semantic text region accepts the same MiliUI.TextSpec shape.
```lua
local card = UI.PlayingCard(parent, {
frameColor = 'danger',
header = {
icon = 103002,
label = { text = 'FIRE', textId = 'Elements.Fire' },
},
value = { text = 7, needsTranslation = false },
artwork = { image = 112022 },
title = { text = 'Flamecaller', textId = 'Cards.Flamecaller' },
})
card:OnClick(function() card:SetSelected(true) end)
```

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.PlayingCardProps` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.PlayingCardProps
---@return MiliUI.PlayingCard
```


### `UI.Badge(parent, props)`

Create a small **Badge** to display a short word or status, such as **NEW** or **READY**.
**Example:** `local badge = UI.Badge(parent, { label = { text = 'NEW' } })` creates a Badge inside an existing container called `parent`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.BadgeProps` | — |
| Returns | `MiliUI.Badge` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.BadgeProps
---@return MiliUI.Badge
```


### `UI.Chip(parent, props)`

Alias of UI.Badge.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.BadgeProps` | — |
| Returns | `MiliUI.Badge` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.BadgeProps
---@return MiliUI.Badge
```


### `UI.Stat(parent, props)`

Create a **Stat card** that displays a main number and a short label explaining it.
**Example:** `local wins = UI.Stat(parent, { value = { text = '12' }, label = { text = 'Wins' } })` creates a Stat displaying **12 Wins** inside the `parent` container.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.StatProps` | — |
| Returns | `MiliUI.Stat` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.StatProps
---@return MiliUI.Stat
```


### `UI.ProgressBar(parent, props)`

Show progress from 0 to 100 percent. Values run from 0 (empty) to 1 (full).
Example: `UI.ProgressBar(parent, { value = 0.6, showText = true })` shows 60%.

Create a **ProgressBar** showing how much of something is complete, such as loading progress or a health-like meter.
**Example:** `local progress = UI.ProgressBar(parent, { width = 240, value = 0.75, showText = true })` creates a 240-unit-wide bar that is 75% full and displays its percentage. Here, `parent` is an existing UI container.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ProgressBarProps` | — |
| Returns | `MiliUI.ProgressBar` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ProgressBarProps
---@return MiliUI.ProgressBar
```


### `UI.Accordion(parent, props)`

Use this for extra settings or long information that players can expand only when needed.
Example: `UI.Accordion(parent, { title = { text = 'Advanced' }, open = false })`.

Creates a collapsible section with a controller-focusable header and
content-driven body height. The open state can use normal `remember`
persistence through a stable props.id.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.AccordionProps` | — |
| Returns | `MiliUI.Accordion` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.AccordionProps
---@return MiliUI.Accordion
```


### `UI.Slider(parent, props)`

Let players drag a handle to choose a number. Use `min`, `max` and `step` to control the allowed values.
Example: `UI.Slider(parent, { min = 0, max = 100, value = 50, step = 5 })`.

Creates a draggable numeric slider. Cursor deltas compensate for nested UI scaling.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.SliderProps` | — |
| Returns | `MiliUI.Slider` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.SliderProps
---@return MiliUI.Slider
```


### `UI.IconButton(parent, props)`

Creates a themed image button. All normal Button props are forwarded.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props` | `MiliUI.IconButtonProps` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props MiliUI.IconButtonProps
---@return MiliUI.Button
```


### `UI.Selection(parent, props)`

Create an always-visible single- or multi-choice group.
Set mode='single' for automatic replacement with exactly one selected item by
default, or mode='multiple' for indexed arrays and selection limits.
Use appearance='segmented' for compact evenly sized options, or 'tiles'
for configurable item cards. Custom renderItem/updateItem callbacks are supported.
Single-mode submission sends scalar values; multiple mode sends typed lists.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props` | `MiliUI.SelectionProps` | — |
| Returns | `MiliUI.Selection` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props MiliUI.SelectionProps
---@return MiliUI.Selection
```


### `UI.Toggle(parent, props)`

Create an ON/OFF switch, useful for music, hints or accessibility settings.
Example: `UI.Toggle(parent, { value = true, onChange = function(on) print(on) end })`.

Creates an animated boolean switch.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ToggleProps` | — |
| Returns | `MiliUI.Toggle` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ToggleProps
---@return MiliUI.Toggle
```


### `UI.Checkbox(parent, props)`

Create a checkable option. Use `value = true` to start checked.
Example: `UI.Checkbox(parent, { label = { text = 'Show tips' }, value = true })`.

Creates a checkbox with optional localized label.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.CheckboxProps` | — |
| Returns | `MiliUI.Checkbox` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.CheckboxProps
---@return MiliUI.Checkbox
```


### `UI.Stepper(parent, props)`

Creates minus/value/plus controls for a clamped numeric value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.StepperProps` | — |
| Returns | `MiliUI.Stepper` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.StepperProps
---@return MiliUI.Stepper
```


### `UI.Tabs(parent, props)`

Creates persistent tab content containers; every item is a table with a
localized `label` TextSpec. Switching tabs does not rebuild content.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props` | `MiliUI.TabsProps` | — |
| Returns | `MiliUI.Tabs` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props MiliUI.TabsProps
---@return MiliUI.Tabs
```


### `UI.Shell(parent, props)`

Creates a matching 106061-106090 directional shell.
Width/height may be percentages such as '100%'.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ShellProps` | — |
| Returns | `MiliUI.ImageControl` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ShellProps
---@return MiliUI.ImageControl
```


### `UI.Alert(parent, props)`

Creates a reusable status alert. `title` and `message` are TextSpecs.
```lua
UI.Alert(parent, {
variant = 'success',
title = { text = 'READY', textId = 'Status.Ready' },
message = {
text = 'Changes saved automatically.',
textId = 'Status.SavedMessage',
},
})
```

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.AlertProps` | — |
| Returns | `MiliUI.Alert` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.AlertProps
---@return MiliUI.Alert
```


### `UI.ToastManager(parent, props)`

Creates a reusable timed toast stack.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ToastManagerProps` | — |
| Returns | `MiliUI.ToastManager` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ToastManagerProps
---@return MiliUI.ToastManager
```


### `UI.Modal(parent, props)`

Creates a modal with a full-screen input blocker preventing click-through.
Build arbitrary child UI inside `modal.content`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.ModalProps` | — |
| Returns | `MiliUI.Modal` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.ModalProps
---@return MiliUI.Modal
```


### `UI.Native(parent, templateIndex, props)`

Instantiates any editor-created Client UI control template without adding a
specialized MiliUI abstraction. The raw native control is returned, common
layout props are applied, and MiliUI tracks it under the owning Host so
`UI.Destroy(...)` and Host detach clean it up consistently.
If the template is text-bearing, call UI.SetText(control, spec) to localize it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `templateIndex` | `integer` | — |
| Parameter `props?` | `MiliUI.LayoutProps` | — |
| Returns | `MiliUI.Control` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param templateIndex integer
---@param props? MiliUI.LayoutProps
---@return MiliUI.Control
```


### `UI.Animation(parent, props)`

Creates a native UI Animation wrapper. Requires templates.animation.
This wraps Miliastra's ClientUIAnimationControl rather than MiliUI.Motion.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.AnimationProps` | — |
| Returns | `MiliUI.Animation` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.AnimationProps
---@return MiliUI.Animation
```


### `UI.FullscreenAnimation(parent, props)`

Creates a native fullscreen UI Animation wrapper. Requires templates.fullscreenAnimation.
Miliastra always renders Fullscreen UI Animations at the bottom of all UI layers; this cannot be changed by sibling order, parent, Page order, or Host Layer.
Use this for screen-wide atmospheric/background effects, not foreground UI transitions.
Playback is controlled through native activation so Play always starts from the beginning.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.FullscreenAnimationProps` | — |
| Returns | `MiliUI.FullscreenAnimation` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.FullscreenAnimationProps
---@return MiliUI.FullscreenAnimation
```


### `UI.KeyHint(parent, props)`

Creates a native device-aware key hint. Requires templates.keyHint.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.KeyHintProps` | — |
| Returns | `MiliUI.KeyHint` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.KeyHintProps
---@return MiliUI.KeyHint
```


### `UI.TextWindow(parent, props)`

Creates the native scrollable text wrapper. Requires templates.textWindow.
It accepts the same top-level text/textId/args fields as UI.Text.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.TextWindowProps` | — |
| Returns | `MiliUI.TextWindow` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.TextWindowProps
---@return MiliUI.TextWindow
```


### `UI.ScrollText(parent, props)`

Alias of UI.TextWindow.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.TextWindowProps` | — |
| Returns | `MiliUI.TextWindow` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.TextWindowProps
---@return MiliUI.TextWindow
```


### `UI.GridScroller(parent, props)`

Creates the native GridScroller wrapper. Requires templates.gridScroller.
Uses current `itemPrefabIndex` and preserves runtime item indices exactly.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.GridScrollerProps` | — |
| Returns | `MiliUI.GridScroller` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.GridScrollerProps
---@return MiliUI.GridScroller
```
