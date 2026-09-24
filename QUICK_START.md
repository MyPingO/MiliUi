# MiliUI Quick Start

This guide gets a first MiliUI interface on screen while also setting up the project in a way that scales cleanly later.

> MiliUI is preparing for its first public beta. Download links will appear in GitHub Releases when the beta opens.

## 1. Install MiliUI

### Recommended: MiliUI Manager

1. Download **MiliUI Manager** from the latest GitHub Release.
2. Open it.
3. Select the Miliastra project you want to use.
4. Click **Install MiliUI**.
5. Restart Test Play after installing or updating MiliUI.

The Manager installs only:

```text
external_lua_file/
└─ MiliUI/
   └─ init.lua
```

You do not need MiliUI's development source files in your project. Existing MiliUI installations are backed up before replacement.

### Manual installation

Advanced users can download the production `MiliUI-init.lua` release asset and place it at:

```text
external_lua_file/MiliUI/init.lua
```

## 2. Create the full MiliUI Client UI template set

MiliUI creates Client UI controls from editor templates. For a new project, the recommended setup is to create **one template for every Client UI type that MiliUI currently supports**, even if your first screen does not use all of them.

Create one of each:

| MiliUI template key | Editor control |
| --- | --- |
| `container` | ContainerControl |
| `image` | ImageControl |
| `text` | TextBoxControl / normal text control |
| `button` | PresetButton |
| `cursorArea` | CursorEventArea |
| `animation` | UIAnimationControl |
| `fullscreenAnimation` | Fullscreen UI Animation |
| `keyHint` | KeyHintControl |
| `textWindow` | TextWindowControl |
| `gridScroller` | GridScrollerControl |

You do **not** need a `ReferenceControl` template for MiliUI setup.

Creating the whole supported set up front has two advantages:

- every current MiliUI feature is immediately available;
- future components that reuse these same native control types work without changing the shared setup.

If a future MiliUI version adds support for a genuinely new native Client UI type, that release may add another template requirement.

### Expose the template IDs to a persistent client script

Create Integer Script Parameters for the template IDs. The exact parameter names are your choice; these names are used throughout the beginner examples:

```text
Container Template ID
Image Template ID
Text Template ID
Button Template ID
Cursor Area Template ID
UI Animation Template ID
Screen Animation Template ID
Key Hint Template ID
Text Window Template ID
Grid Scroller Template ID
```

## 3. Add one persistent MiliUI setup script

For projects with more than one UI, put shared MiliUI setup in a persistent client Global Script (or another client script that is guaranteed to start once and remain available).

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
        keyHint = script:GetParam("Key Hint Template ID"),
        textWindow = script:GetParam("Text Window Template ID"),
        gridScroller = script:GetParam("Grid Scroller Template ID"),
    })
end

function OnStart()
    InitTemplates()
end
```

### What this code is doing

`require("MiliUI/init")` loads the installed production runtime.

`InitTemplates()` tells MiliUI which editor template ID belongs to each supported native control type. Template configuration is shared across every MiliUI Host in the same client runtime, so a persistent setup script is a convenient place to do this once.

`OnStart()` is where the persistent client script performs that shared initialization. UI Controllers created later can then focus only on attaching their own Host and building UI.

For a very small project, calling the same complete `UI.InitTemplates(...)` mapping directly in one UI Controller is also valid. Repeated compatible mappings are safe.

## 4. Optional: register the local Player Entity

Some MiliUI/game workflows need the local Player Entity, usually because a client ServerSignal includes the Player Entity as one of its parameters.

MiliUI can store that reference for all UI modules:

```lua
function OnStart()
    InitTemplates()

    UI.Player.RegisterFromSignal(
        script,
        "Register Player"
    )
end
```

This tells MiliUI to listen for a server-to-client signal named `"Register Player"`. The signal should send the local Player Entity as parameter #1.

This is optional. If your game never uses `UI.Player`, leave it out.

### Reconnects matter

Player registration belongs to the current client Lua runtime. If a disconnect/reconnect causes the client to be refreshed, the new client must receive its Player Entity again.

A simple game-side pattern is:

```text
client starts or reconnects
    -> persistent client script registers "Register Player"
    -> server initialization sends the Player Entity
    -> UI.Player is ready again
```

MiliUI does not dictate how your server detects the reconnect or when it sends that signal. The important part is that the registration must happen again for a fresh client runtime.

See [Player Context](docs/Player.md) for the full API.

## 5. Create one UI Control Group

In the Miliastra UI Control Group Library:

1. Create a UI Control Group.
2. Put a **Client Control Container** inside it.
3. Attach a Lua UI Controller script to that container.
4. Note the Control Group's **UI Index**.

The UI Index is Miliastra's integer identity for that UI entry. MiliUI associates it with a stable Host name such as `"Main Menu"`.

For the first example below, replace `1001` with your actual UI Index.

## 6. Build the smallest useful MiliUI screen

Attach this script to the Client Control Container:

```lua
local UI = require("MiliUI/init")

-- Miliastra owns this integer. Replace it with this Control Group's UI Index.
local UI_INDEX = 1001

-- This is MiliUI's stable name for the native UI root.
local HOST_ID = "Quick Start"

function OnStart()
    -- Attach the Client Control Container to MiliUI.
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    -- Screen creates the page-sized MiliUI root and handles the normal content area.
    local screen = UI.Screen(script.object, {
        padding = 40,
        background = "page",
        showCursor = true,
    })

    -- A fit-content Column sizes itself from its children instead of requiring
    -- hand-authored width/height values for this simple layout.
    local content = UI.Column(screen, {
        name = "QuickStartContent",
        fitContent = true,
        gap = 16,
        align = "center",
    })

    UI.Center(content)

    -- fitWidth lets the heading follow the actual text width.
    UI.Heading(content, {
        text = "Hello, MiliUI!",
        needsTranslation = false,
        fitWidth = true,
    })

    -- fitContent lets the Button size from its label + padding.
    local button = UI.Button(content, {
        label = {
            text = "CLICK ME",
            needsTranslation = false,
        },
        fitContent = true,
    })

    button:OnClick(function()
        print("MiliUI button clicked!")
    end)
