# Recommended Game Project Structure

MiliUI does not force one project layout, but larger games are much easier to maintain when **shared setup**, **native UI lifecycle**, **page construction**, and **game content/data** are kept separate.

This guide shows a beginner-friendly structure that scales from one UI screen to several independent interfaces such as an Updates screen, Settings screen, HUD, inventory, or overlay.

> **Rule of thumb:** one shared setup, one controller per Host, one module per Page.

This is a recommendation, not a framework requirement. A small project can keep everything in one attached script. The structure below becomes more useful as soon as the game has multiple MiliUI screens or Control Groups.

---

## 1. The four responsibilities

A clean MiliUI game usually has four different kinds of Lua files.

| File type | Responsibility | Attached to a UI object? |
| --- | --- | --- |
| **Persistent shared setup script** | Initializes shared primitive templates and optional player context | No Client Control Container required |
| **UI Controller** | Owns one native UI Host lifecycle and knows that UI entry's Index | **Yes** |
| **Page module** | Builds one logical MiliUI Page | No |
| **Data module** | Stores content/configuration used by a Page | No |

Think of the flow like this:

```text
Persistent shared setup
    -> configures MiliUI once

Server activates a UI Control Group
    -> its Client Control Container is created
        -> attached UI Controller starts
            -> attaches a MiliUI Host
            -> registers the Page module
            -> opens/restores the Page
                -> Page module builds controls
                    -> Data module supplies content
```

The most important distinction for beginners is:

```text
Controller = attached script that owns the native UI lifecycle
Page       = required Lua module that builds interface content
Data       = required Lua module containing content/configuration
```

A Page module is normally **not attached directly** to a Client Control Container.

---

## 2. Example project structure

Suppose a game has two independent interfaces:

- an Updates screen;
- a Settings screen.

Each is its own Miliastra UI Control Group and can be activated or removed independently.

A clean game-side layout could be:

```text
Global/
└── MiliUI Global.lua

Client UI Logic/
├── Updates UI Controller.lua
└── Settings UI Controller.lua

Game UI/
├── Updates Page.lua
├── Updates Data.lua
└── Settings Page.lua
```

In the UI Control Group Library, the editor-side structure might be:

```text
Updates UI Control Group
UI Index: 1201
Layer: project-defined
└── Client Control Container
    └── Updates UI Controller.lua

Settings UI Control Group
UI Index: 1202
Layer: project-defined
└── Client Control Container
    └── Settings UI Controller.lua
```

Only the controller scripts are attached to the Client Control Containers.

`Updates Page.lua`, `Updates Data.lua`, and `Settings Page.lua` are normal modules loaded with `require(...)`.

---

## 3. Shared setup belongs in one persistent script

Shared templates are global to the MiliUI runtime. If several UI Controllers use the same mapping, repeating the same template parameters on every controller is unnecessary.

For a multi-UI project, a persistent client Global Script is a convenient place to initialize them once.

Example:

```lua
local UI = require("MiliUI/init")

local function InitTemplates()
    UI.InitTemplates({
        container = script:GetParam("Container Template ID"),
        image = script:GetParam("Image Template ID"),
        text = script:GetParam("Text Template ID"),
        button = script:GetParam("Button Template ID"),
        cursorArea = script:GetParam("Cursor Area Template ID"),
        animation = script:GetParam("UI Animation Template ID"),
        fullscreenAnimation = script:GetParam("Screen Animation Template ID"),
        gridScroller = script:GetParam("Grid Scroller Template ID"),
        keyHint = script:GetParam("Key Hint Template ID"),
        textWindow = script:GetParam("Text Window Template ID"),
    })
end

function OnStart()
    InitTemplates()
end
```

The exact parameter names are game-defined. MiliUI does not require the names above; they are simply clear editor-facing names.

For public projects, **register the complete supported template set up front** rather than trying to predict which templates the first screen needs. One copy of each supported editor control is inexpensive, keeps every current MiliUI feature available, and means later components can reuse the shared mapping without changing each UI Controller.

The current shared template kinds are:

```text
ContainerControl
ImageControl
TextBoxControl / normal text template
PresetButton
CursorEventArea
UIAnimationControl
Fullscreen UI Animation
KeyHintControl
TextWindowControl
GridScrollerControl
```

`ReferenceControl` is not a MiliUI template kind, and the current framework does not require a separate ReferenceControl template. `UI.Native(...)` accepts arbitrary editor template indexes directly when a project needs a native control outside the shared mapping.

