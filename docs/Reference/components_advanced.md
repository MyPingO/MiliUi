# API reference: Components Advanced

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_advanced.lua`  
**Coverage:** 11 classes, 213 fields, 0 aliases, 39 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Components](../Components.md) · [DataViews](../DataViews.md)

## Classes, component props and return types

### `MiliUI.AccordionProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `title?` | `MiliUI.TextSpec` | Text in the clickable header of an expandable section. Example: `title = { text = 'Advanced Settings' }`. |
| `label?` | `MiliUI.TextSpec` | Another name for `title`: the text shown on the Accordion's clickable header. Use `title` for new code. |
| `open?` | `boolean` | Start the section expanded (`true`) or collapsed (`false`). Default false. |
| `value?` | `boolean` | Another name for `open`. Set `value = true` to start the Accordion expanded, or `value = false` to start collapsed. |
| `headerHeight?` | `number` | Height of the clickable header bar. Example: `headerHeight = 56`. |
| `gap?` | `number` | Space between the header and its revealed content while expanded. Example: `gap = 6`. |
| `titleInset?` | `number` | Empty space between the **left edge** of the Accordion header and its title text, in UI units. Default: `18`. |
| `titleSize?` | `MiliUI.TextSize` | Font size of the Accordion's header title. Example: `titleSize = 'lg'` uses your theme's large text size. Default: `'md'`. |
| `titleColor?` | `MiliUI.ColorValue` | Color used for the title appearance of this accordion. Example: `'accent'` or `'white'`. |
| `adaptiveFontSize?` | `boolean` | Let the Accordion header text become smaller if it does not fit. Default: `true`. |
| `minimumFontSize?` | `number` | Smallest font size the Accordion header is allowed to shrink to. Default: `10`. |
| `headerVariant?` | `MiliUI.ButtonVariant` | Choose the built-in appearance of the Accordion's clickable header. Example: `headerVariant = 'secondary'`. Default: `'secondary'`. |
| `headerBackground?` | `MiliUI.ColorValue` | Background color of the Accordion header, where the player clicks to expand or collapse it. Example: `headerBackground = 'surface'`. |
| `headerHoverColor?` | `MiliUI.ColorValue` | Color used for the header hover appearance of this accordion. Example: `'accent'` or `'white'`. |
| `headerPressedColor?` | `MiliUI.ColorValue` | Color used for the header pressed appearance of this accordion. Example: `'accent'` or `'white'`. |
| `headerDisabledColor?` | `MiliUI.ColorValue` | Color used for the header disabled appearance of this accordion. Example: `'accent'` or `'white'`. |
| `disabledTextColor?` | `MiliUI.ColorValue` | Color used for the disabled text appearance of this accordion. Example: `'accent'` or `'white'`. |
| `headerRadius?` | `MiliUI.Radius` | Round the corners of the header part; use `'none'` for square edges. |
| `headerBorder?` | `boolean` | Show a border on the header part when true. |
| `headerBorderColor?` | `MiliUI.ColorValue` | Color used for the header border appearance of this accordion. Example: `'accent'` or `'white'`. |
| `headerImage?` | `integer` | Optional image asset ID to use as the Accordion header's background instead of the normal shape. |
| `headerStretch?` | `boolean` | Stretch the header image to fit its rectangle when true. |
| `headerBorderImage?` | `integer` | Image asset ID used for the header border appearance of this accordion. |
| `headerBorderStretch?` | `boolean` | Stretch the header border image to fit its rectangle when true. |
| `headerClipToRadius?` | `boolean` | Clip a custom header background image so its corners match `headerRadius`. Does not alter the header's text. |
| `headerAnimate?` | `boolean` | Show the normal Button hover and press animation on the Accordion header. Set `false` to keep it still. |
| `clickAudioId?` | `integer\|false` | Asset ID of the sound played when the header is pressed. Set `false` for no click sound. |
| `indicatorImage?` | `integer\|false` | Default Theme.assets.chevronDown (100105). Set false to hide the indicator. |
| `indicatorSize?` | `number` | Width and height of the Accordion's open/close indicator, in UI units. Example: `indicatorSize = 20`. Default: `18`. |
| `indicatorInset?` | `number` | Empty space between the Accordion's open/close indicator and the **right edge** of its header. Default: `18` UI units. |
| `indicatorColor?` | `MiliUI.ColorValue` | Color of the Accordion's open/close indicator when closed. Default: `'muted'`. |
| `indicatorOpenColor?` | `MiliUI.ColorValue` | Color of the Accordion's open/close indicator when expanded. Default: `'accent'`. |
| `indicatorDisabledColor?` | `MiliUI.ColorValue` | Color of the Accordion's indicator when the control is disabled. Default: `'disabled'`. |
| `indicatorRotation?` | `number` | Angle of the Accordion indicator when the section is **closed**. Example: `indicatorRotation = 0` leaves the image in its normal direction. Default: `0` degrees. |
| `indicatorOpenRotation?` | `number` | Angle of the Accordion indicator when the section is **open**. Example: `indicatorOpenRotation = 180` turns it upside-down. Default: `180` degrees. |
| `indicatorStretch?` | `boolean` | Stretch the open/close indicator image to match its width and height. Default: `false`. |
| `bodyBackground?` | `MiliUI.ColorValue` | Background color of the content area that appears when this Accordion opens. Default: `'surface'`. |
| `bodyRadius?` | `MiliUI.Radius` | Round the corners of the body part; use `'none'` for square edges. |
| `bodyBorder?` | `boolean` | Show an outline around the Accordion's content area. Default: `true`. |
| `bodyBorderColor?` | `MiliUI.ColorValue` | Color of the outline around the Accordion's content area. Default: `'border'`. |
| `bodyImage?` | `integer` | Optional image asset ID used as the background of the Accordion's expanded content area. |
| `bodyStretch?` | `boolean` | Stretch the body image to fit its rectangle when true. |
| `bodyBorderImage?` | `integer` | Image asset ID used for the body border appearance of this accordion. |
| `bodyBorderStretch?` | `boolean` | Stretch the body border image to fit its rectangle when true. |
| `bodyClipToRadius?` | `boolean` | Clip a custom body background image so its corners match `bodyRadius`. |
| `bodyGap?` | `number` | Empty space between elements you add **inside the Accordion's body**. Example: `bodyGap = 10` leaves 10 UI units between each child. |
| `bodyPadding?` | `number` | Space **inside the Accordion's opened body**, between its outer edges and the content you add. Example: `bodyPadding = 16` leaves 16 UI units on every side. Default: `16`. |
| `bodyPaddingX?` | `number` | Empty space inside the left and right edges of the expanded Accordion content. |
| `bodyPaddingY?` | `number` | Empty space inside the top and bottom edges of the expanded Accordion content. |
| `bodyAlign?` | `MiliUI.StackAlign` | Decide how child elements line up within the Accordion's body. `'stretch'` makes them fill the available width when possible. Default: `'stretch'`. |
| `bodyJustify?` | `MiliUI.StackJustify` | Choose how children are arranged from top to bottom inside the Accordion's expanded body. Default: `'start'` (from the top). |
| `animate?` | `boolean` | Animate the Accordion opening and closing, including movement of its indicator and content. Set `animate = false` for an immediate change. Default: `true`. |
| `motionDistance?` | `number` | How far the Accordion's contents slide as the section opens or closes. Example: `motionDistance = 10` moves the content by 10 UI units. Default: `10`. |
| `motionDuration?` | `number` | How long it takes the Accordion to open or close, in seconds. Example: `motionDuration = 0.2` takes one-fifth of a second. Default: `0.20`. |
| `interactable?` | `boolean` | Allow the player to click the Accordion header to expand or collapse it. Set `false` to disable interaction. Default: `true`. |
| `controllerFocus?` | `boolean` | Let the controller's D-pad or left stick select the Accordion header. Default: `true`. |
| `onChange?` | `fun(open:boolean, accordion:MiliUI.Accordion)` | Run your code when this Accordion opens or closes. The first argument is `true` when open and `false` when closed. Example: `onChange = function(isOpen) print(isOpen) end` prints the new state. |

