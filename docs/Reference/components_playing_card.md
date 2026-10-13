# API reference: Components Playing Card

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_playing_card.lua`  
**Coverage:** 8 classes, 120 fields, 1 aliases, 17 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Components](../Components.md)

## Classes, component props and return types

### `MiliUI.PlayingCardHeaderProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `icon?` | `integer` | Image asset ID displayed beside the text at the top of the card. Example: `icon = 100103`. |
| `label?` | `MiliUI.TextSpec` | Text shown in the card header. Example: `{ text = 'Rare' }`. |
| `color?` | `MiliUI.ColorValue` | Color used for the header's text and image unless more specific colors are set. Example: `color = 'accent'`. |
| `iconColor?` | `MiliUI.ColorValue` | Color used for the icon appearance of this playing card header. Example: `'accent'` or `'white'`. |
| `iconSize?` | `number` | Width and height of the header image, in UI units. Default: `22`. |

### `MiliUI.PlayingCardArtworkProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `image?` | `integer` | Image asset ID shown as the **main picture** on the front of the card. |
| `color?` | `MiliUI.ColorValue` | Color applied over the card's main picture. Example: `color = 'white'` keeps the original light tint. |
| `background?` | `MiliUI.ColorValue` | Background color of the area behind the card's main picture. |
| `stretch?` | `boolean` | Stretch the main picture to fit its allotted space. Default: `false`. |
| `x?` | `number` | Move the main picture left or right inside its area, in UI units. Positive numbers move right. |
| `y?` | `number` | Move the main picture up or down inside its area, in UI units. Positive numbers move up. |
| `width?` | `number` | Width of the main picture, in UI units. If omitted, MiliUI sizes it automatically as a square. |
| `height?` | `number` | Height of the main picture, in UI units. If omitted, MiliUI sizes it automatically as a square. |
| `glowImage?` | `integer` | Optional image asset ID shown behind the main picture as decoration. |
| `glowColor?` | `MiliUI.ColorValue` | Color used for the glow appearance of this playing card artwork. Example: `'accent'` or `'white'`. |
| `glowStretch?` | `boolean` | Stretch the decoration behind the picture to fit its requested size. Default: `true`. |
| `glowX?` | `number` | Horizontal position or offset for glow, in UI units. |
| `glowY?` | `number` | Vertical position or offset for glow, in UI units. |
| `glowWidth?` | `number` | Width of the glow part in UI units. |
| `glowHeight?` | `number` | Height of the glow part in UI units. |

### `MiliUI.PlayingCardBackProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `background?` | `MiliUI.ColorValue` | Background color shown when the **back side** of the card is visible. Default: an opaque dark color. |
| `frameColor?` | `MiliUI.ColorValue` | Optional border color used when the back of the card is showing. |
| `glowImage?` | `integer` | Optional image asset ID for decoration behind the card-back symbol. |
| `glowColor?` | `MiliUI.ColorValue` | Color used for the glow appearance of this playing card back. Example: `'accent'` or `'white'`. |
| `glowStretch?` | `boolean` | Stretch the decoration behind the card-back symbol. Default: `true`. |
| `glowX?` | `number` | Horizontal position or offset for glow, in UI units. |
| `glowY?` | `number` | Vertical position or offset for glow, in UI units. |
| `glowWidth?` | `number` | Width of the glow part in UI units. |
| `glowHeight?` | `number` | Height of the glow part in UI units. |
| `icon?` | `integer` | Optional image asset ID displayed at the center of the card's back. |
| `iconColor?` | `MiliUI.ColorValue` | Color of the picture at the center of the card's back. Default: `'gold'`. |
| `iconSize?` | `number` | Width and height of the card-back image, in UI units. |
| `iconX?` | `number` | Horizontal position or offset for icon, in UI units. |
| `iconY?` | `number` | Vertical position or offset for icon, in UI units. |
| `title?` | `MiliUI.TextSpec` | Text shown as the main heading on the back of the card. Example: `title = { text = 'Quest Card' }`. |
| `titleX?` | `number` | Horizontal position or offset for title, in UI units. |
| `titleY?` | `number` | Vertical position or offset for title, in UI units. |
| `subtitle?` | `MiliUI.TextSpec` | Smaller supporting text shown on the back of the card. Example: `subtitle = { text = 'Level 2' }`. |
| `subtitleX?` | `number` | Horizontal position or offset for subtitle, in UI units. |
| `subtitleY?` | `number` | Vertical position or offset for subtitle, in UI units. |