This complete setup automatically covers future MiliUI components that reuse these existing template kinds. If MiliUI eventually adds support for a genuinely new native Client UI type, that release may add a new template requirement.

### Optional player registration

If the game uses `UI.Player` so client UI code can retrieve the current Player Entity, the same persistent script is also a good place to register it once:

```lua
local UI = require("MiliUI/init")

local function InitTemplates()
    UI.InitTemplates({
        container = script:GetParam("Container Template ID"),
        image = script:GetParam("Image Template ID"),
        text = script:GetParam("Text Template ID"),
        button = script:GetParam("Button Template ID"),
        cursorArea = script:GetParam("Cursor Area Template ID"),
        animation = script:GetParam("UI Animation Template ID"),
        fullscreenAnimation = script:GetParam("Screen Animation Template ID"),
        gridScroller = script:GetParam("Grid Scroller Template ID"),
        keyHint = script:GetParam("Key Hint Template ID"),
        textWindow = script:GetParam("Text Window Template ID"),
    })
end

function OnStart()
    InitTemplates()

    UI.Player.RegisterFromSignal(
        script,
        "Register Player"
    )
end
```

`"Register Player"` is the actual server -> client signal name in this example. The signal must send the local Player Entity as parameter #1.

No additional Script Parameter is required for the signal name.

The `script` argument is intentionally explicit. Required Lua modules in Miliastra have their own Script context, so MiliUI cannot safely assume that its internal `script` value is the persistent Global Script that should own the signal handler.

The registration is client-runtime state. If a disconnect/reconnect causes the client Lua environment to be refreshed, the new client must register the handler again and the game must provide the local Player Entity again. A simple pattern is for the server to send the same registration signal whenever that client's initialization/reconnection flow completes.

MiliUI does not prescribe how the server detects that lifecycle; it only provides the client-side registration helper.

If the game does not use `UI.Player`, simply omit the registration code.

### Is calling `UI.InitTemplates(...)` in every controller wrong?

No.

MiliUI allows compatible repeated calls to `UI.InitTemplates(...)`. Separate Control Group scripts may initialize the same template mapping again.

For a small project, this is perfectly valid:

```text
Updates UI Controller
    -> InitTemplates
    -> Attach Updates Host

Settings UI Controller
    -> InitTemplates
    -> Attach Settings Host
```

The shared Global Script approach is recommended when a project has several MiliUI interfaces because it removes duplication and gives the project one obvious place for shared MiliUI configuration.

All repeated mappings must agree. Do not configure `button` as one template ID in one script and a different template ID elsewhere.

---

## 4. A UI Controller owns one Host

The UI Controller is the script attached to the Client Control Container created by the Control Group.

Its job is lifecycle, not detailed UI construction.

A controller normally knows:

```text
the Host ID
the Miliastra UI Index
which Page module belongs to the Host
what should happen when the Host appears
what should happen when the Host disappears
```

It should generally **not** contain hundreds of lines of layout/content code.

### Updates UI Controller example

Assume the controller has an Integer script parameter named:

```text
Updates UI Index
```

Then:

```lua
local UI = require("MiliUI/init")
local UpdatesPage = require("Game UI/Updates Page")

local HOST_ID = "Updates"
local UPDATES_UI_INDEX = script:GetParam("Updates UI Index")

assert(
    type(UPDATES_UI_INDEX) == "number",
    "Updates UI Index must be configured as an Integer script parameter"
)

function OnStart()
    UpdatesPage.Register()

    UI.Hosts.Attach(
        UPDATES_UI_INDEX,
        HOST_ID,
        script.object
    )

    local openPages = UI.Pages.GetOpenPages(HOST_ID)

    if #openPages > 0 then
        UI.Pages.Restore(HOST_ID)
    else
        UpdatesPage.Open()
    end
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

This controller stays small because shared template setup is already handled by the persistent script and the actual interface is built by `Updates Page.lua`.

### Why does the UI Index belong here?

The UI Index identifies the Miliastra UI entry that this Host corresponds to.

That is native lifecycle information, so it belongs naturally in the controller that owns that native UI root:

```lua
UI.Hosts.Attach(
    UPDATES_UI_INDEX,
    "Updates",
    script.object
)
```

The Page module should not need to know its Control Group Index.

The Index may come from:

- an Integer script parameter;
- a Lua constant;
- a shared configuration module;
- another game-defined source.

MiliUI does not require one particular configuration style.

---

## 5. A Page module builds the interface

The Page module contains UI construction and page-specific behavior.

It should know which MiliUI Host it belongs to, but it does not need the Miliastra UI Index and does not attach the Host itself.

Example `Game UI/Updates Page.lua`:

```lua
local UI = require("MiliUI/init")
local UpdatesData = require("Game UI/Updates Data")

