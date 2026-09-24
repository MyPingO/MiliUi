-- Standalone Control Group pattern. Larger projects should normally move
-- the complete shared template mapping into one persistent client Global Script.
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
        animation = script:GetParam("UIAnimationTemplateId"),
        fullscreenAnimation = script:GetParam("FullscreenAnimationTemplateId"),
        keyHint = script:GetParam("KeyHintTemplateId"),
        textWindow = script:GetParam("TextWindowTemplateId"),
        gridScroller = script:GetParam("GridScrollerTemplateId"),
    })
end

function OnStart()
    InitTemplates()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    -- A simple HUD does not need UI.Pages. Its UI exists whenever this Control
    -- Group instance exists.
    local content = UI.Column(script.object, {
        name = "HudContent",
        x = -560,
        y = 330,
        fitContent = true,
        gap = 6,
        align = "start",
    })

    UI.Heading(content, {
        text = "HUD",
        needsTranslation = false,
        fitWidth = true,
    })

    UI.Label(content, {
        text = "Control Group = visible HUD",
        needsTranslation = false,
        fitWidth = true,
    })
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
