-- Recommended simple Control Group pattern.
--
-- Put this script on the Client Control Container inside a HUD entry in the
-- Miliastra UI Control Group Library. The Server Node Graph shows/hides the HUD
-- by instantiating/removing that Control Group. No separate "show Lua UI" signal
-- is required.

local UI = require("MiliUI/init")

local UI_INDEX = 1001 -- Replace with this UI entry's Miliastra Index.
local HOST_ID = "Example HUD"

local function InitTemplates()
    UI.InitTemplates({
        container = script:GetParam("ContainerTemplateId"),
        image = script:GetParam("ImageTemplateId"),
        text = script:GetParam("TextTemplateId"),
        button = script:GetParam("ButtonTemplateId"),
        cursorArea = script:GetParam("CursorAreaTemplateId"),
    })
end

function OnStart()
    InitTemplates()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    -- A simple HUD does not need UI.Pages. Its UI exists whenever this Control
    -- Group instance exists.
    local card = UI.Card(script.object, {
        x = -560,
        y = 330,
        width = 360,
        height = 120,
    })

    UI.Heading(card.content, {
        text = "HUD",
        needsTranslation = false,
        y = 28,
        width = 300,
    })

    UI.Label(card.content, {
        text = "Control Group = visible HUD",
        needsTranslation = false,
        y = -22,
        width = 300,
    })
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