local UpdatesPage = {}

local HOST_ID = "Updates"
local PAGE_ID = "Updates"

local function BuildPage(parent, page)
    local screen = UI.Screen(parent, {
        padding = 48,
        background = "page",
        showCursor = true,
        disableKeyEventPassthrough = true,
    })

    local content = UI.Column(screen, {
        name = "UpdatesContent",
        fillWidth = true,
        fitHeight = true,
        gap = 16,
        align = "center",
        justify = "start",
    })

    UI.Heading(content, {
        name = "UpdatesTitle",
        text = "Updates",
        textId = "Updates.Title",
        fitWidth = true,
    })

    UI.Label(content, {
        name = "UpdatesSummary",
        text = UpdatesData.items[1].summary,
        needsTranslation = true,
        fitWidth = true,
        maxWidth = "80%",
    })

    local backButton = UI.Button(content, {
        name = "BackButton",
        fitContent = true,
        label = {
            text = "BACK",
            textId = "Common.Back",
        },
    })

    backButton:OnClick(function()
        page:Close()
    end)

    return screen
end

function UpdatesPage.Register()
    if UI.Pages.IsRegistered(PAGE_ID) then
        return false
    end

    UI.Pages.Register(PAGE_ID, {
        host = HOST_ID,
        create = BuildPage,
    })

    return true
end

function UpdatesPage.Open()
    if not UI.Pages.IsRegistered(PAGE_ID) then
        UpdatesPage.Register()
    end

    return UI.Pages.Open(PAGE_ID)
end

return UpdatesPage
```

Notice what is **not** in this file:

```text
no UI Index
no UI.Hosts.Attach(...)
no primitive template parameters
no OnStart()
no OnDestroy()
```

Those responsibilities belong to the controller or shared setup script.

### Why guard `Register()`?

The native UI root may be destroyed and recreated while Lua module state survives.

That means this sequence is possible:

```text
first Updates UI instance
    -> UpdatesPage.Register()
    -> Host attaches

native UI disappears
    -> Host detaches

new Updates UI instance
    -> controller starts again
    -> same Updates Page module is still loaded
```

MiliUI treats duplicate Page registration as a programming error, so reusable registration functions should check:

```lua
if not UI.Pages.IsRegistered(PAGE_ID) then
    UI.Pages.Register(...)
end
```

---

## 6. A Data module contains content, not lifecycle

A data module is useful when a Page has content that changes independently from its layout.

For an Updates screen, keep dates, titles, patch notes, roadmap items, and similar content in `Updates Data.lua` rather than mixing everything into the layout code.

Example:

```lua
local UpdatesData = {}

UpdatesData.items = {
    {
        id = "2026-09-15",
        date = {
            month = "SEP",
            day = 15,
            year = 2026,
        },
        title = "September Update",
        summary = "New content and quality-of-life improvements.",
        sections = {
            {
                title = "What's New",
                items = {
                    "New game mode",
                    "New achievements",
                    "UI improvements",
                },
            },
        },
    },
}

return UpdatesData
```

Then the Page module reads that data:

```lua
local UpdatesData = require("Game UI/Updates Data")
```

This separation makes later edits much easier:

```text
Change patch notes       -> Updates Data.lua
Change visual layout     -> Updates Page.lua
Change native lifecycle  -> Updates UI Controller.lua
Change shared primitives -> MiliUI Global.lua
```

---

## 7. Adding a second interface should be simple

Once the structure exists, adding another UI does not require copying all shared MiliUI initialization.

Suppose the game later adds Settings.

### Settings UI Controller.lua

```lua
local UI = require("MiliUI/init")
local SettingsPage = require("Game UI/Settings Page")

local HOST_ID = "Settings"
local SETTINGS_UI_INDEX = script:GetParam("Settings UI Index")

assert(
    type(SETTINGS_UI_INDEX) == "number",
    "Settings UI Index must be configured as an Integer script parameter"
)

