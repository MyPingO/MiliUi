# API reference: Aliases

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `aliases.lua`  
**Coverage:** 9 classes, 109 fields, 16 aliases, 0 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Components](../Components.md) · [ResponsiveLayout](../ResponsiveLayout.md) · [Theming](../Theming.md)

## Classes, component props and return types

### `MiliUI.RememberOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `id?` | `string` | Stable persistence ID. Falls back to props.id when omitted. |
| `key?` | `string` | Deprecated compatibility alias for id. |
| `scope?` | `string` | Optional explicit session scope instead of the current page/global scope. |

### `MiliUI.Templates`

| Field | Declared type | Description |
| --- | --- | --- |
| `container` | `integer` | Client UI Container template index. |
| `image` | `integer` | Client UI Image template index. |
| `text` | `integer` | Client UI Text template index. |
| `button` | `integer` | Client UI Button template index. |
| `cursorArea?` | `integer` | Cursor Event Area template index. Required by UI.Hitbox and components that use invisible pointer regions. |
| `animation?` | `integer` | Index of the Client UI animation template configured in your Miliastra UI editor. Used when MiliUI creates animation controls. |
| `fullscreenAnimation?` | `integer` | Optional ClientUIFullscreenAnimationControl template index. |
| `keyHint?` | `integer` | Index of the Client UI key-hint template, which can show the keyboard or controller button to press. |
| `textWindow?` | `integer` | Index of the Client UI TextWindow template for longer or scrolling text. |
| `gridScroller?` | `integer` | Index of the Client UI GridScroller template for native repeated-item grids. |

