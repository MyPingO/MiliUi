# API reference: Responsive Props

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `responsive_props.lua`  
**Coverage:** 2 classes, 9 fields, 1 aliases, 0 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [ResponsiveComponents](../ResponsiveComponents.md)

## Classes, component props and return types

### `MiliUI.ResponsiveWhen`

| Field | Declared type | Description |
| --- | --- | --- |
| `minWidth?` | `number` | Use this layout rule when the parent has at least this much width. Example: `when = { minWidth = 800 }` targets wide screens. |
| `maxWidth?` | `number` | Use this layout rule when the parent has at most this much width. Example: `when = { maxWidth = 600 }` targets small/narrow screens. |
| `minHeight?` | `number` | Use this rule when the parent is at least this tall. Example: `minHeight = 700`. |
| `maxHeight?` | `number` | Use this rule when the parent is at most this tall. Example: `maxHeight = 500`. |
| `minAspect?` | `number` | Minimum available width / height ratio. |
| `maxAspect?` | `number` | Maximum available width / height ratio. |
| `orientation?` | `MiliUI.ResponsiveOrientation` | Apply the rule only when available space is `'landscape'` (wider than tall), `'portrait'` (taller than wide), or `'square'`. |

### `MiliUI.ResponsiveRule`

| Field | Declared type | Description |
| --- | --- | --- |
| `when?` | `MiliUI.ResponsiveWhen` | When should these changes apply? Example: `{ maxWidth = 600 }` means only when the parent is narrow. Omit it to apply unconditionally. |
| `props` | `table<string, any>` | Which properties should change? Example: `props = { width = '100%', height = 60 }`. Later matching rules take priority. |

## Type aliases and enum values

### `MiliUI.ResponsiveOrientation`

```lua
---@alias MiliUI.ResponsiveOrientation 'landscape'|'portrait'|'square'
```