### `MiliUI.PlayingCardHoverProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `raise?` | `number` | How far the card rises when hovered. Example: `raise = 12` moves it upward by 12 UI units. |
| `scale?` | `number` | Card size while hovered: `1` is normal, `1.05` is 5% larger. |
| `pressScale?` | `number` | Size of the card while pressed. `pressScale = 0.97` makes it look 3% smaller. Default: `0.97`. |
| `rotation?` | `number` | Additional angle while hovered, in degrees. Example: `rotation = 3` tilts the card slightly. |
| `duration?` | `number` | Length of the animation or visibility period, in seconds. |
| `ease?` | `any` | Choose how the card's hover animation speeds up and slows down. Use a Miliastra `Enum.EaseType` value. |
| `press?` | `boolean` | Apply a slight size change when the card is pressed. Set `press = false` to turn this off. |

### `MiliUI.PlayingCardSlots`

| Field | Declared type | Description |
| --- | --- | --- |
| `headerLeft?` | `MiliUI.PlayingCardSlotRenderer` | Replaces standard header icon/label contents. |
| `headerRight?` | `MiliUI.PlayingCardSlotRenderer` | Replaces standard top-right value contents. |
| `artwork?` | `MiliUI.PlayingCardSlotRenderer` | Replaces standard artwork image/glow inside the artwork well. |
| `footer?` | `MiliUI.PlayingCardSlotRenderer` | Replaces standard title/subtitle footer. |
| `back?` | `MiliUI.PlayingCardSlotRenderer` | Replaces standard card-back contents. |

### `MiliUI.PlayingCardProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `frameColor?` | `MiliUI.ColorValue` | Color of the thick border around the **front** of the card. Default: `'accent'`. |
| `backFrameColor?` | `MiliUI.ColorValue` | Fallback when back.frameColor is omitted. |
| `frameThickness?` | `number` | Thickness of the border around the card, in UI units. Default: `5`. |
| `bodyColor?` | `MiliUI.ColorValue` | Background color of the area **inside** the card's outer border. Default: `'black'`. |
| `radius?` | `MiliUI.Radius` | How rounded the whole card's outer corners are. Default: `'xl'`. |
| `header?` | `MiliUI.PlayingCardHeaderProps` | Optional text and icon settings for the top strip of the card. |
| `value?` | `MiliUI.TextSpec` | Localized top-right value/rank/price/etc. |
| `image?` | `integer` | Convenience alias for artwork.image. |
| `artwork?` | `MiliUI.PlayingCardArtworkProps` | Settings for the main picture displayed in the card. |
| `artworkRadius?` | `MiliUI.Radius` | How rounded the main picture area's corners are. Default: `'lg'`. |
| `artworkBorder?` | `boolean` | Show an outline around the picture area. Default: `true`. |
| `artworkBorderColor?` | `MiliUI.ColorValue` | Color of the outline around the main picture area. Default: `'borderStrong'`. |
| `title?` | `MiliUI.TextSpec` | Main name shown on the card. Example: `{ text = 'Frost Mage' }`. |
| `subtitle?` | `MiliUI.TextSpec` | Smaller supporting text below the card title, such as a character class. |
| `divider?` | `boolean` | Show a dividing line between the card's sections. Default: `true` for the standard footer. |
| `dividerColor?` | `MiliUI.ColorValue` | Color of the dividing line on the card. Example: `dividerColor = 'border'`. |
| `back?` | `MiliUI.PlayingCardBackProps` | Settings for the reverse side of the card. |
| `face?` | `"front"\|"back"` | Which side starts visible: front or back (see allowed values). |
| `hidden?` | `boolean` | Start with the card face hidden when true; useful for unrevealed cards. |
| `selected?` | `boolean` | Draw the card using its selected appearance. Useful for chosen items or deck selections. |
| `selectionColor?` | `MiliUI.ColorValue` | Color of the outline indicating the card is selected. Default: `'gold'`. |
| `interactive?` | `boolean` | Allow the player to interact with the card (select/press/hover), rather than treating it as decoration. |
| `interactable?` | `boolean` | Allow the player to hover over and click this card if interaction is enabled. Default: `true` when `interactive` is used. |
| `controllerFocus?` | `boolean` | Allow controller players to select the card with the D-pad or left stick. Default: `true`. |
| `hover?` | `MiliUI.PlayingCardHoverProps\|false` | Settings for animation while the pointer is over the card. |
| `hoverRaise?` | `number` | Convenience fallback for hover.raise. |
| `hoverScale?` | `number` | Convenience fallback for hover.scale. |
| `hoverRotation?` | `number` | Convenience fallback for hover.rotation. |
| `hoverDuration?` | `number` | Convenience fallback for hover.duration. |
| `hoverEase?` | `any` | Convenience fallback for hover.ease. |
| `pressScale?` | `number` | Convenience fallback for hover.pressScale. |
| `slots?` | `MiliUI.PlayingCardSlots` | Optional custom UI pieces that replace parts of the default card, such as artwork or footer. |

