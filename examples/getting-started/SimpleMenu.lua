-- Small menu using flow layout and localization-safe Button sizing.
-- Assumes the shared template mapping from MiliUIGlobal.lua is already active.

local UI = require("MiliUI/init")

local UI_INDEX = 1001 -- Replace with this UI Control Group's Index.
local HOST_ID = "Simple Menu"

local function AddButton(parent, label, textId, callback)
    return UI.Button(parent, {
        label = {
            text = label,
            textId = textId,
        },
        fitContent = true,
        minWidth = 220,
        onClick = callback,
    })
end

function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local screen = UI.Screen(script.object, {
        padding = 48,
        background = "page",
        showCursor = true,
        disableKeyEventPassthrough = true,
    })

    local menu = UI.Column(screen, {
        name = "MainMenu",
        fitContent = true,
        gap = 12,
        align = "center",
    })

    UI.Center(menu)

    UI.Heading(menu, {
        name = "MainMenuTitle",
        text = "MAIN MENU",
        textId = "Example.MainMenu.Title",
        fitWidth = true,
    })

    AddButton(menu, "PLAY", "Example.MainMenu.Play", function()
        print("Play selected")
    end)

    AddButton(menu, "SETTINGS", "Example.MainMenu.Settings", function()
        print("Settings selected")
    end)

    AddButton(menu, "CLOSE", "Example.MainMenu.Close", function()
        print("Close selected")
    end)
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
