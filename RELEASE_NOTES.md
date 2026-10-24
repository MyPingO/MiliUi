# MiliUI 0.9.0-beta.4

This update makes controller menus easier to build and fixes problems with scrolling, focus, text sizing, and large lists. **Existing menus still work as before** unless you turn on the new controller system.

## Highlights

- **Controller Navigation V2:** Add `controllerNavigation = "auto"` to a Screen to let MiliUI move focus between Buttons automatically.
- **Right-stick scrolling:** Scroll the list you are using, even with several lists on one screen. If a focused Button scrolls out of view, the focus arrow moves to the scrollbar. Press Left to return.
- **Cleaner focus arrows:** Fewer temporary flashes and less overlap with nearby controls.
- **Faster long lists:** `UI.ListView` performed better in tests with 2,400 rows.
- **Bug fixes:** More reliable Repeater cleanup and safer automatic text height.
- **Editor help (current beta.4 download):** MiliUI IntelliSense **0.1.15** includes controller documentation, settings-table suggestions, and diagnostics for LuaLS skipping oversized runtime files. The runtime version remains beta.4.

## Upgrade and compatibility

**You can upgrade without rewriting your menus.** The new controller behavior starts only when you add `controllerNavigation = "auto"` to a Screen.

Use [Upgrading from beta.3 to beta.4](https://github.com/MyPingO/MiliUI/blob/main/docs/UpgradeBeta4.md) to check compatibility, opt into V2, and test nested scrolling and Page/modal focus.

If upgrading from beta.2 or beta.1, follow the intermediate migration guides in order. Update the runtime and IntelliSense together, and restart Test Play after changing the runtime.

The MiliUI Manager minimum remains **0.2.0**. Its installer creates a backup before replacing the runtime. The bundled starter save may contain an older runtime; check `UI.VERSION` after importing it and update via Manager.

## Native validation

Development testing confirmed the previously failing cases #104–#108 and the Controller V2 stress scenarios in Miliastra Test Play. The validated focus behavior includes nested ScrollAreas and Left return from scrollbar proxies. Automated Lua/controller tests also passed on the integrated development source.

Beta.4 is now published. The release passed development tests and received an in-game controller smoke test before publication. Testing cannot cover every input device, language, or unusual screen layout, so please report problems you find.

## Known limitations

- PC controller safe-area padding and controller focus initialization after a running Test Play switches input mode depend on the Miliastra native engine.
- Fullscreen UI Animation layering and inverted native masks remain native rendering limitations.
- Wrapped-text preferred heights are conservatively estimated, not pixel-exact across all languages.
- Managed navigation may require explicit `UI.Focus.Link` overrides for intentionally unconventional or overlapping controls.

See [Controller Navigation V2](https://github.com/MyPingO/MiliUI/blob/main/docs/ControllerNavigationV2.md), [Controller Support](https://github.com/MyPingO/MiliUI/blob/main/docs/ControllerSupport.md), and [Known Issues](https://github.com/MyPingO/MiliUI/blob/main/KNOWN_ISSUES.md).
