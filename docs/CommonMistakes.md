# Common mistakes and troubleshooting

This page collects mistakes that are easy to make when building or testing MiliUI screens. Some are layout/component mistakes; others come from confusing Miliastra's Control Group lifecycle with MiliUI's Host/Page lifecycle.

If Hosts, Control Groups, Pages, or Layers are new to you, read [ControlGroups.md](ControlGroups.md) first.

## Do not use `UI.DestroyAll()` in every Control Group script

This is one of the most important multi-host rules.

Bad:

```lua
function OnDestroy()
    UI.DestroyAll()
end
```

`UI.DestroyAll()` is global across currently attached MiliUI Hosts. If a Menu Control Group disappears while HUD is still alive, a Menu script should not destroy HUD-owned controls too.

Use host-local teardown:

```lua
local HOST_ID = "Menu"

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

Think of `Detach("Menu")` as "this native Menu root no longer exists." It releases only Menu-owned live runtime state while preserving logical Session state and the Host's registered UI Index that may be used later.

Use `DestroyAll()` only when you intentionally want global MiliUI teardown across all attached hosts.

## Do not use the removed single-root `UI.Init(...)` lifecycle

Old examples may have looked like:

```lua
UI.Init(script.object, templates)
```

The multi-host runtime intentionally replaced that with two separate steps:

```lua
UI.InitTemplates(templates)
UI.Hosts.Attach(1002, "Menu", script.object)
```

Why split them? Templates are shared configuration. A Host identifies one Miliastra UI entry by both a stable Host ID and its required integer UI Index, while its native Client UI root may come and go. Separating these concerns lets HUD, Menu, Overlay, and other roots exist simultaneously without a mutable global "current root."

The UI Index does not have to come from a script parameter. A Lua constant, literal, shared config value, or other game-defined source is valid.

## Do not send a second "Show Lua UI" signal when Control Group instantiation already shows it

For the recommended setup:

```text
Server Node Graph instantiates Control Group
    -> attached Client UI script starts
    -> script attaches its MiliUI Host
    -> UI is built/restored
```

The Control Group's existence is already the high-level show/hide mechanism.

A separate ServerSignal is still useful for actual application events, such as updating data or requesting a server-owned UI activation/removal action.

## Do not expect `Pages.BringToFront` to override Control Group Layers

`UI.Pages.BringToFront(...)` reorders siblings inside one Host.

```text
Menu Host
├── Inventory
├── Settings
└── Confirm       <- MiliUI can reorder these
```

It cannot reorder separate native roots:

```text
HUD Control Group
Menu Control Group
Overlay Control Group
```

Use Miliastra's Control Group **Layer** setting for cross-host ordering.

Rule of thumb:

```text
same Host/root         -> MiliUI page/sibling order
separate Control Group -> Miliastra Layer
```

## Do not reuse Host IDs or UI Indexes for different identities

This is intentionally invalid while the first Menu root is attached:

```lua
UI.Hosts.Attach(1002, "Menu", firstRoot)
UI.Hosts.Attach(1002, "Menu", secondRoot)
```

A stable Host cannot later change to a different Miliastra UI Index either:

```lua
UI.Hosts.Attach(1002, "Menu", firstRoot)
UI.Hosts.Detach("Menu")
UI.Hosts.Attach(9999, "Menu", replacementRoot) -- error
```

And one UI Index cannot represent two Host IDs:

```lua
UI.Hosts.Attach(1002, "Menu", menuRoot)
UI.Hosts.Attach(1002, "HUD", hudRoot) -- error
```

If a Control Group prefab always attaches as `"Menu"`, only one live copy of that prefab should exist at a time.

If the game genuinely needs several simultaneous instances, they need deliberate distinct Host IDs and distinct UI Indexes rather than silent shared ownership.

## Do not confuse `Close` with `Detach`

These mean different things:

```lua
UI.Pages.Close("Settings")
```

means the logical page is no longer open.

```lua
UI.Hosts.Detach("Menu")
```

means the native Menu root is unavailable/being removed. Logical open-page state and the Host's UI Index mapping are preserved so a replacement root may explicitly restore it.

Using `Close` during temporary native teardown loses the logical open-page stack. Using `Detach` when the player actually meant to close a page leaves that page logically open.

## Do not assume `Attach` restores anything automatically

`UI.Hosts.Attach(...)` is intentionally passive:

```lua
UI.Hosts.Attach(1002, "Menu", script.object)
```

After that, game/bootstrap code explicitly chooses:

```lua
UI.Pages.Open("Main Menu")
```

or:

```lua
UI.Pages.Restore("Menu")
```

A common bootstrap is:

```lua
if #UI.Pages.GetOpenPages("Menu") > 0 then
    UI.Pages.Restore("Menu")
