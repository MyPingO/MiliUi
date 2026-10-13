# API reference: Theme

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `theme.lua`  
**Coverage:** 14 classes, 176 fields, 0 aliases, 2 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Theming](../Theming.md)

## Classes, component props and return types

### `MiliUI.ThemeColors`

| Field | Declared type | Description |
| --- | --- | --- |
| `page` | `MiliUI.Color` | Background behind an entire page or screen. |
| `surface` | `MiliUI.Color` | Default background color used by panels and cards. Example: `background = 'surface'` on a Panel. |
| `surface2` | `MiliUI.Color` | A second panel/background shade for contrast. |
| `surfaceHover` | `MiliUI.Color` | Panel or button background while the pointer is over it. |
| `surfacePressed` | `MiliUI.Color` | Background while a surface or button is pressed. |
| `surfaceDisabled` | `MiliUI.Color` | Background for an unavailable or disabled control. |
| `border` | `MiliUI.Color` | Standard border/outline color around a control. Example: `color = 'border'` uses this named theme color. |
| `borderStrong` | `MiliUI.Color` | More visible border color for emphasis. |
| `text` | `MiliUI.Color` | Standard text color. Example: `color = 'text'` uses this named theme color. |
| `muted` | `MiliUI.Color` | Less prominent text or icon color for hints and secondary information. |
| `disabled` | `MiliUI.Color` | Color for unavailable controls. Example: `color = 'disabled'` uses this named theme color. |
| `accent` | `MiliUI.Color` | Highlight color for primary actions or selected items. |
| `accentHover` | `MiliUI.Color` | Accent color while the pointer is over the control. |
| `accentPressed` | `MiliUI.Color` | Accent color while the control is being pressed. |
| `gold` | `MiliUI.Color` | Gold highlight color for special or premium elements. |
| `success` | `MiliUI.Color` | Color that signals a successful action or positive state. |
| `successHover` | `MiliUI.Color` | Success color while hovered. |
| `successPressed` | `MiliUI.Color` | Success color while pressed. |
| `warning` | `MiliUI.Color` | Color that warns players to be careful. |
| `info` | `MiliUI.Color` | Color used for general informational messages. Example: `color = 'info'` uses this named theme color. |
| `danger` | `MiliUI.Color` | Color for errors, destructive actions or danger. |
| `dangerHover` | `MiliUI.Color` | Danger color while hovered. |
| `dangerPressed` | `MiliUI.Color` | Danger color while pressed. |
| `overlay` | `MiliUI.Color` | Dimmed background color behind dialogs/popups. |
| `transparent` | `MiliUI.Color` | Invisible color, useful when only layout/interaction should remain. |
| `white` | `MiliUI.Color` | Pure white color. Example: `color = 'white'` uses this named theme color. |
| `black` | `MiliUI.Color` | Pure black color. Example: `color = 'black'` uses this named theme color. |
| `[string]` | `MiliUI.Color` | Custom semantic color tokens may be added with Theme.Apply. |

### `MiliUI.ThemeTextSize`

| Field | Declared type | Description |
| --- | --- | --- |
| `xs` | `number` | Font size 13. Use the 'xs' text size for very small labels. Example: `size = 'xs'` on a Text element. |
| `sm` | `number` | Font size 16. Use the 'sm' text size for small labels. Example: `size = 'sm'` on a Text element. |
| `md` | `number` | Font size 20. Use the 'md' text size for normal text. Example: `size = 'md'` on a Text element. |
| `lg` | `number` | Font size 26. Use the 'lg' text size for larger labels. Example: `size = 'lg'` on a Text element. |
| `xl` | `number` | Font size 34. Use the 'xl' text size for headings. Example: `size = 'xl'` on a Text element. |
| `xxl` | `number` | Font size 44. Use the 'xxl' text size for large headings. Example: `size = 'xxl'` on a Text element. |
| `title` | `number` | Font size 56. Use the 'title' text size for page titles. Example: `size = 'title'` on a Text element. |
| `display` | `number` | Font size 68. Use the 'display' text size for very large display text. Example: `size = 'display'` on a Text element. |
| `[string]` | `number` | Custom text-size tokens may be added with Theme.Apply. |

### `MiliUI.ThemeSpacing`