### `MiliUI.LayoutProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `id?` | `string` | A unique label used to recognize the same UI state later. Required for `remember = true` unless a separate persistence ID is provided. Example: `id = 'music_slider'`. |
| `name?` | `string` | Optional name for finding this native UI control while debugging. It does not have to be unique and does not save state. |
| `remember?` | `MiliUI.RememberSpec` | Keep supported settings (such as a selected option) when this UI page is recreated in the same Lua session. Example: `id = 'settings_volume', remember = true`. Not permanent storage. |
| `x?` | `number` | Move this element **left or right** from the position MiliUI normally gives it. Positive numbers move right; negative numbers move left. Example: `x = 20` moves it 20 UI units to the right. |
| `y?` | `number` | Move this element **up or down** from the position MiliUI normally gives it. Positive numbers move up; negative numbers move down. Example: `y = -12` moves it 12 UI units down. |
| `width?` | `MiliUI.Dimension` | Set how wide this element should be. `width = 240` means **240 UI units**. `width = '50%'` means **half the width of its parent element**. Example: `local button = UI.Button(column, { width = 240, label = { text = 'Play' } })` creates a Button 240 units wide inside the existing `column`. |
| `height?` | `MiliUI.Dimension` | Set how tall this element should be. `height = 56` means **56 UI units**. `height = '100%'` requests the full height of its parent element. Example: `local button = UI.Button(column, { height = 56, label = { text = 'Play' } })` creates a Button 56 units tall. |
| `minWidth?` | `MiliUI.Dimension` | The smallest width this element is allowed to shrink to. Example: `minWidth = 140` keeps it at least 140 UI units wide when its parent becomes narrower. |
| `maxWidth?` | `MiliUI.Dimension` | The largest width this element is allowed to grow to. Example: `maxWidth = 480` prevents it from becoming wider than 480 UI units on a large screen. |
| `minHeight?` | `MiliUI.Dimension` | The smallest height this element is allowed to shrink to. Example: `minHeight = 48` keeps it at least 48 UI units tall. |
| `maxHeight?` | `MiliUI.Dimension` | The largest height this element is allowed to grow to. Example: `maxHeight = 500` keeps it no taller than 500 UI units. |
| `aspectRatio?` | `number` | Desired width compared with height. Example: `aspectRatio = 2` makes an item twice as wide as it is tall when MiliUI can calculate the missing dimension. Explicit sizes or limits can override the ratio. |
| `fillWidth?` | `boolean` | Make this element fill the available width **inside the parent container**. For example, `local button = UI.Button(column, { fillWidth = true })` creates a Button that uses the available width of the existing `column`. See `UI.Column` for a complete example. |
| `fillHeight?` | `boolean` | Make this element fill the available height inside its parent container. For example, `local box = UI.Box(row, { fillHeight = true })` creates a Box that fills the height of the existing `row`. In a Column, use `grow` to share extra height. |
| `grow?` | `number` | Let this element use some of the **extra space** left inside its parent. In a Row this means extra width; in a Column, extra height. `grow = 2` receives twice as much extra space as `grow = 1`. Default: `0`. See `UI.Row` for a complete example. |
| `alignSelf?` | `MiliUI.StackAlign` | Change how **this one element** lines up inside its Row or Column without moving the other children. In a **Row**, it controls up/down placement. In a **Column**, it controls left/right placement. Example: `alignSelf = 'center'` centers this element in that direction; `alignSelf = 'stretch'` makes it fill that direction. |
| `anchorX?` | `number` | Horizontal anchor position inside the parent: 0 = left, 0.5 = center, 1 = right. Usually leave unchanged unless manually positioning UI. |
| `anchorY?` | `number` | Vertical anchor position inside the parent: 0 = bottom, 0.5 = center, 1 = top. Usually leave unchanged unless manually positioning UI. |
| `anchorMinX?` | `number` | Where the left-side horizontal anchor sits in the parent (0 = left edge, 1 = right edge). Advanced manual layout setting. |
| `anchorMinY?` | `number` | Where the lower vertical anchor sits in the parent (0 = bottom, 1 = top). Advanced manual layout setting. |
| `anchorMaxX?` | `number` | Where the right-side horizontal anchor sits in the parent (0 = left edge, 1 = right edge). Different min/max values can make an item stretch. |
| `anchorMaxY?` | `number` | Where the upper vertical anchor sits in the parent (0 = bottom, 1 = top). Different min/max values can make an item stretch. |
| `pivotX?` | `number` | Point inside the item used for positioning and rotation: 0 = left edge, 0.5 = center, 1 = right edge. Default 0.5. |
| `pivotY?` | `number` | Point inside the item used for positioning and rotation: 0 = bottom, 0.5 = center, 1 = top. Default 0.5. |
| `rotation?` | `number` | Rotate this element in the 2D UI, measured in degrees. Example: `rotation = 45` turns it 45 degrees. |
| `zoom?` | `number` | Make the entire item bigger or smaller, including its children. Example: `zoom = 1.2` makes it 20% larger; `zoom = 0.8` makes it smaller. |
| `zoomX?` | `number` | Change the element's horizontal visual size without changing the space reserved in its layout. Example: `zoomX = 1.2` makes it appear 20% wider. |
| `zoomY?` | `number` | Change the element's vertical visual size without changing the space reserved in its layout. Example: `zoomY = 0.8` makes it appear 20% shorter. |
| `zoomZ?` | `number` | Scale multiplier for the control's depth direction. Most flat 2D UIs can leave it at `1`. |
| `scale?` | `number` | Older name for `zoom`. Use `zoom = 1.2` instead when you want an element to appear 20% larger. |
| `class?` | `string` | Optional shortcut for writing multiple MiliUI style/layout options in one string. Any explicitly supplied property takes priority over the class. |
| `responsive?` | `MiliUI.ResponsiveRule[]` | Automatically change the layout when the available parent space changes. Example: `responsive = { { when = { maxWidth = 600 }, props = { width = '100%' } } }`. |

### `MiliUI.BoxProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `size?` | `number` | Set both the width and height of a Spacer (an invisible empty space) in UI units. Example: `local space = UI.Spacer(column, { size = 16 })` creates a 16-by-16 unit gap inside the existing `column`. |

