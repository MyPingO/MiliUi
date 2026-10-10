# Motion

`UI.Motion` provides Host-owned managed tweens and reusable transform effects.

Use Motion when the visual behavior belongs to an existing control or component. Effects that create temporary decorative controls, such as confetti/image bursts, are intentionally not part of this first motion preset batch.

## Managed motion

All Motion targets may be native Client UI controls or MiliUI wrapper objects with `.root`.

Managed motion tracks semantic transform channels:

- position
- size
- anchors
- pivot
- scale
- rotation

Starting new managed motion on a channel replaces conflicting MiliUI-managed motion on that channel. Reusable effects remember the target's intended baseline and restore it after completion or cancellation.

This means repeated interaction effects should not permanently accumulate offsets, scale, or rotation.

## Low-level helpers

```lua
UI.Motion.Tween(control, {
    anchoredPositionX = 120,
    anchoredPositionY = 40,
}, 0.2, Enum.EaseType.OutCubic)

UI.Motion.MoveTo(control, 120, 40)
UI.Motion.ScaleTo(control, 1.08)
UI.Motion.RotateTo(control, 8)

UI.Motion.Cancel(control, "position")
UI.Motion.Cancel(control, { "scale", "rotation" })
```

Targetless delayed work requires a current Host context:

```lua
UI.Motion.After(0.25, function()
end)
```

From bootstrap/game code without a current Host context, use `UI.Hosts.After(hostId, ...)`.

### Native rotation caveat

Low-level absolute rotation tweens inherit Miliastra's numeric Euler interpolation behavior. If a control is currently stored near `360` and you tween directly to a small positive angle, Miliastra can take the long numeric path instead of the shortest angular path.

Reusable rotation presets such as `Wobble` and `SpinIn` compensate for the confirmed `0/360` seam behavior. For deliberate custom rotation paths, choose an equivalent target angle near the current stored value (for example `367` instead of `7` when starting from `353`), or use the raw tween semantics intentionally when a long spin is desired.

## Existing effects

### PopIn

Starts from a smaller scale and expands to the intended scale.

```lua
UI.Motion.PopIn(card)

UI.Motion.PopIn(card, {
    from = 0.75,
    duration = 0.28,
})
```

### Pulse

Scales outward and returns.

```lua
UI.Motion.Pulse(button, {
    scale = 1.08,
})
```

### FlipX

Collapses the X scale, invokes an optional midpoint callback, then expands again.

```lua
UI.Motion.FlipX(card, nil, function()
    card:ShowBack()
end)
```

### Shake

Applies a short horizontal shake and restores the intended position.

```lua
UI.Motion.Shake(input, {
    distance = 10,
})
```

## Reusable effect presets

### SlideIn

Starts from a directional offset and slides into the target's intended position.

```lua
UI.Motion.SlideIn(panel, {
    direction = "left",
    distance = 64,
    duration = 0.24,
})
```

Directions:

- `left`
- `right`
- `up`
- `down`

If another managed position tween was already moving the control, SlideIn uses that tween's intended destination as its baseline rather than the current interpolated position.

### BounceIn

Starts smaller, grows through an overshoot, then settles at the intended scale.

```lua
UI.Motion.BounceIn(card, {
    from = 0.70,
    overshoot = 1.07,
})
```

### Nudge

Moves briefly in one direction and returns.

```lua
UI.Motion.Nudge(button, {
    direction = "right",
    distance = 14,
})
```

This is intended for subtle directional feedback rather than an error-style shake.

### Wobble

Applies a diminishing Z-rotation wobble and restores the original rotation.

```lua
UI.Motion.Wobble(icon, {
    angle = 8,
})
```

Miliastra normalizes completed/stored negative Z Euler rotations into the equivalent `0..360` value. Its native Tween interpolation then works with the raw numeric values rather than automatically choosing the shortest angular path. For example, a completed `-7` degree orientation may be stored as `353`; naively tweening that to `+7` would travel almost a full rotation.

`Wobble` compensates for this engine behavior by choosing the equivalent target angle nearest the control's current stored rotation for every step. This keeps the effect on the intended short path across the `0/360` seam.

### Punch

Applies a sharp outward scale, slight compression, and settle.

```lua
UI.Motion.Punch(button)

UI.Motion.Punch(button, {
    scale = 1.12,
    compress = 0.96,
})
```

This is suitable for click/confirm feedback when a normal pulse feels too soft.

### Squash

Briefly stretches one scale axis while compressing the other, then returns to the baseline.

```lua
UI.Motion.Squash(button, {
    scaleX = 1.08,
    scaleY = 0.92,
})
```

### SpinIn

