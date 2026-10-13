# API reference: Components Feedback

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `components_feedback.lua`  
**Coverage:** 9 classes, 106 fields, 0 aliases, 17 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [Components](../Components.md) · [Theming](../Theming.md)

## Classes, component props and return types

### `MiliUI.ShellProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `name?` | `string` | Optional name for this decorative background/outline. Useful when debugging. |
| `image?` | `integer` | Optional image asset ID to use for this decorative shape. Usually MiliUI chooses one for you. |
| `matchAsset?` | `integer` | Image asset ID whose rounded shape should match this decoration. Usually leave it out so MiliUI picks the shape automatically. |
| `radius?` | `MiliUI.Radius` | Used when matchAsset is omitted. |
| `mode?` | `MiliUI.ShellMode` | Choose the look of this decoration: `'gradient'` gives a filled fade, while `'outline'`, `'border'`, or `'half-border'` use an outline-style asset. |
| `width?` | `MiliUI.Dimension` | Width of this decoration. Example: `width = 200` means 200 UI units, while `'100%'` requests all available width. |
| `height?` | `MiliUI.Dimension` | Height of this decoration. Example: `height = 100` means 100 UI units, while `'100%'` requests all available height. |
| `align?` | `'left'\|'center'\|'right'` | Position this decoration toward the left, center, or right of its available area. Example: `align = 'center'`. |
| `verticalAlign?` | `'top'\|'center'\|'bottom'` | Move the decorative shell to the top, center, or bottom of its available area. |
| `insetX?` | `number` | Move the decoration inward from its left/right aligned position, in UI units. |
| `insetY?` | `number` | Move the decoration inward from its top/bottom aligned position, in UI units. |
| `x?` | `number` | Explicit X overrides automatic alignment. |
| `y?` | `number` | Explicit Y overrides automatic alignment. |
| `color?` | `MiliUI.ColorValue` | Color applied to this visual element. Example: `'white'` or `'accent'`. |
| `opacity?` | `number` | How visible the decorative shell is: `0` makes it transparent and `1` fully visible; values above 1 are treated as percentages. |

### `MiliUI.AlertProps`