### `MiliUI.PlayingCardSlotHandles`

| Field | Declared type | Description |
| --- | --- | --- |
| `headerLeft` | `MiliUI.ContainerControl` | Container for extra UI on the left side of the card header. |
| `headerRight` | `MiliUI.ContainerControl` | Container for extra UI on the right side of the card header. |
| `artwork` | `MiliUI.ContainerControl` | Container for custom artwork or decorations on the card. |
| `footer` | `MiliUI.ContainerControl` | Container for custom UI near the card's bottom edge. |
| `back` | `MiliUI.ContainerControl` | Container for custom UI on the card's reverse side. |

### `MiliUI.PlayingCard`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Stationary layout/hit-test slot. |
| `slot` | `MiliUI.ContainerControl` | Another name for `root`, the layout container that holds this card. |
| `visual` | `MiliUI.ContainerControl` | Animated visible card root. |
| `panel` | `MiliUI.Panel` | Outer colored frame panel. |
| `body` | `MiliUI.Panel` | Panel that forms the inner body of the card, inside the outer frame. |
| `front` | `MiliUI.ContainerControl` | Container holding the card's front-side artwork, text, and decorations. |
| `back` | `MiliUI.Panel` | Panel shown on the back of the card when its face is flipped. |
| `frame` | `MiliUI.ImageControl` | Image control drawing the decorative outer frame of the card. |
| `selection` | `MiliUI.ImageControl` | Image control drawing the outline that marks a selected card. |
| `slots` | `MiliUI.PlayingCardSlotHandles` | Handles to the card's containers where you can insert custom UI content. |
| `headerLeft` | `MiliUI.ContainerControl` | Header left used by this playing card. |
| `headerRight` | `MiliUI.ContainerControl` | Header right used by this playing card. |
| `artwork` | `MiliUI.Panel` | Artwork used by this playing card. |
| `footer` | `MiliUI.ContainerControl` | Footer used by this playing card. |
| `backContent` | `MiliUI.ContainerControl` | Back content used by this playing card. |
| `headerIcon?` | `MiliUI.ImageControl` | Present when the standard header icon is used. |
| `headerText?` | `MiliUI.TextControl` | Present when the standard header label is used. |
| `valueText?` | `MiliUI.TextControl` | Present when the standard value is used. |
| `artworkGlow?` | `MiliUI.ImageControl` | Artwork glow used by this playing card. |
| `artworkImage?` | `MiliUI.ImageControl` | Image asset ID used for the artwork appearance of this playing card. |
| `divider?` | `MiliUI.ImageControl` | Divider used by this playing card. |
| `title?` | `MiliUI.TextControl` | Text control used to show this component's heading. |
| `subtitle?` | `MiliUI.TextControl` | Subtitle used by this playing card. |
| `backGlow?` | `MiliUI.ImageControl` | Back glow used by this playing card. |
| `backIcon?` | `MiliUI.ImageControl` | Back icon used by this playing card. |
| `backTitle?` | `MiliUI.TextControl` | Back title used by this playing card. |
| `backSubtitle?` | `MiliUI.TextControl` | Back subtitle used by this playing card. |
| `hitbox?` | `MiliUI.Hitbox` | Invisible input area that receives clicks and drag events. |
| `hover?` | `MiliUI.Hover` | Object that manages hover and press visual feedback. |
| `enabled` | `boolean` | Whether this control currently accepts player interaction. |
| `face` | `"front"\|"back"` | Which side is currently shown: `'front'` or `'back'`. |