### `MiliUI.Accordion`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `stack` | `MiliUI.Stack` | Row or Column responsible for arranging the items. |
| `header` | `MiliUI.Button` | Clickable Button used to open or close the section. |
| `body` | `MiliUI.Panel` | Panel containing the section's expanded content. |
| `viewport` | `MiliUI.ImageControl` | Native mask used to clip content during animated height transitions. |
| `content` | `MiliUI.Stack` | Parent arbitrary child controls here. |
| `indicator?` | `MiliUI.ImageControl` | Optional image that shows a selection, opening state, or direction. |

### `MiliUI.ToggleProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `label?` | `MiliUI.TextSpec` | Optional text shown beside the Toggle switch. Example: `label = { text = 'Music' }`. |
| `textSize?` | `MiliUI.TextSize` | Font size of the label beside the Toggle. Example: `textSize = 'md'`. |
| `textColor?` | `MiliUI.ColorValue` | Color of the text beside the Toggle. Example: `textColor = 'text'`. |
| `adaptiveFontSize?` | `boolean` | Let the Toggle label become smaller if it does not fit. Default: `true`. |
| `minimumFontSize?` | `number` | Smallest font size the Toggle's label is allowed to shrink to. Default: `16`. |
| `horizontalAlignment?` | `any` | Align the Toggle's text left, center, or right using Miliastra's `Enum.TextHorizontalAlignment`. |
| `value?` | `boolean` | Whether the switch starts ON (`true`) or OFF (`false`). Useful for settings like music or hints. |
| `switchWidth?` | `number` | How wide the on/off switch track is. Example: `switchWidth = 68`. |
| `switchHeight?` | `number` | Height of the Toggle's sliding switch, in UI units. Default: `32`. |
| `thumbSize?` | `number` | Size of the small movable circle in the switch. Example: `thumbSize = 24`. |
| `padding?` | `number` | Space inside the Toggle's switch, between the sliding handle and its outer edges. Default: `4` UI units. |
| `onColor?` | `MiliUI.ColorValue` | Function called when color happens in this toggle. |
| `offColor?` | `MiliUI.ColorValue` | Color used for the off appearance of this toggle. Example: `'accent'` or `'white'`. |
| `trackImage?` | `integer` | Optional image asset ID for the track behind the Toggle's sliding handle. |
| `trackStretch?` | `boolean` | Stretch the Toggle's track background image to fit the track. Default: `true`. |
| `trackBorder?` | `boolean` | Show an outline around the Toggle's switch track. Set `true` to enable it. |
| `trackBorderColor?` | `MiliUI.ColorValue` | Color used for the track border appearance of this toggle. Example: `'accent'` or `'white'`. |
| `trackBorderImage?` | `integer` | Optional image asset ID for the outline around the Toggle's track. |
| `trackBorderStretch?` | `boolean` | Stretch the image used for the Toggle's track outline. Default: `true`. |
| `thumbColor?` | `MiliUI.ColorValue` | Color used for the thumb appearance of this toggle. Example: `'accent'` or `'white'`. |
| `thumbImage?` | `integer` | Optional image asset ID for the movable Toggle handle (the small shape that slides). |
| `thumbStretch?` | `boolean` | Stretch the image used for the Toggle's moving handle. Default: `true`. |
| `thumbBorder?` | `boolean` | Show an outline around the Toggle's movable handle. Set `true` to enable it. |
| `thumbBorderColor?` | `MiliUI.ColorValue` | Color used for the thumb border appearance of this toggle. Example: `'accent'` or `'white'`. |
| `thumbBorderImage?` | `integer` | Optional image asset ID for the outline around the Toggle's handle. |
| `thumbBorderStretch?` | `boolean` | Stretch the image used for the Toggle's handle outline. Default: `true`. |
| `disabledColor?` | `MiliUI.ColorValue` | Color used for the disabled appearance of this toggle. Example: `'accent'` or `'white'`. |
| `disabledTextColor?` | `MiliUI.ColorValue` | Color used for the disabled text appearance of this toggle. Example: `'accent'` or `'white'`. |
| `radius?` | `MiliUI.Radius` | Roundness of the corners. Example: `'lg'` or `'none'`. |
| `thumbRadius?` | `MiliUI.Radius` | Round the corners of the thumb part; use `'none'` for square edges. |
| `border?` | `boolean` | Whether to draw an outline around the control. |
| `borderColor?` | `MiliUI.ColorValue` | Color used for the border appearance of this toggle. Example: `'accent'` or `'white'`. |
| `interactable?` | `boolean` | Allow the player to turn this Toggle on or off. Set `false` to prevent changes. Default: `true`. |
| `controllerFocus?` | `boolean` | Allow this Toggle to be selected by controller navigation. Default: `false` (you can turn it on). |
| `hoverScale?` | `number` | Size multiplier for hover feedback: 1 is normal, 1.05 is 5% larger. |
| `pressScale?` | `number` | Size multiplier for press feedback: 1 is normal, 1.05 is 5% larger. |
| `hoverDuration?` | `number` | Duration of the hover effect, in seconds. |
| `onChange?` | `fun(value:boolean, toggle:MiliUI.Toggle)` | Run your code when the player switches this Toggle on or off. The first argument is `true` for on or `false` for off. Example: `onChange = function(isEnabled) print(isEnabled) end`. |

