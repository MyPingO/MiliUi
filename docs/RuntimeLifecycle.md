# Runtime lifecycle

MiliUI separates several concepts that Miliastra may recreate at different times:

```text
Templates  -> shared primitive Client Control template IDs
Hosts      -> currently available Client UI roots + persistent UI Index identity
Pages      -> logical UI screens assigned to one host
Session    -> logical values/open-page order that can survive host recreation
```

In the recommended setup, a MiliUI Host is attached to the Client Control Container inside an instantiated Miliastra **UI Control Group**.

Miliastra owns:

- whether that Control Group instance exists;
- its native Client UI hierarchy;
- its integer UI Index used by server UI nodes;
- cross-Control-Group **Layer** ordering.

MiliUI owns:

- the stable Host ID <-> UI Index mapping for the client runtime;
- controls created under an attached host;
- listeners, tweens, layout metadata, and input ownership for those controls;
- logical page ordering inside each host;
- in-memory Session state.

For the editor/server-graph setup, read [ControlGroups.md](ControlGroups.md) first.

## The full lifecycle at a glance

```text
Server graph instantiates Menu Control Group (UI Index 1002)
    -> Menu script OnStart()
    -> UI.InitTemplates(...)
    -> page registrations are ensured
    -> UI.Hosts.Attach(1002, "Menu", script.object)
    -> Open default page OR Restore remembered pages

Menu exists normally
    -> pages/components/listeners/tweens belong to host "Menu"

Miliastra removes/recreates the native UI
    -> Menu script OnDestroy()
    -> UI.Hosts.Detach("Menu")
    -> live native references are released
    -> Host "Menu" still remembers UI Index 1002
    -> logical page order + remembered values remain in Session

Replacement Menu Control Group appears
    -> new Menu script OnStart()
    -> Attach(1002, "Menu", newRoot)
    -> UI.Pages.Restore("Menu")
```

Other hosts such as HUD remain logically independent throughout this sequence.

## Bootstrap

Configure templates independently of any root:

```lua
UI.InitTemplates({
    container = script:GetParam("ContainerTemplateId"),
    image = script:GetParam("ImageTemplateId"),
    text = script:GetParam("TextTemplateId"),
    button = script:GetParam("ButtonTemplateId"),
    cursorArea = script:GetParam("CursorAreaTemplateId"),
    animation = script:GetParam("UIAnimationTemplateId"),
    fullscreenAnimation = script:GetParam("FullscreenAnimationTemplateId"),
    keyHint = script:GetParam("KeyHintTemplateId"),
    textWindow = script:GetParam("TextWindowTemplateId"),
    gridScroller = script:GetParam("GridScrollerTemplateId"),
})
```

Register page definitions. Registration does not require the host to be attached:

```lua
if not UI.Pages.IsRegistered("Updates") then
    UI.Pages.Register("Updates", {
        host = "Menu",
        create = function(parent, page)
            return UpdatesPage.Create(parent, function()
                page:Close()
            end)
        end,
    })
end
```

The `IsRegistered` guard matters because the native Control Group script can start again while required Lua module state remains alive. Duplicate page IDs are intentionally programming errors.

## Host appears

When the Control Group's Client Control Container exists:

```lua
local MENU_UI_INDEX = 1002
UI.Hosts.Attach(MENU_UI_INDEX, "Menu", script.object)
```

The UI Index is required. MiliUI does not prescribe how the game stores it; a Lua literal/constant, shared config, or another game-defined source is valid.

Attachment is passive. The host script explicitly decides what should happen next.

For a newly-instantiated menu with no remembered open page:

```lua
UI.Pages.Open("Updates")
```

For a replacement root whose pages were already logically open:

```lua
UI.Pages.Restore("Menu")
```

A common bootstrap is:

```lua
local openPages = UI.Pages.GetOpenPages("Menu")

if #openPages > 0 then
    UI.Pages.Restore("Menu")
else
    UI.Pages.Open("Updates")
end
```

That policy is game-side behavior, not hidden behavior inside `Attach`.

## Control Group existence can be the show/hide mechanism

If a Server Node Graph already controls whether the Control Group exists, a separate signal whose only meaning is "show the Lua UI" is redundant.

```text
instantiate Control Group -> script starts -> host attaches -> UI appears
remove Control Group      -> script destroys -> host detaches
```

When client Lua needs to request activation/removal itself, it can retrieve the remembered Miliastra Index with:

