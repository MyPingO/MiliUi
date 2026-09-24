# MiliUI Architecture

This document defines the conventions MiliUI should follow as it grows.

For game-side setup, read [ControlGroups.md](ControlGroups.md) first. This file is primarily about framework ownership and implementation rules.

## 1. Core runtime boundary: Miliastra owns roots and Layers; MiliUI owns inside them

The multi-host runtime deliberately does not invent a global UI layer system.

```text
Miliastra UI Control Group
    -> owns existence + Layer + UI Index
    -> provides Client Control Container/root

MiliUI Host
    -> maps one stable Host ID to that Miliastra UI Index
    -> attaches to that root while it exists
    -> owns MiliUI-created controls/listeners/tweens/layout metadata under it

MiliUI Pages
    -> order logical screens inside one Host
```

Cross-Control-Group ordering belongs to Miliastra's `Layer` parameter. `Pages.BringToFront` only changes sibling order inside a single Host.

This boundary should remain explicit. Do not add a framework-level fake global z-index around separate native roots.

## 2. One implementation per public API

A public function must have one runtime owner. Do not define a fallback implementation in one module and silently replace it from another except for an explicitly documented migration shim.

Current ownership:

| Area | Module |
| --- | --- |
| Primitive creation, Button, public entry point | `init.lua` |
| Per-host creation/tracking/cleanup, coordinate conversion, responsive dimension resolution | `Systems/Core.lua` |
| Named Host API, Host/UI-Index identity, passive attach/detach, explicit host timers | `Systems/Hosts.lua` |
| Logical Page registration/open/close/order/restore | `Systems/Pages.lua` |
| Logical Session scopes and host page stacks | `Systems/Session.lua` |
| `remember = true` component bindings | `Systems/SessionPersistence.lua` |
| Theme tokens, active theme state, Apply / Reset | `Systems/Theme.lua` |
| Component theme defaults and custom skin integration | `Components/ThemeWrapper.lua` |
| Native image masking integration | `Systems/Masking.lua` |
| Rounded/shell asset lookup | `Systems/Surface.lua` |
| Utility classes / theme-default merge | `Systems/Style.lua` |
| Standard component root layout prop extraction | `Systems/LayoutProps.lua` |
| Select / MultipleChoiceWindow signal submission | `Systems/SignalSubmit.lua` |
| One-shot layouts | `Systems/Layout.lua` |
| Responsive persistent Row/Column stacks | `Systems/Stack.lua` |
| Canvas-sized responsive root / content insets / screen queries / screen input flags | `Components/Screen.lua` |
| Responsive grid/focus composition | `Systems/Responsive.lua` |
| Layout and text diagnostics | `Systems/Diagnostics.lua` |
| Hitbox / Bind / Hover | `Systems/Interaction.lua` |
| Tweens and reusable motion | `Systems/Motion.lua` |
| Localization resolution and text bindings | `Systems/Localization.lua` |
| Text safe-height measurement and wrappers | `Systems/TextMetrics.lua` |
| Component installation order | `Components/init.lua` |
| Card / Badge / Stat / ProgressBar | `Components/DisplayComponents.lua` |
| Slider / IconButton | `Components/SliderComponents.lua` |
| SegmentedControl | `Components/SelectionComponents.lua` |
| Standalone vertical scrollbar | `Components/Scrollbar.lua` |
| Masked arbitrary-content scrolling | `Components/ScrollArea.lua` |
| Single-select dropdown | `Components/Select.lua` |
| Multiple-choice selection grid | `Components/MultipleChoiceWindow.lua` |
| Advanced component installation | `Components/AdvancedComponents.lua` |
| Toggle / Checkbox / Stepper | `Components/AdvancedInputs.lua` |
| Tabs | `Components/Tabs.lua` |
| Reusable front/back playing card | `Components/PlayingCard.lua` |
| Native escape hatch / Animation / FullscreenAnimation / KeyHint / TextWindow / GridScroller wrappers | `Components/NativeControls.lua` |
| Shell / Alert / ToastManager | `Components/Feedback.lua` |
| Modal | `Components/Overlay.lua` |