### `MiliUI.Toggle`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `track` | `MiliUI.Panel` | Visual track behind the draggable handle. |
| `thumb` | `MiliUI.Panel` | Draggable handle the player moves. |
| `label?` | `MiliUI.TextControl` | Text control used to show this component's label. |
| `hitbox` | `MiliUI.Hitbox` | Invisible input area that receives clicks and drag events. |
| `hover` | `MiliUI.Hover` | Object that manages hover and press visual feedback. |

### `MiliUI.CheckboxProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `label?` | `MiliUI.TextSpec` | Optional text displayed beside the Checkbox. Example: `label = { text = 'Show hints' }`. |
| `textSize?` | `MiliUI.TextSize` | Font size of the Checkbox's label. Example: `textSize = 'md'`. |
| `textColor?` | `MiliUI.ColorValue` | Color of the Checkbox label. Example: `textColor = 'text'`. |
| `adaptiveFontSize?` | `boolean` | Let the Checkbox label become smaller if it does not fit. Default: `true`. |
| `minimumFontSize?` | `number` | Smallest font size the Checkbox label is allowed to shrink to. Default: `16`. |
| `value?` | `boolean` | Choose whether this Checkbox starts with a checkmark. `value = true` means checked; `value = false` means unchecked. |
| `boxSize?` | `number` | Width and height of the square Checkbox area, in UI units. Example: `boxSize = 34`. Default: `34`. |
| `boxImage?` | `integer` | Optional image asset ID for the background of the square Checkbox area. |
| `boxStretch?` | `boolean` | Stretch the Checkbox background image to fit the square. Default: `true`. |
| `boxBorderImage?` | `integer` | Optional image asset ID for the outline around the Checkbox square. |
| `boxBorderStretch?` | `boolean` | Stretch the Checkbox outline image to match its size. Default: `true`. |
| `check?` | `MiliUI.TextSpec` | Optional explicit custom text marker. Supplying it switches from the default image marker to text. |
| `checkSize?` | `MiliUI.TextSize` | Size of the checkmark text displayed when this Checkbox is selected. Default: `'md'`. |
| `checkIcon?` | `integer` | Image marker asset. Default `UI.Theme.assets.checkboxCheck` (100102). |
| `checkIconSize?` | `number` | Image marker size. Default about 72% of boxSize. |
| `checkedColor?` | `MiliUI.ColorValue` | Color used for the checked appearance of this checkbox. Example: `'accent'` or `'white'`. |
| `uncheckedColor?` | `MiliUI.ColorValue` | Color used for the unchecked appearance of this checkbox. Example: `'accent'` or `'white'`. |
| `checkColor?` | `MiliUI.ColorValue` | Color used for the check appearance of this checkbox. Example: `'accent'` or `'white'`. |
| `disabledColor?` | `MiliUI.ColorValue` | Color used for the disabled appearance of this checkbox. Example: `'accent'` or `'white'`. |
| `disabledTextColor?` | `MiliUI.ColorValue` | Color used for the disabled text appearance of this checkbox. Example: `'accent'` or `'white'`. |
| `radius?` | `MiliUI.Radius` | Roundness of the corners. Example: `'lg'` or `'none'`. |
| `border?` | `boolean` | Whether to draw an outline around the control. |
| `borderColor?` | `MiliUI.ColorValue` | Color used for the border appearance of this checkbox. Example: `'accent'` or `'white'`. |
| `interactable?` | `boolean` | Let the player check or uncheck this Checkbox. Set `false` to prevent changes. Default: `true`. |
| `controllerFocus?` | `boolean` | Allow the controller's D-pad or left stick to select this Checkbox. Default: `false`. |
| `hoverScale?` | `number` | Size multiplier for hover feedback: 1 is normal, 1.05 is 5% larger. |
| `pressScale?` | `number` | Size multiplier for press feedback: 1 is normal, 1.05 is 5% larger. |
| `hoverDuration?` | `number` | Duration of the hover effect, in seconds. |
| `onChange?` | `fun(value:boolean, checkbox:MiliUI.Checkbox)` | Run your code whenever the player checks or unchecks this Checkbox. The first argument is `true` for checked or `false` for unchecked. Example: `onChange = function(isChecked) print(isChecked) end`. |

