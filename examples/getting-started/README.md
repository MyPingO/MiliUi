# Getting Started Examples

These examples are deliberately small and are intended to be read in order.

1. **[MiliUIGlobal.lua](MiliUIGlobal.lua):** shared MiliUI setup for all interfaces, with optional Button sounds and Player Entity lookup.
2. **[HelloMiliUI.lua](HelloMiliUI.lua):** a simple first interface with a Host, Screen, Column, Heading, and Button.
3. **[PolishedHelloMiliUI.lua](PolishedHelloMiliUI.lua):** the first interface with translated text, shared sounds, controller input, and themed Buttons.
4. **[SimpleMenu.lua](SimpleMenu.lua):** a vertical menu with translated labels and Buttons that size themselves to fit their text.
5. **[SimpleSettings.lua](SimpleSettings.lua):** a settings screen with a Toggle and Slider that share the same width.

The examples prefer MiliUI's layout helpers instead of manually calculating the position of every control:

- text uses `fitWidth` when the text box should grow with the text;
- Buttons use `fitContent` when the label should decide the Button's size;
- Rows and Columns use automatic sizing and `gap` instead of manually positioning every child;
- fixed width/height values are still useful when the design actually calls for them, such as a settings form or data area.

Complete [Installation + Setup](../../docs/Installation.md) first, then read the [Quick Start](../../QUICK_START.md) for the block-by-block first-interface walkthrough.
