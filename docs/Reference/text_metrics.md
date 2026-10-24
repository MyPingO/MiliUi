# API reference: Text Metrics

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `text_metrics.lua`  
**Coverage:** 5 classes, 26 fields, 0 aliases, 7 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Safe text height and native geometry](../IntrinsicSizing.md#safe-text-height-and-native-text-geometry)

## Classes, component props and return types

### `MiliUI.TextGeometryOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `recursive?` | `boolean` | Inspect descendants recursively. Default true. |
| `includeHidden?` | `boolean` | Include hidden/inactive controls. Default false. |
| `tolerance?` | `number` | Ignore shortages at or below this many UI units. Default 0.5. |
| `maxDepth?` | `integer` | Maximum recursive depth. Default 32. |
| `print?` | `boolean` | Print one-line warnings for each issue. |

### `MiliUI.TextGeometryIssue`

| Field | Declared type | Description |
| --- | --- | --- |
| `kind` | `'textHeight'` | Kind of issue detected. `'textHeight'` means the text area may not be tall enough. |
| `control` | `MiliUI.Control` | The Text or TextWindow control MiliUI found a potential sizing problem with. |
| `name` | `string` | Name of this UI element, useful for debugging. |
| `textKind` | `'text'\|'textWindow'` | Which native text control type was measured: `'text'` or `'textWindow'`. |
| `fontSize` | `number` | Font size used for the safety check. Adaptive controls use their configured minimum size. |
| `height` | `number` | Actual height of the text control, in UI units. |
| `recommendedMinimum` | `number` | Minimum height MiliUI estimates is needed for this text to fit safely, in UI units. |
| `shortage` | `number` | How many additional UI units of height this text may need. Calculated as `recommendedMinimum - height`. |

### `MiliUI.TextMetricsMetadata`

| Field | Declared type | Description |
| --- | --- | --- |
| `kind` | `'text'\|'textWindow'` | Kind of native text control that was measured: `'text'` or `'textWindow'`. |
| `fontSize` | `number` | Configured text size used for MiliUI geometry tracking. |
| `safeHeight` | `number` | Minimum height MiliUI estimates is safe for the first line of text, in UI units. |
| `automaticHeight` | `boolean` | Whether MiliUI supplied the control height automatically. |
| `automaticMinimum` | `boolean` | Whether MiliUI supplied the adaptive minimum font size automatically. |

### `MiliUI.TextMeasurement`

| Field | Declared type | Description |
| --- | --- | --- |
| `control` | `MiliUI.Control` | The Text or TextWindow UI control being measured. |
| `kind` | `'text'\|'textWindow'` | Which kind of native text control was measured: `'text'` or `'textWindow'`. |
| `fontSize` | `number` | Font size used for the current safety calculation. |
| `width` | `number` | Current width of this text control, in UI units. |
| `height` | `number` | Current height of this text control, in UI units. |
| `requiredHeight` | `number` | Height MiliUI estimates is needed to show this text safely, in UI units. |
| `shortage` | `number` | Extra height needed if the current control is too short. Never below `0`. |
| `metadata` | `MiliUI.TextMetricsMetadata` | Additional measurements and settings MiliUI recorded for this text control. |

### `MiliUI.TextMetricsAPI`

*No fields are declared directly on this type.*

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `TextMetricsAPI.SafeTextHeight(fontSize)`

Calibrated safe single-line height for a normal native Text control.
Current rule: ceil(fontSize * 1.2 + 10).

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fontSize` | `MiliUI.TextSize` | — |
| Returns | `integer` | height |

**Original LuaLS annotations:**

```lua
---@param fontSize MiliUI.TextSize
---@return integer height
```


### `TextMetricsAPI.SafeTextWindowHeight(fontSize)`

Calibrated safe first-line height for native TextWindow.
Current rule: ceil(fontSize * 1.2 + 12).

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fontSize` | `MiliUI.TextSize` | — |
| Returns | `integer` | height |

**Original LuaLS annotations:**

```lua
---@param fontSize MiliUI.TextSize
---@return integer height
```


### `TextMetricsAPI.EstimateWrappedLineCount(text, fontSize, width, horizontalInset)`

Estimates how many wrapped lines a TextWindow needs at the supplied width.
Supported rich-text tags are accounted for when they affect text geometry.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `text` | `any` | — |
| Parameter `fontSize` | `MiliUI.TextSize` | — |
| Parameter `width` | `number` | — |
| Parameter `horizontalInset?` | `number` | Per-side horizontal inset. Uses the runtime default when omitted. |
| Returns | `integer` | lineCount |

**Original LuaLS annotations:**

```lua
---@param text any
---@param fontSize MiliUI.TextSize
---@param width number
---@param horizontalInset? number Per-side horizontal inset. Uses the runtime default when omitted.
---@return integer lineCount
```


### `TextMetricsAPI.EstimateWrappedHeight(text, fontSize, width, horizontalInset)`

Estimates the natural wrapped height and line count for a TextWindow.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `text` | `any` | — |
| Parameter `fontSize` | `MiliUI.TextSize` | — |
| Parameter `width` | `number` | — |
| Parameter `horizontalInset?` | `number` | Per-side horizontal inset. Uses the runtime default when omitted. |
| Returns | `integer` | height |
| Returns | `integer` | lineCount |

**Original LuaLS annotations:**

```lua
---@param text any
---@param fontSize MiliUI.TextSize
---@param width number
---@param horizontalInset? number Per-side horizontal inset. Uses the runtime default when omitted.
---@return integer height
---@return integer lineCount
```


### `TextMetricsAPI.GetMetadata(value)`

Returns MiliUI-owned text geometry metadata, or nil for unrelated controls.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `MiliUI.Parent` | — |
| Returns | `MiliUI.TextMetricsMetadata?` | metadata |

**Original LuaLS annotations:**

```lua
---@param value MiliUI.Parent
---@return MiliUI.TextMetricsMetadata? metadata
```


### `TextMetricsAPI.GetRequiredHeight(value)`

Returns the current safe-height requirement for a tracked text control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `MiliUI.Parent` | — |
| Returns | `number?` | requiredHeight |
| Returns | `number?` | fontSize |
| Returns | `'text'\|'textWindow'\|nil` | kind |

**Original LuaLS annotations:**

```lua
---@param value MiliUI.Parent
---@return number? requiredHeight
---@return number? fontSize
---@return 'text'|'textWindow'|nil kind
```


### `TextMetricsAPI.Measure(value)`

Returns a current text-geometry measurement suitable for diagnostics, or nil
when the supplied value is not a MiliUI-tracked text control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `MiliUI.Parent` | — |
| Returns | `MiliUI.TextMeasurement?` | measurement |

**Original LuaLS annotations:**

```lua
---@param value MiliUI.Parent
---@return MiliUI.TextMeasurement? measurement
```
