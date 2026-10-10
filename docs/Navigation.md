# Navigation

`UI.Navigation` remembers which Page the player came from, so a Back button can return to it. It works with `UI.Pages`, which creates, opens, and closes the actual screens inside a Host.

Use it when one Host contains a flow such as:

```text
Main Menu
  -> Settings
      -> Controls
```

A simple HUD or a pair of manually toggled panels does not need Navigation.

## Pages versus Navigation

Here's the difference:

```text
UI.Pages
    What logical pages are currently open in this Host?

UI.Navigation
    How did the player get to the current page, and where should Back go?
```

Navigation does not replace `UI.Pages.Open`, `Close`, or `BringToFront`. Manually opened Pages, Modals, and overlays can coexist with a navigation flow without automatically becoming history entries.

For example:

```lua
UI.Navigation.Reset("MainMenu")
UI.Navigation.Push("Settings")

UI.Pages.Open("PatchNotesOverlay")
```

The navigation current page is still `Settings`; the overlay is simply another open Page.

## One Host, several pages

Navigation is intended for several logical Pages inside the same MiliUI Host / Client Control Container:

```text
Menu Control Group
└── Client Control Container
    └── Host "Menu"
        ├── MainMenu
        ├── Settings
        ├── Controls
        └── Updates
```

Those Pages may live in separate Lua modules, but they do not need separate native Client Control Containers merely because they are different screens.

## Reset

Start a navigation flow with:

```lua
UI.Navigation.Reset("MainMenu")
```

This opens `MainMenu` and replaces that Host's navigation history with:

```text
[ MainMenu ]
```

Only the current navigation page is kept live by Navigation. Unrelated Pages opened manually in the same Host are not closed.

## Push

Move forward and remember the previous page:

```lua
UI.Navigation.Push("Settings")
UI.Navigation.Push("Controls")
```

History becomes:

```text
[ MainMenu, Settings, Controls ]
```

The previous navigation page is closed after the target page opens successfully, so the live navigation UI is only:

```text
Controls
```

Closing a MiliUI Page does not erase its `UI.Session` state. Components using `remember = true` and explicit page-scoped Session values can therefore restore their logical state when Back rebuilds the page.

Pushing the page that is already current does not duplicate it in history or rebuild it.

## Back

Return to the previous entry:

```lua
local opened, result = UI.Navigation.Back("Menu")
```

For:

```text
[ MainMenu, Settings, Controls ]
```

Back first opens/rebuilds `Settings`, then closes `Controls`, then commits the shorter history:

```text
[ MainMenu, Settings ]
```

Opening the destination happens first. If its Host is unavailable, Back returns the Page error such as:

```text
false, "host-unavailable"
```

and leaves history/current-page state unchanged.

At the root:

```lua
UI.Navigation.Back("Menu")
-- false, "no-history"
```

## Replace

Use Replace when the current page should not remain reachable through Back:

```lua
UI.Navigation.Reset("Login")
UI.Navigation.Replace("MainMenu")
```

History changes from:

```text
[ Login ]
```

to:

```text
[ MainMenu ]
```

This is useful for completed login/setup/confirmation steps.

When no history exists yet, `Replace(pageId)` behaves like starting a new one-entry history.

## Page context shortcuts

A registered Page factory receives navigation shortcuts through its existing page context:

```lua
UI.Pages.Register("Settings", {
    host = "Menu",

    create = function(parent, page)
        local screen = UI.Screen(parent, {})

        UI.Button(screen, {
            label = { text = "Controls" },
            onClick = function()
                page:Push("Controls")
            end,
        })

        UI.Button(screen, {
            label = { text = "Back" },
            onClick = function()
                page:Back()
            end,
        })

        return screen
    end,
})
```

Available shortcuts:

```lua
page:Push("Controls")
page:Replace("Controls")
page:Back()
page:Reset("MainMenu")
page:CanGoBack()
```

A page-context navigation target must belong to the same Host. This catches accidental cross-Host navigation while keeping the global `UI.Navigation.*` API available to higher-level code.

## Queries

```lua
UI.Navigation.GetCurrent("Menu")
-- "Controls"

UI.Navigation.GetHistory("Menu")
-- { "MainMenu", "Settings", "Controls" }

UI.Navigation.CanGoBack("Menu")
-- true
```

`GetHistory` returns a copy; modifying it does not mutate MiliUI's stored history.

`GetCurrent` is independent of `UI.Pages.GetActivePage`. A manually opened overlay may be the frontmost open Page while the navigation current page remains unchanged.

## Host recreation

Navigation history is stored through `UI.Session`, so temporary Host loss preserves the flow.

Given:

```text
[ MainMenu, Settings, Controls ]
```

when the Menu Control Group disappears:

```lua
UI.Hosts.Detach("Menu")
```

the native page hierarchy is released, but:

- the logical current Page remains remembered by `UI.Pages`,
- the full Navigation history remains remembered by `UI.Navigation`.

After the Host is recreated:

```lua
UI.Hosts.Attach(UI_INDEX, "Menu", script.object)
UI.Pages.Restore("Menu")
```

the current page is rebuilt. A later:

```lua
UI.Navigation.Back("Menu")
```

still returns to the previous history entry.

A full `UI.Session.Clear()` also clears Navigation history because Navigation stores its history inside Session state.

## Unregistered historical pages

Closed Pages may be unregistered later. Navigation sanitizes history whenever it is read or changed, removing entries that are no longer registered to that Host.

For example, if:

```text
[ MainMenu, TemporarySetup, Settings ]
```

and `TemporarySetup` is later unregistered while closed, the effective history becomes:

```text
[ MainMenu, Settings ]
```

rather than leaving Back pointed at a missing Page.

## Optional directional slide transitions

Navigation remains immediate by default. To keep the outgoing and incoming
Pages visible during a transition, pass an options table:

```lua
page:Push("Settings", {
    transition = "slideLeft",
    duration = 0.24,
})

page:Back({
    transition = "slideRight",
})
```

The same options are accepted by `UI.Navigation.Push`, `Replace`, `Reset`,
and `Back(hostId, options)`, as well as Page-context shortcuts. Supported
values are `"slideLeft"`, `"slideRight"`, and `"none"`.
Duration defaults to 0.24 seconds. Duration 0 disables the animation.
A transition option is ignored when no outgoing Page exists (such as the
first Reset).

During a slide, the destination is immediately the *logical* current Page and
the destination factory sees the candidate history. Both Page roots remain
visually present until the animation completes; the outgoing Page is then
closed and destroyed. Pointer and controller-focus interaction on both Pages
is temporarily disabled, with an outside-click blocker layered above them.

Additional navigation calls while a slide is active on that Host are rejected
with a descriptive error; other Hosts continue working. Host detach cancels
the in-flight logical transition and keeps only the destination Page for
later `UI.Pages.Restore`. Unrelated manually opened Pages are never added
to navigation history or explicitly closed.

Full composed-Page fade is not yet supported: native controls do not expose
one common alpha property across all descendant UI types. Fade will need
its own verified rendering strategy.

## Deliberately not included yet

The first Navigation version does not add:

- crossfade and scale transitions,
- controller focus restoration,
- automatic scroll-position restoration,
- route parameters or URL-style routing,
- before-enter/before-leave hooks.

The internal history model is intentionally small enough that controller focus metadata can be added later after hardware validation without changing the basic Push/Back API.
