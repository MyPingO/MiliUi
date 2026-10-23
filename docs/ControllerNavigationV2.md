# Controller Navigation V2

**Status:** Native-tested and independently integrated into development `main` through PR #119. The public beta.3 runtime predates V2; these instructions apply to a runtime that includes Controller Navigation V2. The reported in-game tests covered automatic navigation, nested ScrollArea ownership, scrollbar Left return, and chevron/focus recovery; they do not constitute exhaustive cross-platform testing.

[Controller Support](ControllerSupport.md) · [Migration guide](ControllerNavigationV2Migration.md) · [ScrollArea](ScrollArea.md) · [Example](../examples/ControllerNavigationV2Menu.lua) · [Focus API reference](Reference/focus.md)

## Opt in to managed navigation

Create a Screen with `controllerNavigation = "auto"` and group related controls in Rows, Columns or other containers. The normal hierarchy needs **no manual directional links**:

```lua
local screen = UI.Screen(parent, {
    controllerNavigation = "auto",
    isolateNavigation = true,
    padding = 32,
})
local sidebar = UI.Column(screen.content, { gap = 12 })
local play = UI.Button(sidebar, {
    focusKey = "play",
    label = { text = "PLAY", needsTranslation = false },
})
UI.Button(sidebar, {
    focusKey = "settings",
    label = { text = "SETTINGS", needsTranslation = false },
})
screen:SetInitialFocus(play)
```

`SetInitialFocus` should be called after the target is constructed. `isolateNavigation` is suitable for full-screen menus, not all HUDs. Omitting `controllerNavigation = "auto"` preserves the existing legacy behavior.

## Central focus ownership

`Systems/ControllerFocus.lua` is the **single writer** of native `SetControllerNavigation` directional edges within a managed Screen:

1. Exclude dead, hidden, disabled, inactive or out-of-modal native targets.
2. Honor `UI.Focus.Block` / `UI.Focus.Link` overrides.
3. Apply component navigation policies (including Selection and Dropdown).
4. When focus is on a ScrollArea's passive scrollbar proxy, **Left** prefers its own eligible content.
5. Otherwise navigate through the actual UI ancestry: sibling groups first, then parent regions.
6. At a genuine boundary, write a native `None` edge instead of escaping arbitrarily.

The manager verifies requests against `game.GetControllerFocus()`. The controller chevron represents the **actual native focused control**, not a separate predicted selection. Managed Stacks contribute their native containment hierarchy; unmanaged Stacks retain legacy direct native links.

**Do not call native `SetControllerNavigation` yourself on controls inside a managed Screen.** The manager can overwrite those links during refresh. Use `UI.Focus.Link` or `UI.Focus.Block` only for exceptional layouts.

## Right-stick scrolling

- **Left stick / D-pad:** Navigate between focusable Buttons, Hitboxes and components.
- **Right stick:** Scroll the ScrollArea that currently owns controller input. Nested and adjacent ScrollAreas scroll independently.
- **Button still fully visible:** Chevron stays on the actual focused Button as content scrolls.
- **Focused Button moves offscreen:** Focus transfers to a passive ScrollArea proxy; the chevron appears beside *that area's scrollbar*.
- **Left from scrollbar proxy:** Focus returns into the proxy's own list, preferring visible eligible items. With only passive content visible, an offscreen eligible item can be revealed after an intentional focus change.
- **At the physical top/bottom:** An additional right-stick event at the same boundary may exit the scrolling region.

Auto-reveal listens to **confirmed managed focus**, not transient native Focus events. A short deferred focus check reconciles native focus changes after right-stick callbacks. There is no per-frame polling and no second artificial chevron.

Managed ScrollArea scrollbar arrow Buttons remain pointer/touch controls by default; the focusable proxy handles passive right-stick scrolling.

## Pages, Dropdowns and lifecycle

Each opted-in Screen owns a focus scope tied to its attached Host generation. Opening a different logical Page suspends sibling Screen scopes in the same Host. Returning to a Page recovers valid focus; use stable `focusKey` values across Page recreation. Reopening an already active Page should not steal eligible focus.

An open Dropdown temporarily restricts focus to its modal menu; closing it restores the trigger when applicable. MiliUI automatically handles common wrapped disabled/hidden/destroyed changes. After *direct* native visibility, active-state, focusability or geometry mutations, call `UI.Focus.Refresh(screen)` or `screen:RefreshControllerNavigation()`.

Do not keep destroyed native handles as controller links or reuse an old Host's controls after Control Group recreation.

## Public API

| API | Purpose |
| --- | --- |
| `screen:SetInitialFocus(target)` | Preferred initial target in a managed Screen. |
| `screen:RefreshControllerNavigation()` | Recompute graph and recover focus. |
| `UI.Focus.Get(screen)` | Read current native-focused registered wrapper in this Screen. |
| `UI.Focus.Set(target)` | Request and verify actual native focus. |
| `UI.Focus.Link(source, direction, destination)` | Override an exceptional directional route. |
| `UI.Focus.Block(source, direction)` | Prohibit a direction. |
| `UI.Focus.Refresh(screen)` | Refresh after direct native mutations. |
| `UI.Focus.Explain(screen)` | Diagnostics: focus identity, eligible count and last request. |

Direction strings are `"Up"`, `"Down"`, `"Left"`, `"Right"`. `UI.Focus.Set` can return `false, "not-yet-confirmed"` when native focus has not settled yet; this alone does not prove permanent failure.

## Testing and availability

On some PC Test Play builds, controller focus will initialize correctly only if the level **starts in Controller mode**. Switching from keyboard after loading can report controller input while `game.GetControllerFocus()` remains nil.

A green Lua CI simulator is not a native Test Play pass. The development validation included the 64-case controller audit and eight additional stress scenarios, but not every case was individually certified as PASS on every platform.

**Publication gate:** Publish the compatible runtime, IntelliSense, generated API reference, and guides together. Validate Manager, IntelliSense and API Audit on the exact release source, repeat a native Controller-start smoke test, and validate public documentation links.

See [migration and troubleshooting](ControllerNavigationV2Migration.md).
