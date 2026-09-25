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

Attach a Lua UI Controller script to the Client Control Container.

For this first screen, build it in small pieces so each part has one clear job. After the walkthrough, the complete copy/paste version is shown in one block.

### 6.1 Load MiliUI and name this UI

```lua
local UI = require("MiliUI/init")

local UI_INDEX = 1001
local HOST_ID = "Quick Start"
```

`require("MiliUI/init")` loads the installed MiliUI runtime.

`UI_INDEX` is Miliastra's integer identity for this Control Group. Replace `1001` with the real UI Index from your project.

`HOST_ID` is MiliUI's stable name for this live UI root. The UI Index and Host ID identify the same interface at two different layers: Miliastra owns the numeric Control Group identity, while MiliUI uses the Host name for runtime ownership and cleanup.

### 6.2 Attach the Client Control Container as a Host

Start the controller with:

```lua
function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)
end
```

`script.object` is the Client Control Container this script is attached to.

`UI.Hosts.Attach(...) ` tells MiliUI that this native root currently exists. Controls, listeners, tweens, bindings, and other runtime resources created under it can now be owned and cleaned up as part of this Host.

Do not attach this Host from the persistent Global setup script. The controller that actually owns the Client Control Container should attach and detach it.

### 6.3 Create a screen

Add this inside `OnStart()` after `Attach`:

```lua
local screen = UI.Screen(script.object, {
    padding = 40,
    background = "page",
    showCursor = true,
})
```

`UI.Screen` creates the page-sized root for this interface.

For this simple interactive example:

- `padding = 40` keeps content away from the screen edges;
- `background = "page"` uses the theme's normal page background;
- `showCursor = true` makes the cursor available while this UI is open.

### 6.4 Add a content layout

Now add a small vertical layout:

```lua
local content = UI.Column(screen, {
    name = "QuickStartContent",
    fitContent = true,
    gap = 16,
    align = "center",
})

UI.Center(content)
```

A `Column` stacks its children vertically.

`fitContent = true` lets this simple container size itself from its children instead of hard-coding a rectangle that may stop fitting when content changes.

`UI.Center(content)` places the finished group in the middle of the screen.

### 6.5 Add text and a Button

Create a heading:

```lua
UI.Heading(content, {
    text = "Hello, MiliUI!",
    needsTranslation = false,
    fitWidth = true,
    fitWidthPadding = 16,
})
```

For short single-line text, `fitWidth = true` lets the width follow the resolved text. `fitWidthPadding = 16` adds extra breathing room because Miliastra does not expose exact native preferred text width and some font/style combinations can otherwise clip close to the edge.

Now add a content-sized Button:

```lua
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
```

`fitContent = true` sizes the Button from its label and padding rather than assuming one fixed English-sized width.

`OnClick` registers the normal activation callback. MiliUI Buttons also participate in native controller focus/navigation by default.

### 6.6 Detach the Host when Miliastra removes this UI

Add the controller cleanup function:

```lua
function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

When Miliastra removes this Control Group, its Client Control Container no longer exists. `Detach` releases only the live runtime resources owned by this Host.

Do not use `UI.DestroyAll()` as normal per-Control-Group cleanup because it affects every currently attached MiliUI Host.

### 6.7 Complete copy/paste example

The pieces above combine into this small controller:

```lua
local UI = require("MiliUI/init")

local UI_INDEX = 1001
local HOST_ID = "Quick Start"

function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local screen = UI.Screen(script.object, {
        padding = 40,
        background = "page",
        showCursor = true,
    })

    local content = UI.Column(screen, {
        name = "QuickStartContent",
        fitContent = true,
        gap = 16,
        align = "center",
    })

    UI.Center(content)

    UI.Heading(content, {
        text = "Hello, MiliUI!",
        needsTranslation = false,
        fitWidth = true,
        fitWidthPadding = 16,
    })

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
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

This example intentionally stays small. The persistent setup from sections 2-4 already owns shared template initialization and optional Player registration; this controller only owns its own Host lifecycle and UI.

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
        fitWidthPadding = 16,
    })

    UI.Label(content, {
        name = "WelcomeMessage",
        text = "Your MiliUI setup is working.",
        textId = "QuickStart.Message",
        fitWidth = true,
        fitWidthPadding = 16,
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
- [Text Geometry](docs/TextGeometry.md)
- [Responsive Layout](docs/ResponsiveLayout.md)
- [Pages](docs/Pages.md)
- [Controller Support](docs/ControllerSupport.md)
- [Player Context](docs/Player.md)
- [Localization](docs/Localization.md)
- [Theming](docs/Theming.md)
- [Support and bug reports](SUPPORT.md)

For copyable starter scripts, see [examples/getting-started](examples/getting-started/README.md).
