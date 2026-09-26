# MiliUI Quick Start

This guide builds one small MiliUI interface from scratch and explains the important code as you go.

You do **not** need previous Lua experience to follow the code below. This guide does assume that the one-time MiliUI project setup is already complete.

## Before you start

Complete these first:

1. [Installation + Setup](docs/Installation.md) — installs MiliUI, maps `MiliUI/init` in the Sandbox, creates the Global Script, creates the Client Control Templates, and initializes them.
2. [Recommended Game Project Structure](docs/ProjectStructure.md) — optional background on how larger MiliUI projects are usually organized.

By the end of this Quick Start, you will have:

- one Client Control Container Server Template;
- one UI controller Client Script;
- a MiliUI Screen with a Heading and Button;
- a Button click that prints to the Client Script Log.

## 1. Create the UI controller Client Script

Open:

```text
Window
→ Client Script Resource Explorer
→ Client Script Mapping
→ UI Controllers
```

Create a **New Client Script** and save it as:

```text
Hello MiliUI Controller.lua
```

[![Create the Hello MiliUI controller Client Script](docs/images/getting-started/create-test-controller-script.png)](docs/images/getting-started/create-test-controller-script.png)

The `UI Controllers` folder name is only a recommendation. What matters is that the script is available in the Client Script Resource Explorer so it can be attached to a Client Control Container.

## 2. Create a Client Control Container Server Template

Open the **UI Control Group Library** and switch to **Server Control Templates**.

Create a **Client Control Container** Server Template, give it a clear name such as `Hello MiliUI`, then open it for editing.

In the Client Control Container's **Script** tab, add:

```text
Hello MiliUI Controller
```

[![Create a Client Control Container Server Template and attach the controller script](docs/images/getting-started/attach-ui-controller-script.png)](docs/images/getting-started/attach-ui-controller-script.png)

The Client Control Container is the native Miliastra UI root that will contain this interface.

When Miliastra creates this Server Template for a player, the attached Client Script starts and `script.object` refers to that live Client Control Container.

## 3. Find the UI Index

Select the Server Control Template you just created and find its **Index** in the details panel.

[![Find the UI Index for the Server Control Template](docs/images/getting-started/ui-control-group-index.png)](docs/images/getting-started/ui-control-group-index.png)

You will use that number in the controller code.

For example, if the editor shows:

```text
Index: 12345
```

then your script will use:

```lua
local UI_INDEX = 12345
```

The UI Index is Miliastra's numeric identity for this UI entry. MiliUI stores the same Index with the Host so your game can refer back to that native UI entry when needed.

## 4. Build the interface

Open `Hello MiliUI Controller.lua`.

We will add the code in small pieces and explain each one immediately.

### 4.1 Load MiliUI and name this interface

Start with:

```lua
local UI = require("MiliUI/init")

local UI_INDEX = 12345
local HOST_ID = "Hello MiliUI"
```

Replace `12345` with the real Index from the previous step.

`require("MiliUI/init")` loads the MiliUI runtime that was mapped during [Installation + Setup](docs/Installation.md).

`HOST_ID` is a readable name that **you choose** for this interface inside MiliUI.

For now, think of the two values as:

```text
UI_INDEX -> how Miliastra identifies this UI entry
HOST_ID  -> how MiliUI identifies this interface
```

### 4.2 Attach the Client Control Container as a Host

Add:

```lua
function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)
end
```

A **Host** is MiliUI's name for one active UI root.

This line registers the current Client Control Container as the live root for the `"Hello MiliUI"` Host.

It does **not** decide where every control is physically placed. The parent you pass to `UI.Screen`, `UI.Button`, and other MiliUI controls does that.

The Host tells MiliUI which interface owns the controls and related runtime work created under this root, such as listeners, tweens, layout state, and Pages. That lets MiliUI manage or clean up one interface without affecting another Host such as a HUD or overlay.

Because this script is attached to the Client Control Container, `script.object` refers to that container.

### 4.3 Create the Screen

Inside `OnStart()`, after `Attach`, add:

```lua
local screen = UI.Screen(script.object, {
    padding = 40,
    background = "page",
    showCursor = true,
})
```

Most MiliUI controls follow this pattern:

```lua
UI.SomeControl(parent, {
    -- settings
})
```

The **first argument** is the parent: where the new control should be placed.

Here the parent is `script.object`, so the Screen is created inside the Client Control Container.

The settings mean:

- `padding = 40` leaves space between normal content and the Screen edges;
- `background = "page"` uses the MiliUI theme color named `page`;
- `showCursor = true` asks Miliastra to show the cursor while this Screen is active.

`"page"` is a built-in MiliUI theme color name, not an arbitrary Miliastra name.

### 4.4 Add a Column

Add:

```lua
local content = UI.Column(screen, {
    name = "HelloContent",
    fitContent = true,
    gap = 16,
    align = "center",
})

UI.Center(content)
```

The first argument is now `screen`, so the Column is created inside the Screen.

A Column lays out its children from top to bottom.

The settings mean:

- `name` gives the control a useful debugging name;
- `fitContent = true` lets the Column size itself around its children;
- `gap = 16` leaves 16 UI units between children;
- `align = "center"` centers children across the Column.

`UI.Center(content)` places the finished Column in the center of its parent area.

### 4.5 Add a Heading

Create a Heading inside the Column:

```lua
UI.Heading(content, {
    text = "Hello, MiliUI!",
    needsTranslation = false,
    fitWidth = true,
    fitWidthPadding = 16,
})
```

Because the parent is `content`, the Heading becomes one of the Column's children.

The settings mean:

- `text` is the text to display;
- `needsTranslation = false` uses the text exactly as written;
- `fitWidth = true` lets MiliUI size the text box from the text;
- `fitWidthPadding = 16` gives the width estimate a little extra room.

Miliastra does not currently expose the exact final rendered text width to Lua, so MiliUI estimates it. A small `fitWidthPadding` is useful for short text that should size itself.

### 4.6 Add a Button

Add a Button to the same Column:

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

Because the parent is also `content`, the Button appears below the Heading in the same Column.

`fitContent = true` lets the Button size itself from its label and normal Button padding.

`button:OnClick(...)` registers the function that runs when the Button is activated.

The `print(...)` message appears in the Miliastra Sandbox **Log**, not on the game screen.

### 4.7 Detach the Host when the Client Control Container disappears

Outside `OnStart()`, add:

```lua
function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

Miliastra calls `OnDestroy()` when this Client Control Container is being removed.

`UI.Hosts.Detach(HOST_ID)` tells MiliUI that this Host's native root is gone, so MiliUI can release the live controls, listeners, tweens, and other runtime work associated with that Host.

Use `Detach` for normal cleanup of one Host. `UI.DestroyAll()` is broader and affects every currently attached Host.

## 5. Complete controller script

Your full `Hello MiliUI Controller.lua` should now look like this:

```lua
local UI = require("MiliUI/init")

local UI_INDEX = 12345
local HOST_ID = "Hello MiliUI"

function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local screen = UI.Screen(script.object, {
        padding = 40,
        background = "page",
        showCursor = true,
    })

    local content = UI.Column(screen, {
        name = "HelloContent",
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

Remember to replace `12345` with your actual UI Index.

## 6. Activate the UI from server logic

Creating a Server Control Template does not by itself decide **when** your game should show it.

Your server Node Graph should activate the UI for the appropriate player when your game wants this interface to appear.

The image below shows one example that activates the UI from an interaction:

[![Example server logic that activates the UI Control Group](docs/images/getting-started/activate-server-control-template-logic.png)](docs/images/getting-started/activate-server-control-template-logic.png)

You do **not** need to copy that exact trigger. Your game might activate the UI when:

- the stage starts;
- a player interacts with something;
- a menu button is selected;
- a server-side game event occurs.

The important part is that the server activates the Server Control Template that contains your Client Control Container.

## 7. Test it

Enter Test Play and activate the UI using the server logic from the previous step.

You should see:

- a dark MiliUI Screen;
- **Hello, MiliUI!** in the center;
- a **CLICK ME** Button underneath it.

Click the Button.

Then open the Miliastra Sandbox **Log** and monitor **Client Scripts**. You should see:

```text
MiliUI button clicked!
```

[![Expected Quick Start interface and Client Script log output](docs/images/getting-started/quick-start-result.png)](docs/images/getting-started/quick-start-result.png)

If both the interface and Log message appear, the main path is working:

```text
MiliUI runtime loaded
→ shared templates were initialized
→ server activated the UI
→ Client Control Container started
→ Host attached
→ MiliUI created the controls
→ Button received input
```

## Troubleshooting

### `MiliUI.InitTemplates(...) must be called before creating controls`

The shared template setup did not finish before this controller tried to create a MiliUI control.

Check [Installation + Setup](docs/Installation.md) and make sure:

- the correct Global Script is assigned in Stage Settings;
- its template Script Variables are filled in;
- `UI.InitTemplates(...)` is called from the Global Script's `OnInit()`, not its `OnStart()`.

### `require("MiliUI/init")` cannot be resolved

Make sure the installed `external_lua_file/MiliUI` folder is mapped under **Client Script Resource Explorer → Client Script Mapping → MiliUI**.

### Nothing appears on screen

Check that:

- the Server Control Template is actually being activated for the player;
- the attached controller script is `Hello MiliUI Controller`;
- `UI_INDEX` matches the Index shown for that UI entry.

### The Button works but I do not see the printed message

`print(...)` goes to the Sandbox **Log → Client Scripts**, not onto the game screen.

## What to learn next

- [Installation + Setup](docs/Installation.md)
- [Recommended Game Project Structure](docs/ProjectStructure.md)
- [Control Groups and MiliUI Hosts](docs/ControlGroups.md)
- [Components](docs/Components.md)
- [Responsive Layout](docs/ResponsiveLayout.md)
- [Pages](docs/Pages.md)
- [Controller Support](docs/ControllerSupport.md)
- [Localization](docs/Localization.md)
- [Theming](docs/Theming.md)

For additional copyable examples, see [examples/getting-started](examples/getting-started/README.md).
