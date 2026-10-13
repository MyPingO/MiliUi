# MiliUI Documentation

## Where to start

- **New to MiliUI?** Follow [Installation + Setup](Installation.md), then the illustrated [Quick Start](../QUICK_START.md). No previous Lua experience is assumed.
- **Using the starter save?** Open the [Getting Started Examples](../examples/getting-started/README.md) to understand and modify the example UI.
- **Already using beta.1?** Follow the [beta.2 upgrade checklist](UpgradeBeta2.md), especially if you used the old `UI.Player` registration functions.
- **Looking for a component or function?** Use [API at a glance](APIAtAGlance.md) or the practical [Components reference](Components.md).
- **Want code to copy and adapt?** Browse [all available public examples](../examples/README.md).

## A few terms worth knowing

MiliUI uses some names from the Miliastra editor. You do not need to memorize these, but knowing the difference makes the examples easier to follow.

| Term | What it means |
| --- | --- |
| **Control Group** | An interface that the game can create or remove using Miliastra's server logic. |
| **Client Control Container** | The part of a Control Group that contains the client-side UI controls and their attached scripts. |
| **UI Controller** | A client Lua script attached to that container. It tells MiliUI what to show and cleans up when the container disappears. |
| **UI Index** | The number assigned to the Control Group's Server Template in the editor. |
| **Host** | MiliUI's name for one attached UI root. It keeps that interface separate from others, such as a HUD and a menu. |
| **Page** | A logical screen inside a Host, such as Settings or Inventory. One Host can contain several Pages. |
| **Props** | Settings passed to a component when you create it, such as `width`, `text`, or `gap`. |

See [Control Groups and Hosts](ControlGroups.md) for a diagram showing how these parts fit together.

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
- [MiliUI Manager](Manager.md)
- [IntelliSense](IntelliSense.md)

## Help

- [FAQ](FAQ.md)
- [Known Issues](../KNOWN_ISSUES.md)
- [Support and Bug Reports](../SUPPORT.md)
