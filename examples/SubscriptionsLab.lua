-- MiliUI subscription runtime diagnostic.
--
-- Optional script parameters:
--   Signal Name          string, defaults to "Subscription Test"
--   Custom Variable Name string, empty/missing skips Custom Variable watching
--   Variable Entity Type string: "Level", "PlayerSelf", or "AvatarSelf"
--
-- No MiliUI templates are required. Fire the configured server-to-client signal
-- from game logic and/or change the configured Custom Variable while this script
-- is alive. Logs confirm callback Host context and automatic teardown.

local UI = require("MiliUI/init")

local UI_INDEX = 1073741870
local HOST_ID = "MiliUI Subscription Test"

local signalSubscription = nil
local variableSubscription = nil
local signalCount = 0
local variableCount = 0

local function ReadStringParam(name, fallback)
    local value = script:GetParam(name)
    if type(value) ~= "string" or value == "" then
        return fallback
    end
    return value
end

local function ResolveEntityType(name)
    if name == "Level" then
        return Enum.CustomVariableEntityType.Level
    end

    if name == "AvatarSelf" then
        return Enum.CustomVariableEntityType.AvatarSelf
    end

    return Enum.CustomVariableEntityType.PlayerSelf
end

local function ParamCount(params)
    if type(params) ~= "table" then return 0 end
    return #params
end

function DisconnectSubscriptions()
    local signalDisconnected = signalSubscription ~= nil
        and signalSubscription:Disconnect()
        or false

    local variableDisconnected = variableSubscription ~= nil
        and variableSubscription:Disconnect()
        or false

    print(
        "MILIUI_SUB_TEST_MANUAL_DISCONNECT | signal="
            .. tostring(signalDisconnected)
            .. " | variable="
            .. tostring(variableDisconnected)
    )
end

function OnStart()
    UI.Hosts.Attach(UI_INDEX, HOST_ID, script.object)

    local signalName = ReadStringParam("Signal Name", "Subscription Test")

    signalSubscription = UI.Signals.Listen(
        HOST_ID,
        signalName,
        function(params, receivedSignalName)
            signalCount = signalCount + 1

            print(
                "MILIUI_SUB_TEST_SIGNAL"
                    .. " | count="
                    .. tostring(signalCount)
                    .. " | host="
                    .. tostring(UI.Hosts.IsAttached(HOST_ID) and HOST_ID or "detached")
                    .. " | signal="
                    .. tostring(receivedSignalName)
                    .. " | params="
                    .. tostring(ParamCount(params))
            )

            -- This only succeeds if the subscription callback re-entered its
            -- Host context correctly.
            UI.After(0.05, function()
                print(
                    "MILIUI_SUB_TEST_SIGNAL_AFTER"
                        .. " | count="
                        .. tostring(signalCount)
                )
            end)
        end
    )

    print(
        "MILIUI_SUB_TEST_SIGNAL_READY"
            .. " | name="
            .. signalName
            .. " | connected="
            .. tostring(signalSubscription:IsConnected())
    )

    local variableName = ReadStringParam("Custom Variable Name", nil)
    if variableName == nil then
        print("MILIUI_SUB_TEST_VARIABLE_SKIPPED | set Custom Variable Name to test watching")
        return
    end

    local entityTypeName = ReadStringParam(
        "Variable Entity Type",
        "PlayerSelf"
    )
    local entityType = ResolveEntityType(entityTypeName)

    variableSubscription = UI.Variables.Watch(
        HOST_ID,
        entityType,
        variableName,
        function(value, _, changedVariableName)
            variableCount = variableCount + 1

            print(
                "MILIUI_SUB_TEST_VARIABLE"
                    .. " | count="
                    .. tostring(variableCount)
                    .. " | name="
                    .. tostring(changedVariableName)
                    .. " | value="
                    .. tostring(value)
            )
        end,
        { immediate = true }
    )

    print(
        "MILIUI_SUB_TEST_VARIABLE_READY"
            .. " | entityType="
            .. entityTypeName
            .. " | name="
            .. variableName
            .. " | connected="
            .. tostring(variableSubscription:IsConnected())
    )
end

function OnDestroy()
    local signalWasConnected = signalSubscription ~= nil
        and signalSubscription:IsConnected()
        or false

    local variableWasConnected = variableSubscription ~= nil
        and variableSubscription:IsConnected()
        or false

    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end

    print(
        "MILIUI_SUB_TEST_DESTROY"
            .. " | signalBefore="
            .. tostring(signalWasConnected)
            .. " | signalAfter="
            .. tostring(
                signalSubscription ~= nil
                    and signalSubscription:IsConnected()
                    or false
            )
            .. " | variableBefore="
            .. tostring(variableWasConnected)
            .. " | variableAfter="
            .. tostring(
                variableSubscription ~= nil
                    and variableSubscription:IsConnected()
                    or false
            )
    )
end