else
    UI.Pages.Open("Main Menu")
end
```

## Guard Page registration when the native UI can restart

The native Control Group/Client UI script may start again while the Lua modules containing the MiliUI registry are still alive.

Bad:

```lua
UI.Pages.Register("Inventory", definition)
```

on every `OnStart`.

Good:

```lua
if not UI.Pages.IsRegistered("Inventory") then
    UI.Pages.Register("Inventory", definition)
end
```

Duplicate Page IDs are treated as programming errors instead of silently replacing an existing definition.

## Use the correct timer API from bootstrap code

Inside a MiliUI-owned listener/page/timer callback, `UI.After(...)` already has an owning Host context:

```lua
button:OnClick(function()
    UI.After(0.25, function()
        -- owned by the button's Host
    end)
end)
```

But top-level bootstrap code such as `OnStart()` has no implicit Host context merely because a Host was attached earlier.

Use:

```lua
UI.Hosts.After("Menu", 0.25, function()
end)
```

from external/bootstrap code. The timer is then cancelled automatically if that Host detaches first.

## A simple HUD does not require Pages

Pages are for logical screens and page ordering. A HUD that should simply exist whenever its Control Group exists can attach its Host and build directly under `script.object`.

Do not add `UI.Pages` solely because every MiliUI root is called a Host.

## Run diagnostics from the MiliUI screen, not the editor script root

A `UI.Screen` represents the full UI canvas. The editor script object above it is not another 1600x900 layout container, so using the script root as the diagnostic root can make the screen look massively out of bounds.

Bad:

```lua
local screen = UI.Screen(script.object, { padding = 32 })

local issues = UI.CheckLayout(script.object, {
    recursive = true,
})
```

A warning such as this is usually the result:

```text
control=Screen | parent=LuaRoot | overflow=L799.00 R799.00 T449.00 B449.00
```

Good:

```lua
local screen = UI.Screen(script.object, { padding = 32 })