function OnStart()
    SettingsPage.Register()

    UI.Hosts.Attach(
        SETTINGS_UI_INDEX,
        HOST_ID,
        script.object
    )

    if #UI.Pages.GetOpenPages(HOST_ID) > 0 then
        UI.Pages.Restore(HOST_ID)
    else
        SettingsPage.Open()
    end
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

### Settings Page.lua

```lua
local UI = require("MiliUI/init")

local SettingsPage = {}

local HOST_ID = "Settings"
local PAGE_ID = "Settings"

local function BuildPage(parent, page)
    local screen = UI.Screen(parent, {
        padding = 48,
        background = "page",
        showCursor = true,
        disableKeyEventPassthrough = true,
    })

    local content = UI.Column(screen, {
        name = "SettingsContent",
        fitContent = true,
        gap = 16,
        align = "center",
    })

    UI.Center(content)

    UI.Heading(content, {
        name = "SettingsTitle",
        text = "Settings",
        textId = "Settings.Title",
        fitWidth = true,
    })

    UI.Toggle(content, {
        id = "Music Enabled",
        name = "MusicToggle",
        remember = true,
        width = 360,
        label = {
            text = "Music",
            textId = "Settings.Music",
        },
        value = true,
    })

    return screen
end

function SettingsPage.Register()
    if not UI.Pages.IsRegistered(PAGE_ID) then
        UI.Pages.Register(PAGE_ID, {
            host = HOST_ID,
            create = BuildPage,
        })
    end
end

function SettingsPage.Open()
    SettingsPage.Register()
    return UI.Pages.Open(PAGE_ID)
end

return SettingsPage
```

The shared Global Script does not change.

That is the main benefit of this architecture: each new interface adds only the code that is actually unique to that interface.

---

## 8. Dedicated Host or multiple Pages in one Host?

Not every Page needs its own Host.

This is a game-design/lifecycle decision.

### Use one Host with multiple Pages when

The screens share the same native Control Group and should behave like navigation inside one interface.

Example:

```text
Menu Host
├── Main Menu Page
├── Inventory Page
├── Settings Page
└── Credits Page
```

All of these can live under one `"Menu"` Host if they should share the same Control Group, Layer, and native lifecycle.

### Use dedicated Hosts when

The interfaces need independent native existence or Miliastra Layer behavior.

Example:

```text
HUD Host
Updates Host
Settings Host
Overlay Host
```

A dedicated `"Updates"` Host makes sense when the Updates UI has its own Control Group and the server can activate/remove it independently.

A dedicated Host also has its own UI Index:

```text
Updates Control Group -> UI Index 1201 -> Host "Updates"
Settings Control Group -> UI Index 1202 -> Host "Settings"
```

The important question is not "does this have its own Lua file?"

The important question is:

> Does this UI need its own native Control Group existence/Layer/lifecycle?

If yes, a dedicated Host is usually appropriate.

---

## 9. Opening, closing, detaching, and disabling are different

Beginners often treat these as the same operation, but they represent different layers.

### Close a Page

```lua
UI.Pages.Close("Updates")
```

This means the logical MiliUI Page is closed.

The native Control Group may still exist and its Host may still be attached.

### Detach a Host

```lua
UI.Hosts.Detach("Updates")
```

This means the native root disappeared.

MiliUI releases live native resources for that Host but preserves logical Page state so the game can explicitly restore it after temporary root recreation.

### Disable/remove a UI Control Group

This is a Miliastra/server lifecycle operation.

The server removes or disables the Control Group. Its controller is destroyed, `OnDestroy()` runs, and the controller detaches the Host.

A useful mental model is:

```text
Close  = I am done with this logical Page
Detach = this native root disappeared
Disable Control Group = Miliastra says this UI no longer exists
```

Do not use `game.DestroyClientUIControl(...)` as a replacement for server-owned Control Group removal.

---

## 10. Restore or start fresh?

`UI.Hosts.Attach(...)` is intentionally passive. It does not decide whether a UI should reopen old Pages or start from its default screen.

The controller makes that decision.

A common resume policy is:

```lua
local openPages = UI.Pages.GetOpenPages(HOST_ID)

if #openPages > 0 then
    UI.Pages.Restore(HOST_ID)
else
    UpdatesPage.Open()
end
```

This is useful when temporary UI recreation, such as teleport-related native hierarchy recreation, should preserve logical state.

If the game wants the next appearance to start fresh, close Pages before removing the Control Group:

```lua
UI.Pages.CloseAll("Updates")
```

Then when the Control Group appears again, its controller sees an empty Page stack and opens the default Page.