### `MiliUI.Checkbox`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `box` | `MiliUI.Panel` | Box used by this checkbox. |
| `check` | `MiliUI.TextControl\|MiliUI.ImageControl` | The checkmark image or text shown when the Checkbox is selected. |
| `checkText?` | `MiliUI.TextControl` | Check text used by this checkbox. |
| `checkIcon?` | `MiliUI.ImageControl` | Check icon used by this checkbox. |
| `label?` | `MiliUI.TextControl` | Text control used to show this component's label. |
| `hitbox` | `MiliUI.Hitbox` | Invisible input area that receives clicks and drag events. |
| `hover` | `MiliUI.Hover` | Object that manages hover and press visual feedback. |

### `MiliUI.StepperProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `min?` | `number` | Smallest number the player can choose with the minus/plus buttons. |
| `max?` | `number` | Largest number the player can choose with the minus/plus buttons. |
| `step?` | `number` | How much one press of + or - changes the number. Example: `step = 5`. |
| `value?` | `number` | Starting number between `min` and `max`. Example: `value = 3`. |
| `decreaseLabel?` | `MiliUI.TextSpec` | Explicit text override for the decrease button. Omit to use an image icon. |
| `increaseLabel?` | `MiliUI.TextSpec` | Explicit text override for the increase button. Omit to use an image icon. |
| `decreaseIcon?` | `integer` | Decrease icon asset. Default `UI.Theme.assets.minus` (100108). |
| `increaseIcon?` | `integer` | Increase icon asset. Default `UI.Theme.assets.plus` (100107). |
| `buttonIconSize?` | `number` | Shared increase/decrease icon size. Default about 34% of the smaller button dimension. |
| `buttonIconColor?` | `MiliUI.ColorValue` | Color of the plus and minus icons when their Buttons can be pressed. Default: `'text'`. |
| `disabledButtonIconColor?` | `MiliUI.ColorValue` | Color of plus/minus icons when those Buttons cannot be pressed. Default: `'disabled'`. |
| `valueLabel?` | `MiliUI.TextSpec` | Localized value template. Default `{ text = '{value}' }`. |
| `buttonWidth?` | `number` | Width of each plus/minus Button in the Stepper, in UI units. Default: `52`. |
| `buttonVariant?` | `MiliUI.ButtonVariant` | Choose the built-in look of the Stepper's plus/minus Buttons. Example: `buttonVariant = 'secondary'`. |
| `textSize?` | `MiliUI.TextSize` | Size of the displayed text. Use e.g. `'sm'`, `'md'`, or a number. |
| `textColor?` | `MiliUI.ColorValue` | Color of the displayed text. Example: `'white'` or `'accent'`. |
| `adaptiveFontSize?` | `boolean` | Let the Stepper's number label become smaller when it does not fit. Default: `true`. |
| `minimumFontSize?` | `number` | Smallest font size the Stepper's number label is allowed to shrink to. Default: `16`. |
| `formatValue?` | `fun(value:number):string` | Decide how the Stepper's number should appear as text. The function receives the number and **must return a string**. Example: `formatValue = function(amount) return tostring(amount) .. ' coins' end` displays a value such as **3 coins**. |
| `interactable?` | `boolean` | Allow the player to change the Stepper's number using its plus and minus Buttons. Default: `true`. |
| `controllerFocus?` | `boolean` | Whether controller navigation can select this control. |
| `onChange?` | `fun(value:number, stepper:MiliUI.Stepper)` | Run your code when the Stepper's plus or minus Button changes its value. The first argument is the new number. Example: `onChange = function(amount) print(amount) end` prints the new value. |