| Field | Declared type | Description |
| --- | --- | --- |
| `xs` | `number` | Spacing amount 4 UI units, suitable for very small spaces. Use it to keep gaps and padding consistent across your UI. |
| `sm` | `number` | Spacing amount 8 UI units, suitable for small gaps. Use it to keep gaps and padding consistent across your UI. |
| `md` | `number` | Spacing amount 12 UI units, suitable for medium gaps. Use it to keep gaps and padding consistent across your UI. |
| `lg` | `number` | Spacing amount 16 UI units, suitable for larger gaps. Use it to keep gaps and padding consistent across your UI. |
| `xl` | `number` | Spacing amount 24 UI units, suitable for large spaces. Use it to keep gaps and padding consistent across your UI. |
| `xxl` | `number` | Spacing amount 32 UI units, suitable for extra-large spaces. Use it to keep gaps and padding consistent across your UI. |
| `xxxl` | `number` | Spacing amount 48 UI units, suitable for very large spaces. Use it to keep gaps and padding consistent across your UI. |
| `[string]` | `number` | Custom spacing tokens may be added with Theme.Apply. |

### `MiliUI.ThemeMotion`

| Field | Declared type | Description |
| --- | --- | --- |
| `instant` | `number` | Duration of 0.06 seconds for the 'instant' animation speed. Smaller values make an animation finish sooner. |
| `fast` | `number` | Duration of 0.10 seconds for the 'fast' animation speed. Smaller values make an animation finish sooner. |
| `normal` | `number` | Duration of 0.16 seconds for the 'normal' animation speed. Smaller values make an animation finish sooner. |
| `slow` | `number` | Duration of 0.24 seconds for the 'slow' animation speed. Smaller values make an animation finish sooner. |
| `slower` | `number` | Duration of 0.34 seconds for the 'slower' animation speed. Smaller values make an animation finish sooner. |
| `[string]` | `number` | Custom motion-duration tokens may be added with Theme.Apply. |

### `MiliUI.ThemeSounds`

| Field | Declared type | Description |
| --- | --- | --- |
| `buttonClick?` | `integer` | Default managed click-audio resource ID for MiliUI Buttons when clickAudioId is omitted. |
| `sliderCommit?` | `integer` | Optional 2D audio resource played when a Slider commits a changed value. |
| `[string]` | `integer` | Custom semantic UI sound IDs may be added with Theme.Apply. |

### `MiliUI.ThemeAssets`

| Field | Declared type | Description |
| --- | --- | --- |
| `square` | `integer` | Image asset ID 100001, used for a square UI background. This is a Miliastra image resource ID, not a size or a color. |
| `circle` | `integer` | Image asset ID 100002, used for a circular UI background. This is a Miliastra image resource ID, not a size or a color. |
| `close` | `integer` | Image asset ID 100101: Default close/cancel X icon. |
| `checkboxCheck` | `integer` | Image asset ID 100102: Default Checkbox checkmark icon. |
| `chevronRight` | `integer` | Image asset ID 100103: Right-pointing chevron used by the default left-side controller focus indicator. |
| `chevronLeft` | `integer` | Image asset ID 100104: Left-pointing chevron used by the default right-side controller focus indicator. |
| `chevronDown` | `integer` | Image asset ID 100105: Down-pointing chevron used by the default top-side controller focus indicator. |
| `chevronUp` | `integer` | Image asset ID 100106: Up-pointing chevron used by the default bottom-side controller focus indicator. |
| `plus` | `integer` | Image asset ID 100107: Default add/increase icon. |
| `minus` | `integer` | Image asset ID 100108: Default remove/decrease icon. |
| `selectIndicator` | `integer` | Image asset ID 100111: Default Dropdown triangle indicator. |
| `sparkle` | `integer` | Image asset ID 105003, used for a sparkle decoration. This is a Miliastra image resource ID, not a size or a color. |
| `smallSparkle` | `integer` | Image asset ID 105140, used for a small sparkle decoration. This is a Miliastra image resource ID, not a size or a color. |
| `divider` | `integer` | Image asset ID 108002, used for a divider graphic. This is a Miliastra image resource ID, not a size or a color. |
| `vs` | `integer` | Image asset ID 109030, used for a 'VS' graphic. This is a Miliastra image resource ID, not a size or a color. |
| `[string]` | `integer` | Custom named asset IDs may be added with Theme.Apply. |

### `MiliUI.ThemeControllerFocusIndicatorAnimation`

