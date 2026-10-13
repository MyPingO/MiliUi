# API reference: Components Base

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_base.lua`  
**Coverage:** 19 classes, 231 fields, 0 aliases, 27 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Components](../Components.md) · [IntrinsicSizing](../IntrinsicSizing.md)

## Classes, component props and return types

### `MiliUI.Panel`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Outer container of this Panel. MiliUI uses it to position the Panel on screen. |
| `content` | `MiliUI.ContainerControl` | Container **inside** the Panel where you should add its child elements. Example: `UI.Button(panel.content, { label = { text = 'OK' } })`. |
| `background` | `MiliUI.ImageControl` | Image control drawing the Panel's background color or background image. |
| `border?` | `MiliUI.ImageControl` | Image control drawing the outline around the Panel, when an outline is enabled. |

### `MiliUI.InteractiveVisualState`

| Field | Declared type | Description |
| --- | --- | --- |
| `background?` | `MiliUI.ColorValue` | Background tint for this state. |
| `backgroundColor?` | `MiliUI.ColorValue` | Another name for this visual state's background color. Use `background` for new code. Example: `backgroundColor = 'surfaceHover'`. |
| `backgroundImage?` | `integer` | Optional image asset ID for the Button background in this interaction state. |
| `textColor?` | `MiliUI.ColorValue` | Label color for this state. |
| `borderColor?` | `MiliUI.ColorValue` | Existing button-border tint for this state. |

### `MiliUI.ButtonStates`

| Field | Declared type | Description |
| --- | --- | --- |
| `hover?` | `MiliUI.InteractiveVisualState` | Appearance when a mouse cursor is resting on this Button. |
| `pressed?` | `MiliUI.InteractiveVisualState` | Appearance while the player is actively pressing this Button. |
| `selected?` | `MiliUI.InteractiveVisualState` | Appearance when the Button is marked selected (for example, the chosen tab), even when not hovered. |
| `selectedHover?` | `MiliUI.InteractiveVisualState` | Appearance used when a Button is **both selected and under the mouse pointer**. |
| `selectedPressed?` | `MiliUI.InteractiveVisualState` | Appearance used when a Button is **selected and being pressed**. |
| `disabled?` | `MiliUI.InteractiveVisualState` | Appearance when the Button cannot be clicked or activated. |

### `MiliUI.StateTargetVisual`

| Field | Declared type | Description |
| --- | --- | --- |
| `color?` | `MiliUI.ColorValue` | Generic color for image/font/background targets. |
| `imageColor?` | `MiliUI.ColorValue` | Color applied to the related image while this visual state is active. |
| `fontColor?` | `MiliUI.ColorValue` | Color applied to the related text while this visual state is active. |
| `backgroundColor?` | `MiliUI.ColorValue` | Native text/background tint override. |

### `MiliUI.StateTargetStates`

| Field | Declared type | Description |
| --- | --- | --- |
| `hover?` | `MiliUI.StateTargetVisual` | Color/image changes applied to this related visual when its Button is hovered. |
| `pressed?` | `MiliUI.StateTargetVisual` | Changes applied to this related visual while its Button is pressed. |
| `selected?` | `MiliUI.StateTargetVisual` | Changes applied while its Button has `selected = true`. |
| `selectedHover?` | `MiliUI.StateTargetVisual` | Changes applied when the Button is both selected and hovered. |
| `selectedPressed?` | `MiliUI.StateTargetVisual` | Changes applied when the Button is both selected and pressed. |
| `disabled?` | `MiliUI.StateTargetVisual` | Changes applied when its Button is disabled. |

### `MiliUI.ControllerFocusIndicatorAnimationProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `enabled?` | `boolean` | Show or hide the controller focus indicator. Set `false` to hide it. Default: `true`. |
| `distance?` | `number` | How far the indicator moves toward the focused control and back during its animation, in UI units. Example: `distance = 5`. Default: `5`. |
| `duration?` | `number` | Time, in seconds, for one complete back-and-forth indicator movement. Default: `0.46`. |

### `MiliUI.ControllerFocusIndicatorProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `enabled?` | `boolean` | Show or hide this controller focus indicator. Set `enabled = false` to hide it. Default: `true`. |
| `placement?` | `MiliUI.AnchorPlacement\|'inside-left'\|'inside-right'` | Choose where the **controller focus indicator** appears when a control has focus. `'right'` places it outside the control's right edge, while `'inside-right'` keeps it inside that edge. Also supports left, top, bottom, and `'auto'`. Example: `placement = 'inside-right'`. |
| `align?` | `MiliUI.AnchorAlign` | Choose where the indicator lines up along the chosen control edge. For left/right placement this is the up/down position; for top/bottom placement it is the left/right position. Default: `'center'`. |
| `gap?` | `number` | Space between the **focus indicator** and the nearest Button edge, in UI units. With `placement = 'right'`, `gap = 8` moves the indicator 8 units outside the right edge. With `'inside-right'`, it moves the indicator 8 units inward. |
| `margin?` | `number` | Extra space MiliUI tries to leave between the indicator and the edge of the available area when `placement = 'auto'`. Has no effect if you choose a specific placement. |
| `size?` | `number` | Width **and** height of the controller focus indicator, in UI units. `size = 20` makes it 20 units wide and 20 tall. Default: `22`. Set `width` or `height` separately if needed. |
| `width?` | `number` | Set only the controller focus indicator's width. Example: `width = 18`. Without it, MiliUI uses `size` (default: 22). |
| `height?` | `number` | Set only the controller focus indicator's height. Example: `height = 24`. Without it, MiliUI uses `size` (default: 22). |
| `image?` | `integer` | Image asset ID to use for the focus indicator in every position. Example: `image = 100103` uses the right-chevron image asset. |
| `leftImage?` | `integer` | Image asset ID to show when the focus indicator is on the Button's left side. |
| `rightImage?` | `integer` | Image asset ID to show when the focus indicator is on the Button's right side. |
| `topImage?` | `integer` | Image asset ID to show when the focus indicator is above the Button. |
| `bottomImage?` | `integer` | Image asset ID to show when the focus indicator is below the Button. |
| `color?` | `MiliUI.ColorValue` | Color of the controller focus indicator. Example: `color = 'accent'` uses your theme's accent color. Default: white. |
| `stretch?` | `boolean` | Set `true` to stretch the indicator image to fit its requested width and height. Default: `false`. |
| `offsetX?` | `number` | Move the focus indicator left or right after choosing its placement. Positive numbers move right; negative numbers move left. Default: `0`. |
| `offsetY?` | `number` | Move the focus indicator up or down after choosing its placement. Positive numbers move up; negative numbers move down. Default: `0`. |
| `animation?` | `boolean\|MiliUI.ControllerFocusIndicatorAnimationProps` | Choose whether the **controller focus indicator** moves back and forth when its Button is selected. Set `animation = false` to keep it still. To customize movement, use `animation = { distance = 5, duration = 0.46 }`, where `distance` is how far it moves and `duration` is one complete cycle in seconds. |
| `name?` | `string` | Optional name for finding this indicator in the native UI tree while debugging. You can normally leave this out. |

