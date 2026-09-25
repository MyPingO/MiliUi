# MiliUI Quick Start

This guide will get your first MiliUI interface on screen and explain the important pieces as you go.

You do not need to understand every MiliUI system before starting. The goal here is to build one small working interface first, then show where to learn more.

> MiliUI is preparing for its first public beta. Download links will appear in GitHub Releases when the beta opens.

## 1. Install MiliUI

### Recommended: MiliUI Manager

1. Download **MiliUI Manager** from the latest GitHub Release.
2. Open it.
3. Select the Miliastra project you want to use.
4. Click **Install MiliUI**.
5. Restart Test Play after installing or updating MiliUI.

The Manager installs:

```text
external_lua_file/
└─ MiliUI/
   └─ init.lua
```

That `init.lua` file is the MiliUI runtime your own Lua scripts will load with `require("MiliUI/init")`.

You do not need MiliUI's development source files in your project. If MiliUI is already installed, the Manager creates a backup before replacing it.

### Manual installation

If you prefer to install it manually, download the production `MiliUI-init.lua` release file and place it at:

```text
external_lua_file/MiliUI/init.lua
```

## 2. Create the MiliUI Client UI templates

Miliastra creates Client UI controls from templates made in the editor. MiliUI uses those same templates when it creates controls from Lua.

For a new project, the easiest setup is to create **one template for every Client UI type MiliUI currently supports**, even if your first screen only uses a few of them.

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

You do **not** need a `ReferenceControl` template for the normal MiliUI setup.

Creating the full set now means you will not need to come back and add another template every time you start using a different MiliUI component.

If a future MiliUI version starts using a completely new type of native Client UI control, that version may require one additional template.

### Make the template IDs available to Lua

Each editor template has an ID. Your Lua setup script needs those IDs so it knows which editor template should be used for each MiliUI control type.

Create Integer Script Parameters for them. You can choose your own parameter names, but the examples in these docs use:

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

## 3. Add one shared MiliUI setup script

If your project has more than one interface, it is useful to have one persistent client Global Script that performs setup shared by all of them.

For example:

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

`require("MiliUI/init")` loads MiliUI and stores its API in the local variable `UI`.

`UI.InitTemplates({...})` tells MiliUI which editor template belongs to each control type. For example, the value stored in `"Button Template ID"` becomes the template MiliUI uses when it needs to create a native button.

This setup is shared by every MiliUI interface running in the same client, so you normally only need to configure it once.

`OnStart()` runs when this Global Script starts, which makes it a convenient place to initialize MiliUI before your individual UI Control Groups create their interfaces.

For a very small project with only one interface, putting the same `UI.InitTemplates(...)` call directly in that interface's script is also valid. The shared setup is simply easier to manage once your project has several interfaces.

## 4. Optional: register the local Player Entity

Some projects need a reference to the local Player Entity in their Client Scripts, often because a Client Script sends a signal to the server and that signal requires a Player Entity parameter.

MiliUI can store that Player Entity so different UI scripts can access the same reference when they need it:

```lua
function OnStart()
    InitTemplates()

    UI.Player.RegisterFromSignal(
        script,
        "Register Player"
    )
end
```

This listens for a server-to-client signal named `"Register Player"`. That signal should send the local Player Entity as its first parameter.

This part is optional. If your UI never uses `UI.Player`, you can leave it out.

### What happens after reconnecting?

The stored Player Entity belongs to the current client session. If reconnecting causes the client Lua environment to start again, the new client needs to receive the Player Entity again too.

A simple setup looks like:

```text
client starts or reconnects
    -> Global Script starts listening for "Register Player"
    -> server sends the local Player Entity
    -> UI.Player can be used again
```

MiliUI does not decide how your game's server detects a reconnect. It only provides a place to store the Player Entity after your game sends it.

See [Player Context](docs/Player.md) for the full API.

## 5. Create one UI Control Group

In the Miliastra **UI Control Group Library**:

1. Create a UI Control Group.
2. Put a **Client Control Container** inside it.
3. Attach a Lua UI Controller script to that Client Control Container.
4. Note the Control Group's **UI Index**.

The UI Index is the number Miliastra uses to identify that Control Group.

MiliUI will also give the interface a readable Host name such as `"Main Menu"` or `"Settings"`. A **Host** is simply MiliUI's name for one active UI root.

For the example below, replace `1001` with your real UI Index.

## 6. Build the smallest useful MiliUI screen

Attach a Lua UI Controller script to the Client Control Container.

We will build the script a few lines at a time. At the end, the whole script is shown together for easy copying.

### One syntax rule before we start

Most MiliUI controls are created like this:

```lua
UI.SomeControl(parent, {
    -- settings
})
```

The **first argument** tells MiliUI where the new control should be placed.

The table after it contains that control's settings.

For example:

```lua
UI.Column(screen, {
    gap = 16,
})
```