Starts from a Z-rotation offset and spins into the intended rotation.

```lua
UI.Motion.SpinIn(icon)

UI.Motion.SpinIn(icon, {
    degrees = 180,
    duration = 0.3,
})
```

The default is a 180-degree clockwise SpinIn in Miliastra. Negative and positive degree offsets spin from opposite directions, so pass `degrees` explicitly when the opposite direction is desired. `SpinIn` preserves the requested signed rotation amount even when Miliastra normalizes the starting Euler value. For example, a `-90` degree offset still travels exactly 90 degrees rather than taking the long path from stored `270` back to `0`.

### Hop

Moves upward, lands slightly past the original position, then settles. Unlike `Nudge`, this is a three-phase vertical feedback motion with a visible landing.

```lua
UI.Motion.Hop(button, {
    height = 28,
    landing = 6,
})
```

### Swing

Applies a broader, slower pendulum-style rotation than `Wobble`.

```lua
UI.Motion.Swing(icon, {
    angle = 16,
})
```

Like `Wobble`, Swing chooses nearest equivalent Euler targets so it does not accidentally take long paths across Miliastra's `0/360` seam.

### RubberBand

Alternates horizontal stretch and vertical compression before settling back to the intended scale.

```lua
UI.Motion.RubberBand(badge, {
    stretch = 1.18,
    squeeze = 0.86,
})
```

The deformation is multiplied against the original X/Y scale, so non-uniform controls keep their proportions correctly after the effect ends.

### DropIn

Starts above the intended position, drops slightly past it, then settles.

```lua
UI.Motion.DropIn(panel, {
    distance = 64,
    overshoot = 9,
})
```

This is a more physical entrance than `SlideIn`, which moves directly to the destination without a landing overshoot.

### Slam

Starts enlarged, compresses sharply on impact, rebounds slightly, then settles.

```lua
UI.Motion.Slam(achievementCard)
```

Slam is intended as a strong entrance/impact preset. `Punch` remains the corresponding feedback preset that begins from the control's normal scale.

### Breathe

Loops a subtle scale expansion and return until another scale effect replaces it or it is explicitly cancelled.

```lua
UI.Motion.Breathe(highlight)

-- Later:
UI.Motion.Cancel(highlight, "scale")
```

`Breathe` is intentionally persistent. Host teardown, target destruction, cancellation, or another managed scale effect stops the loop and restores the stable baseline.

## Interruption behavior

Effects are designed to be restartable.

For example:

```lua
UI.Motion.SlideIn(card, {
    direction = "left",
})

UI.Motion.Nudge(card, {
    direction = "right",
})
```

The second position effect does not treat SlideIn's temporary offset as a new permanent base position. It recovers the stable intended position first.

Likewise, scale effects such as `PopIn`, `Pulse`, `BounceIn`, `Punch`, and `Squash` share the managed scale channel and restore the original non-uniform scale correctly.

Rotation effects use the managed rotation channel and preserve the original X/Y/Z rotation.

## Choosing an effect

Use:

- `PopIn` for a simple scale entrance.
- `BounceIn` for a more expressive entrance.
- `SlideIn` for directional screen/card entrances.
- `Pulse` for soft emphasis.
- `Punch` for stronger click/confirm feedback.
- `Squash` for tactile/cartoon-like interaction feedback.
- `Nudge` for directional hints or acknowledgement.
- `Shake` for rejection/error feedback.
- `Wobble` for playful attention feedback.
- `FlipX` for midpoint content swaps.
- `SpinIn` for icons/badges/decorative entrances.
- `Hop` for lively vertical feedback with a landing.
- `Swing` for slower pendulum-like attention motion.
- `RubberBand` for playful elastic feedback.
- `DropIn` for physical downward entrances.
- `Slam` for strong impact entrances.
- `Breathe` for subtle persistent ambient emphasis.

Avoid stacking multiple effects on the same transform channel when the intended visual requires both to remain active simultaneously. Managed effects deliberately replace conflicting channel ownership.

## Not implemented as a generic preset yet

### Fade

A generic MiliUI component does not have one universal opacity property. Composed controls may own separate image/text/border colors. A future Fade API needs an explicit descendant and alpha-restoration model rather than pretending opacity is a simple transform.

### SlideOut / exit effects

An exit preset also needs a clear completion contract: leave the target transformed, hide it, deactivate it, destroy it, or restore it after a callback. That lifecycle behavior should be designed before adding a deceptively simple `SlideOut`.

### Spawned decorative effects

Image bursts/confetti create temporary controls and need spawning, randomized motion, cleanup, and Host teardown semantics. They may eventually belong in a separate `UI.Effects` namespace rather than `UI.Motion`.