---

## 11. Client requests to activate or disable a UI

Some games allow client UI code to request that the server activate or disable a Control Group.

A generic game-defined signal can carry:

```text
Player Entity
UI Index
Active?
```

Example client request:

```lua
local signal = game.ServerSignal("Activate/Disable Lua UI")

signal:AddEntity(UI.Player.RequireEntity())
signal:AddInt(UI.Hosts.RequireIndex("Updates"))
signal:AddBool(false)
signal:SendSignal()
```

The server can then route the request using the Miliastra UI Index.

This signal format is **game application code**, not a MiliUI requirement. MiliUI does not dictate the name or parameter order of your server signals.

One limitation is important: `UI.Hosts.RequireIndex("Updates")` knows the Index only after that Host has successfully attached at least once in the current client runtime. If code must activate a UI that has never existed yet, use a game-defined static Index/configuration source instead.

---

## 12. Common structure mistakes

### Putting the entire interface in the controller

This works at first, but becomes difficult to maintain when the script contains lifecycle logic, layout, content, data, server signals, and state all together.

Prefer:

```text
Controller -> lifecycle
Page       -> UI construction
Data       -> content/configuration
```

### Attaching the Page module directly

Normally only the UI Controller is attached to the Client Control Container.

The controller loads the Page:

```lua
local UpdatesPage = require("Game UI/Updates Page")
```

### Putting the UI Index in the Page

The UI Index identifies the native Miliastra UI entry. Keep it in the controller or other game configuration used by the controller.

### Calling `UI.Hosts.Attach(...)` from the Global Script

The persistent Global Script does not own the dynamically-created Client Control Container roots.

Attach each Host from the controller that actually owns that root.

### Calling `UI.DestroyAll()` from one controller's `OnDestroy()`

`UI.DestroyAll()` affects all currently attached Hosts.

A normal controller should detach only its own Host:

```lua
UI.Hosts.Detach(HOST_ID)
```

### Registering the same Page every time without checking

Use `UI.Pages.IsRegistered(...)` when registration code may run again after native UI recreation.

### Giving two Hosts the same UI Index

Host ID and UI Index are a one-to-one mapping for the client runtime.

These are invalid:

```lua
UI.Hosts.Attach(1201, "Updates", updatesRoot)
UI.Hosts.Attach(1201, "Settings", settingsRoot)
```

Likewise, a Host cannot later change to a different Index.

---

## 13. Small-project version

Do not feel forced to create five files for a tiny interface.

For one simple Control Group, this is still valid:

```lua
local UI = require("MiliUI/init")

local UI_INDEX = 1201
local HOST_ID = "Example"

function OnStart()
    UI.InitTemplates({
        container = script:GetParam("Container Template ID"),
        image = script:GetParam("Image Template ID"),
        text = script:GetParam("Text Template ID"),
        button = script:GetParam("Button Template ID"),
        cursorArea = script:GetParam("Cursor Area Template ID"),
        animation = script:GetParam("UI Animation Template ID"),
        fullscreenAnimation = script:GetParam("Screen Animation Template ID"),
        keyHint = script:GetParam("Key Hint Template ID"),
        textWindow = script:GetParam("Text Window Template ID"),
        gridScroller = script:GetParam("Grid Scroller Template ID"),
    })

    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local screen = UI.Screen(script.object, {
        background = "page",
    })

    UI.Heading(screen, {
        text = "Hello",
        needsTranslation = false,
        fitWidth = true,
    })
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

Split responsibilities when the project benefits from it, not merely to create more files.

---

## 14. Recommended scalable pattern

For a game with several interfaces, this is the pattern to remember:

```text
Persistent Global Script
├── UI.InitTemplates(...) once
└── optional UI.Player registration once

Updates UI Controller
├── Updates UI Index
├── Attach Host "Updates"
├── Register/Open/Restore Updates Page
└── Detach Host in OnDestroy

Settings UI Controller
├── Settings UI Index
├── Attach Host "Settings"
├── Register/Open/Restore Settings Page
└── Detach Host in OnDestroy

Updates Page
└── builds the Updates interface

Updates Data
└── contains update content

Settings Page
└── builds the Settings interface
```

Or, in one sentence:

> **Put shared configuration in shared setup, native lifecycle in controllers, UI construction in Pages, and editable content in data modules.**

That separation keeps each file understandable and lets the project grow without coupling unrelated interfaces together.
