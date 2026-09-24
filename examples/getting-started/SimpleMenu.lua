local UI = require("MiliUI/init")

local UI_INDEX = 1001 -- Replace with this UI Control Group's Index.
local HOST_ID = "Simple Menu"

local function AddButton(parent, label, callback)
    return UI.Button(parent, {
        label = {
            text = label,
            needsTranslation = false,
        },
        width = 280,
        height = 58,
        onClick = callback,
    })
end

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
        padding = 48,
        background = "page",
        showCursor = true,
    })

    local menu = UI.Column(screen, {
        width = 320,
        fitHeight = true,
        gap = 12,
        align = "center",
    })

    UI.Heading(menu, {
        text = "MAIN MENU",
        needsTranslation = false,
        fitWidth = true,
    })

    AddButton(menu, "PLAY", function()
        print("Play selected")
    end)

    AddButton(menu, "SETTINGS", function()
        print("Settings selected")
    end)

    AddButton(menu, "CLOSE", function()
        print("Close selected")
    end)
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
