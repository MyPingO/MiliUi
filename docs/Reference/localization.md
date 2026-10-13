# API reference: Localization

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `localization.lua`  
**Coverage:** 1 classes, 0 fields, 0 aliases, 9 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Localization](../Localization.md)

## Classes, component props and return types

### `MiliUI.LocalizationAPI`

*No fields are declared directly on this type.*

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Localization.Normalize(spec, fallbackText)`

Normalizes a text spec. Primitive values become `{ text = value }`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec?` | `MiliUI.TextSpec\|any` | — |
| Parameter `fallbackText?` | `any` | — |
| Returns | `MiliUI.TextSpec` | — |

**Original LuaLS annotations:**

```lua
---@param spec? MiliUI.TextSpec|any
---@param fallbackText? any
---@return MiliUI.TextSpec
```


### `Localization.Resolve(spec, fallbackText)`

Turn a Text Mapping ID plus fallback/placeholder values into the text the player should see.
Example: `UI.Localization.Resolve({ text = 'Wave {n}', args = { n = 2 } })` returns `Wave 2`.

Resolves game.GetText(textId), falls back when an unknown ID returns itself,
then applies named `{placeholder}` values from args.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec?` | `MiliUI.TextSpec\|any` | — |
| Parameter `fallbackText?` | `any` | — |
| Returns | `string` | — |

**Original LuaLS annotations:**

```lua
---@param spec? MiliUI.TextSpec|any
---@param fallbackText? any
---@return string
```


### `Localization.Bind(control, spec, fallbackText)`

Binds a native text-bearing control to a text spec and writes resolved text.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Control` | — |
| Parameter `spec?` | `MiliUI.TextSpec\|any` | — |
| Parameter `fallbackText?` | `any` | — |
| Returns | `MiliUI.TextSpec\|nil` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Control
---@param spec? MiliUI.TextSpec|any
---@param fallbackText? any
---@return MiliUI.TextSpec|nil
```


### `Localization.Set(control, spec, fallbackText)`

Save or replace the value linked to the key you provide.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Control` | — |
| Parameter `spec?` | `MiliUI.TextSpec\|any` | — |
| Parameter `fallbackText?` | `any` | — |
| Returns | `MiliUI.TextSpec\|nil` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Control
---@param spec? MiliUI.TextSpec|any
---@param fallbackText? any
---@return MiliUI.TextSpec|nil
```


### `Localization.Unbind(control)`

Stop updating this text control from its localization settings.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Control` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Control
```


### `Localization.Refresh(control)`

Update this UI to reflect current settings or data.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Control` | — |
| Returns | `boolean` | refreshed |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Control
---@return boolean refreshed
```


### `Localization.RefreshAll()`

Recalculate every live text binding, for example after the player's language changes.

Update every live localized text control so the latest translations appear.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | count Number of live bindings refreshed. |

**Original LuaLS annotations:**

```lua
---@return integer count Number of live bindings refreshed.
```


### `Localization.TextProps(spec, fallbackText, props)`

Copies a base props table and overlays a normalized TextSpec onto it.
The returned table contains the canonical text, textId, needsTranslation, and
args fields plus any semantic typography fields supplied by the TextSpec.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec?` | `MiliUI.TextSpec\|any` | — |
| Parameter `fallbackText?` | `any` | — |
| Parameter `props?` | `table<string, any>` | — |
| Returns | `table<string, any>` | — |

**Original LuaLS annotations:**

```lua
---@param spec? MiliUI.TextSpec|any
---@param fallbackText? any
---@param props? table<string, any>
---@return table<string, any>
```


### `Localization.WithArgs(spec, args, fallbackText)`

Fill named placeholders while keeping the rest of the text/translation settings.
Example: `UI.Localization.WithArgs({ text = 'HP: {hp}' }, { hp = 100 })`.

Copies a text spec and merges named placeholder args into it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec?` | `MiliUI.TextSpec\|any` | — |
| Parameter `args?` | `table<string, any>` | — |
| Parameter `fallbackText?` | `any` | — |
| Returns | `MiliUI.TextSpec` | — |

**Original LuaLS annotations:**

```lua
---@param spec? MiliUI.TextSpec|any
---@param args? table<string, any>
---@param fallbackText? any
---@return MiliUI.TextSpec
```