end

function OnDestroy()
    -- Detach only the Host owned by this Control Group.
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

### Why each block exists

The two constants separate Miliastra's UI identity (`UI_INDEX`) from MiliUI's logical identity (`HOST_ID`).

`UI.Hosts.Attach(...)` tells MiliUI that this native root currently exists. MiliUI can then own controls, listeners, tweens, and cleanup under that Host.

`UI.Screen(...)` gives the interface a normal page/content root. `showCursor = true` is appropriate for this mouse-driven test screen.

`UI.Column(..., { fitContent = true })` is used instead of hard-coding a container rectangle because this tiny layout should naturally follow its contents.

The Heading uses `fitWidth = true`, and the Button uses `fitContent = true`. Fixed dimensions are still useful when the design actually requires them, but they should not be added only because one English string happens to fit.

`OnDestroy()` detaches only this Host. Do not use `UI.DestroyAll()` as normal Control Group cleanup because that would affect unrelated MiliUI Hosts too.

## 7. Test it

Instantiate the UI Control Group and enter Test Play.

You should see a heading and button in the center of the screen. Clicking the button should print:

```text
MiliUI button clicked!
```

That confirms:

```text
production runtime loaded
shared templates configured
Control Group root attached as a Host
MiliUI controls created
pointer interaction works
Host cleanup path exists
```

## 8. The same example with production-friendly polish

Once the barebones version works, the same structure can add localization, shared sound, diagnostics-friendly names, and controller-friendly behavior without changing the basic lifecycle.

### Add a project-wide Button sound

In the persistent MiliUI setup script, add a positive Audio Resource ID as a Script Parameter named `Button Click Audio ID`, then apply it before UI is created:

```lua
local clickAudioId = script:GetParam("Button Click Audio ID")

if type(clickAudioId) == "number" and clickAudioId > 0 then
    UI.Theme.Apply({
        sounds = {
            buttonClick = clickAudioId,
        },
    })
end
```

Using the theme is preferable when most project Buttons should share the same click sound. A single Button can still override it with `clickAudioId`.

### Use localized fallback text and intrinsic sizing

```lua
local UI = require("MiliUI/init")

local UI_INDEX = 1001
local HOST_ID = "Quick Start Polished"

function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local screen = UI.Screen(script.object, {
        padding = 40,
        background = "page",
        showCursor = true,
        disableKeyEventPassthrough = true,
    })

    local content = UI.Column(screen, {
        name = "WelcomeContent",
        fitContent = true,
        gap = 14,
        align = "center",
    })

    UI.Center(content)

    UI.Heading(content, {
        name = "WelcomeTitle",
        text = "WELCOME",
        textId = "QuickStart.Welcome",
        fitWidth = true,
    })

    UI.Label(content, {
        name = "WelcomeMessage",
        text = "Your MiliUI setup is working.",
        textId = "QuickStart.Message",
        fitWidth = true,
    })

    local continueButton = UI.Button(content, {
        name = "ContinueButton",
        variant = "primary",
        fitContent = true,
        label = {
            text = "CONTINUE",
            textId = "QuickStart.Continue",
        },
    })

    continueButton:OnClick(function()
        print("Continue selected")
    end)
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

This version adds several practices that are useful in real projects:

- `textId` supplies the localization mapping while `text` remains an English fallback;
- intrinsic sizing allows translated labels to grow instead of assuming English-sized rectangles;
- meaningful `name` values make layout diagnostics easier to read;
- `variant = "primary"` expresses semantic Button styling rather than manually restyling one Button;
- the shared theme supplies Button audio;
- normal MiliUI Buttons already participate in native controller focus/navigation and show the controller focus indicator when focused;
- `disableKeyEventPassthrough = true` is useful for a menu-like screen that should own its UI input while open.

See [Localization](docs/Localization.md), [Intrinsic Sizing](docs/IntrinsicSizing.md), [Theming](docs/Theming.md), and [Control Groups and Hosts](docs/ControlGroups.md) for the next layer of detail.

## 9. Recommended project structure

Once the project has more than one UI, a useful structure is:

```text
external_lua_file/
├── MiliUI/
│   └── init.lua
├── Global/
│   └── MiliUI Global.lua
├── Client UI Logic/
│   ├── Menu UI Controller.lua
│   └── HUD UI Controller.lua
└── Game UI/
    ├── Main Menu Page.lua
    ├── Settings Page.lua
    └── UI Data.lua
```

Only `MiliUI/init.lua` is the installed MiliUI runtime. The other folders above are your own game scripts.

Read [Recommended Game Project Structure](docs/ProjectStructure.md) when you are ready to split lifecycle, Pages, and editable data into separate modules.

## What to learn next

- [Control Groups and MiliUI Hosts](docs/ControlGroups.md)
- [Recommended Game Project Structure](docs/ProjectStructure.md)
- [Components](docs/Components.md)
- [Intrinsic and Localization-Safe Sizing](docs/IntrinsicSizing.md)
- [Responsive Layout](docs/ResponsiveLayout.md)
- [Pages](docs/Pages.md)
- [Player Context](docs/Player.md)
- [Localization](docs/Localization.md)
- [Theming](docs/Theming.md)
- [Support and bug reports](SUPPORT.md)

For copyable starter scripts, see [examples/getting-started](examples/getting-started/README.md).
