-- Page Navigation fixture.
--
-- One Client Control Container / Host owns all pages in this flow. The pages are
-- logical MiliUI screens, not separate Miliastra Control Groups.
--
-- Shared MiliUI templates are expected to be initialized by the project's
-- persistent global setup script. Edit the constants below for the test project.

local UI = require("MiliUI/init")

local UI_INDEX = 1073741870
local HOST_ID = "MiliUI Navigation Test"

local MAIN_PAGE = "Navigation Test Main"
local SETTINGS_PAGE = "Navigation Test Settings"
local CONTROLS_PAGE = "Navigation Test Controls"
local COMPLETE_PAGE = "Navigation Test Complete"


local function NewPage(parent, title, subtitle)
    local screen = UI.Screen(parent, {
        padding = 48,
        background = "page",
        showCursor = true,
        disableKeyEventPassthrough = true,
    })

    local content = UI.Column(screen, {
        width = 430,
        fitContent = true,
        gap = 14,
        align = "stretch",
    })

    UI.Center(content)

    UI.Heading(content, {
        text = title,
        needsTranslation = false,
        fitWidth = true,
        fitWidthPadding = 16,
        align = "center",
    })

    UI.Label(content, {
        text = subtitle,
        needsTranslation = false,
        width = "100%",
        align = "center",
    })

    return screen, content
end

local function AddButton(parent, label, callback)
    return UI.Button(parent, {
        label = {
            text = label,
            needsTranslation = false,
        },
        width = "100%",
        onClick = callback,
    })
end

local function BuildMain(parent, page)
    local screen, content = NewPage(
        parent,
        "MAIN MENU",
        "This is the root navigation page."
    )

    AddButton(content, "Open Settings", function()
        page:Push(SETTINGS_PAGE)
    end)

    AddButton(content, "Open Controls Directly", function()
        page:Push(CONTROLS_PAGE)
    end)

    return screen
end

local function BuildSettings(parent, page)
    local screen, content = NewPage(
        parent,
        "SETTINGS",
        "Change the toggle, open Controls, then Back. The setting should persist."
    )

    UI.Toggle(content, {
        id = "Navigation Test Toggle",
        name = "NavigationTestToggle",
        remember = true,
        width = "100%",
        label = {
            text = "Remember this setting",
            needsTranslation = false,
        },
        value = false,
    })

    AddButton(content, "Open Controls", function()
        page:Push(CONTROLS_PAGE)
    end)

    AddButton(content, "Replace With Complete", function()
        page:Replace(COMPLETE_PAGE)
    end)

    AddButton(content, "Back", function()
        page:Back()
    end)

    return screen
end

local function BuildControls(parent, page)
    local screen, content = NewPage(
        parent,
        "CONTROLS",
        "Back should rebuild the previous page without losing its remembered state."
    )

    AddButton(content, "Back", function()
        page:Back()
    end)

    AddButton(content, "Reset To Main Menu", function()
        page:Reset(MAIN_PAGE)
    end)

    return screen
end

local function BuildComplete(parent, page)
    local screen, content = NewPage(
        parent,
        "COMPLETE",
        "Settings was replaced, so Back should return to whatever came before Settings."
    )

    AddButton(content, "Back", function()
        page:Back()
    end)

    AddButton(content, "Reset To Main Menu", function()
        page:Reset(MAIN_PAGE)
    end)

    return screen
end

local function RegisterPage(pageId, create)
    if UI.Pages.IsRegistered(pageId) then return end

    UI.Pages.Register(pageId, {
        host = HOST_ID,
        create = create,
    })
end

local function RegisterPages()
    RegisterPage(MAIN_PAGE, BuildMain)
    RegisterPage(SETTINGS_PAGE, BuildSettings)
    RegisterPage(CONTROLS_PAGE, BuildControls)
    RegisterPage(COMPLETE_PAGE, BuildComplete)
end

function PrintNavigationState()
    local history = UI.Navigation.GetHistory(HOST_ID)

    print(
        "MILIUI_NAV_TEST_STATE"
            .. " | current="
            .. tostring(UI.Navigation.GetCurrent(HOST_ID))
            .. " | canGoBack="
            .. tostring(UI.Navigation.CanGoBack(HOST_ID))
            .. " | history="
            .. table.concat(history, " > ")
    )
end

function OnStart()
    RegisterPages()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local openPages = UI.Pages.GetOpenPages(HOST_ID)

    if #openPages > 0 then
        UI.Pages.Restore(HOST_ID)
    else
        UI.Navigation.Reset(MAIN_PAGE)
    end

    PrintNavigationState()
end

function OnDestroy()
    PrintNavigationState()

    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
