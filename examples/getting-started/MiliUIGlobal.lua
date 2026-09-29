-- Recommended shared MiliUI setup for projects with multiple interfaces.
-- Give this persistent client script the template-ID Script Variables listed in
-- docs/Installation.md.

local UI = require("MiliUI/init")

local function InitTemplates()
    UI.InitTemplates({
        container = script:GetParam("Container Template ID"),
        text = script:GetParam("Text Template ID"),
        textWindow = script:GetParam("Text Window Template ID"),
        image = script:GetParam("Image Template ID"),
        animation = script:GetParam("UI Animation Template ID"),
        fullscreenAnimation = script:GetParam("Screen Animation Template ID"),
        button = script:GetParam("Button Template ID"),
        keyHint = script:GetParam("Key Hint Template ID"),
        cursorArea = script:GetParam("Cursor Area Template ID"),
        gridScroller = script:GetParam("Grid Scroller Template ID"),
    })
end

function OnInit()
    InitTemplates()

    -- Optional project-wide polish can also live here. For example:
    --
    -- UI.Theme.Apply({
    --     sounds = {
    --         buttonClick = 123456, -- Replace with your Audio Resource ID.
    --     },
    -- })

    -- Optional Player context:
    -- Create an Entity-valued Player Custom Variable that references its
    -- owning Player Entity, then configure that project-defined name here.
    -- Configure only stores the name; the Entity is resolved when requested.
    --
    -- UI.Player.Configure("PlayerSelf")
end