## Type aliases and enum values

### `MiliUI.PlayingCardSlotRenderer`

```lua
---@alias MiliUI.PlayingCardSlotRenderer fun(parent:MiliUI.ContainerControl, card:MiliUI.PlayingCard)
```

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `PlayingCard:SetSelected(selected)`

Mark this card as selected or unselected. Pass `true` to select it or `false` to clear the selection.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `selected` | `boolean` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param selected boolean
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetFace(face)`

Choose which side of the card is visible. Pass `'front'` for its artwork and details, or `'back'` for the reverse side.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `face` | `"front"\|"back"` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param face "front"|"back"
---@return MiliUI.PlayingCard
```


### `PlayingCard:ShowFront()`

Show the **front side** of this card, including its main picture, title, and front decorations.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.PlayingCard
```


### `PlayingCard:ShowBack()`

Show the **back side** of this card, including any card-back text or images.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.PlayingCard
```


### `PlayingCard:Flip(face, options)`

Flips on X and changes face at the midpoint.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `face` | `"front"\|"back"` | — |
| Parameter `options?` | `table` | Motion.FlipX options. |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param face "front"|"back"
---@param options? table Motion.FlipX options.
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetTitle(spec)`

Change the main heading shown on this PlayingCard.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetSubtitle(spec)`

Change the smaller text shown below the card's main heading.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetValue(spec)`

Change the current value of this control. Some setters also let you choose whether a change callback should run.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetHeaderLabel(spec)`

Change the header label of this PlayingCard.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetHeaderIcon(icon)`

Change the header icon of this PlayingCard.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `icon` | `integer` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param icon integer
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetArtwork(image)`

Replace the main picture displayed on the front of this card.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `image` | `integer` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param image integer
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetFrameColor(color)`

Change the frame color of this PlayingCard.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `color` | `MiliUI.ColorValue` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param color MiliUI.ColorValue
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetBackFrameColor(color)`

Change the back frame color of this PlayingCard.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `color` | `MiliUI.ColorValue` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param color MiliUI.ColorValue
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetEnabled(enabled)`

Allow or block player interaction. Pass `true` to enable this component or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.PlayingCard
```


### `PlayingCard:OnClick(callback)`

Register a function that runs when the player clicks or activates this control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `MiliUI.CursorCallback` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param callback MiliUI.CursorCallback
---@return MiliUI.PlayingCard
```


### `PlayingCard:SetVisible(visible)`

Show or hide this card. Pass `true` to show it or `false` to hide it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `visible` | `boolean` | — |
| Returns | `MiliUI.PlayingCard` | — |

**Original LuaLS annotations:**

```lua
---@param visible boolean
---@return MiliUI.PlayingCard
```


### `PlayingCard:Destroy()`

Remove this component from the screen and release its UI controls.