### `MiliUI.ButtonProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `label?` | `MiliUI.TextSpec\|false` | Set the text displayed **inside** this Button. Example: `label = { text = 'Start Game' }` shows **Start Game**. Use `label = false` if you plan to create your own Button contents instead. |
| `variant?` | `MiliUI.ButtonVariant` | Choose a ready-made Button appearance: `'primary'` for an important action, `'secondary'` for ordinary actions, `'danger'` for destructive actions. |
| `background?` | `MiliUI.ColorValue` | Color or appearance of the component's main background. |
| `backgroundColor?` | `MiliUI.ColorValue` | Another name for `background`, the Button's normal background color. Example: `backgroundColor = 'surface'`. |
| `hoverColor?` | `MiliUI.ColorValue` | Color used for the hover appearance of this button. Example: `'accent'` or `'white'`. |
| `pressedColor?` | `MiliUI.ColorValue` | Color used for the pressed appearance of this button. Example: `'accent'` or `'white'`. |
| `disabledColor?` | `MiliUI.ColorValue` | Color used for the disabled appearance of this button. Example: `'accent'` or `'white'`. |
| `backgroundImage?` | `integer` | Normal-state background asset. Falls back to the rounded surface for radius. |
| `hoverImage?` | `integer` | Hover-state background asset. Falls back to backgroundImage. |
| `pressedImage?` | `integer` | Pressed-state background asset. Falls back to hoverImage/backgroundImage. |
| `disabledImage?` | `integer` | Disabled-state background asset. Falls back to backgroundImage. |
| `backgroundStretch?` | `boolean` | Stretch the Button's background image to fit its width and height. Default: `true`. |
| `textColor?` | `MiliUI.ColorValue` | Default label color; label.color/textColor overrides it. |
| `disabledTextColor?` | `MiliUI.ColorValue` | Color used for the disabled text appearance of this button. Example: `'accent'` or `'white'`. |
| `textSize?` | `MiliUI.TextSize` | Font size used by the built-in Button label. You can override it with `label = { size = 24 }`. |
| `radius?` | `MiliUI.Radius` | Choose how rounded the Button's corners are. Example: `radius = 'lg'` for rounded corners or `'none'` for square corners. |
| `border?` | `boolean` | Show a visible outline around the Button. Example: `border = true`. |
| `borderColor?` | `MiliUI.ColorValue` | Color used for the border appearance of this button. Example: `'accent'` or `'white'`. |
| `borderImage?` | `integer` | Optional custom border asset; implies border=true unless explicitly false. |
| `borderStretch?` | `boolean` | Stretch the Button's border image to match its width and height. Default: `true`. |
| `interactable?` | `boolean` | Can the player press this Button? `false` disables clicks and controller activation. Default true. |
| `raycastTarget?` | `boolean` | Let mouse and touch input detect this Button. Set `false` if you want the pointer to ignore it. Default: `true`. |
| `controllerFocus?` | `boolean` | Allow the controller's D-pad or left stick to select this Button. When selected, the controller Confirm button activates it. Use `controllerFocus = false` to skip it. Default: `true`. |
| `parentScroll?` | `boolean` | When inside a ScrollArea, allow dragging on this Button to scroll the list. Set `false` when this Button needs to handle its own drag. Default true. |
| `controllerFocusIndicator?` | `boolean\|MiliUI.ControllerFocusIndicatorProps` | Show a **controller focus indicator** to identify the Button selected using a controller. Set `false` to hide it. Example: `controllerFocusIndicator = { placement = 'inside-right', size = 20, animation = false }`. See `UI.Button` for a complete example. |
| `clickAudioId?` | `integer\|false` | Sound asset ID played when pressed. Set `false` for a silent Button; otherwise MiliUI uses the configured theme/template click sound. |
| `animate?` | `boolean` | Enable the built-in tiny size changes on hover and press. Set `false` for a completely static Button. Default true. |
| `hoverScale?` | `number` | How large the Button becomes while hovered. Example: `hoverScale = 1.05` means 5% larger than normal. |
| `pressScale?` | `number` | How large the Button becomes while pressed. Example: `pressScale = 0.95` means 5% smaller. |
| `adaptiveFontSize?` | `boolean` | Default true for label; label.adaptiveFontSize overrides it. |
| `minimumFontSize?` | `number` | Smallest font size the Button's built-in label can shrink to when automatic text resizing is enabled. Default: `10`. |
| `onClick?` | `MiliUI.CursorCallback` | Run your own code each time the player activates this Button with a mouse, touch, or controller. Example: `onClick = function() print('Play was pressed') end` prints that message when the Button is activated. |
| `onEnter?` | `MiliUI.CursorCallback` | Run a function when the mouse pointer first moves over this Button. Example: `onEnter = function() print('Hover started') end`. |
| `onExit?` | `MiliUI.CursorCallback` | Run a function when the mouse pointer leaves this Button. Example: `onExit = function() print('Hover ended') end`. |
| `onDown?` | `MiliUI.CursorCallback` | Run a function when the mouse/touch press begins on the Button. Use `onClick` instead for the normal action after a completed press. |
| `onUp?` | `MiliUI.CursorCallback` | Run a function when the player releases a mouse/touch press on the Button. Use `onClick` for normal completed activations. |
| `selected?` | `boolean` | Start with the Button marked as selected. Useful for persistent toggle-like choices. Default false. |
| `states?` | `MiliUI.ButtonStates` | Customize colors/images for different situations such as hover, pressed, selected and disabled. Example: `states = { hover = { background = 'accent' } }`. |
| `fitContent?` | `boolean` | Automatically size the Button to fit its icon, translated label and inside padding when width/height were not explicitly set. Example: `fitContent = true` for buttons with varying text lengths. |
| `fitWidth?` | `boolean` | Automatically calculate Button width from its icon and text, unless a fixed width or fillWidth is supplied. |
| `fitHeight?` | `boolean` | Automatically calculate Button height from its text and padding, unless a fixed height or fillHeight is supplied. |
| `icon?` | `integer` | Image asset ID displayed before the Button's label. Example: `icon = 100103` displays a right-chevron image. |
| `iconSize?` | `number` | Width and height of the image shown before the Button's label, in UI units. Default: `22`. |
| `iconColor?` | `MiliUI.ColorValue` | Color applied over the image before the Button's label. Example: `iconColor = 'accent'`. |
| `gap?` | `number` | Empty space between the Button's image and its label, in UI units. Default: `8`. |
| `padding?` | `number` | Inside space around the Button's icon/text. Example: `padding = 12` makes the clickable area bigger without changing the text. |
| `paddingX?` | `number` | Empty space **inside** the Button on the left and right of its contents. Default: `16` UI units. |
| `paddingY?` | `number` | Empty space **inside** the Button above and below its contents. Default: `10` UI units. |
| `paddingLeft?` | `number` | Empty space **inside** the Button on the left of its contents. |
| `paddingRight?` | `number` | Empty space **inside** the Button on the right of its contents. |
| `paddingTop?` | `number` | Empty space **inside** the Button above its contents. |
| `paddingBottom?` | `number` | Empty space **inside** the Button below its contents. |