`Components/ThemeWrapper.lua` intentionally wraps completed constructors after the normal component installers run. It does not own a second implementation of those APIs; it applies creation-time defaults and custom image behavior around the existing implementation.

## 3. Host ownership is the runtime cleanup unit

Every MiliUI-created native control belongs to one attached Host. Core also associates that Host with:

```text
cursor listeners
resize handlers
layout metadata
tweens/delayed work
localization bindings
persistence bindings
```

Detaching one Host must release only that Host's live resources.

```lua
UI.Hosts.Detach("Menu")
```

must not disrupt:

```text
Host "HUD"
Host "Overlay"
```

The Host ID -> UI Index mapping is metadata, not a live native resource, so it remains available after detach.

A normal Control Group script should therefore detach its own Host in `OnDestroy` rather than calling global `UI.DestroyAll()`.

`UI.DestroyAll()` remains a global destructive operation across attached MiliUI Hosts. It is not the standard per-Control-Group lifecycle primitive.

## 4. Attach is passive

`UI.Hosts.Attach(uiIndex, hostId, root)` means only:

> this Miliastra UI entry has this stable Index and MiliUI Host ID, and this native root currently exists for it.

It must not secretly:

- open a default page;
- restore Session pages;
- replay a failed page open;
- run deferred work from a previous root.

Game/bootstrap code explicitly chooses what to do after attachment:

```lua
UI.Hosts.Attach(1002, "Menu", script.object)

if #UI.Pages.GetOpenPages("Menu") > 0 then
    UI.Pages.Restore("Menu")
else
    UI.Pages.Open("Main Menu")
end
```

The UI Index is required and may come from any game-defined source. MiliUI does not require an editor/script parameter.

This keeps root availability separate from game navigation policy.

## 5. Host identity rules

Host IDs are exact, case-sensitive runtime identities. UI Indexes are integer Miliastra identities.

The relationship is one-to-one for the lifetime of the client MiliUI runtime:

```text
Host "Menu" <-> UI Index 1002
```

Only one root may be attached under a given Host ID at a time. A root already owned by another Host may not be attached again.

A Host ID already associated with one UI Index cannot later be attached with a different Index. Likewise, one UI Index cannot be assigned to two different Host IDs.

Replacement is explicit:

```lua
UI.Hosts.Detach("Menu")
UI.Hosts.Attach(1002, "Menu", replacementRoot)
```

This also means a fixed-ID Control Group prefab such as `"Menu"` normally supports one live instance at a time. Multiple simultaneous copies would need distinct Host IDs and distinct UI Indexes by design rather than accidental shared ownership.

One script may own several Hosts when it has several roots:

```lua
UI.Hosts.Attach(1001, "HUD", hudRoot)
UI.Hosts.Attach(1002, "Menu", menuRoot)
```

## 6. Pages are logical screens inside Hosts

Page IDs are globally unique. Every Page registration names exactly one Host:

```lua
UI.Pages.Register("Inventory", {
    host = "Menu",
    create = BuildInventory,
})
```

The factory must return a top-level root directly parented to the supplied Host root.

Page order is host-scoped:

```lua
UI.Pages.GetOpenPages("Menu")
UI.Pages.GetActivePage("Menu")
```

There is no global active page across separate native roots.

Opening an already-live Page brings it forward instead of rebuilding it. Closing a Page removes it from the logical open-page order. Detaching the Host preserves that order for explicit later `Restore`.

Registration is strict. Code that can run again while module state survives should guard with `IsRegistered` rather than depending on silent replacement.

## 7. Session is logical state, never native object storage

Session may persist across temporary native Host recreation inside the same Lua runtime.

Store values such as:

```text
strings
numbers
booleans
plain Lua tables
selected IDs/indices
scroll positions
```

Do not store native Client Controls, MiliUI component objects, tweens, event data, or callbacks in Session.

Pages establish an explicit Session scope using the globally unique Page ID. Outside `WithScope`, state uses the global Session scope; it must not infer a scope from a notion of global active page.