| Field | Declared type | Description |
| --- | --- | --- |
| `enabled?` | `boolean` | Whether the controller focus indicator gently moves back and forth by default. Set `false` to keep it still. Default: `true`. |
| `distance?` | `number` | How far the controller focus indicator moves during its animation, in UI units. Default: `5`. |
| `duration?` | `number` | Full out-and-back cycle duration. Built-in default 0.46. |

### `MiliUI.ThemeControllerFocusIndicator`

| Field | Declared type | Description |
| --- | --- | --- |
| `enabled?` | `boolean` | Choose whether controller focus indicators are enabled by default on Buttons. Default: `true`. |
| `placement?` | `MiliUI.AnchorPlacement` | Choose the default side of a selected Button for its controller focus indicator. Example: `placement = 'inside-right'`. Default: `'left'`. |
| `align?` | `MiliUI.AnchorAlign` | Choose the default alignment of the focus indicator along the Button's edge. Default: `'center'`. |
| `gap?` | `number` | Space between the focus indicator and the selected Button's edge, in UI units. Default: `8`. |
| `margin?` | `number` | Minimum overlay-root edge margin. |
| `flip?` | `boolean` | Allow explicit placement to flip when it does not fit. Default true. |
| `size?` | `number` | Width **and** height of the focus indicator image, in UI units. Default: `22`. |
| `width?` | `number` | Set only the focus indicator's width, overriding `size` if supplied. Example: `width = 18`. |
| `height?` | `number` | Set only the focus indicator's height, overriding `size` if supplied. Example: `height = 24`. |
| `image?` | `integer` | Optional image asset ID that replaces the normal focus indicator image for **every** placement. |
| `leftImage?` | `integer` | Optional image asset ID for the focus indicator when shown on the left side of a Button. |
| `rightImage?` | `integer` | Optional image asset ID for the focus indicator when shown on the right side of a Button. |
| `topImage?` | `integer` | Optional image asset ID for the focus indicator shown above a Button. |
| `bottomImage?` | `integer` | Optional image asset ID for the focus indicator shown below a Button. |
| `color?` | `MiliUI.ColorValue` | Default color of the controller focus indicator image. Example: `color = 'white'`. Default: `'white'`. |
| `stretch?` | `boolean` | Stretch the controller focus indicator image to match its requested width and height. Default: `false`. |
| `offsetX?` | `number` | Move the focus indicator left or right relative to its normal position. Positive numbers move right. |
| `offsetY?` | `number` | Move the focus indicator up or down relative to its normal position. Positive numbers move up. |
| `animation?` | `MiliUI.ThemeControllerFocusIndicatorAnimation` | Default settings for the gentle back-and-forth movement of the controller focus indicator. |

### `MiliUI.ThemeScrollbar`

| Field | Declared type | Description |
| --- | --- | --- |
| `width?` | `number` | Total scrollbar lane width. Built-in default 24. |
| `gap?` | `number` | Gap between list content and scrollbar lane. Built-in default 8. |
| `trackWidth?` | `number` | Visible track width. Built-in default 5. |
| `trackColor?` | `MiliUI.ColorValue` | Built-in default surface2. |
| `trackImage?` | `integer` | Track asset. Built-in default 100001 for a rectangular rail. |
| `trackStretch?` | `boolean` | Stretch the scrollbar's background track image to fit its size. Default: `true`. |
| `thumbWidth?` | `number` | Visible thumb width. Built-in default 11. |
| `thumbMinimumHeight?` | `number` | Minimum thumb height. Built-in default 28. |
| `thumbColor?` | `MiliUI.ColorValue` | Default color of the scrollbar's draggable handle. Default: `'accent'`. |
| `thumbHoverColor?` | `MiliUI.ColorValue` | Built-in default accentHover. |
| `thumbImage?` | `integer` | Thumb asset. Built-in default 106007 for light rounded-rectangle corners. |
| `thumbStretch?` | `boolean` | Stretch the draggable scrollbar handle image to fit its size. Default: `true`. |
| `buttonSize?` | `number` | Up/down button size. Built-in default 24. |
| `buttonGap?` | `number` | Gap between arrow buttons and track. Built-in default 4. |
| `indicatorImage?` | `integer` | Arrow asset. Built-in default 100111. |
| `indicatorSize?` | `number` | Arrow icon size. Built-in default 10. |
| `iconColor?` | `MiliUI.ColorValue` | Default color of the scrollbar's arrow icons when they can be pressed. Default: `'muted'`. |
| `iconDisabledColor?` | `MiliUI.ColorValue` | Built-in default disabled. |

