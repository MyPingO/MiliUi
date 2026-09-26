# Getting Started Examples

These examples are deliberately small and are intended to be read in order.

1. **MiliUIGlobal.lua** — shared MiliUI setup used by all interfaces, plus optional project-wide Button audio and Player registration.
2. **HelloMiliUI.lua** — the smallest first interface: Host, Screen, Column, Heading, and Button.
3. **PolishedHelloMiliUI.lua** — the same idea with localization, shared sound, controller-ready input, clearer control names, and theme-based Button styling.
4. **SimpleMenu.lua** — a small localized vertical menu using fit-content Buttons with a useful minimum width.
5. **SimpleSettings.lua** — a small form showing when fixed control width is intentional rather than accidental.

The examples prefer MiliUI's layout helpers instead of manually calculating the position of every control:

- text uses `fitWidth` when the text box should grow with the text;
- Buttons use `fitContent` when the label should decide the Button's size;
- Rows and Columns use automatic sizing and `gap` instead of manually positioning every child;
- fixed width/height values are still useful when the design actually calls for them, such as a settings form or data area.

Complete [Installation + Setup](../../docs/Installation.md) first, then read the [Quick Start](../../QUICK_START.md) for the block-by-block first-interface walkthrough.