### `MiliUI.Button`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ButtonControl` | The underlying native Button control created by MiliUI. Most game code can use the Button wrapper instead. |
| `content` | `MiliUI.ButtonControl` | Preferred parent for custom button content. |
| `background` | `MiliUI.ImageControl` | Image control that draws the Button's background, not the color value. To set the color, use ButtonProps.background. |
| `border?` | `MiliUI.ImageControl` | Whether to draw an outline around the control. |
| `label` | `MiliUI.TextControl` | Text control used to show this component's label. |
| `icon?` | `MiliUI.ImageControl` | The image control shown in an IconButton, if one exists. |
| `enabled` | `boolean` | Whether this control currently accepts player interaction. |
| `selected` | `boolean` | Persistent selected state. |
| `states` | `MiliUI.ButtonStates` | Declarative visual-state table supplied at creation. |
| `hasLabel` | `boolean` | Whether the built-in label is currently visible. |
| `controllerFocusIndicator?` | `MiliUI.ImageControl` | Controller-only selector image rendered above masked/scrolling content when the feature is enabled. |
| `controllerFocusIndicatorPlacement?` | `'left'\|'right'\|'top'\|'bottom'` | Resolved current placement after flip/auto selection. |
| `controllerFocusIndicatorAlign?` | `MiliUI.AnchorAlign` | Resolved vertical/horizontal alignment of the controller arrow relative to the Button. |
| `normalImage?` | `integer` | Image asset ID used for the normal appearance of this button. |
| `hoverImage?` | `integer` | Image asset ID used for the hover appearance of this button. |
| `pressedImage?` | `integer` | Image asset ID used for the pressed appearance of this button. |
| `disabledImage?` | `integer` | Image asset ID used for the disabled appearance of this button. |

### `MiliUI.CardProps`

