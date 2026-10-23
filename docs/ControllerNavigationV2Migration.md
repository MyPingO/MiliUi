# Adopting Controller Navigation V2

V2 is **opt-in**. Existing HUDs and Screens keep legacy controller behavior unless they explicitly enable the managed Screen. The native-tested implementation was independently promoted into development `main` by PR #119. Check the public release manifest to confirm that your installed runtime includes V2.

[Full guide](ControllerNavigationV2.md) · [Controller Support](ControllerSupport.md) · [Menu example](../examples/ControllerNavigationV2Menu.lua)

## Migration checklist

1. Add `controllerNavigation = "auto"` to the `UI.Screen` creating the menu. Use `isolateNavigation = true` for a menu that should not navigate into unrelated gameplay UI.
2. Assign stable `focusKey` strings to important Buttons and call `screen:SetInitialFocus(first)` after the controls exist.
3. Arrange controls in sensible Rows, Columns and panels; V2 derives navigation from actual native ancestry.
4. Remove direct native `SetControllerNavigation` calls inside the managed Screen. Use `UI.Focus.Link` / `UI.Focus.Block` only for intentional exceptions.
5. For scrollable content, prefer `UI.ScrollArea` / `UI.ScrollColumn` with a correct `contentHeight`. Left stick navigates; right stick scrolls.
6. Verify Page activation, Dropdowns, focus after hide/disable/destroy, and controller startup in native Test Play.

```lua
local screen = UI.Screen(parent, {
    controllerNavigation = "auto",
    isolateNavigation = true,
})
local menu = UI.Column(screen.content, { gap = 12 })
local first = UI.Button(menu, {
    focusKey = "first",
    label = { text = "FIRST", needsTranslation = false },
})
local second = UI.Button(menu, {
    focusKey = "second",
    label = { text = "SECOND", needsTranslation = false },
})
screen:SetInitialFocus(first)
-- Only if an unusual layout needs a manual override:
-- UI.Focus.Link(first, "Down", second)
```

## Differences from legacy navigation

| Topic | Legacy/unmanaged | Opt-in managed V2 |
| --- | --- | --- |
| Directional graph | Native controls / component-authored links | One Screen-level manager and automatic hierarchy |
| Manual override | Native `SetControllerNavigation` | `UI.Focus.Link` / `UI.Focus.Block` |
| Nested ScrollAreas | Native/component behavior | Right-stick scrolling owned by the focused region |
| Offscreen selected Button | Existing component behavior | Real focus transfers to scrollbar proxy after leaving viewport |
| Left from scrollbar | Native nearest-control result | Re-enter the proxy's own eligible list |
| Focus chevron | Component/native events | Confirmed native focus |
| Page/Dropdown focus | Legacy behavior | Coordinated managed scope and modal eligibility |

## Troubleshooting

**Chevron beside scrollbar:** Expected when the old Button has scrolled out of view. Use the right stick to keep scrolling, Left to re-enter the list.

**Wrong directional destination:** Check Row/Column hierarchy before adding a managed `UI.Focus.Link` override. A visible proximity guess cannot always encode developer intent.

**List not moving:** `contentHeight` must exceed the viewport height and `controllerScroll` must not be false. A nested list only scrolls when its focus or proxy owns the right-stick input.

**List jumps back to an old Button:** Confirmed focus deliberately reveals offscreen rows. A raw temporary Focus event should not cause auto-reveal; investigate actual native focus and scroll offsets.

**Controller starts with no focus on PC:** Start Test Play in Controller mode. Merely switching the device after a level starts may not initialize focus.

**Focus wrong after native property mutation:** Use MiliUI APIs where available, or call `UI.Focus.Refresh(screen)` after native hide/disable/position updates.

**A DUMP STATE button changes focus:** Activating that button is not passive; capture event history before navigation when diagnosing transient behavior.

## Version compatibility

The public beta.3 runtime does not include V2. Use a release whose manifest and notes explicitly include managed `UI.Screen(..., { controllerNavigation = "auto" })`, and update runtime plus IntelliSense together.