### `MiliUI.Stepper`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `minus` | `MiliUI.Button` | Clickable Button that decreases the number. |
| `plus` | `MiliUI.Button` | Clickable Button that increases the number. |
| `minusIcon` | `MiliUI.ImageControl` | Default decrease image; hidden when decreaseLabel is supplied. |
| `plusIcon` | `MiliUI.ImageControl` | Default increase image; hidden when increaseLabel is supplied. |
| `label` | `MiliUI.TextControl` | Text control used to show this component's label. |

### `MiliUI.TabItem`

| Field | Declared type | Description |
| --- | --- | --- |
| `label` | `MiliUI.TextSpec` | Text shown on this tab's Button. Example: `label = { text = 'Inventory' }`. |

### `MiliUI.TabsProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `items` | `MiliUI.TabItem[]` | The tabs across the top (or side), such as `Inventory`, `Stats`, and `Settings`. |
| `selected?` | `integer` | Choose which tab is shown when the Tabs control first appears. Lua counts from **1**, so `selected = 1` shows the first tab in `items`. |
| `tabHeight?` | `number` | Height of each tab Button, in UI units. Example: `tabHeight = 52`. Default: `52`. |
| `gap?` | `number` | Empty space between the clickable tab Buttons, in UI units. Default: `4`. |
| `contentGap?` | `number` | Empty space between the row of tab Buttons and the content displayed for the selected tab. Default: `10` UI units. |
| `tabBarBackground?` | `MiliUI.ColorValue` | Background color of the row that holds the tab Buttons. Example: `tabBarBackground = 'surface'`. |
| `tabBarImage?` | `integer` | Optional image asset ID for the background of the row of tab Buttons. |
| `tabBarStretch?` | `boolean` | Stretch the tab bar's background image to fit the tab bar. Default: `true`. |
| `tabBarBorder?` | `boolean` | Draw an outline around the whole row of tab Buttons when set to `true`. |
| `tabBarBorderColor?` | `MiliUI.ColorValue` | Color used for the tab bar border appearance of this tabs. Example: `'accent'` or `'white'`. |
| `tabBarBorderImage?` | `integer` | Optional image asset ID for the outline around the whole tab bar. |
| `tabBarBorderStretch?` | `boolean` | Stretch the tab bar's border image to fit its size. Default: `true`. |
| `radius?` | `MiliUI.Radius` | Roundness of the corners. Example: `'lg'` or `'none'`. |
| `tabRadius?` | `MiliUI.Radius` | Round the corners of the tab part; use `'none'` for square edges. |
| `tabImage?` | `integer` | Optional image asset ID to use as the background of every tab Button. |
| `tabStretch?` | `boolean` | Stretch each tab Button's background image to fit that Button. Default: `true`. |
| `tabBorder?` | `boolean` | Draw an outline around each tab Button when set to `true`. |
| `tabBorderColor?` | `MiliUI.ColorValue` | Color used for the tab border appearance of this tabs. Example: `'accent'` or `'white'`. |
| `tabBorderImage?` | `integer` | Optional image asset ID for the outline around each tab Button. |
| `tabBorderStretch?` | `boolean` | Stretch each tab Button's border image to fit. Default: `true`. |
| `selectedColor?` | `MiliUI.ColorValue` | Color used for the selected appearance of this tabs. Example: `'accent'` or `'white'`. |
| `selectedHoverColor?` | `MiliUI.ColorValue` | Color used for the selected hover appearance of this tabs. Example: `'accent'` or `'white'`. |
| `tabColor?` | `MiliUI.ColorValue` | Color used for the tab appearance of this tabs. Example: `'accent'` or `'white'`. |
| `tabHoverColor?` | `MiliUI.ColorValue` | Color used for the tab hover appearance of this tabs. Example: `'accent'` or `'white'`. |
| `selectedTextColor?` | `MiliUI.ColorValue` | Color used for the selected text appearance of this tabs. Example: `'accent'` or `'white'`. |
| `textColor?` | `MiliUI.ColorValue` | Color of the displayed text. Example: `'white'` or `'accent'`. |
| `disabledColor?` | `MiliUI.ColorValue` | Color used for the disabled appearance of this tabs. Example: `'accent'` or `'white'`. |
| `disabledTextColor?` | `MiliUI.ColorValue` | Color used for the disabled text appearance of this tabs. Example: `'accent'` or `'white'`. |
| `textSize?` | `MiliUI.TextSize` | Size of the displayed text. Use e.g. `'sm'`, `'md'`, or a number. |
| `adaptiveFontSize?` | `boolean` | Let tab labels become smaller if they do not fit inside the tab Buttons. Default: `true`. |
| `minimumFontSize?` | `number` | Smallest font size tab labels are allowed to shrink to. Default: `16`. |
| `interactable?` | `boolean` | Let the player switch tabs. Set `false` to disable selection changes. Default: `true`. |
| `controllerFocus?` | `boolean` | Allow controller navigation to focus the tab Buttons. Default: `false`. |
| `onChange?` | `fun(index:integer, item:MiliUI.TabItem, tabs:MiliUI.Tabs)` | Run your code when the player chooses another Tab. The first argument is the new tab's position, counting from 1. The other arguments are its data and the Tabs control. Example: `onChange = function(tabIndex) print(tabIndex) end`. |

