-- Small settings form.
-- Explicit widths are intentional here because Slider/Toggle controls share a
-- consistent form width; text-only controls still use intrinsic sizing.
-- Assumes the shared template mapping from MiliUIGlobal.lua is already active.

local UI = require("MiliUI/init")

local UI_INDEX = 1001 -- Replace with this UI Control Group's Index.
local HOST_ID = "Simple Settings"

function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local screen = UI.Screen(script.object, {
        padding = 48,
        background = "page",
        showCursor = true,
        disableKeyEventPassthrough = true,
    })

    local form = UI.Column(screen, {
        name = "SettingsForm",
        fitContent = true,
        gap = 18,
        align = "center",
    })

    UI.Center(form)

    UI.Heading(form, {
        name = "SettingsTitle",
        text = "SETTINGS",
        textId = "Example.Settings.Title",
        fitWidth = true,
    })

    local music = UI.Toggle(form, {
        name = "MusicToggle",
        width = 360,
        label = {
            text = "Music",
            textId = "Example.Settings.Music",
        },
        value = true,
    })

    music:OnChange(function(value)
        print("Music enabled:", value)
    end)

    local volume = UI.Slider(form, {
        name = "VolumeSlider",
        width = 360,
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