## 8. Callbacks and timers must keep Host ownership

MiliUI listener callbacks re-enter the Host that owns the listener target. Resize callbacks and host-owned delayed callbacks do the same.

Target-based motion helpers infer their Host from the target control.

Targetless timers require a current Host context:

```lua
UI.After(0.25, callback)
UI.Motion.After(0.25, callback)
```

From bootstrap/game code without a current Host context, use:

```lua
UI.Hosts.After("Menu", 0.25, callback)
```

The timer is then cancelled if Menu detaches first.

Do not reintroduce a mutable global "current root" fallback. In a simultaneous multi-host runtime, such a fallback is nondeterministic.

## 9. Native controls vs component wrappers

A primitive such as `UI.Text` returns a native Client UI control.

A composed component usually returns a wrapper object containing at least:

```lua
{
    root = nativeControl,
}
```

Components that are useful as parents should also expose:

```lua
content = nativeControl
```

MiliUI resolves these consistently:

- parenting prefers `.content`, then `.root`;
- transforms/layout/motion use `.root`;
- raw native controls pass through unchanged.

Use `Core.ResolveParent()` and `Core.ResolveControl()` instead of reimplementing this logic.

`UI.Screen`, `UI.Row`, `UI.Column`, and `UI.ScrollArea` deliberately use separate `root` and `content` handles so normal child construction lands in the correct logical content rectangle.

## 10. Native escape hatch

MiliUI should not create abstractions around engine controls whose behavior is highly template-specific or not sufficiently understood.

Use:

```lua
UI.Native(parent, templateIndex, props)
```

for those cases. `UI.Native` must remain deliberately small:

- instantiate the supplied editor template index;
- resolve wrapper parents normally;
- apply common layout/transform props;
- return the raw native control;
- register the control with normal Host lifecycle cleanup.

It must not guess at special playback behavior, animation timing, device-specific behavior, or cross-Control-Group Layer rules.

`UI.Animation` and `UI.FullscreenAnimation` are deliberate dedicated wrappers rather than uses of `UI.Native`. Their native playback lifecycles were runtime-mapped and normalized: inactive state is the configuration/stopped state, active property writes are avoided, and wrapper methods own play/restart/stop transitions. Keep those lifecycle rules inside the wrappers instead of requiring application code to manipulate native activation directly.

## 11. Layout props and responsive roots

Public visual components should accept the standard layout properties when they create a root control:

```text
name
x / y
width / height
minWidth / maxWidth
minHeight / maxHeight
aspectRatio
fillWidth / fillHeight
grow / alignSelf
anchorX / anchorY
anchorMinX / anchorMinY
anchorMaxX / anchorMaxY
pivotX / pivotY
rotation
zoom / zoomX / zoomY / zoomZ
scale
```

`width` / `height` and min/max bounds may be numeric Miliastra UI units or percentage strings such as `"100%"`. Percentages resolve against the resolved parent content rectangle. Numeric units are editor/reference-space units, not physical monitor pixels.

`aspectRatio` is width divided by height. It may fill one otherwise-unowned axis, but it must not silently override both explicit width and height.

`Core.Rect` records responsive metadata. `Core.SetSize` is the MiliUI-owned path for size changes when resize propagation matters. `Core.RefreshLayout(parent)` re-resolves stored percentage/fill descendants.

See [ResponsiveLayout.md](ResponsiveLayout.md) and [ResponsiveFoundation.md](ResponsiveFoundation.md) for the detailed responsive rules.

## 12. Component methods

Stateful components should prefer these patterns:

```text
GetValue / GetSelected       read state
SetValue / SetSelected       update state
SetEnabled                   interaction state
OnChange / OnCommit          replace callback
Destroy                      release owned behavior/UI
```

Setters should return `self` when chaining is useful.

Callbacks should fire only when the logical value actually changes unless the method explicitly documents otherwise.

## 13. Input and overlays

Interactive components must keep these concepts separate:

