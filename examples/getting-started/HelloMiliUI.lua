local UI = require("MiliUI/init")

local UI_INDEX = 1001 -- Replace with this UI Control Group's Index.
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
