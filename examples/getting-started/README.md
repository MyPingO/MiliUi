# Getting Started Examples

These examples are deliberately small and are intended to be read in order.

1. **MiliUIGlobal.lua** — recommended shared template setup, optional project-wide Button audio, and the optional Player-registration hook.
2. **HelloMiliUI.lua** — the barebones first interface: Host, Screen, intrinsic Column, Heading, and Button.
3. **PolishedHelloMiliUI.lua** — the same idea with localization fallback text, semantic styling, shared sound, controller-ready input, and diagnostics-friendly names.
4. **SimpleMenu.lua** — a small localized vertical menu using fit-content Buttons with a useful minimum width.
5. **SimpleSettings.lua** — a small form showing when fixed control width is intentional rather than accidental.

The examples intentionally prefer MiliUI's higher-level layout features over manual coordinate arithmetic:

- text uses `fitWidth` when its rectangle should follow content;
- Buttons use `fitContent` when their label should determine size;
- Rows/Columns use content fitting and gaps instead of hand-positioning every child;
- explicit dimensions remain appropriate when the design itself requires a shared width/height, such as a settings form or data viewport.

Read the [Quick Start](../../QUICK_START.md) first for the editor setup, complete Client UI template list, and a block-by-block explanation of the starter code.
