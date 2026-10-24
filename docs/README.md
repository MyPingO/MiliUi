# MiliUI Documentation

## Where to start

Pick the path that matches what you want to do:

| I want to... | Open this |
| --- | --- |
| Start a new project quickly | [Installation + Setup](Installation.md), then the [Quick Start](../QUICK_START.md) |
| Learn by changing a working script | [Getting Started Examples](../examples/getting-started/README.md) |
| Add a Button, Slider, or other control | [Components](Components.md) |
| Make a menu that works with a controller | [Controller Navigation V2](ControllerNavigationV2.md) |
| Update an older MiliUI project | [Upgrade to beta.4](UpgradeBeta4.md) (read earlier upgrade guides if needed) |
| Find one function or setting | [API at a glance](APIAtAGlance.md) |

**New to Lua?** Start with the Quick Start and try changing the Button text. You can come back to the longer reference pages when you need them. For editor assistance, [MiliUI IntelliSense v0.1.15](IntelliSense.md) explains autocomplete, settings tables, and how to diagnose oversized Lua files.

## A few terms worth knowing

MiliUI uses some names from the Miliastra editor. You do not need to memorize these, but knowing the difference makes the examples easier to follow.

| Term | What it means |
| --- | --- |
| **Control Group** | A complete UI that Miliastra can show or remove, such as a menu or HUD. |
| **Client Control Container** | The part of that UI where your MiliUI controls and Lua script live. |
| **UI Controller** | The Lua script that builds the UI when it appears and cleans it up when it closes. |
| **UI Index** | The number assigned to the Control Group's Server Template in the editor. |
| **Host** | The name MiliUI uses to keep one UI separate from another, such as `"Menu"` and `"HUD"`. |
| **Page** | A logical screen inside a Host, such as Settings or Inventory. One Host can contain several Pages. |
| **Props** | Settings inside `{ ... }` that tell a control what to look like or do, such as `width` or `text`. |

See [Control Groups and Hosts](ControlGroups.md) for a diagram showing how these parts fit together.

**Need every setting or function?** Use the [complete API reference](Reference/README.md). It is a lookup book, not a guide you need to read from start to finish. You do not need VS Code to browse it.

## Building interfaces

- [Intrinsic and Localization-Safe Sizing](IntrinsicSizing.md)
- [Text Geometry](TextGeometry.md)
- [Responsive Layout](ResponsiveLayout.md)
- [Responsive Foundation](ResponsiveFoundation.md)
- [Responsive Components](ResponsiveComponents.md)
- [Theming](Theming.md)
- [Motion](Motion.md)
- [Localization](Localization.md)
- [ScrollArea](ScrollArea.md)
- [Scrollbar](Scrollbar.md)
- [Dropdown](Dropdown.md)
- [Accordion](Accordion.md)
- [Selection](Selection.md)
- [Anchored Overlays](AnchoredOverlays.md)
- [Masking](Masking.md)
- [Data Views](DataViews.md)
- [Controller Support](ControllerSupport.md)
- [Controller Navigation V2](ControllerNavigationV2.md)

## Application structure

- [Project Structure](ProjectStructure.md)
- [Hosts](Hosts.md)
- [Pages](Pages.md)
- [Navigation](Navigation.md)
- [Session](Session.md)
- [Server Signals and Custom Variables](Subscriptions.md)
- [Runtime Lifecycle](RuntimeLifecycle.md)
- [Player Context](Player.md)
- [Common Mistakes](CommonMistakes.md)

## Releases and tooling

- [Versioning](Versioning.md)
- [Upgrading from beta.2 to beta.3](UpgradeBeta3.md)
- [Upgrading from beta.3 to beta.4](UpgradeBeta4.md)
- [MiliUI Manager](Manager.md)
- [IntelliSense](IntelliSense.md)

## Help

- [FAQ](FAQ.md)
- [Known Issues](../KNOWN_ISSUES.md)
- [Support and Bug Reports](../SUPPORT.md)