local issues = UI.CheckLayout(screen.root, {
    recursive = true,
})
```

The same rule applies to `UI.CheckTextGeometry`.

Use the smallest meaningful MiliUI-owned root for diagnostics. For a full page that is normally `screen.root`. For an isolated component test it may be the component's `.root`.

## Do not force text into a rectangle shorter than its safe height

MiliUI supplies safe text geometry automatically when `height` is omitted. An explicit height is authoritative, so MiliUI will not silently enlarge it.

For normal text:

```lua
UI.SafeTextHeight(fontSize)
```

For native TextWindow text:

```lua
UI.SafeTextWindowHeight(fontSize)
```

For example, if a 28-unit font requires 44 units of safe height, this is unsafe:

```lua
UI.Heading(parent, {
    text = "TITLE",
    size = 28,
    height = 42,
})
```

Prefer omitting `height` or using the safe helper:

```lua
UI.Heading(parent, {
    text = "TITLE",
    size = 28,
    height = UI.SafeTextHeight(28),
})
```

`UI.CheckTextGeometry(...)` reports explicit rectangles that are too short.

## Keep adaptive minimum font sizes inside the engine-supported range

Miliastra may emit a native `Font size limit exceeded` warning when an adaptive control is given a minimum font size below the engine-supported floor.

MiliUI's current tests use `10` as the practical lower bound. Avoid values such as:

```lua
minimumFontSize = 9
```

unless host behavior is re-tested and known to support it.

## Do not diagnose hover/press animation as permanent overflow

Buttons and several interactive components briefly scale during hover and press animations. If `UI.CheckLayout` runs during that tween, a control near its parent's edge can temporarily appear out of bounds even though its stable layout is correct.

From a Host-owned callback, either wait for motion to settle:

```lua
UI.After(0.22, function()
    UI.CheckLayout(screen.root, {
        recursive = true,
        print = true,
    })
end)
```

or disable animation on the test control when motion is not part of the test.

Do not change production geometry solely to fix a warning that exists only mid-animation.

## Do not drive native animation playback through `.root`

`UI.Animation` and `UI.FullscreenAnimation` expose `.root` for normal wrapper interoperability, but their playback state is intentionally managed by MiliUI.

Do not use calls such as:

```lua
effect.root:SetActive(false)
effect.root:SetActive(true)
effect.root.animationId = anotherAnimation
```

while also expecting the wrapper's `Play()`, `Stop()`, and setter methods to remain synchronized.

Miliastra can start or retrigger native animation visuals/audio when animation fields are changed on an active control. MiliUI avoids those side effects by configuring inactive controls and deferring active setter changes. Use:

```lua
effect:SetAnimation(anotherAnimation)
effect:SetSoundEnabled(false)
effect:Stop()
effect:Play()
```

For regular UI Animation, use `SetLayer(...)` rather than writing `root.layer` directly.

## Understand `screen` versus `screen.root`

Passing the Screen wrapper itself as a parent routes children into the padded content area:

```lua
UI.Card(screen, {
    width = "100%",
})
```

Parenting to `screen.root` bypasses content padding and uses the full canvas. This is appropriate for full-screen overlays such as modals, but usually wrong for ordinary page content.

## Numeric sizes are reference UI units, not physical pixels

MiliUI geometry follows Miliastra's editor reference space, approximately 1600x900. A fixed `width = 300` is 300 reference UI units, not 300 monitor pixels.

Use percentages and `grow` when the relationship should follow available space:

```lua
UI.Card(parent, {
    width = "100%",
    grow = 1,
})
```

Use fixed numbers when the design really should remain fixed in reference-space units.

## Hidden responsive branches can still be a problem for native controls

Normal MiliUI layout diagnostics ignore hidden controls by default when `includeHidden = false`.

However, some native controls should not be duplicated into multiple responsive branches merely because only one branch is visible. `TextWindow` is the known example: keep one instance and reparent it when layout mode changes instead of creating duplicate hidden TextWindows.

## Rounded borders do not clip arbitrary custom images by themselves

A rectangular custom texture can still extend into square corners even when a rounded border is drawn on top. A border changes outline appearance; it does not inherently clip the background image.

Use:

```lua
UI.Panel(parent, {
    backgroundImage = 107033,
    backgroundStretch = true,
    radius = "xl",
    clipToRadius = true,
    border = true,
})
```

For direct mask composition, `UI.Image` also exposes native mask properties. See [Masking.md](Masking.md).

The current host has a known issue with `reverseMaskArea = true`: inverted masking does not reliably detect opaque pixels.

## Theme changes are creation-time, not live repainting

`UI.Theme.Apply(...)` changes defaults used by controls created afterward. Existing controls are not recolored or reskinned in place.

Likewise, `UI.Theme.Reset()` restores defaults for controls created afterward.

## Explicit props beat theme defaults

Styling precedence is intentionally:

```text
component theme defaults -> utility class -> explicit constructor props
```

If one component does not match the active theme, check for an explicit background/image/border/color prop overriding the theme.

## Multiple Choice Window rows and columns must fit the items

For `UI.MultipleChoiceWindow`, fixed `rows` and `columns` describe real capacity.

This is invalid for six items:

```lua
rows = 2,
columns = 2,
```

because the grid has only four cells.

Use enough capacity, define only one axis, or use `autoWrap = true`.

## Multiple Choice Window selection order is item order, not click order

Selected identities are stable 1-based item indices. Returned and submitted selections are sorted by item index.

If the player clicks 5, then 2, then 4, the component returns:

```lua
{ 2, 4, 5 }
```

Do not treat the returned order as click history.

## Disabled Multiple Choice items can still be changed by Lua

`SetItemEnabled(index, false)` blocks player interaction and applies disabled styling. It does not freeze programmatic selection state.

```lua
choices:SetItemEnabled(2, false)
choices:Deselect(2, true)
```

Disabling an already-selected item does not silently deselect it.

## Selected-hover styling needs an intentional fallback

If custom selection style defines `selectedBackground` but omits `selectedHoverBackground`, MiliUI keeps the explicit selected background while hovered.

Define `selectedHoverBackground` only when selected+hovered should deliberately look different.

## ServerSignal field order must match the Server Node Graph

Multiple Choice Window submit fields are positional. This contract:

```lua
submit = {
    signal = "SubmitChoices",
    fields = {
        { source = "index", type = "Int" },
        { key = "name", type = "String" },
        { key = "amount", type = "Int" },
    },
}
```

sends:

```text
IntList
StringList
IntList
```

The Server Node Graph signal must define those parameter types in that exact order.

## Do not trust client-submitted metadata as authoritative server state

MiliUI can validate and serialize client-side data, but a modified client can potentially fabricate it.

For authoritative game logic, submit a stable identity such as an index, GUID, ConfigId, or other server-recognized ID and let the server look up real price/reward/damage/etc.

## One sent signal can be received by multiple server monitors

If the same signal-monitoring graph exists on two entities, both can receive the same client signal. Seeing server logic run twice does not necessarily mean MiliUI sent twice.

Check how many server entities monitor the signal before debugging the client submit path.

## Do not confuse payload preview with network submission

```lua
window:BuildSubmitPayload()
```

builds data locally. It does not contact the server.

Actual submission occurs through:

```lua
window:Submit()
```

or through a connected submit button.

## Let Multiple Choice Window own selection interaction

A custom `renderItem` should primarily build visual content. MiliUI owns the cell hitbox, selection state, hover handling, limits, and submit behavior.

Use `updateItem` to react visually to state changes rather than building a second competing selection system.

## Respect selection limits instead of silently replacing choices

`maximumSelected` is a hard maximum. When selection is full, MiliUI does not guess which existing choice to remove.

If replacement behavior is desired, implement that game policy explicitly. For mutually-exclusive behavior, `maximumSelected = 1` is supported.

## When a diagnostic warning looks impossible

Before changing framework code, check these in order:

1. Is the diagnostic root correct?
2. Is the control currently animating or scaled?
3. Did the test explicitly force unsafe height/width?
4. Is a hidden native control duplicated when it should be reparented?
5. Is the problem the custom asset shape rather than control geometry?
6. Should a custom image use `clipToRadius = true`?
7. Is the server behavior caused by multiple signal receivers rather than multiple sends?
8. Is the client trying to send data the server should derive authoritatively?
9. Is the problem actually cross-Control-Group Layer ordering rather than MiliUI sibling order?
10. Is the affected script using `Detach(hostId)` rather than global `DestroyAll()`?
11. Can the issue be reproduced in a stable state after motion settles?

MiliUI diagnostics help find framework/layout problems, but the test harness, Control Group setup, Layer ordering, or lifecycle code can also be the source of the symptom.
