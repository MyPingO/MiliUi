# MiliUI 0.9.0-beta.3

This beta consolidates MiliUI's choice components around `UI.Selection` and `UI.Dropdown`. **It is a breaking beta** for projects using the removed constructors.

## Highlights

- `UI.Selection` replaces both `UI.SegmentedControl` and `UI.MultipleChoiceWindow`. It supports visible single-choice and multiple-choice groups, custom item rendering, and an optional compact `appearance = "segmented"` style.
- `UI.Dropdown` replaces `UI.Select` for collapsible single-choice menus, retaining the overlay, scrolling, and controller handling documented for the new constructor.
- Updated LuaLS / IntelliSense declarations, component examples, and reference documentation for the consolidated APIs.
- MiliUI IntelliSense 0.1.9 accompanies this runtime because the constructors and API signatures changed.

## Breaking changes

The following constructors are **removed** and are not compatibility aliases:

| beta.2 | beta.3 |
| --- | --- |
| `UI.SegmentedControl(parent, props)` | `UI.Selection(parent, { mode = "single", appearance = "segmented", ... })` |
| `UI.MultipleChoiceWindow(parent, props)` | `UI.Selection(parent, { mode = "multiple", ... })` |
| `UI.Select(parent, props)` | `UI.Dropdown(parent, props)` |

For `UI.Selection`, `mode = "single"` returns a single 1-based index (or `nil` when selection is optional), while `mode = "multiple"` returns an ascending array of 1-based indices. Their change and submit callbacks use matching scalar or array values. Single mode defaults to `required = true`; set `required = false` for optional selection. The segmented appearance does not require the old `SegmentedControl` constructor.

Do not perform a blind text replacement: review `selected`, any older `selectedIndex` usage, callbacks, item metadata, selection limits, and automatic ServerSignal submit field types. See [Upgrading from beta.2 to beta.3](https://github.com/MyPingO/MiliUI/blob/main/docs/UpgradeBeta3.md) for working before/after examples.

## Installation and upgrade

Use MiliUI Manager to back up and update the runtime in a test copy of your project, then restart Test Play. If you install IntelliSense manually, update its VSIX separately; changing the runtime alone does not change your editor declarations.

The Manager minimum version remains 0.2.0. This release packages the **refreshed starter `.gil`** uploaded to the public beta.2 release, verified against its pinned SHA-256. After importing the starter, check the installed `MiliUI/init.lua` runtime version and upgrade to beta.3 if necessary.

## Validation

The beta.3 release candidate passed automated runtime, Manager, IntelliSense, metadata, and packaging checks. The interactive Miliastra Test Play lab was also exercised successfully, including Selection, Dropdown, controller navigation, and page lifecycle behavior.

For projects upgrading from beta.2, use a disposable Miliastra project to confirm fresh setup, Manager backup and upgrade behavior, nested ScrollArea/Accordion interactions, Modal, Pages/Navigation, and Host cleanup.

## Known limitations

Native PC controller safe-area padding and focus initialization while a Test Play level is already running are Miliastra engine limitations. Native fullscreen animation layering, inverted native masks, and estimated wrapped-text heights also remain limitations. Navigation does not automatically restore controller focus or scroll position.

For API details, see [Selection](https://github.com/MyPingO/MiliUI/blob/main/docs/Selection.md), [Dropdown](https://github.com/MyPingO/MiliUI/blob/main/docs/Dropdown.md), and [Controller Support](https://github.com/MyPingO/MiliUI/blob/main/docs/ControllerSupport.md).