**Inherits from:** [`MiliUI.SurfaceProps`](aliases.md#miliuisurfaceprops). Inherited fields are defined by the linked parent type; they are not repeated below.

*No fields are declared directly on this type.*

### `MiliUI.BadgeProps`

**Inherits from:** [`MiliUI.SurfaceProps`](aliases.md#miliuisurfaceprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `label?` | `MiliUI.TextSpec` | Small label shown inside the Badge. Example: `label = { text = 'NEW' }`. |
| `textSize?` | `MiliUI.TextSize` | Font size of the short text inside the Badge. Example: `textSize = 'sm'`. |
| `textColor?` | `MiliUI.ColorValue` | Color of the text inside the Badge. Example: `textColor = 'white'`. |
| `icon?` | `integer` | Optional image asset ID shown beside the Badge text. Example: `icon = 100103`. |
| `iconSize?` | `number` | Width and height of the Badge's image, in UI units. Example: `iconSize = 20`. |
| `iconColor?` | `MiliUI.ColorValue` | Color used for the icon appearance of this badge. Example: `'accent'` or `'white'`. |
| `adaptiveFontSize?` | `boolean` | Let the Badge text become smaller if it does not fit. Default: `true`. |
| `minimumFontSize?` | `number` | Smallest font size the Badge text can shrink to. Default: `10`. |
| `gap?` | `number` | Empty space between the Badge icon and its text. Example: `gap = 6`. |
| `padding?` | `number` | Empty space **inside** the Badge around its text and image. |
| `paddingX?` | `number` | Empty space inside the Badge on the left and right. Default: `10` UI units. |
| `paddingY?` | `number` | Empty space inside the Badge above and below its contents. Default: `5` UI units. |
| `paddingLeft?` | `number` | Empty space inside the Badge along the left edge. |
| `paddingRight?` | `number` | Empty space inside the Badge along the right edge. |
| `paddingTop?` | `number` | Empty space inside the Badge along the top edge. |
| `paddingBottom?` | `number` | Empty space inside the Badge along the bottom edge. |
| `fitContent?` | `boolean` | Fit omitted width/height axes from localized label, optional icon, gap, and padding. |
| `fitWidth?` | `boolean` | Fit omitted width from current localized badge content. |
| `fitHeight?` | `boolean` | Fit omitted height from current localized badge content. |

### `MiliUI.Badge`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `panel` | `MiliUI.Panel` | Visual panel that draws the component's background and border. |
| `label` | `MiliUI.TextControl` | Text control used to show this component's label. |
| `icon?` | `MiliUI.ImageControl` | The image control used to draw this Badge's optional icon. |

### `MiliUI.StatProps`

**Inherits from:** [`MiliUI.SurfaceProps`](aliases.md#miliuisurfaceprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `value?` | `MiliUI.TextSpec` | Main number or value shown by this Stat card. Example: `value = { text = '125' }`. Default: `'0'`. |
| `label?` | `MiliUI.TextSpec` | Short description of the number shown on this Stat card. Example: `label = { text = 'Wins' }`. |
| `valueSize?` | `MiliUI.TextSize` | Font size of the main number on this Stat card. Example: `valueSize = 'xl'`. |
| `valueColor?` | `MiliUI.ColorValue` | Color of the main number on this Stat card. Example: `valueColor = 'accent'`. |
| `valueAdaptiveFontSize?` | `boolean` | Allow the main number to shrink if it does not fit. Default: `true`. |
| `labelSize?` | `MiliUI.TextSize` | Font size of the short description below or beside the number. |
| `labelColor?` | `MiliUI.ColorValue` | Color of the Stat card's short description. Example: `labelColor = 'muted'`. |
| `labelAdaptiveFontSize?` | `boolean` | Allow the Stat card's description to shrink if it does not fit. Default: `true`. |
| `minimumValueFontSize?` | `number` | Smallest font size the main Stat value can shrink to. Default: `16`. |
| `minimumLabelFontSize?` | `number` | Smallest font size the Stat's description can shrink to. Default: `16`. |

### `MiliUI.Stat`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `panel` | `MiliUI.Panel` | Visual panel that draws the component's background and border. |
| `value` | `MiliUI.TextControl` | Current value stored in this control. |
| `label` | `MiliUI.TextControl` | Text control used to show this component's label. |

### `MiliUI.ProgressBarProps`

**Inherits from:** [`MiliUI.SurfaceProps`](aliases.md#miliuisurfaceprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `value?` | `number` | How full the progress bar is, from `0` (empty) to `1` (completely filled). Example: `value = 0.75` shows 75%. |
| `inset?` | `number` | Space between the outside of the progress bar and its colored fill. Example: `inset = 4`. |
| `radius?` | `MiliUI.Radius` | Background radius. Built-in default is rounded level 6. |
| `fillRadius?` | `MiliUI.Radius` | Fill radius. Defaults to explicit radius when supplied; otherwise rounded level 5. |
| `fillColor?` | `MiliUI.ColorValue` | Color used for the fill appearance of this progress bar. Example: `'accent'` or `'white'`. |
| `fillImage?` | `integer` | Optional fill asset. Overrides the radius-derived fill surface. |
| `fillStretch?` | `boolean` | Stretch the ProgressBar's filled-area image to fit its current width. Default: `true`. |
| `showText?` | `boolean` | Show a percentage on the progress bar, such as `75%`, calculated from `value`. |
| `label?` | `MiliUI.TextSpec` | Localized value template. Default `{ text = '{value}%' }`; supplying it also enables the label. |
| `textSize?` | `MiliUI.TextSize` | Font size of the ProgressBar's optional text label. Default: `'xs'` (extra small). |
| `textColor?` | `MiliUI.ColorValue` | Color of the displayed text. Example: `'white'` or `'accent'`. |
| `adaptiveFontSize?` | `boolean` | Let a ProgressBar's text label shrink if it does not fit. Default: `true` when the label is shown. |
| `minimumFontSize?` | `number` | Smallest font size the ProgressBar's label can shrink to. Default: `16`. |
| `textOutline?` | `boolean` | Enable or disable the text outline behavior of this progress bar. |

### `MiliUI.ProgressBar`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `panel` | `MiliUI.Panel` | Visual panel that draws the component's background and border. |
| `fill` | `MiliUI.ImageControl` | Image control showing how much progress has been completed. |
| `label?` | `MiliUI.TextControl` | Text control used to show this component's label. |
| `value` | `number` | Current value stored in this control. |

### `MiliUI.SliderProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `min?` | `number` | Lowest value the player can choose. Example: `min = 0`. |
| `max?` | `number` | Highest value the player can choose. Example: `max = 100`. |
| `step?` | `number` | Interval between allowed values. Example: `step = 5` chooses 0, 5, 10, etc. instead of every number. |
| `value?` | `number` | Starting number on the Slider. Example: `value = 50` with `min = 0` and `max = 100` puts the handle in the middle. |
| `thumbSize?` | `number` | Width and height of the Slider's draggable handle, in UI units. Default: `26`. |
| `trackHeight?` | `number` | Thickness of the Slider's long horizontal track, in UI units. Default: `10`. |
| `trackY?` | `number` | Optional track/thumb vertical offset. Defaults to -8 when the value label is shown, otherwise 0. |
| `background?` | `MiliUI.ColorValue` | Color of the Slider's track before the player moves the handle. Example: `background = 'surface2'`. |
| `radius?` | `MiliUI.Radius` | Track/background radius. Built-in default is rounded level 6. |
| `fillRadius?` | `MiliUI.Radius` | Filled-track radius. Defaults to explicit radius when supplied; otherwise rounded level 5. |
| `trackImage?` | `integer` | Optional image asset ID for the background of the Slider's horizontal track. |
| `trackStretch?` | `boolean` | Stretch the Slider's track image to match the track. Default: `true`. |
| `trackBorder?` | `boolean` | Show an outline around the Slider track when set to `true`. |
| `trackBorderColor?` | `MiliUI.ColorValue` | Color used for the track border appearance of this slider. Example: `'accent'` or `'white'`. |
| `trackBorderImage?` | `integer` | Image asset ID for the outline around the Slider's track. Use it to replace the default border artwork; for example, `trackBorderImage = 100001` uses that image resource. |
| `trackBorderStretch?` | `boolean` | Stretch the Slider track's outline image to match the track size. Default: `true`. |
| `fillColor?` | `MiliUI.ColorValue` | Color used for the fill appearance of this slider. Example: `'accent'` or `'white'`. |
| `fillImage?` | `integer` | Optional filled-track asset. Overrides the radius-derived fill surface. |
| `fillStretch?` | `boolean` | Stretch the Slider's filled portion image to match the amount filled. Default: `true`. |
| `thumbColor?` | `MiliUI.ColorValue` | Color used for the thumb appearance of this slider. Example: `'accent'` or `'white'`. |
| `thumbHoverColor?` | `MiliUI.ColorValue` | Color used for the thumb hover appearance of this slider. Example: `'accent'` or `'white'`. |
| `thumbImage?` | `integer` | Optional image asset ID for the Slider's movable handle. |
| `thumbStretch?` | `boolean` | Stretch the Slider handle's image to fit its dimensions. Default: `true`. |
| `thumbRadius?` | `MiliUI.Radius` | Round the corners of the thumb part; use `'none'` for square edges. |
| `thumbBorder?` | `boolean` | Show an outline around the Slider's draggable handle. Set `true` to enable it. |
| `thumbBorderColor?` | `MiliUI.ColorValue` | Color used for the thumb border appearance of this slider. Example: `'accent'` or `'white'`. |
| `thumbBorderImage?` | `integer` | Optional image asset ID for an outline around the Slider handle. |
| `thumbBorderStretch?` | `boolean` | Stretch the image used for the Slider handle's outline. Default: `true`. |
| `disabledColor?` | `MiliUI.ColorValue` | Color used for the disabled appearance of this slider. Example: `'accent'` or `'white'`. |
| `showValue?` | `boolean` | Show the current Slider number as text near the handle. Default depends on the Slider settings. |
| `valueLabel?` | `MiliUI.TextSpec` | Localized value template. Default `{ text = '{value}' }`; supplying it also enables the label. |
| `valueY?` | `number` | Optional value-label vertical offset; when omitted it is kept inside the Slider root. |
| `valueWidth?` | `number` | Width of the small label that shows the Slider's current number, in UI units. |
| `valueHeight?` | `number` | Height of the Slider's current-number label, in UI units. |
| `valueTextSize?` | `MiliUI.TextSize` | Font size of the Slider's current-number label. Default: `'xs'` (extra small). |
| `valueTextColor?` | `MiliUI.ColorValue` | Color used for the value text appearance of this slider. Example: `'accent'` or `'white'`. |
| `valueAdaptiveFontSize?` | `boolean` | Let the Slider's current-number label shrink if it does not fit. Default: `true` when shown. |
| `minimumValueFontSize?` | `number` | Smallest font size the Slider's current-number label can shrink to. Default: `16`. |
| `valueSuffix?` | `string` | Applied to the `{value}` argument before localization template substitution. |
| `formatValue?` | `fun(value:number):string` | Function that turns the Slider's number into displayed text. Example: `formatValue = function(v) return v .. '%' end`. |
| `interactable?` | `boolean` | Allow players to drag or click the Slider to change its value. Set `false` to disable input. Default: `true`. |
| `controllerFocus?` | `boolean` | Allow this Slider to be selected when navigating with a controller's D-pad or left stick. |
| `thumbHoverScale?` | `number` | Size multiplier for thumb hover feedback: 1 is normal, 1.05 is 5% larger. |
| `thumbPressScale?` | `number` | Size multiplier for thumb press feedback: 1 is normal, 1.05 is 5% larger. |
| `hoverDuration?` | `number` | Duration of the hover effect, in seconds. |
| `commitAudioId?` | `integer` | Optional 2D audio resource played only when an interaction commits a changed value. Falls back to Theme.sounds.sliderCommit when configured. |
| `onChange?` | `fun(value:number, slider:MiliUI.Slider)` | Run a function whenever the player moves the Slider. Example: `onChange = function(value) print(value) end`. |
| `onCommit?` | `fun(value:number, slider:MiliUI.Slider)` | Runs when the player finishes dragging the Slider, including when the final value matches the starting value. Use it to save or apply the final value instead of responding to every movement. |

### `MiliUI.Slider`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `track` | `MiliUI.Panel` | Visual track behind the draggable handle. |
| `fill` | `MiliUI.ImageControl` | Image control showing the filled portion of the Slider track. |
| `thumb` | `MiliUI.Panel` | Draggable handle the player moves. |
| `hitbox` | `MiliUI.Hitbox` | Invisible input area that receives clicks and drag events. |
| `hover` | `MiliUI.Hover` | Object that manages hover and press visual feedback. |
| `valueLabel?` | `MiliUI.TextControl` | Native text control displaying the chosen number, if enabled. |

### `MiliUI.IconButtonProps`

**Inherits from:** [`MiliUI.ButtonProps`](components_base.md#miliuibuttonprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `icon` | `integer` | Image asset ID drawn inside this small Button. Example: `icon = 100103`. |
| `iconSize?` | `number` | Width and height of the image inside the IconButton, in UI units. Example: `iconSize = 24`. |
| `iconColor?` | `MiliUI.ColorValue` | Color used for the icon appearance of this icon button. Example: `'accent'` or `'white'`. |
| `size?` | `number` | Set both the width and height of the IconButton. Example: `size = 52` makes a 52-by-52 Button. Default: `52`. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Button:OnClick(callback)`

Register a function that runs when the player activates this Button by clicking or using the controller.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `MiliUI.CursorCallback` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param callback MiliUI.CursorCallback
---@return MiliUI.Button
```


### `Button:OnEnter(callback)`

Register a function that runs when enter occurs on this Button.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `MiliUI.CursorCallback` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param callback MiliUI.CursorCallback
---@return MiliUI.Button
```


### `Button:OnExit(callback)`

Register a function that runs when exit occurs on this Button.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `MiliUI.CursorCallback` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param callback MiliUI.CursorCallback
---@return MiliUI.Button
```


### `Button:OnDown(callback)`

Register a function that runs when down occurs on this Button.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `MiliUI.CursorCallback` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param callback MiliUI.CursorCallback
---@return MiliUI.Button
```


### `Button:OnUp(callback)`

Register a function that runs when up occurs on this Button.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `MiliUI.CursorCallback` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param callback MiliUI.CursorCallback
---@return MiliUI.Button
```


### `Button:SetLabel(spec)`

Change the visible label shown by this component. Pass the new text or a text settings table.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Button
```


### `Button:SetEnabled(enabled)`

Turn player interaction on or off. Pass `true` to enable this component, or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Button
```


### `Button:SetSelected(selected)`

Change the current selection. Lua counts list positions starting at `1`, not `0`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `selected` | `boolean` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param selected boolean
---@return MiliUI.Button
```


### `Button:IsSelected()`

Return `true` when the given item or option is currently selected.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | selected |

**Original LuaLS annotations:**

```lua
---@return boolean selected
```


### `Button:RefreshControllerFocusIndicator()`

Repositions the controller-focus selector against the Button.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.AnchorPlacementResult?` | result |

**Original LuaLS annotations:**

```lua
---@return MiliUI.AnchorPlacementResult? result
```


### `Button:BindStates(target, states)`

Binds a child/related visual control to this button's hover/pressed/selected/disabled state.
The target's current color is captured as its normal state and restored automatically.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `target` | `MiliUI.Parent` | — |
| Parameter `states` | `MiliUI.StateTargetStates` | — |
| Returns | `MiliUI.Button` | — |

**Original LuaLS annotations:**

```lua
---@param target MiliUI.Parent
---@param states MiliUI.StateTargetStates
---@return MiliUI.Button
```


### `Button:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.


### `Badge:SetLabel(spec)`

Change the visible label shown by this component. Pass the new text or a text settings table.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Badge` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Badge
```


### `Badge:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.


### `Stat:SetValue(spec)`

Change the value currently displayed or stored by this component. Use the expected value type shown in the function signature.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Stat` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Stat
```


### `Stat:SetLabel(spec)`

Change the visible label shown by this component. Pass the new text or a text settings table.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Stat` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Stat
```


### `Stat:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.


### `ProgressBar:SetValue(value, animate)`

Change the value currently displayed or stored by this component. Use the expected value type shown in the function signature.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `number` | Normalized 0-1 value. |
| Parameter `animate?` | `boolean` | — |
| Returns | `MiliUI.ProgressBar` | — |

**Original LuaLS annotations:**

```lua
---@param value number Normalized 0-1 value.
---@param animate? boolean
---@return MiliUI.ProgressBar
```


### `ProgressBar:GetValue()`

Return the current value of this component so your script can use it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | value |

**Original LuaLS annotations:**

```lua
---@return number value
```


### `ProgressBar:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.


### `Slider:SetValue(value, fireEvent, animate)`

Sets value, clamps to range, and snaps to step when configured.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `number` | — |
| Parameter `fireEvent?` | `boolean` | Call OnChange only when value changed. |
| Parameter `animate?` | `boolean` | Animate thumb/fill. |
| Returns | `MiliUI.Slider` | — |

**Original LuaLS annotations:**

```lua
---@param value number
---@param fireEvent? boolean Call OnChange only when value changed.
---@param animate? boolean Animate thumb/fill.
---@return MiliUI.Slider
```


### `Slider:GetValue()`

Return the current value of this component so your script can use it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | value |

**Original LuaLS annotations:**

```lua
---@return number value
```


### `Slider:GetRatio()`

Return the current ratio from this Slider, so your script can read it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | ratio Normalized 0-1 ratio. |

**Original LuaLS annotations:**

```lua
---@return number ratio Normalized 0-1 ratio.
```


### `Slider:SetEnabled(enabled)`

Turn player interaction on or off. Pass `true` to enable this component, or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Slider` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Slider
```


### `Slider:OnChange(callback)`

Register a function to run whenever this component's selected option or value changes. This is useful for updating other UI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(value:number, slider:MiliUI.Slider)` | — |
| Returns | `MiliUI.Slider` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(value:number, slider:MiliUI.Slider)
---@return MiliUI.Slider
```


### `Slider:OnCommit(callback)`

Register a function that runs when commit occurs on this Slider.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(value:number, slider:MiliUI.Slider)` | — |
| Returns | `MiliUI.Slider` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(value:number, slider:MiliUI.Slider)
---@return MiliUI.Slider
```


### `Slider:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.