means:

> Create a Column **inside `screen`**, with a gap of 16 between its children.

You will see this parent-first pattern throughout MiliUI. A control created inside another control will move and be cleaned up with that parent.

### 6.1 Load MiliUI and name this interface

Start with:

```lua
local UI = require("MiliUI/init")

local UI_INDEX = 1001
local HOST_ID = "Quick Start"
```

`require("MiliUI/init")` loads MiliUI so this script can use functions such as `UI.Screen`, `UI.Column`, and `UI.Button`.

`UI_INDEX` is the Control Group's numeric ID from Miliastra. Replace `1001` with your own UI Index.

`HOST_ID` is a name you choose for this interface inside MiliUI. It does not need to match the Control Group's editor name, but using a clear name makes your code easier to understand.

For now, you can think of these two values as:

```text
UI_INDEX -> how Miliastra identifies this UI
HOST_ID  -> how MiliUI identifies this UI
```

### 6.2 Tell MiliUI that this UI is now on screen

Start the controller with:

```lua
function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)
end
```

`script.object` is the Client Control Container that this Lua script is attached to.

`UI.Hosts.Attach(...)` connects that container to MiliUI and gives it the Host name from `HOST_ID`.

After this line runs, MiliUI knows where controls for this interface should be created and which Host they belong to.

You should call `Attach` from the script attached to this Client Control Container. Your shared Global setup script does not have this UI container, so it should not attach the Host for you.

### 6.3 Create the Screen

Add this inside `OnStart()`, after `Attach`:

```lua
local screen = UI.Screen(script.object, {
    padding = 40,
    background = "page",
    showCursor = true,
})
```

`UI.Screen` creates a screen-sized MiliUI container using the current Miliastra UI canvas size. It also creates a content area inside itself where normal page UI can be placed.

Here, the first argument is `script.object`, so the Screen is created inside the Client Control Container.

The settings mean:

- `padding = 40` leaves 40 UI units of space between normal content and the edges of the Screen;
- `background = "page"` gives the Screen the theme color named `page`;
- `showCursor = true` asks Miliastra to show the cursor while this Screen is active.

#### What does `"page"` mean?

`"page"` is **not** an arbitrary Miliastra name. It is one of MiliUI's built-in theme color names.

The default MiliUI theme includes names such as:

```text
page
surface
surface2
text
muted
accent
success
warning
danger
transparent
```

Using a name such as:

```lua
background = "page"
```

means "use whatever color the current MiliUI theme has stored under `page`."

That is useful because you can later change the theme in one place instead of changing every individual control.

You can also use another theme color name, or provide a `Color` value directly when you want a specific color.

See [Theming](docs/Theming.md) for the complete theme system.

### 6.4 Add a Column for the content

Now add:

```lua
local content = UI.Column(screen, {
    name = "QuickStartContent",
    fitContent = true,
    gap = 16,
    align = "center",
})

UI.Center(content)
```

A `Column` places its children from top to bottom.

The first argument is `screen`, so this new Column is placed inside the Screen's normal content area. That means the Screen's `padding = 40` also applies to where the Column is allowed to go.

The settings here mean:

- `name = "QuickStartContent"` gives the control a useful name for debugging;
- `fitContent = true` makes the Column grow just large enough to contain its children;
- `gap = 16` puts 16 UI units of space between each child;
- `align = "center"` centers the children across the width of the Column.

Finally:

```lua
UI.Center(content)
```

moves the finished Column to the center of its parent area.

### 6.5 Add a Heading

Create a Heading inside the Column:

```lua
UI.Heading(content, {
    text = "Hello, MiliUI!",
    needsTranslation = false,
    fitWidth = true,
    fitWidthPadding = 16,
})
```

Again, the first argument is `content`, so the Heading becomes a child of the Column.

That is important: because the Heading is inside the Column, the Column can automatically position it and include it when calculating its own size.

The settings mean:

- `text` is the text to display;
- `needsTranslation = false` says this example is using the text exactly as written instead of looking it up through Miliastra localization;
- `fitWidth = true` lets MiliUI make the text box wide enough for the text;
- `fitWidthPadding = 16` adds a little extra width so the text is less likely to be clipped at the edge.

Why is the extra padding useful? Miliastra does not currently give Lua the exact final width of rendered text, so MiliUI has to estimate it. The extra 16 gives that estimate some safe room.

You do not need to memorize that detail. For short text that should size itself, `fitWidth = true` with a little `fitWidthPadding` is a safe starting point.

### 6.6 Add a Button

Now create a Button in the same Column:

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

Because the first argument is also `content`, the Button appears in the same Column underneath the Heading.

`fitContent = true` tells the Button to size itself from its label and normal Button padding.

This part:

```lua
button:OnClick(function()
    print("MiliUI button clicked!")
end)
```

