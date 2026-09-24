# Player Context

MiliUI can optionally keep the local Player Entity reference available to every Lua UI module in the same client runtime.

This is useful when client Lua needs to send a server signal whose schema requires an explicit Player Entity parameter.

MiliUI does not discover the player automatically and does not impose any server-signal naming or parameter conventions on game code. The game remains responsible for providing the authoritative Player Entity reference.

## Recommended setup

Use a persistent client Global Script so registration is not tied to whether a particular UI Control Group is currently active.

The registration signal must send the local Player Entity as its first parameter.

Register that signal directly from the persistent script:

```lua
local UI = require("MiliUI/init")

function OnStart()
    UI.Player.RegisterFromSignal(
        script,
        "Register Player"
    )
end
```

`"Register Player"` above is the actual server-to-client signal name in the game. It is not the name of a Script Parameter.

No extra signal-name Script Parameter is required.

The `script` argument is still required. In Miliastra, a required Lua module has its own `script` context rather than automatically inheriting the Script instance that called it. Passing the persistent Script instance explicitly ensures MiliUI registers and later unregisters the signal handler on the correct Script.

When the signal arrives, MiliUI stores its first parameter as the local Player Entity reference. Sending the registration signal again replaces the stored Entity, so games may refresh the reference if their player lifecycle requires it.

### Disconnects and reconnects

Player registration belongs to the current client Lua runtime. If leaving/reconnecting causes the client to be refreshed, do not assume the previously stored Entity or signal handler still exists.

On the refreshed client:

```text
persistent client script starts again
    -> RegisterFromSignal(...) installs the handler again
    -> game/server initialization sends the local Player Entity again
    -> UI.Player is ready for the new client runtime
```

How the server notices that the client is ready is game-defined. A straightforward option is a server-to-client initialization signal that is sent on the initial connection and again after reconnect. MiliUI intentionally does not dictate that server lifecycle.

## Reading the player

Use `GetEntity()` when an unregistered result is acceptable:

```lua
local playerEntity = UI.Player.GetEntity()
if playerEntity ~= nil then
    -- Use the Entity reference.
end
```

Use `RequireEntity()` when the operation cannot proceed without the player:

```lua
local playerEntity = UI.Player.RequireEntity()
```

`RequireEntity()` raises a clear error if registration has not happened yet.

```lua
if UI.Player.IsRegistered() then
    print(UI.Player.GetEntity())
end
```

## Existing initialization signals

The convenience listener is optional. If the game already has its own server-signal handler that receives the Player Entity, store it directly instead:

```lua
UI.Player.SetEntity(playerEntity)
```

This avoids forcing a project to create a second signal or change an existing signal-handler structure.

## Server signals remain game-defined

MiliUI does not wrap `game.ServerSignal(...)` or choose parameter order for outgoing signals. Use the stored Entity wherever your own server contract expects it:

```lua
local signal = game.ServerSignal("My Game Signal")
signal:AddString("Menu")
signal:AddEntity(UI.Player.RequireEntity())
signal:AddBool(false)
signal:SendSignal()
```

The order above is only an example. Match the server signal schema defined by the game.