### `MiliUI.ButtonVariantStyle`

| Field | Declared type | Description |
| --- | --- | --- |
| `background?` | `MiliUI.ColorValue` | Background used by this button variant. |
| `hover?` | `MiliUI.ColorValue` | Hover used by this button variant. |
| `pressed?` | `MiliUI.ColorValue` | Pressed used by this button variant. |
| `text?` | `MiliUI.ColorValue` | Text used by this button variant. |
| `radius?` | `MiliUI.Radius` | Radius used by this button variant. |
| `border?` | `boolean` | Turn the border behavior of this button variant on or off. |
| `borderColor?` | `MiliUI.ColorValue` | Color used for the border part of this button variant. Example: `'accent'` or `'white'`. |
| `hoverScale?` | `number` | Size multiplier for hover; 1 is normal and 1.05 is 5% larger. |
| `pressScale?` | `number` | Size multiplier for press; 1 is normal and 1.05 is 5% larger. |
| `backgroundImage?` | `integer` | Normal-state background asset. |
| `hoverImage?` | `integer` | Hover-state background asset. Falls back to backgroundImage. |
| `pressedImage?` | `integer` | Pressed-state background asset. Falls back to hoverImage/backgroundImage. |
| `disabledImage?` | `integer` | Disabled-state background asset. Falls back to backgroundImage. |
| `borderImage?` | `integer` | Optional border asset; implies border=true unless explicitly disabled. |
| `backgroundStretch?` | `boolean` | Stretch each Button's background image to fit the Button's size. Default: `true`. |
| `borderStretch?` | `boolean` | Stretch the image used for the Button's border to fit the Button's size. Default: `true`. |
| `clipToRadius?` | `boolean` | Clip custom button image states through the button radius using native ImageControl masking. |

### `MiliUI.ThemeButtonVariants`

| Field | Declared type | Description |
| --- | --- | --- |
| `primary` | `MiliUI.ButtonVariantStyle` | Primary button style for the most important action. |
| `secondary` | `MiliUI.ButtonVariantStyle` | Secondary button style for ordinary actions. |
| `ghost` | `MiliUI.ButtonVariantStyle` | Minimal button style without a strong background. |
| `success` | `MiliUI.ButtonVariantStyle` | Color that signals a successful action or positive state. |
| `danger` | `MiliUI.ButtonVariantStyle` | Color for errors, destructive actions or danger. |
| `[string]` | `MiliUI.ButtonVariantStyle` | Custom variants may be added with Theme.Apply. |

### `MiliUI.ThemeComponents`

| Field | Declared type | Description |
| --- | --- | --- |
| `surface?` | `MiliUI.SurfaceProps` | Default settings applied when you create UI.SurfaceControl. You can override these settings on individual components. |
| `panel?` | `MiliUI.SurfaceProps` | Default settings applied when you create UI.Panel. You can override these settings on individual components. |
| `screen?` | `MiliUI.ScreenProps` | Default settings applied when you create UI.Screen. You can override these settings on individual components. |
| `button?` | `MiliUI.ButtonProps` | Default settings applied when you create UI.Button and UI.IconButton. You can override these settings on individual components. |
| `card?` | `MiliUI.CardProps` | Default settings applied when you create UI.Card. You can override these settings on individual components. |
| `badge?` | `MiliUI.BadgeProps` | Default settings applied when you create UI.Badge / UI.Chip. You can override these settings on individual components. |
| `stat?` | `MiliUI.StatProps` | Default settings applied when you create UI.Stat. You can override these settings on individual components. |
| `progressBar?` | `MiliUI.ProgressBarProps` | Default settings applied when you create UI.ProgressBar. You can override these settings on individual components. |
| `slider?` | `MiliUI.SliderProps` | Default settings applied when you create UI.Slider. You can override these settings on individual components. |
| `toggle?` | `MiliUI.ToggleProps` | Default settings applied when you create UI.Toggle. You can override these settings on individual components. |
| `checkbox?` | `MiliUI.CheckboxProps` | Default settings applied when you create UI.Checkbox. You can override these settings on individual components. |
| `stepper?` | `MiliUI.StepperProps` | Default settings applied when you create UI.Stepper. You can override these settings on individual components. |
| `scrollArea?` | `MiliUI.ScrollAreaProps` | Default settings applied when you create UI.ScrollArea. You can override these settings on individual components. |
| `dropdown?` | `MiliUI.DropdownProps` | Default settings applied when you create UI.Dropdown; these override shared Theme.scrollbar values for Dropdown when both are supplied. You can override these settings on individual components. |
| `selection?` | `MiliUI.SelectionProps` | Default settings applied when you create UI.Selection, including grouped itemStyle values. You can override these settings on individual components. |
| `tabs?` | `MiliUI.TabsProps` | Default settings applied when you create UI.Tabs. You can override these settings on individual components. |
| `alert?` | `MiliUI.AlertProps` | Default settings applied when you create UI.Alert and Alert-backed toasts created after the theme is applied. You can override these settings on individual components. |
| `modal?` | `MiliUI.ModalProps` | Default settings applied when you create UI.Modal. You can override these settings on individual components. |
| `popover?` | `MiliUI.PopoverProps` | Default settings applied when you create UI.Popover. You can override these settings on individual components. |
| `tooltip?` | `MiliUI.TooltipProps` | Default settings applied when you create UI.Tooltip. You can override these settings on individual components. |
| `repeater?` | `MiliUI.RepeaterProps` | Default settings applied when you create UI.Repeater. You can override these settings on individual components. |
| `listView?` | `MiliUI.ListViewProps` | Default settings applied when you create UI.ListView. You can override these settings on individual components. |
| `playingCard?` | `MiliUI.PlayingCardProps` | Default settings applied when you create UI.PlayingCard. You can override these settings on individual components. |