tells MiliUI what to do when the Button is activated. In this example it only runs `print(...)`.

A normal MiliUI Button can be activated by mouse input, and it also supports Miliastra's controller focus/Confirm path.

### 6.7 Clean up when the Control Group disappears

Add:

```lua
function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

Miliastra calls `OnDestroy()` when this Client Control Container is being removed.

`UI.Hosts.Detach(HOST_ID)` tells MiliUI that this Host's Client Control Container is gone. MiliUI can then stop using the old controls and listeners that belonged to that on-screen UI.

The `IsAttached` check simply makes sure the Host is currently attached before trying to detach it.

For normal Control Group cleanup, detach this one Host instead of calling `UI.DestroyAll()`. `UI.DestroyAll()` is much broader: it affects all currently attached MiliUI Hosts, including other interfaces that may still be open.

#### Detach is different from Close

You may also see `UI.Pages.Close(...)` in other MiliUI examples. It has a different job.

- **Detach** is used when the Client Control Container for a Host disappears. It tells MiliUI that the native UI root is gone.
- **Close** is used when you are working with `UI.Pages` and the user or game is finished with one logical Page.

For example, closing a Settings Page does not automatically mean the whole Menu Control Group disappeared. The Menu Host may still be attached and showing other Pages.

This Quick Start does not use `UI.Pages` yet, so its `OnDestroy()` only needs to detach the Host.

### 6.8 Complete copy/paste example

All of the pieces above combine into this small controller:

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

The shared setup from sections 2-4 handles things that are common to the whole project, such as the MiliUI template IDs and optional Player registration.

This controller has a smaller job: it builds **this particular interface** when its Control Group appears, and tells MiliUI when that interface disappears.

## 7. Test it

Instantiate the UI Control Group and enter Test Play.

You should see a Heading and Button in the center of the screen.

Click the Button. The message:

```text
MiliUI button clicked!
```

is printed to the **Log**, not onto the game screen.

In the Miliastra Sandbox window, open the **Log** and monitor **Client Scripts** to see `print()` output from this client UI script.

If you see the UI and the Log message appears after clicking the Button, the important parts of the setup are working:

```text
MiliUI loaded
template IDs were configured
the Control Group was attached to MiliUI
MiliUI created the controls
the Button received input
the Host has an OnDestroy cleanup path
```

## 8. Add a few production-friendly features

The small example above is enough to prove MiliUI is working.

From here, you can add features such as localization, shared Button sounds, better debug names, and menu-style input settings without changing the basic structure.

### Add a project-wide Button sound

If most Buttons in your project should use the same click sound, add a positive Audio Resource ID as a Script Parameter on the **Global Script (or whatever shared MiliUI setup script you are using)**. In this example the parameter is named `Button Click Audio ID`.

The Audio Resource ID is the actual ID of the SFX/audio resource you want to play. You can find that ID on the sound/SFX resource in Miliastra and use that number here.

Then add:

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

This stores the sound as the theme's normal Button click sound, so Buttons can use it automatically.

A specific Button can still use a different sound by setting its own `clickAudioId`.

### Add localization and useful names

Here is the same kind of screen with a few settings you are more likely to use in a real menu:

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

The new settings are:

- `textId` is the Miliastra text-mapping ID MiliUI will try to use for localization. The normal `text` value remains available as the English fallback;
- `name` gives controls clearer names, which makes debugging and layout diagnostics easier to read;
- `variant = "primary"` asks the MiliUI theme for its primary Button style;
- `disableKeyEventPassthrough = true` prevents normal key input from passing through this Screen while it is open, which is often useful for a menu.

The `fitWidth` and `fitContent` settings also help translated text use the space it needs instead of assuming every language will be the same width as English.

See [Localization](docs/Localization.md), [Intrinsic Sizing](docs/IntrinsicSizing.md), [Theming](docs/Theming.md), and [Control Groups and Hosts](docs/ControlGroups.md) when you want more detail on those systems.

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

Only `MiliUI/init.lua` above belongs to the installed MiliUI package. The other folders are example names for scripts you create in your own game.

A simple way to think about the split is:

```text
MiliUI Global.lua      -> setup shared by all interfaces
Menu UI Controller.lua -> attached to the Control Group and handles its related logic when the Control Group is created or removed
Main Menu Page.lua     -> used by the controller to build the actual menu controls
UI Data.lua            -> used by the Page while building the menu; stores editable game/menu data
```

You do not need to split a tiny interface into several files immediately. Do it when the project becomes large enough that keeping everything in one file is harder to manage.

This is called **separation of concerns**: each file has one main job instead of one script trying to handle setup, Control Group lifecycle, UI layout, and editable data all at once. Good separation keeps code cleaner, easier to read, easier to maintain, and usually much easier to debug when something goes wrong.

Read [Recommended Game Project Structure](docs/ProjectStructure.md) when you are ready for that step.

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