- `interactable`: should input activate this control?
- `raycastTarget`: can cursor raycasting hit it?
- `canControllerFocus`: can controller navigation focus it?

`SetEnabled(false)` should also prevent controller focus where applicable.

`UI.Screen` may opt into cursor/key/navigation capture. A HUD that should leave gameplay input alone should not enable menu-style input capture merely because it uses MiliUI.

Modals require a full-screen input blocker beneath the dialog card so clicks cannot reach UI behind the modal within that Host.

An important Layer rule still applies: a Modal inside Menu cannot magically exceed the native Layer of the Menu Control Group. A truly global overlay should use an appropriate separate Overlay Host/Control Group.

On Host detach or Page destruction, input/cursor capture owned by the affected subtree must be released before native references disappear. This avoids stale cursor/game-input state during root recreation.

## 14. Theme application and skinning

Theme behavior is creation-time:

- call `Theme.Apply` before creating controls that should use those defaults;
- existing controls are not repainted when the active theme changes;
- `Theme.Reset` restores built-in defaults for controls created afterward.

Normal component precedence is:

```text
built-in component fallback
    -> Theme.components defaults
    -> utility class values
    -> explicit constructor props
```

Explicit constructor props remain authoritative.

See [Theming.md](Theming.md).

## 15. Beta API changes

MiliUI source should use current host names directly. Do not keep invisible compatibility shims for removed host-property names unless there is a deliberate public compatibility policy.

Current GridScroller uses `itemPrefabIndex`, not `itemPrefabId`.

The old single-root `UI.Init(root, templates)` lifecycle is removed. The temporary public symbol exists only to produce a useful migration error; new code must use:

```lua
UI.InitTemplates(templates)
UI.Hosts.Attach(uiIndex, hostId, root)
```

Never hardcode enum numeric values. Use `Enum.X.Y` symbols.

## 16. Text measurement is conservative, not authoritative

MiliUI text measurement exists to make common localized layouts safer, not to reproduce Miliastra's native font renderer.

`TextMetrics` and intrinsic width/wrapped-height calculations are conservative estimates. Miliastra does not expose documented preferred-width or preferred-wrapped-height APIs, and exact glyph widths, kerning, rich-text behavior, and line breaking vary across supported scripts and languages.

Framework code should therefore follow this rule:

> **Do not make UI correctness depend on an exact text-size prediction.**

When arbitrary-length localized text must always remain usable, prefer native wrapping inside explicit/flexible bounds, scrolling, `grow`, responsive presentation changes, or other layouts that tolerate measurement error. `fitContentHeight` is useful when an estimated content-driven height improves normal flow and the surrounding layout can absorb small differences; it is not a guarantee of pixel-identical native wrapped height.

Do not turn text-estimation accuracy into a prerequisite for unrelated component work. Improve the estimator only when a concrete UI exposes a meaningful failure case that cannot be solved more robustly through layout.

## 17. IntelliSense source of truth

`library/` is the single MiliUI declaration source, split by responsibility into native, shared aliases/helpers, lifecycle/state, theme, component, and public-API declarations.

Runtime files should bind their real tables with annotations such as:

```lua
---@type MiliUI.MotionAPI
local Motion = {}
```

and:

```lua
---@type MiliUI
local UI = { ... }
```

Do not add fake shadow modules for `require("MiliUI/init")`; they can compete with the real runtime module and cause `unknown` hover results.

When adding or changing a public function:

1. implement it in its owning runtime module;
2. update the appropriate declaration file under `library/` in the same change;
3. update practical docs/examples if behavior or user-facing props changed;
4. add it to the IntelliSense smoke example when it introduces a new API family.

## 18. Repository guardrails

Run the dependency-free audit before considering a public API change complete:

```bash
python tools/audit_api.py
```

The audit is also enforced by GitHub Actions on pull requests and pushes to `main`.

Runtime behavior still needs in-game smoke testing when implementation logic changes. In particular, Host lifecycle changes should be tested with more than one simultaneous Control Group/Host and with native root destruction/recreation.
