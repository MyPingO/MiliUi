-- Recommended Control Group + Pages pattern.
--
-- Put this script on the Client Control Container inside a Menu entry in the
-- Miliastra UI Control Group Library. The Server Node Graph shows/hides the Menu
-- by instantiating/removing that Control Group.

local UI = require("MiliUI/init")

local UI_INDEX = 1002 -- Replace with this UI entry's Miliastra Index.
local HOST_ID = "Example Menu"
local PAGE_ID = "Example Main Menu"

local function InitTemplates()
    UI.InitTemplates({
        container = script:GetParam("ContainerTemplateId"),
        image = script:GetParam("ImageTemplateId"),
        text = script:GetParam("TextTemplateId"),
        button = script:GetParam("ButtonTemplateId"),
        cursorArea = script:GetParam("CursorAreaTemplateId"),
    })
end

local function BuildMainMenu(parent)
    local screen = UI.Screen(parent, {
        padding = 48,
        background = "page",
        showCursor = true,
        disableKeyEventPassthrough = true,
    })

    local card = UI.Card(screen, {
        width = 560,
        height = 320,
    })

    UI.Heading(card.content, {
        text = "MAIN MENU",
        needsTranslation = false,
        y = 90,
        width = 440,
    })

    UI.Label(card.content, {
        text = "This page belongs to the Example Menu host.",
        needsTranslation = false,
        y = 30,
        width = 440,
    })

    UI.Toggle(card.content, {
        id = "Example Toggle",
        remember = true,
        y = -45,
        width = 320,
        label = {
            text = "Remember me",
            needsTranslation = false,
        },
        value = true,
    })

    return screen
end

local function RegisterPages()
    -- The logical page registry may outlive one native Control Group instance,
    -- so repeated OnStart calls must not blindly register the same page twice.
    if not UI.Pages.IsRegistered(PAGE_ID) then
        UI.Pages.Register(PAGE_ID, {
            host = HOST_ID,
            create = BuildMainMenu,
        })
    end
end

function OnStart()
    InitTemplates()
    RegisterPages()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local openPages = UI.Pages.GetOpenPages(HOST_ID)

    if #openPages > 0 then
        -- Recreate pages that were logically open before temporary host loss.
        UI.Pages.Restore(HOST_ID)
    else
        -- A newly-instantiated Menu Control Group needs an initial page.
        UI.Pages.Open(PAGE_ID)
    end
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
