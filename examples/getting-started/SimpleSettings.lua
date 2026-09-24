local UI = require("MiliUI/init")

local UI_INDEX = 1001 -- Replace with this UI Control Group's Index.
local HOST_ID = "Simple Settings"

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

    local card = UI.Card(screen, {
        width = 520,
        height = 320,
        padding = 28,
    })

    local column = UI.Column(card.content, {
        fillWidth = true,
        fillHeight = true,
        gap = 18,
        align = "stretch",
    })

    UI.Heading(column, {
        text = "SETTINGS",
        needsTranslation = false,
        fitWidth = true,
    })

    local music = UI.Toggle(column, {
        label = {
            text = "Music",
            needsTranslation = false,
        },
        value = true,
    })

    music:OnChange(function(value)
        print("Music enabled:", value)
    end)

    local volume = UI.Slider(column, {
        min = 0,
        max = 100,
        value = 70,
    })

    volume:OnChange(function(value)
        print("Volume:", value)
    end)
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
