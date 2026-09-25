# Text Geometry

Miliastra's native text controls require more vertical rectangle space than their nominal `fontSize`. This is an engine/rendering constraint that MiliUI now treats as layout geometry rather than leaving each component to guess.

## Runtime-confirmed behavior

Dedicated runtime calibration showed two distinct behaviors:

- `UI.Text` has a hard vertical cutoff. Below its native threshold, the text may render nothing at all.
- `UI.TextWindow` is more viewport-like. It can still render in a short rectangle, but descenders such as `g`, `y`, `j`, `p`, and `q` are clipped before the rest of the glyph.

Measured first fully visible `UI.Text` heights:

| Font size | Measured minimum |
| ---: | ---: |
| 10 | 21 |
| 13 | 23 |
| 16 | 28 |
| 17 | 29 |
| 20 | 33 |
| 22 | 35 |
| 26 | 40 |
| 34 | 49 |
| 44 | 62 |
| 56 | 77 |
| 68 | 91 |

A conservative rule was then validated across 24 font sizes from 10 through 68 and with Middle, Top, and Bottom `UI.Text` alignment:

```lua
math.ceil(fontSize * 1.2 + 10)
```

For `TextWindow`, descender calibration requires two additional units:

```lua
math.ceil(fontSize * 1.2 + 12)
```

These are safety rules, not claims about the exact internal engine font metrics. The same principle applies to MiliUI's width and wrapped-height estimators: they are conservative layout aids, not a pixel-accurate reproduction of Miliastra text rendering across every supported language.

## MiliUI behavior

MiliUI exposes:

```lua
UI.SafeTextHeight(fontSize)
UI.SafeTextWindowHeight(fontSize)
```

When a `UI.Text` or `UI.TextWindow` does **not** explicitly own its vertical size:

- a normal fixed control receives the calibrated safe height automatically;
- a `grow`/`fillHeight` control receives that value as its default `minHeight`;
- an explicit `height` or explicit `minHeight` remains authoritative;
- an explicit `aspectRatio` is not silently overridden.

This follows normal layout expectations: MiliUI supplies a useful intrinsic size when the developer leaves the axis automatic, while explicit geometry remains the developer's choice.

Examples:

```lua
-- Gets an intrinsic safe height automatically.
UI.Text(parent, {
    text = "READY",
    textSize = 22,
})

-- Flexible height: MiliUI supplies a safe minimum.
UI.TextWindow(column, {
    text = longText,
    textSize = 16,
    grow = 1,
})

-- Explicit geometry is preserved exactly.
UI.Text(parent, {
    text = "Compact",
    textSize = 22,
    height = 26,
})
```

## Horizontal clipping is a separate problem

`UI.SafeTextHeight(...)` protects vertical glyph geometry. It does not guarantee that a long string fits horizontally.

Use the appropriate width strategy:

- `fitWidth = true` for short single-line text whose width may follow its content;
- a constrained width plus `adaptiveFontSize = true` and a sensible `minimumFontSize` when the line must stay inside a fixed region;
- `UI.TextWindow(..., { fillWidth = true, fitContentHeight = true })` for prose that should wrap.

This matters especially for localized text and runtime values because the final string can be substantially longer than the authored English fallback.

## Diagnostics

`UI.CheckLayout(...)` remains strictly about parent/child bounds.

Text-height safety is a separate opt-in check:

```lua
local issues = UI.CheckTextGeometry(root, {
    recursive = true,
    print = true,
})
```

An undersized tracked text rectangle prints a compact warning:

```text
MILIUI_TEXT_WARNING | control=Label | kind=text | fontSize=22 | height=26.00 | recommendedMinimum=37 | shortage=11.00
```

Keeping the checks separate prevents intentional component composition from changing normal layout issue counts.

## TextWindow responsive rule

Responsive layouts should keep one live native `TextWindow` and resize/reposition that same control as the layout changes. Do not maintain hidden Wide/Medium/Narrow native TextWindow copies. Runtime probing showed hidden/overlapping native TextWindows can produce clipping/masking artifacts, while a single-tree responsive TextWindow remains clean.

For vertically constrained responsive layouts, prefer:

```lua
UI.TextWindow(column, {
    text = longText,
    grow = 1,
    minHeight = 80,
})
```

rather than manual remaining-height arithmetic.
