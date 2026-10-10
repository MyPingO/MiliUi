-- Accordion runtime fixture.
--
-- Shared MiliUI templates are expected to be initialized by the project's
-- persistent global setup script. Edit the constants below for the test project.

local UI = require("MiliUI/init")

local UI_INDEX = 1073741870
local HOST_ID = "MiliUI Accordion Test"

local function BuildAccordionLab(parent)
    local screen = UI.Screen(parent, {
        padding = 48,
        background = "page",
        showCursor = true,
        disableKeyEventPassthrough = true,
    })

    local sections = UI.Column(screen, {
        width = 620,
        fitHeight = true,
        gap = 12,
        align = "stretch",
        justify = "start",
    })

    UI.Center(sections)

    UI.Heading(sections, {
        text = "Accordion Lab",
        needsTranslation = false,
        fitContentHeight = true,
        fillWidth = true,
    })

    UI.Text(sections, {
        text = "Open and close the sections below. Gameplay starts open; Details starts closed. Their open state should survive Control Group recreation.",
        needsTranslation = false,
        fillWidth = true,
        fitContentHeight = true,
        adaptiveFontSize = true,
        color = "muted",
    })

    local gameplay = UI.Accordion(sections, {
        id = "Accordion Lab Gameplay",
        remember = true,
        title = {
            text = "Gameplay Settings",
            needsTranslation = false,
        },
        open = true,
        fillWidth = true,
    })

    UI.Toggle(gameplay.content, {
        label = {
            text = "Controller Hints",
            needsTranslation = false,
        },
        value = true,
        fillWidth = true,
    })

    UI.Toggle(gameplay.content, {
        label = {
            text = "Damage Numbers",
            needsTranslation = false,
        },
        value = true,
        fillWidth = true,
    })

    local details = UI.Accordion(sections, {
        id = "Accordion Lab Details",
        remember = true,
        title = {
            text = "Details",
            needsTranslation = false,
        },
        fillWidth = true,
    })

    UI.Text(details.content, {
        text = "This body sizes itself from its children and restores its open state when rebuilt.",
        needsTranslation = false,
        fillWidth = true,
        fitContentHeight = true,
        adaptiveFontSize = true,
    })

    UI.Button(details.content, {
        label = {
            text = "Example Action",
            needsTranslation = false,
        },
        fillWidth = true,
        height = 52,
    })

    local disabled = UI.Accordion(sections, {
        title = {
            text = "Disabled Section",
            needsTranslation = false,
        },
        fillWidth = true,
        interactable = false,
    })

    UI.Text(disabled.content, {
        text = "This content stays closed because the header is disabled.",
        needsTranslation = false,
        fillWidth = true,
        fitContentHeight = true,
    })

    return screen
end

function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)
    BuildAccordionLab(script.object)
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