### `MiliUI.Tabs`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `tabBar` | `MiliUI.Panel` | Tab bar used by this tabs. |
| `content` | `MiliUI.ContainerControl` | Container where you can add custom child UI. |
| `tabs` | `table[]` | Array of Buttons the player uses to switch tabs. |
| `contents` | `MiliUI.ContainerControl[]` | Array of content containers, one for each tab. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Accordion:SetOpen(open, fireEvent, animate)`

Change the open setting on this Accordion. Pass the new value shown in the function parameters.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `open` | `boolean` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Parameter `animate?` | `boolean` | — |
| Returns | `MiliUI.Accordion` | — |

**Original LuaLS annotations:**

```lua
---@param open boolean
---@param fireEvent? boolean
---@param animate? boolean
---@return MiliUI.Accordion
```


### `Accordion:IsOpen()`

Return `true` if this component is currently open or expanded, or `false` if it is closed.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | — |

**Original LuaLS annotations:**

```lua
---@return boolean
```


### `Accordion:SetValue(value, fireEvent, animate)`

Change the value currently displayed or stored by this component. Use the expected value type shown in the function signature.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `boolean` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Parameter `animate?` | `boolean` | — |
| Returns | `MiliUI.Accordion` | — |

**Original LuaLS annotations:**

```lua
---@param value boolean
---@param fireEvent? boolean
---@param animate? boolean
---@return MiliUI.Accordion
```


### `Accordion:GetValue()`

Return the current value of this component so your script can use it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | — |

**Original LuaLS annotations:**

```lua
---@return boolean
```


### `Accordion:Toggle(fireEvent, animate)`

Switch between open and closed. An open component closes; a closed component opens.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fireEvent?` | `boolean` | Defaults true. |
| Parameter `animate?` | `boolean` | — |
| Returns | `MiliUI.Accordion` | — |