### `MiliUI.ImageProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `image?` | `integer` | Image asset ID to display. Example: `image = 100103` shows the built-in right-chevron image. |
| `color?` | `MiliUI.ColorValue` | Change the color applied over this image. Example: `color = 'accent'` uses your MiliUI theme's accent color. |
| `background?` | `MiliUI.ColorValue` | Another name for the image's color when `color` is not set. Example: `background = 'accent'` colors the image with the theme accent. |
| `stretch?` | `boolean` | `true` stretches the image asset to exactly fit its rectangle; `false` uses Miliastra's Basic image sizing. |
| `fillAmount?` | `number` | How much of the image is filled using its native image-fill mode. Use a number supported by the Miliastra image control. |
| `enableMask?` | `boolean` | When true, the image's visible shape hides parts of CHILD controls drawn outside that shape. Useful for scroll viewports or rounded-image clipping. |
| `enableSoftEdge?` | `boolean` | Make the edges of the image's mask fade gradually instead of ending sharply. Set `enableSoftEdge = true` to enable this native effect. |
| `softEdgeMode?` | `any` | Choose how Miliastra fades this image mask's edges. Use an `Enum.ImageMaskSoftEdgeMode` value. |
| `softEdgeWidthX?` | `number` | How wide the fade at the image mask's **left and right edges** is. Only matters when soft edges are enabled. |
| `softEdgeWidthY?` | `number` | How wide the fade at the image mask's **top and bottom edges** is. Only matters when soft edges are enabled. |
| `horizontalSoftRange?` | `number` | Amount of horizontal area affected by the native image-mask edge fade. |
| `verticalSoftRange?` | `number` | Amount of vertical area affected by the native image-mask edge fade. |
| `reverseMaskArea?` | `boolean` | Requests masking outside the visible image instead of inside. CAUTION: this native Miliastra feature currently behaves unreliably. |

### `MiliUI.IconProps`

