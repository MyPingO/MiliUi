-- Recommended shared MiliUI setup for projects with multiple interfaces.
-- Give this persistent client script the template-ID Script Parameters listed in
-- QUICK_START.md.

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

local function InitTheme()
    -- Optional project-wide Button audio.
    local clickAudioId = script:GetParam("Button Click Audio ID")

    if type(clickAudioId) == "number" and clickAudioId > 0 then
        UI.Theme.Apply({
            sounds = {
                buttonClick = clickAudioId,
            },
        })
    end
end

function OnStart()
    InitTemplates()
    InitTheme()

    -- Optional Player context:
    -- Uncomment this when the game has a server -> client signal that sends
    -- the local Player Entity as parameter #1. The server should send it again
    -- after a full client reconnect/refresh.
    --
    -- UI.Player.RegisterFromSignal(
    --     script,
    --     "Register Player"
    -- )
end