### `MiliUI.ThemePatch`

| Field | Declared type | Description |
| --- | --- | --- |
| `colors?` | `table<string, MiliUI.Color>` | Semantic/custom color tokens to deep-merge. |
| `textSize?` | `table<string, number>` | Text-size tokens to deep-merge. |
| `spacing?` | `table<string, number>` | Spacing tokens to deep-merge. |
| `motion?` | `table<string, number>` | Motion-duration tokens to deep-merge. |
| `sounds?` | `table<string, integer>` | Semantic UI sound IDs to deep-merge. |
| `assets?` | `table<string, integer>` | Named asset IDs to deep-merge. |
| `controllerFocusIndicator?` | `MiliUI.ThemeControllerFocusIndicator` | Shared controller-focus selector defaults. |
| `scrollbar?` | `MiliUI.ThemeScrollbar` | Shared compact-scrollbar defaults used by components that adopt the shared scrollbar contract. |
| `buttonVariants?` | `table<string, MiliUI.ButtonVariantStyle>` | Button variant defaults to deep-merge. |
| `components?` | `MiliUI.ThemeComponents` | Component constructor defaults to deep-merge. |

### `MiliUI.Theme`

| Field | Declared type | Description |
| --- | --- | --- |
| `colors` | `MiliUI.ThemeColors` | Colors used by this theme. |
| `textSize` | `MiliUI.ThemeTextSize` | Size of the text part, in UI units. |
| `spacing` | `MiliUI.ThemeSpacing` | Spacing used by this theme. |
| `motion` | `MiliUI.ThemeMotion` | Motion used by this theme. |
| `sounds` | `MiliUI.ThemeSounds` | Sounds used by this theme. |
| `assets` | `MiliUI.ThemeAssets` | Assets used by this theme. |
| `controllerFocusIndicator` | `MiliUI.ThemeControllerFocusIndicator` | Shared controller-focus selector defaults. |
| `scrollbar` | `MiliUI.ThemeScrollbar` | Shared compact-scrollbar defaults used by UI.Scrollbar and scrollable composed controls. |
| `buttonVariants` | `MiliUI.ThemeButtonVariants` | Button variants used by this theme. |
| `components` | `MiliUI.ThemeComponents` | Creation-time component defaults. Explicit constructor props remain authoritative. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Theme.Apply(theme)`

Deep-merges a creation-time theme into the active MiliUI theme.
Existing controls are not repainted automatically.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `theme` | `MiliUI.ThemePatch` | — |
| Returns | `MiliUI.Theme` | — |

**Original LuaLS annotations:**

```lua
---@param theme MiliUI.ThemePatch
---@return MiliUI.Theme
```


### `Theme.Reset()`

Restores all built-in theme sections while preserving their table identities.
Existing controls keep the appearance they were created with.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Theme` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Theme
```
