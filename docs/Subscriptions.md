# Server Signals and Custom Variables

Use `UI.Signals.Listen` to react when your client receives a Server Signal. Use `UI.Variables.Watch` to react when a global Custom Variable changes.

Each listener belongs to a MiliUI Host (one active UI root). MiliUI handles cleanup when that Host is detached, so a closed menu does not keep receiving events. Multiple callbacks can listen to the same event, and you can disconnect one manually if needed.

## Server Signals

Use `UI.Signals.Listen(hostId, signalName, callback)`:

```lua
local refreshSubscription = UI.Signals.Listen(
    HOST_ID,
    "Refresh Shop",
    function(params, signalName)
        RefreshShop(params)
    end
)
```

The callback receives:

1. the native signal parameter array,
2. the received signal name.

The signal name is normally the same value passed to `Listen`; it is included for parity/debugging.

### Shared native registration

Miliastra unregisters a Server Signal handler by signal name rather than by callback reference. MiliUI therefore registers one native callback per signal name and dispatches it to every active MiliUI subscriber.

For example, these share one native `RegisterServerSignalHandler` registration:

```lua
UI.Signals.Listen("HUD", "Round Started", function(params)
    RefreshRoundHud(params)
end)

UI.Signals.Listen("Scoreboard", "Round Started", function(params)
    RefreshScoreboard(params)
end)
```

When the last MiliUI subscriber disconnects, MiliUI calls the native unregister function.

While MiliUI owns a signal name, avoid separately registering/unregistering that same signal name through raw `script:RegisterServerSignalHandler` / `script:UnregisterServerSignalHandler` calls. The native unregister API is keyed only by signal name, so the two ownership models cannot be isolated reliably.

## Custom Variables

Miliastra's Custom Variable changed callback reports the entity type and variable name, but not the new value. MiliUI reads the current value with `game.GetGlobalCustomVariableValue` and passes it directly to the watcher.

Use:

```lua
local currencySubscription = UI.Variables.Watch(
    HOST_ID,
    Enum.CustomVariableEntityType.PlayerSelf,
    "Currency",
    function(value)
        UpdateCurrency(value)
    end,
    {
        immediate = true,
    }
)
```

The callback receives:

1. the current value,
2. the `Enum.CustomVariableEntityType`,
3. the Custom Variable name.

Supported entity types are the Miliastra values:

- `Enum.CustomVariableEntityType.Level`
- `Enum.CustomVariableEntityType.PlayerSelf`
- `Enum.CustomVariableEntityType.AvatarSelf`

### Immediate initial value

By default, `Watch` waits for a native change event.

Set `immediate = true` when the UI should receive the current value as soon as the watcher is created:

```lua
UI.Variables.Watch(
    HOST_ID,
    Enum.CustomVariableEntityType.Level,
    "Wave",
    function(wave)
        waveLabel.text = tostring(wave)
    end,
    { immediate = true }
)
```

The immediate callback also runs inside the owning Host context.

### Read without watching

`UI.Variables.Get` is a thin read helper and does not require a Host:

```lua
local wave = UI.Variables.Get(
    Enum.CustomVariableEntityType.Level,
    "Wave"
)
```

Complex Custom Variable values are returned unchanged.

## Subscription lifetime

Both `Listen` and `Watch` return the same subscription shape:

```lua
local subscription = UI.Signals.Listen(
    HOST_ID,
    "Close Menu",
    function()
        CloseMenu()
    end
)

print(subscription:IsConnected())

subscription:Disconnect()
```

`Disconnect()` is idempotent. It returns `true` only when that call actually disconnected the subscription.

Normally, explicit cleanup is unnecessary:

```lua
function OnDestroy()
    if UI.Hosts.IsAttached(HOST_ID) then
        UI.Hosts.Detach(HOST_ID)
    end
end
```

Detaching the Host disposes all remaining Host-owned subscriptions before the Host is released.

## Callback Host context

A native signal/variable callback may arrive long after `OnStart` has finished. MiliUI re-enters the subscription's owning Host before invoking user code.

That means Host-aware APIs continue to work naturally inside the callback:

```lua
UI.Signals.Listen(HOST_ID, "Show Reward", function(params)
    UI.Motion.PopIn(rewardCard)

    UI.After(2, function()
        HideReward()
    end)
end)
```

The nested `UI.After` belongs to the same Host because the signal callback is executing inside that Host context.

If the original Host has already detached, its subscription is disconnected and cannot later target a replacement Host that happens to reuse the same logical Host ID.

## Sending Server Signals

This feature manages incoming subscriptions only.

Outgoing Server Signals continue to use Miliastra's native API:

```lua
local signal = game.ServerSignal("Choose Option")
signal:AddInt(2)
signal:SendSignal()
```

MiliUI's existing component `submit` support continues to use its typed `SignalSubmit` helper where applicable.