**Original LuaLS annotations:**

```lua
---@param fireEvent? boolean Defaults true.
---@param animate? boolean
---@return MiliUI.Accordion
```


### `Accordion:SetEnabled(enabled)`

Turn player interaction on or off. Pass `true` to enable this component, or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Accordion` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Accordion
```


### `Accordion:IsEnabled()`

Return `true` or `false` to indicate whether this Accordion is enabled.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | — |

**Original LuaLS annotations:**

```lua
---@return boolean
```


### `Accordion:SetTitle(spec)`

Change the heading shown by this component. Example: `modal:SetTitle({ text = 'Paused' })`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Accordion` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Accordion
```


### `Accordion:OnChange(callback)`

Register a function to run whenever this component's selected option or value changes. This is useful for updating other UI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback?` | `fun(open:boolean, accordion:MiliUI.Accordion)` | — |
| Returns | `MiliUI.Accordion` | — |

**Original LuaLS annotations:**

```lua
---@param callback? fun(open:boolean, accordion:MiliUI.Accordion)
---@return MiliUI.Accordion
```


### `Accordion:Refresh()`

Update the  on this Accordion so the UI reflects the current settings.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Accordion` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Accordion
```


### `Accordion:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.


### `Toggle:SetValue(value, fireEvent, animate)`

Change the value currently displayed or stored by this component. Use the expected value type shown in the function signature.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `boolean` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Parameter `animate?` | `boolean` | Defaults true. |
| Returns | `MiliUI.Toggle` | — |

**Original LuaLS annotations:**

```lua
---@param value boolean
---@param fireEvent? boolean
---@param animate? boolean Defaults true.
---@return MiliUI.Toggle
```


### `Toggle:GetValue()`

Return the current value of this component so your script can use it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | value |

**Original LuaLS annotations:**

```lua
---@return boolean value
```


### `Toggle:Toggle(fireEvent)`

Switch between open and closed. An open component closes; a closed component opens.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fireEvent?` | `boolean` | Defaults true. |
| Returns | `MiliUI.Toggle` | — |

**Original LuaLS annotations:**

```lua
---@param fireEvent? boolean Defaults true.
---@return MiliUI.Toggle
```


### `Toggle:SetEnabled(enabled)`

Turn player interaction on or off. Pass `true` to enable this component, or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Toggle` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Toggle
```


### `Toggle:OnChange(callback)`

Register a function to run whenever this component's selected option or value changes. This is useful for updating other UI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(value:boolean, toggle:MiliUI.Toggle)` | — |
| Returns | `MiliUI.Toggle` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(value:boolean, toggle:MiliUI.Toggle)
---@return MiliUI.Toggle
```


### `Toggle:SetLabel(spec)`

Change the visible label shown by this component. Pass the new text or a text settings table.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Toggle` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Toggle
```


### `Toggle:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.


### `Checkbox:SetValue(value, fireEvent)`