**Inherits from:** [`MiliUI.SurfaceProps`](aliases.md#miliuisurfaceprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `title?` | `MiliUI.TextSpec` | Short heading at the top of the message box. Example: `title = { text = 'Connection Lost' }`. |
| `message?` | `MiliUI.TextSpec` | Main explanation shown below the title. Example: `message = { text = 'Please reconnect.' }`. |
| `variant?` | `MiliUI.AlertVariant` | Message style: `'info'` for general information, `'success'` for completed actions, `'warning'` for caution, or `'danger'` for errors. |
| `titleSize?` | `MiliUI.TextSize` | Font size of the Alert heading, which appears above the message. Default: `'sm'` (small); `title = { size = ... }` overrides it. |
| `titleColor?` | `MiliUI.ColorValue` | Color of the Alert heading. Example: `titleColor = 'text'`. A color inside `title` takes priority. |
| `titleAdaptiveFontSize?` | `boolean` | Let the Alert heading shrink when it does not fit. Default: `true`, unless overridden inside `title`. |
| `minimumTitleFontSize?` | `number` | Smallest font size the Alert heading is allowed to shrink to. Default: `16`. |
| `textSize?` | `MiliUI.TextSize` | Font size of the Alert's main message. Default: `'xs'` (extra small); a size inside `message` takes priority. |
| `textColor?` | `MiliUI.ColorValue` | Color of the Alert message. Example: `textColor = 'text'`. A color inside `message` takes priority. |
| `adaptiveFontSize?` | `boolean` | Let the Alert's main message shrink when space is limited. Default: `false`, so longer messages keep their intended font size. |
| `minimumFontSize?` | `number` | Smallest font size the Alert message may shrink to when automatic text resizing is enabled. Default: `16`. |
| `textInset?` | `number` | Empty space between the text part and its surrounding edge. |
| `shellImage?` | `integer` | Optional explicit shell/accent asset applied after the normal matching shell is created. |
| `shellStretch?` | `boolean` | Shell-image stretch mode. Default true. |
| `shellMode?` | `MiliUI.ShellMode` | Appearance of the decorative shape around the Alert. Default: `'outline'`. |
| `shellWidth?` | `MiliUI.Dimension` | Width of the Alert's decorative outline or background. Default: `'100%'` of the available width. |
| `shellHeight?` | `MiliUI.Dimension` | Height of the Alert's decorative outline or background. Default: `'100%'` of the available height. |
| `shellOpacity?` | `number` | How visible the Alert decoration is: `1` is fully visible, `0` is invisible. Default: `1`. |
| `shellColor?` | `MiliUI.ColorValue` | Color of the decorative Alert shape. Example: `shellColor = 'accent'`. |
| `shellAlign?` | `'left'\|'center'\|'right'` | Where the decorative shell is placed horizontally: left, center, or right. |
| `shellVerticalAlign?` | `'top'\|'center'\|'bottom'` | Where the decorative shell is placed vertically: top, center, or bottom. |
| `shellInsetX?` | `number` | Horizontal empty space around the shell part, in UI units. |
| `shellInsetY?` | `number` | Vertical empty space around the shell part, in UI units. |
| `accentMode?` | `MiliUI.ShellMode` | Older name for `shellMode`. Prefer `shellMode` for new code. |
| `accentWidth?` | `MiliUI.Dimension` | Older name for `shellWidth`. Prefer `shellWidth` for new code. |
| `accentHeight?` | `MiliUI.Dimension` | Older name for `shellHeight`. Prefer `shellHeight` for new code. |
| `accentOpacity?` | `number` | Older name for `shellOpacity`. Prefer `shellOpacity` for new code. |
| `accentColor?` | `MiliUI.ColorValue` | Older name for `shellColor`. Prefer `shellColor` for new code. |
| `accentInset?` | `number` | Older name for `shellInsetX`. Prefer `shellInsetX` for new code. |
| `accentVerticalInset?` | `number` | Older name for `shellInsetY`. Prefer `shellInsetY` for new code. |

### `MiliUI.Alert`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `panel` | `MiliUI.Panel` | Visual panel that draws the component's background and border. |
| `shell` | `MiliUI.ImageControl` | Automatically matched or explicitly skinned colored shell. |
| `accent` | `MiliUI.ImageControl` | Compatibility alias for shell. |
| `title` | `MiliUI.TextControl` | Text control used to show this component's heading. |
| `message` | `MiliUI.TextControl` | Text control used to show this component's message. |

### `MiliUI.ToastOptions`

**Inherits from:** [`MiliUI.AlertProps`](components_feedback.md#miliuialertprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `duration?` | `number` | How many seconds this short popup stays onscreen before disappearing. Example: `duration = 3`. |

### `MiliUI.Toast`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `alert` | `MiliUI.Alert` | The Alert component displayed inside this temporary notification. |

### `MiliUI.ToastManagerProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `width?` | `MiliUI.Dimension` | Width of the area that holds on-screen notifications, in UI units. Default: `380`; notifications fill this width. |
| `height?` | `MiliUI.Dimension` | Height of the area where short on-screen notifications are placed, in UI units. Default: `520`. |
| `toastHeight?` | `number` | Amount of vertical space reserved for each short on-screen notification, in UI units. |
| `gap?` | `number` | Space between multiple notifications while they are stacked onscreen. |
| `duration?` | `number` | Default number of seconds each small popup stays visible. Example: `duration = 3`. |
| `entryOffsetX?` | `number` | Horizontal distance a new toast travels from the manager's anchored side. Default 28. |
| `transitionDuration?` | `number` | Time, in seconds, for a notification to slide into place and for existing notifications to move. Default: `Theme.motion.normal`. |
| `fadeDuration?` | `number` | Time, in seconds, for a notification to fade out when dismissed. Default: `Theme.motion.fast`. |
| `spawnOffsetY?` | `number` | Deprecated compatibility alias for entryOffsetX. |

### `MiliUI.ToastManager`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Underlying Miliastra UI control for this component. |
| `entries` | `table[]` | Created UI entries corresponding to the displayed data. |

### `MiliUI.ModalProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `width?` | `MiliUI.Dimension` | Dialog width. Default 560. Percentage values resolve against the overlay root. |
| `height?` | `MiliUI.Dimension` | Dialog height. Default 360. Percentage values resolve against the overlay root. |
| `overlayWidth?` | `MiliUI.Dimension` | Overlay/input-blocker width. Default '100%' of the resolved parent. |
| `overlayHeight?` | `MiliUI.Dimension` | Overlay/input-blocker height. Default '100%' of the resolved parent. |
| `overlayColor?` | `MiliUI.ColorValue` | Color of the screen-dimming layer behind the dialog. Example: choose a semi-transparent dark color. |
| `overlayImage?` | `integer` | Optional image asset ID for the dimmed background behind a modal dialog. |
| `overlayStretch?` | `boolean` | Stretch the image behind the dialog to cover its full overlay area. Default: `true`. |
| `background?` | `MiliUI.ColorValue` | Background color of the popup dialog's main card. Example: `background = 'surface'`. |
| `backgroundImage?` | `integer` | Optional image asset ID for the popup dialog's card background. |
| `backgroundStretch?` | `boolean` | Stretch the popup dialog's card background image to fit its size. Default: `true`. |
| `borderColor?` | `MiliUI.ColorValue` | Color used for the border appearance of this modal. Example: `'accent'` or `'white'`. |
| `borderImage?` | `integer` | Optional image asset ID used as the popup dialog's outline. |
| `borderStretch?` | `boolean` | Stretch the image used for the dialog's outline. Default: `true`. |
| `border?` | `boolean` | Choose whether to draw an outline around the popup dialog. Example: `border = true`. |
| `radius?` | `MiliUI.Radius` | Roundness of the corners. Example: `'lg'` or `'none'`. |
| `title?` | `MiliUI.TextSpec` | Heading displayed at the top of the popup dialog. Example: `title = { text = 'Are you sure?' }`. |
| `titleSize?` | `MiliUI.TextSize` | Font size of the popup dialog's heading. A size inside `title` takes priority. |
| `titleAdaptiveFontSize?` | `boolean` | Let the popup dialog's heading shrink when it is too wide. Default: `true`. |
| `minimumTitleFontSize?` | `number` | Smallest font size the popup dialog's heading may shrink to. Default: `16`. |
| `closeLabel?` | `MiliUI.TextSpec` | Explicit text override for the close control. Omit to use an image icon. |
| `closeLabelWidth?` | `number` | Width reserved for a text close control. Default 96. |
| `closeLabelTextSize?` | `MiliUI.TextSize` | Font size of a text-based Close Button, when `closeLabel` is used. Default: `'sm'`. |
| `minimumCloseLabelFontSize?` | `number` | Adaptive-font floor for a text close control. Default 12. |
| `closeIcon?` | `integer` | Close icon asset. Default `UI.Theme.assets.close` (100101). |
| `closeIconSize?` | `number` | Width and height of the popup's close-icon image, in UI units. Default: `18`. |
| `closeIconColor?` | `MiliUI.ColorValue` | Color of the popup's close-icon image. Default: `'muted'`. |
| `contentY?` | `number` | Vertical position or offset for content, in UI units. |
| `contentWidth?` | `MiliUI.Dimension` | Optional dialog-content width. Default dialog width minus 48 UI units. |
| `contentHeight?` | `MiliUI.Dimension` | Optional dialog-content height. Default dialog height minus 108 UI units. |
| `open?` | `boolean` | Whether the dialog starts visible (`true`) or hidden (`false`). |
| `closeOnBackdrop?` | `boolean` | Click the darkened area outside the dialog to close it when true. Useful for dismissible popups; set false for required decisions. |
| `onOpen?` | `fun(modal:MiliUI.Modal)` | Run a function after this dialog opens. Example: `onOpen = function(modal) print('Dialog opened') end`. |
| `onClose?` | `fun(modal:MiliUI.Modal)` | Run a function after this dialog closes. Example: `onClose = function(modal) print('Dialog closed') end`. |

### `MiliUI.Modal`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | Outer container of the entire popup, including its dimmed background. |
| `overlay` | `MiliUI.ImageControl` | Image control that darkens the UI behind the popup so the dialog stands out. |
| `blocker` | `MiliUI.Hitbox` | Full-screen input blocker preventing click-through. |
| `card` | `MiliUI.Panel` | Main panel of the popup dialog, where its heading and other content appear. |
| `title` | `MiliUI.TextControl` | Text control used to show this component's heading. |
| `closeButton` | `MiliUI.Button` | Button that closes this popup when pressed. |
| `closeIcon` | `MiliUI.ImageControl` | Default close icon image; hidden when a text closeLabel is active. |
| `content` | `MiliUI.ContainerControl` | Build arbitrary MiliUI controls here. |

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `Alert:SetMessage(spec)`

Change the message setting of this Alert.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Alert` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Alert
```


### `Alert:SetTitle(spec)`

Change the heading text shown by this component.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Alert` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Alert
```


### `Alert:SetVisible(visible)`

Change the visible setting of this Alert.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `visible` | `boolean` | — |
| Returns | `MiliUI.Alert` | — |

**Original LuaLS annotations:**

```lua
---@param visible boolean
---@return MiliUI.Alert
```


### `Alert:Destroy()`

Remove this component from the UI and release its controls.


### `Toast:Close()`

Close or hide this popup.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Toast` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Toast
```


### `ToastManager:Show(options)`

Creates a notification. `title` and `message` use the same TextSpec shape as Alert.
```lua
toasts:Show({
title = { text = 'SAVED', textId = 'Toast.Saved.Title' },
message = { text = 'Settings updated.', textId = 'Toast.Saved.Message' },
variant = 'success',
duration = 3,
})
```

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `options` | `MiliUI.ToastOptions\|string` | — |
| Returns | `MiliUI.Toast` | — |

**Original LuaLS annotations:**

```lua
---@param options MiliUI.ToastOptions|string
---@return MiliUI.Toast
```


### `ToastManager:Clear()`

Remove the currently selected items, list entries, or notifications, depending on this component.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.ToastManager` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.ToastManager
```


### `ToastManager:Destroy()`

Remove this component from the UI and release its controls.


### `Modal:IsOpen()`

Return `true` if this popup is currently open, otherwise `false`.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `boolean` | open |

**Original LuaLS annotations:**

```lua
---@return boolean open
```


### `Modal:Open()`

Show this popup.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Modal` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Modal
```


### `Modal:Close()`

Close or hide this popup.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Modal` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Modal
```


### `Modal:SetTitle(spec)`

Change the heading text shown by this component.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Modal` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Modal
```


### `Modal:SetCloseLabel(spec)`

Switches the close control to explicit text and uses the text-close geometry.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `spec` | `MiliUI.TextSpec\|any` | — |
| Returns | `MiliUI.Modal` | — |

**Original LuaLS annotations:**

```lua
---@param spec MiliUI.TextSpec|any
---@return MiliUI.Modal
```


### `Modal:SetCloseIcon(image)`

Switches the close control to an image asset and restores the compact icon geometry.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `image?` | `integer` | Defaults to UI.Theme.assets.close. |
| Returns | `MiliUI.Modal` | — |

**Original LuaLS annotations:**

```lua
---@param image? integer Defaults to UI.Theme.assets.close.
---@return MiliUI.Modal
```


### `Modal:OnOpen(callback)`

Register a function that runs when this popup opens.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(modal:MiliUI.Modal)` | — |
| Returns | `MiliUI.Modal` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(modal:MiliUI.Modal)
---@return MiliUI.Modal
```


### `Modal:OnClose(callback)`

Register a function that runs when this popup closes.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(modal:MiliUI.Modal)` | — |
| Returns | `MiliUI.Modal` | — |

**Original LuaLS annotations:**

```lua
---@param callback fun(modal:MiliUI.Modal)
---@return MiliUI.Modal
```


### `Modal:Destroy()`

Remove this component from the UI and release its controls.