```lua
local uiIndex = UI.Hosts.RequireIndex("Menu")
```

ServerSignals remain appropriate for data/events and for game-specific requests to server-owned UI nodes.

## Multiple pages in one host

Each host owns an independent bottom-to-top page order:

```text
Menu
  Page 1
  Page 2
  Page 3  <- frontmost within Menu
```

`UI.Pages.BringToFront("Page 1")` uses native sibling ordering inside the Menu host. It does not rebuild the page and does not reorder another Control Group.

Queries therefore require a host where ordering matters:

```lua
UI.Pages.GetOpenPages("Menu")
UI.Pages.GetActivePage("Menu")
```

There is intentionally no global active page across separate HUD/Menu/Overlay hosts.

## Multiple Hosts from one script

One script may attach multiple Hosts if it owns multiple roots:

```lua
UI.Hosts.Attach(1001, "HUD", hudRoot)
UI.Hosts.Attach(1002, "Menu", menuRoot)
```

Each Host has its own root/runtime ownership and a unique UI Index. MiliUI rejects a Host ID reused with a different Index and rejects one Index being assigned to two Host IDs.

## Cross-host layering

Cross-host ordering is outside the page stack:

```text
HUD Control Group      -> Host "HUD"
Menu Control Group     -> Host "Menu"
Overlay Control Group  -> Host "Overlay"
```

Use the Control Group **Layer** setting to decide which native root appears above another. MiliUI only manages sibling/page ordering inside a host.

## Temporary host loss

During host-driven teardown:

```lua
function OnDestroy()
    if UI.Hosts.IsAttached("Menu") then
        UI.Hosts.Detach("Menu")
    end
end
```

MiliUI releases Menu-owned live input flags, listeners, tweens, persistence bindings, layout metadata, and native references. It does **not** intentionally destroy the hierarchy that Miliastra is already removing.

The logical Menu open-page order remains in Session and the Menu -> UI Index mapping remains available so a replacement root can restore it or client code can identify that server-owned UI entry.

Other hosts are unaffected.

This host recreation is different from a **full client reconnect/refresh**. Host/Page/Session state can survive a native UI root recreation inside the same Lua runtime, but a newly-created client Lua runtime starts with fresh process-local state. If the game uses `UI.Player`, its Player Entity must be supplied again after such a reconnect. See [Player.md](Player.md).

## Recreated host

When Miliastra creates the replacement Client Control Container:

```lua
UI.Hosts.Attach(1002, "Menu", script.object)
```

Attachment still does nothing automatically. To recreate previously-open pages:

```lua
local restored, pages = UI.Pages.Restore("Menu")
```

Restore rebuilds remembered pages in bottom-to-top order. Stateful components using stable `id` + `remember = true` recover their Session values.

## Actual page close

A user/action closing a page is different from native host loss:

```lua
UI.Pages.Close("Updates")
```

The page is destroyed if live and removed from the host's logical open-page order. Its remembered Session values remain unless explicitly cleared.

If the Control Group itself represents the visibility of the entire menu, the game may choose to remove the Control Group after its logical pages are finished. That Control Group removal will then trigger the normal `Detach` path.

## A simple HUD does not need Pages

`UI.Pages` is useful for logical screens, stacking, and restoration. It is not required merely because a Host exists.

A HUD Control Group can simply:

```lua
local HUD_UI_INDEX = 1001

function OnStart()
    UI.InitTemplates(templates)
    UI.Hosts.Attach(HUD_UI_INDEX, "HUD", script.object)
    BuildHud(script.object)
end

function OnDestroy()
    UI.Hosts.Detach("HUD")
end
```

When the HUD Control Group is instantiated again, `OnStart` rebuilds it under the new root.

## Failure semantics

Opening or bringing a page forward while its registered host is unavailable returns:

```lua
false, "host-unavailable"
```

No deferred request is stored. Later `Attach` does not retry it.

Duplicate attached Host IDs, conflicting Host/Index mappings, duplicate UI Index mappings, and duplicate registered Page IDs fail immediately rather than silently replacing existing identities.

## Normal cleanup rule

Do not put this in every Control Group script:

```lua
UI.DestroyAll()
```

`DestroyAll` is global across attached MiliUI hosts. A Menu script should not destroy HUD-owned UI.

Use host-local teardown instead:

```lua
UI.Hosts.Detach("Menu")
```

That is the lifecycle boundary the multi-host runtime is designed around.