Change the value currently displayed or stored by this component. Use the expected value type shown in the function signature.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `boolean` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Checkbox` | — |

**Original LuaLS annotations:**

```lua
---@param value boolean
---@param fireEvent? boolean
---@return MiliUI.Checkbox
```


### `Checkbox:GetValue()`

Return the current value of this component so your script can use it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | value |

**Original LuaLS annotations:**

```lua
---@return boolean value
```


### `Checkbox:Toggle(fireEvent)`

Switch between open and closed. An open component closes; a closed component opens.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `fireEvent?` | `boolean` | Defaults true. |
| Returns | `MiliUI.Checkbox` | — |

**Original LuaLS annotations:**

```lua
---@param fireEvent? boolean Defaults true.
---@return MiliUI.Checkbox
```


### `Checkbox:SetEnabled(enabled)`

Turn player interaction on or off. Pass `true` to enable this component, or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Checkbox` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Checkbox
```


### `Checkbox:OnChange(callback)`

Register a function to run whenever this component's selected option or value changes. This is useful for updating other UI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(value:boolean, checkbox:MiliUI.Checkbox)` | — |
| Returns | `MiliUI.Checkbox` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(value:boolean, checkbox:MiliUI.Checkbox)
---@return MiliUI.Checkbox
```


### `Checkbox:SetLabel(spec)`

Change the visible label shown by this component. Pass the new text or a text settings table.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Checkbox` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Checkbox
```


### `Checkbox:SetCheck(spec)`

Switches the active check marker to localized/custom text.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Checkbox` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Checkbox
```


### `Checkbox:SetCheckIcon(image)`

Switches the active check marker to an image asset.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `image` | `integer` | — |
| Returns | `MiliUI.Checkbox` | — |

**Original LuaLS annotations:**

```lua
---@param image integer
---@return MiliUI.Checkbox
```


### `Checkbox:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.


### `Stepper:SetValue(value, fireEvent)`

Change the value currently displayed or stored by this component. Use the expected value type shown in the function signature.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `number` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Stepper` | — |

**Original LuaLS annotations:**

```lua
---@param value number
---@param fireEvent? boolean
---@return MiliUI.Stepper
```


### `Stepper:GetValue()`

Return the current value of this component so your script can use it.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `number` | value |

**Original LuaLS annotations:**

```lua
---@return number value
```


### `Stepper:SetEnabled(enabled)`

Turn player interaction on or off. Pass `true` to enable this component, or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Stepper` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Stepper
```


### `Stepper:OnChange(callback)`

Register a function to run whenever this component's selected option or value changes. This is useful for updating other UI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(value:number, stepper:MiliUI.Stepper)` | — |
| Returns | `MiliUI.Stepper` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(value:number, stepper:MiliUI.Stepper)
---@return MiliUI.Stepper
```


### `Stepper:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.


### `Tabs:GetSelected()`

Return the currently selected choice or selection index, depending on this component.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `integer` | index |

**Original LuaLS annotations:**

```lua
---@return integer index
```


### `Tabs:GetContent(index)`

Returns a persistent tab content container; switching tabs only changes visibility.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | 1-based tab index. |
| Returns | `MiliUI.ContainerControl\|nil` | content |

**Original LuaLS annotations:**

```lua
---@param index integer 1-based tab index.
---@return MiliUI.ContainerControl|nil content
```


### `Tabs:SetItemLabel(index, spec)`

Change the item label setting on this Tabs. Pass the new value shown in the function parameters.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Tabs` | — |

**Original LuaLS annotations:**

```lua
---@param index integer
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Tabs
```


### `Tabs:SetSelected(index, fireEvent)`

Change the current selection. Lua counts list positions starting at `1`, not `0`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `index` | `integer` | — |
| Parameter `fireEvent?` | `boolean` | — |
| Returns | `MiliUI.Tabs` | — |

**Original LuaLS annotations:**

```lua
---@param index integer
---@param fireEvent? boolean
---@return MiliUI.Tabs
```


### `Tabs:SetEnabled(enabled)`

Turn player interaction on or off. Pass `true` to enable this component, or `false` to disable it.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Tabs` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Tabs
```


### `Tabs:OnChange(callback)`

Register a function to run whenever this component's selected option or value changes. This is useful for updating other UI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(index:integer, item:MiliUI.TabItem, tabs:MiliUI.Tabs)` | — |
| Returns | `MiliUI.Tabs` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(index:integer, item:MiliUI.TabItem, tabs:MiliUI.Tabs)
---@return MiliUI.Tabs
```


### `Tabs:Destroy()`

Remove this component from the screen and release the UI controls it created. Do not keep using it after destroying it.
