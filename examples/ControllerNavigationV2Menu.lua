-- Controller Navigation V2 example for a Menu Control Group.
-- Replace UI_INDEX with the Menu entry's actual Miliastra UI Index.
-- The Server Node Graph instantiates/removes the Control Group;
-- the Host owns the MiliUI controls within its Client Control Container.
-- For PC Test Play, begin in Controller mode to initialize native focus.

local UI = require("MiliUI/init")
local UI_INDEX = 1002
local HOST_ID = "Controller V2 Example Menu"
local PAGE_ID = "Controller V2 Example Page"

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

local function BuildMenu(parent)
    local screen = UI.Screen(parent, {
        padding = 32,
        background = "page",
        showCursor = true,
        controllerNavigation = "auto",
        isolateNavigation = true,
    })

    local row = UI.Row(screen.content, {
        width = "100%",
        height = 440,
        gap = 20,
    })
    local sidebar = UI.Column(row, {
        width = 220, height = 440, gap = 12,
    })
    local first = UI.Button(sidebar, {
        focusKey = "sidebar.play",
        width = 200, height = 48,
        label = { text = "PLAY", needsTranslation = false },
    })
    UI.Button(sidebar, {
        focusKey = "sidebar.settings",
        width = 200, height = 48,
        label = { text = "SETTINGS", needsTranslation = false },
    })
    UI.Button(sidebar, {
        focusKey = "sidebar.focus-info",
        width = 200, height = 48,
        label = { text = "READ FOCUS", needsTranslation = false },
        onClick = function()
            -- This prints the state AFTER navigating to the debug Button.
            local info = UI.Focus.Explain(screen)
            print("Controller V2 | key=" .. tostring(info.focusedKey)
                .. " | eligible=" .. tostring(info.eligibleCount))
        end,
    })

    local area = UI.ScrollArea(row, {
        width = 520, height = 440, contentHeight = 1100,
        controllerScroll = true,
        controllerFocusPadding = 12,
        scrollbarControllerFocus = false,
    })
    local list = UI.Column(area.content, {
        width = "100%",
        height = 1100,
        gap = 12,
        padding = 12,
        align = "stretch",
    })
    for index = 1, 14 do
        UI.Button(list, {
            focusKey = "detail." .. index,
            height = 56,
            fillWidth = true,
            label = { text = "DETAIL ITEM " .. index, needsTranslation = false },
        })
    end

    -- No authored focus links required: hierarchy handles directional moves.
    -- Right stick scrolls this area. When a row goes offscreen, its focus
    -- moves to the scrollbar proxy; Left returns to the eligible list.
    screen:SetInitialFocus(first)
    return screen
end

local function RegisterPages()
    if not UI.Pages.IsRegistered(PAGE_ID) then
        UI.Pages.Register(PAGE_ID, { host = HOST_ID, create = BuildMenu })
    end
end

function OnStart()
    InitTemplates()
    RegisterPages()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)
    if #UI.Pages.GetOpenPages(HOST_ID) > 0 then
        UI.Pages.Restore(HOST_ID)
    else
        UI.Pages.Open(PAGE_ID)
    end
end

function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
