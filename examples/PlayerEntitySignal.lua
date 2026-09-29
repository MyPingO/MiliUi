local UI = require("MiliUI/init")

local PLAYER_ENTITY_VARIABLE_NAME = "PlayerSelf"

function OnInit()
    UI.Player.Configure(PLAYER_ENTITY_VARIABLE_NAME)
end

function SendMenuState(isOpen)
    local signal = game.ServerSignal("Set Menu State")
    signal:AddEntity(UI.Player.RequireEntity())
    signal:AddBool(isOpen)
    signal:SendSignal()
end