**Inherits from:** [`MiliUI.ImageProps`](aliases.md#miliuiimageprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `size?` | `number` | Make the Icon square by setting its width and height together. Example: `size = 32` makes it 32 by 32 UI units. Default: `48`. |

### `MiliUI.TextSpec`

Reusable localization and typography description for one semantic text slot.
`text` is the English/code-first fallback. When `textId` exists, MiliUI calls
game.GetText(textId); if the host returns the ID itself, the fallback is used.

| Field | Declared type | Description |
| --- | --- | --- |
| `text?` | `any` | Text to show when there is no translated Text Mapping entry. Example: `text = 'Play'` displays **Play**. |
| `textId?` | `string` | ID in your project's Text Mapping table. MiliUI looks up the translated text with `game.GetText` and uses `text` as the fallback. |
| `needsTranslation?` | `boolean` | Marks this text for localization/export tools; setting it to false does NOT prevent normal translated-text lookup at runtime. |
| `args?` | `table<string, any>` | Values inserted into placeholders in translated text. Example: `text = 'Wave {wave}', args = { wave = 3 }` displays `Wave 3`. |
| `size?` | `MiliUI.TextSize` | Set how large the letters appear. Use a number such as `size = 24` for a specific font size, or a theme size such as `size = 'lg'`. |
| `textSize?` | `MiliUI.TextSize` | Another name for `size`, which chooses how large the text appears. Example: `textSize = 24`. |
| `color?` | `MiliUI.ColorValue` | Color of the displayed words. Example: `color = 'accent'` uses the theme's accent text color. |
| `textColor?` | `MiliUI.ColorValue` | Another name for the text's `color` setting. Example: `textColor = 'accent'` uses your theme's accent color. |
| `textBackground?` | `MiliUI.ColorValue` | Color behind the displayed text, if a text background is used. |
| `adaptiveFontSize?` | `boolean` | If text is too long for its box, allow the font to shrink until it fits. Use `minimumFontSize` to limit how small it can become. |
| `minimumFontSize?` | `MiliUI.TextSize` | Optional explicit lower bound for adaptive sizing. If omitted, MiliUI may shrink below 16 when needed. |
| `horizontalAlignment?` | `any` | Choose whether the text sits toward the left, center, or right inside its box. Use a Miliastra `Enum.TextHorizontalAlignment` value. |
| `verticalAlignment?` | `any` | Choose whether the text sits toward the top, middle, or bottom inside its box. Use a Miliastra `Enum.TextVerticalAlignment` value. |
| `outline?` | `boolean` | Show a thin outline around each letter. Example: `outline = true`. |
| `outlineColor?` | `MiliUI.ColorValue` | Color of the outline around the letters. Example: `outlineColor = 'black'`. |

### `MiliUI.TextProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `text?` | `any` | English/code-first fallback value, or a nested MiliUI.TextSpec for data-driven text. |
| `textId?` | `string` | Sandbox Text Mapping ID used with game.GetText. |
| `needsTranslation?` | `boolean` | Authoring/export metadata for the spreadsheet. Does not disable runtime lookup behavior. |
| `args?` | `table<string, any>` | Named `{placeholder}` substitutions applied after localization. |
| `size?` | `MiliUI.TextSize` | Set how large the letters appear. Use a number such as `size = 24` for a specific font size, or a theme size such as `size = 'lg'`. |
| `textSize?` | `MiliUI.TextSize` | Another name for `size`, which sets how large the text appears. Example: `textSize = 24`. |
| `color?` | `MiliUI.ColorValue` | Color of the displayed words. Example: `color = 'text'` uses the theme's normal text color. |
| `textColor?` | `MiliUI.ColorValue` | Another name for the text's `color` setting. Example: `textColor = 'accent'` uses your theme's accent color. |
| `textBackground?` | `MiliUI.ColorValue` | Color behind the displayed text, if a text background is used. |
| `adaptiveFontSize?` | `boolean` | Allow the font to shrink to fit the text box. Raw `UI.Text` defaults to false; many built-in labels enable it for you. |
| `minimumFontSize?` | `MiliUI.TextSize` | Optional explicit lower bound. Raw adaptive UI.Text otherwise derives a flexible minimum from its requested font size, never lower than 10. |
| `horizontalAlignment?` | `any` | Choose whether the text sits toward the left, center, or right inside its box. Use a Miliastra `Enum.TextHorizontalAlignment` value. |
| `verticalAlignment?` | `any` | Choose whether the text sits toward the top, middle, or bottom inside its box. Use a Miliastra `Enum.TextVerticalAlignment` value. |
| `outline?` | `boolean` | Show a thin outline around each letter. Example: `outline = true`. |
| `outlineColor?` | `MiliUI.ColorValue` | Color of the outline around the letters. Example: `outlineColor = 'black'`. |
| `fitWidth?` | `boolean` | Size the text rectangle to match its currently displayed/translated text instead of giving it a fixed width. |
| `fitWidthPadding?` | `number` | Extra horizontal safety added to intrinsic text width. Default 4. |

### `MiliUI.SurfaceProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `background?` | `MiliUI.ColorValue` | Background color of this UI panel or surface. Example: `background = 'surface'` uses the normal theme panel color. |
| `backgroundColor?` | `MiliUI.ColorValue` | Another name for `background`. Example: `backgroundColor = 'surface'`. |
| `backgroundImage?` | `integer` | Optional custom fill asset. Falls back to the radius-based rounded surface. |
| `backgroundStretch?` | `boolean` | Stretch the panel's background image to fit its width and height. Default: `true`. |
| `clipToRadius?` | `boolean` | When using a custom background image, also clip it to the rounded corner shape so the picture does not spill past the curve. |
| `radius?` | `MiliUI.Radius` | How rounded the corners appear. Example: `radius = 'lg'` for noticeably rounded corners or `'none'` for square corners. |
| `border?` | `boolean` | Show an outline around the panel. Example: `border = true`; set `borderColor` to choose its color. |
| `borderColor?` | `MiliUI.ColorValue` | Color of the outline around this panel. Example: `borderColor = 'border'`. |
| `borderImage?` | `integer` | Optional custom border asset. Falls back to the matching rounded outline. |
| `borderStretch?` | `boolean` | Stretch the panel's border image to match its width and height. Default: `true`. |
| `padding?` | `number` | Empty space INSIDE the panel, between its edges and its children. Example: `padding = 16` gives all four sides 16 units of breathing room. |
| `paddingX?` | `number` | Empty space **inside** the panel's left and right edges. Example: `paddingX = 16`. |
| `paddingY?` | `number` | Empty space **inside** the panel's top and bottom edges. Example: `paddingY = 12`. |
| `paddingLeft?` | `number` | Empty space **inside** the panel's left edge. Example: `paddingLeft = 16`. |
| `paddingRight?` | `number` | Empty space **inside** the panel's right edge. Example: `paddingRight = 16`. |
| `paddingTop?` | `number` | Empty space **inside** the panel's top edge. Example: `paddingTop = 16`. |
| `paddingBottom?` | `number` | Empty space **inside** the panel's bottom edge. Example: `paddingBottom = 16`. |

## Type aliases and enum values

### `MiliUI.NativeControl`

```lua
---@alias MiliUI.NativeControl MiliUI.Control|MiliUI.ContainerControl|MiliUI.ImageControl|MiliUI.TextControl|MiliUI.ButtonControl|MiliUI.CursorAreaControl|MiliUI.AnimationControl|MiliUI.FullscreenAnimationControl|MiliUI.KeyHintControl|MiliUI.TextWindowControl|MiliUI.GridScrollerControl
```

### `MiliUI.Parent`

```lua
---@alias MiliUI.Parent MiliUI.NativeControl|MiliUI.Screen|MiliUI.Panel|MiliUI.Button|MiliUI.Badge|MiliUI.Stat|MiliUI.ProgressBar|MiliUI.Slider|MiliUI.Toggle|MiliUI.Checkbox|MiliUI.Stepper|MiliUI.Selection|MiliUI.Tabs|MiliUI.PlayingCard|MiliUI.Alert|MiliUI.Modal|MiliUI.Popover|MiliUI.Tooltip|MiliUI.Repeater|MiliUI.ListView|MiliUI.ToastManager|MiliUI.Hitbox|MiliUI.Animation|MiliUI.FullscreenAnimation|MiliUI.KeyHint|MiliUI.TextWindow|MiliUI.GridScroller|MiliUI.Stack
```

### `MiliUI.Color`

```lua
---@alias MiliUI.Color any
```

### `MiliUI.ColorName`

```lua
---@alias MiliUI.ColorName
---| 'page'
---| 'surface'
---| 'surface2'
---| 'surfaceHover'
---| 'surfacePressed'
---| 'surfaceDisabled'
---| 'border'
---| 'borderStrong'
---| 'text'
---| 'muted'
---| 'disabled'
---| 'accent'
---| 'accentHover'
---| 'accentPressed'
---| 'gold'
---| 'success'
---| 'successHover'
---| 'successPressed'
---| 'warning'
---| 'info'
---| 'danger'
---| 'dangerHover'
---| 'dangerPressed'
---| 'overlay'
---| 'transparent'
---| 'white'
---| 'black'
```

### `MiliUI.ColorValue`

```lua
---@alias MiliUI.ColorValue MiliUI.ColorName|MiliUI.Color|string
```

### `MiliUI.Radius`

```lua
---@alias MiliUI.Radius 'none'|'xs'|'sm'|'md'|'lg'|'xl'|'2xl'|integer
```

### `MiliUI.TextSize`

```lua
---@alias MiliUI.TextSize 'xs'|'sm'|'md'|'lg'|'xl'|'xxl'|'title'|'display'|number
```

### `MiliUI.ButtonVariant`

```lua
---@alias MiliUI.ButtonVariant 'primary'|'secondary'|'ghost'|'success'|'danger'|string
```

### `MiliUI.AlertVariant`

```lua
---@alias MiliUI.AlertVariant 'info'|'success'|'warning'|'danger'
```

### `MiliUI.ShellMode`

```lua
---@alias MiliUI.ShellMode 'gradient'|'outline'|'border'|'half-border'
```

### `MiliUI.Dimension`

```lua
---@alias MiliUI.Dimension number|string Numeric Miliastra UI units or a percentage string such as `"100%"`.
```

### `MiliUI.StackAlign`

```lua
---@alias MiliUI.StackAlign 'start'|'center'|'end'|'stretch'
```

### `MiliUI.StackJustify`

```lua
---@alias MiliUI.StackJustify 'start'|'center'|'end'|'between'
```

### `MiliUI.ScreenOrientation`

```lua
---@alias MiliUI.ScreenOrientation 'landscape'|'portrait'|'square'
```

### `MiliUI.ThemeComponentName`

```lua
---@alias MiliUI.ThemeComponentName 'surface'|'panel'|'screen'|'button'|'card'|'badge'|'stat'|'progressBar'|'slider'|'toggle'|'checkbox'|'stepper'|'selection'|'tabs'|'alert'|'modal'|'popover'|'tooltip'|'repeater'|'listView'|'playingCard'
```

### `MiliUI.RememberSpec`

```lua
---@alias MiliUI.RememberSpec boolean|string|MiliUI.RememberOptions
```
