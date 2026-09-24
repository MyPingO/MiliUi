# Pages

`UI.Pages` manages logical pages that belong to named MiliUI Hosts. A host can contain several open pages at once; their order is tracked from bottom/back to front/top.

A Page is **not** a Miliastra UI Control Group. Pages live *inside* one attached host/root. Cross-Control-Group ordering still belongs to Miliastra's Layer system.

Page IDs are globally unique. Host IDs and page IDs are separate namespaces.

For the recommended Control Group setup, see [ControlGroups.md](ControlGroups.md).

## When to use Pages

Use Pages when one host needs logical screens such as:

```text
Menu Host
├── Main Menu
├── Settings
└── Inventory
```

You do not need Pages for a simple HUD that just builds one UI tree whenever its Control Group exists.

## Register

Register each page once and assign it to exactly one host:

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

The factory receives the attached host root plus a page context containing:

```text
id
host
Close()
BringToFront()
```

The returned page root must be directly parented to the supplied host root. `UI.Screen(parent, ...)` naturally satisfies this requirement.

Registering the same page ID twice is an error. A Client Control Container script can restart while MiliUI module state remains alive, so bootstrap code should guard registration with `IsRegistered` or keep registrations in a require-once module.

## Open

```lua
local opened, result = UI.Pages.Open("Updates")
```

When the page's host is attached, MiliUI builds the page, remembers it as open, and brings its root to the front of that host.

When the host is unavailable:

```lua
opened == false
result == "host-unavailable"
```

The failed request is not remembered. Host attachment never retries it automatically.

Opening an already-live page does not create a second copy. It brings the existing page to the front.

## Multiple pages in one Host

A Menu host can contain:

```text
Page 1
Page 2
Page 3  <- frontmost inside Menu
```

```lua
UI.Pages.GetOpenPages("Menu")
-- { "Page 1", "Page 2", "Page 3" }

UI.Pages.GetActivePage("Menu")
-- "Page 3"
```

`active` means frontmost **within that host**. There is intentionally no global active page across separate HUD/Menu/Overlay roots.

Pages can close out of order:

```lua
UI.Pages.Close("Page 2")
```

leaving Page 1 and Page 3 open.

## Bring to front

```lua
UI.Pages.BringToFront("Page 1")
```

For a live page this calls native sibling ordering on the page root and updates the host's remembered order. The page is not destroyed/rebuilt merely to reorder it.

If the page is closed, `BringToFront` behaves like `Open`. If its host is unavailable, it returns `false, "host-unavailable"`.

### BringToFront is not cross-host layering

This works inside one host:

```text
Menu / Settings
Menu / Inventory
```

It cannot put the entire Menu Control Group above a separate HUD or Overlay Control Group.

Use the Miliastra Control Group **Layer** parameter for cross-host ordering.

## Host loss and restore

Temporary native host loss is handled through Hosts, not Pages:

```lua
UI.Hosts.Detach("Menu")
```

MiliUI releases live Menu page input/native references while preserving the logical open-page order and the Host's registered UI Index.

After the native root is recreated, attach it again using the same Miliastra UI Index:

```lua
UI.Hosts.Attach(1002, "Menu", newRoot)
```

Nothing is rebuilt yet. Restoration is explicit:

```lua
local restored, pages = UI.Pages.Restore("Menu")
```

Restore rebuilds remembered Menu pages in their stored bottom-to-top order. Other hosts are untouched.

A common Control Group bootstrap is:

```lua
local openPages = UI.Pages.GetOpenPages("Menu")

if #openPages > 0 then
    UI.Pages.Restore("Menu")
else
    UI.Pages.Open("Main Menu")
end
```

That policy belongs in the attached UI script. `Hosts.Attach` itself remains passive.

## Close versus Detach

Use page close when the page is logically no longer open:

```lua
UI.Pages.Close("Updates")
```

Use host detach when Miliastra is removing/replacing the entire native host hierarchy:

```lua
UI.Hosts.Detach("Menu")
```

`Close` removes the page from Session's open-page order. `Detach` preserves that order and the Host's UI Index for optional later `Restore`.

If a Server Node Graph removes the whole Menu Control Group to hide the menu, its attached script should normally `Detach("Menu")` in `OnDestroy`.

## Close all

Close all logical pages in one host:

```lua
UI.Pages.CloseAll("Menu")
```

Other hosts remain open.

## Page state

Every page factory runs inside `UI.Session.WithScope(pageId)`. Components using `remember = true` therefore persist under the page's stable ID regardless of which other page is frontmost.

Closing a page does not erase its remembered values. Use:

```lua
UI.Session.ClearPage(pageId)
```

when the state itself should be forgotten.

## Pages and overlays

A `UI.Modal` created by a Menu page is still inside the Menu host. It can cover Menu siblings, but its native root still belongs to the Menu Control Group's Layer.

If an overlay must always render above several independent Control Groups, use a dedicated Overlay Control Group/Host rather than trying to solve cross-root ordering with `Pages.BringToFront`.
