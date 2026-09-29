# Player Context

MiliUI can expose the current client's Player Entity to Client Scripts without a registration signal.

Miliastra already lets client Lua read Custom Variables owned by the current client through:

```lua
Enum.CustomVariableEntityType.PlayerSelf
```

MiliUI uses that scope to read one project-defined Player Custom Variable whose value references the Player Entity itself.

## Recommended setup

Create an **Entity-valued Custom Variable** on the Player Entity and set its value to that same Player Entity.

The Custom Variable name is completely project-defined. For example:

```text
Player Custom Variable
Name: PlayerSelf
Value: [that Player Entity]
```

`PlayerSelf` is only a recommended example. If your project uses another naming convention, use any name you prefer.

Then configure MiliUI once from shared client setup:

```lua
local UI = require("MiliUI/init")

function OnInit()
    UI.Player.Configure("PlayerSelf")
end
```

Projects that prefer editor configuration can supply the name through a Script Parameter instead:

```lua
UI.Player.Configure(
    script:GetParam("Player Entity Variable Name")
)
```

After that, `UI.Player.GetEntity()` and `UI.Player.RequireEntity()` read the Entity directly from the configured Custom Variable on `Enum.CustomVariableEntityType.PlayerSelf`.

There is no MiliUI Player registration signal, registration handler, or cached Player Entity.

## Reading the player

Use `GetEntity()` when a missing result is acceptable:

```lua
local playerEntity = UI.Player.GetEntity()

if playerEntity ~= nil then
    -- Use the Entity reference.
end
```

Use `RequireEntity()` when the operation cannot proceed without the Player Entity:

```lua
local playerEntity = UI.Player.RequireEntity()
```

`RequireEntity()` raises a clear error if `UI.Player` has not been configured or if the configured Custom Variable does not currently resolve to an Entity reference.

You can inspect the setup directly:

```lua
if UI.Player.IsConfigured() then
    print(UI.Player.GetCustomVariableName())
end
```

## Server signals

MiliUI does not wrap `game.ServerSignal(...)` or choose parameter order for outgoing signals.

Use the resolved Player Entity wherever your own server contract expects it:

```lua
local signal = game.ServerSignal("My Game Signal")
signal:AddString("Menu")
signal:AddEntity(UI.Player.RequireEntity())
signal:AddBool(false)
signal:SendSignal()
```

The order above is only an example. Match the server signal schema defined by the game.

## Why this replaces Player registration

The older MiliUI Player flow required the server to send the local Player Entity to the client, then cached that value in Lua:

```text
server sends Player Entity
    -> client registration signal
        -> MiliUI stores Player Entity
            -> later signals reuse it
```

That indirection is unnecessary when the Player Entity already owns a globally accessible Custom Variable containing its own Entity reference.

The current flow is:

```text
Player Entity
    -> project-defined self-reference Custom Variable

client
    -> PlayerSelf scope
        -> reads self-reference Custom Variable
            -> gets Player Entity
```

A full client reconnect creates a new Lua runtime, so shared setup runs `UI.Player.Configure(...)` again. No server-to-client registration handshake needs to be repeated.
