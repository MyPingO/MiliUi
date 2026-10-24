# MiliUI API at a glance

Need to find a Button, screen setting, or Lua function? This page groups MiliUI's **71 top-level `UI.*` functions** by what they do. It matches the beta.4 IntelliSense reference. Use **Ctrl+F** to search for a name, then open its guide for examples. You do not need to memorize this list.

For more details about a function, open the [complete API reference](Reference/README.md). It lists its settings, what goes into it, and what it returns. The [Components guide](Components.md) shows how to use these functions in real examples. Start with the [Quick Start](../QUICK_START.md) if you are new.

## A tiny example

This is part of a Page builder, not a complete script on its own. It assumes that MiliUI is already set up, a Host has been attached, and `parent` is an existing MiliUI container to put controls inside.

```lua
local UI = require("MiliUI/init")
local column = UI.Column(parent, { width = 300, gap = 12 })
local button = UI.Button(column, {
    label = { text = "Play" },
    fillWidth = true,
})
button:OnClick(function()
    print("Play clicked")
end)
```

The `{ ... }` part holds settings (called *props*), such as a Button's label. `button:OnClick(...)` means "run this code when the player clicks the Button." For a complete working script with a Host and `parent`, use the [Quick Start](../QUICK_START.md).

## Which guide should I open?

| I want to... | Start here |
| --- | --- |
| Make a simple screen, text, or button | [Components](Components.md) |
| Put controls side by side or stack them | [Responsive Layout](ResponsiveLayout.md) |
| Scroll a list of buttons | [ScrollArea / ScrollColumn](ScrollArea.md) |
| Make a dropdown | [Dropdown](Dropdown.md) |
| Choose one or several visible options | [Selection](Selection.md) |
| Make a collapsible section | [Accordion](Accordion.md) |
| Show an Alert or Toast message | [Alert / Shell](Components.md#alert--shell) or [ToastManager](Components.md#toastmanager) |
| Change Pages and support Back | [Navigation](Navigation.md) |
| Watch game signals or variables | [Signals and Custom Variables](Subscriptions.md) |
| Support controller focus | [Controller Support](ControllerSupport.md) |
| Create a controller-navigable multi-region menu | [Controller Navigation V2 and upgrade checklist](ControllerNavigationV2.md#upgrading-an-existing-menu) |
| Handle different screen sizes | [Responsive Components](ResponsiveComponents.md) |
| Reuse visual styles | [Theming](Theming.md) |
| Make things animate | [Motion](Motion.md) |
| Upgrade to beta.4 | [beta.4 upgrade guide](UpgradeBeta4.md) |
| Upgrade from beta.2 | [beta.3 migration guide](UpgradeBeta3.md) |
| Upgrade from beta.1 | [beta.2 upgrade guide](UpgradeBeta2.md) |

## Top-level `UI.*` function index

### Setup, cleanup, and text helpers

Shared templates, cleanup, and translated text. [Related guide](Components.md).

`UI.InitTemplates` · `UI.Init` *(deprecated; use `UI.InitTemplates` and `UI.Hosts.Attach` instead)* · `UI.DestroyAll` · `UI.Destroy` · `UI.ResolveText` · `UI.SetText` · `UI.RefreshLocalization`

### Screen and basic display

The visible surface, text, images, and simple visual elements. [Related guide](Components.md).

`UI.Screen` · `UI.Box` · `UI.Image` · `UI.Text` · `UI.Heading` · `UI.Label` · `UI.Caption` · `UI.Icon` · `UI.SurfaceControl` · `UI.Panel` · `UI.Divider` · `UI.Spacer`

### Buttons and basic interactions

Clickable controls and event helpers. [Related guide](Components.md).

`UI.Button` · `UI.IconButton` · `UI.Hitbox` · `UI.Hover` · `UI.Bind` · `UI.BindKeys`

### Layout and positioning

Arrange children or position existing elements. [Related guide](ResponsiveLayout.md).

`UI.Row` · `UI.Column` · `UI.HStack` · `UI.VStack` · `UI.Fan` · `UI.Grid` · `UI.Center`

### Scrolling, dropdowns, and overlays

Scrollable content, dropdowns, tooltips, and popovers. [Related guide](ScrollArea.md).

`UI.ScrollArea` · `UI.ScrollColumn` · `UI.Scrollbar` · `UI.Dropdown` · `UI.Popover` · `UI.Tooltip`

### Lists and repeated data

Render items from changing lists. [Related guide](DataViews.md).

`UI.Repeater` · `UI.ListView`

### Responsive sizes and diagnostics

Adapt the layout to space and inspect sizing problems. [Related guide](ResponsiveFoundation.md).

`UI.Responsive` · `UI.CheckLayout` · `UI.SafeTextHeight` · `UI.SafeTextWindowHeight` · `UI.CheckTextGeometry`

### Timing and animation

Create simple animated changes and delayed callbacks. [Related guide](Motion.md).

`UI.Tween` · `UI.After`

### Ready-made components

Cards, state controls, forms, and feedback overlays. [Related guide](Components.md).

`UI.Card` · `UI.PlayingCard` · `UI.Badge` · `UI.Chip` · `UI.Stat` · `UI.ProgressBar` · `UI.Accordion` · `UI.Slider` · `UI.Selection` · `UI.Toggle` · `UI.Checkbox` · `UI.Stepper` · `UI.Tabs` · `UI.Shell` · `UI.Alert` · `UI.ToastManager` · `UI.Modal`

### Miliastra native controls

Direct wrappers for engine-provided controls. [Related guide](Components.md).

`UI.Native` · `UI.Animation` · `UI.FullscreenAnimation` · `UI.KeyHint` · `UI.TextWindow` · `UI.ScrollText` · `UI.GridScroller`

## Other API groups

These aren't called as `UI.Function(...)`; they are namespaces with their own functions. For example, use `UI.Navigation.Push("Settings")`.

| API group | Purpose | Guide |
| --- | --- | --- |
| `UI.Hosts` | Attach and detach independently owned interfaces | [Hosts](Hosts.md) |
| `UI.Pages` | Register and open logical screens inside a Host | [Pages](Pages.md) |
| `UI.Navigation` | Forward/Back page history | [Navigation](Navigation.md) |
| `UI.Session` | Keep state during the current Lua session | [Session](Session.md) |
| `UI.Signals`, `UI.Variables` | Listen for incoming signals and variable changes | [Subscriptions](Subscriptions.md) |
| `UI.Player` | Get the local Player Entity from a configured Custom Variable | [Player](Player.md) |
| `UI.Theme`, `UI.Style`, `UI.Surface` | Appearance, shared tokens, and styling | [Theming](Theming.md) |
| `UI.Motion` | Reusable animation effects | [Motion](Motion.md) |
| `UI.Layout`, `UI.ResponsiveLayout` | Positioning and responsive rules | [Responsive Foundation](ResponsiveFoundation.md) |
| `UI.Localization` | Translated text support | [Localization](Localization.md) |
| `UI.Audio`, `UI.Interaction` | UI sound and cursor interaction | [Components](Components.md) |
| `UI.Diagnostics`, `UI.TextMetrics` | Inspect overflow and measure text | [Text Geometry](TextGeometry.md) |

**For newcomers:** You do not need to learn all these at once. Start with `UI.Screen`, `UI.Column`, `UI.Text`, and `UI.Button`. Add Pages or Navigation only when your interface needs multiple screens.
