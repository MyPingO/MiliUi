# MiliUI Quick Start

This guide is intended to get a first MiliUI interface on screen with as little framework knowledge as possible.

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

Existing MiliUI installations are backed up before replacement.

### Manual installation

Advanced users can download the production `init.lua` from the same release and place it at:

```text
external_lua_file/MiliUI/init.lua
```

## 2. Create the required Client UI templates

MiliUI's standard controls require four editor-created Client UI templates:

- Container
- Image
- Text
- Preset Button

Some components also use a **Cursor Event Area**. It is recommended to create that template too.

Give the Lua script access to their template IDs. The example below uses Script Parameters named:

```text
ContainerTemplateId
ImageTemplateId
TextTemplateId
ButtonTemplateId
CursorAreaTemplateId
```

## 3. Create one UI Control Group

Create a UI Control Group containing a Client Control Container and attach a Lua script to that container.

Note the UI Index of the Control Group. Replace `1001` in the example below with that Index.

## 4. Paste your first MiliUI script

```lua
local UI = require("MiliUI/init")

local UI_INDEX = 1001 -- Replace with your UI Control Group's Index.
local HOST_ID = "Hello MiliUI"

function OnStart()
    UI.InitTemplates({
        container = script:GetParam("ContainerTemplateId"),
        image = script:GetParam("ImageTemplateId"),
        text = script:GetParam("TextTemplateId"),
        button = script:GetParam("ButtonTemplateId"),
        cursorArea = script:GetParam("CursorAreaTemplateId"),
    })

    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local screen = UI.Screen(script.object, {
        padding = 40,
        background = "page",
        showCursor = true,
    })

    local card = UI.Card(screen, {
        width = 440,
        height = 220,
        padding = 24,
    })

    UI.Heading(card.content, {
        text = "Hello, MiliUI!",
        needsTranslation = false,
        y = 50,
    })

    local button = UI.Button(card.content, {
        label = {
            text = "CLICK ME",
            needsTranslation = false,
        },
        width = 220,
        height = 58,
        y = -35,
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

## 5. Test it

Instantiate the UI Control Group and enter Test Play.

You should see a card with a heading and a button. Clicking the button should print:

```text
MiliUI button clicked!
```

That is enough to confirm that the runtime, templates, Host, and basic components are working.

## What to learn next

- [Installation and updates](docs/Installation.md)
- [Control Groups and Hosts](docs/ControlGroups.md)
- [Components](docs/Components.md)
- [Layouts and responsive UI](docs/ResponsiveLayout.md)
- [Pages](docs/Pages.md)
- [Localization](docs/Localization.md)
- [Theming](docs/Theming.md)
- [Support and bug reports](SUPPORT.md)

For copyable starter code, see [examples/getting-started](examples/getting-started/README.md).
