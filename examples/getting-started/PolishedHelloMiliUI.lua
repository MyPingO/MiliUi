-- The same basic interface with localization-friendly text, semantic styling,
-- diagnostics-friendly names, shared audio, and menu input ownership.
-- Assumes MiliUIGlobal.lua configured templates and any shared Button sound.

local UI = require("MiliUI/init")

local UI_INDEX = 1001 -- Replace with this UI Control Group's Index.
local HOST_ID = "Polished Hello"

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
    })

    UI.Label(content, {
        name = "WelcomeMessage",
        text = "Your MiliUI setup is working.",
        textId = "QuickStart.Message",
        fitWidth = true,
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
