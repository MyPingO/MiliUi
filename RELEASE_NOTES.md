# MiliUI 0.9.0-beta.4

This release adds **opt-in automatic controller navigation** and consolidates a series of native Miliastra stability fixes. Existing Screens retain legacy behavior unless they enable V2.

## Highlights

- **Controller Navigation V2:** `UI.Screen(..., { controllerNavigation = "auto" })` centrally owns directional focus, uses the UI hierarchy for adjacent regions, and exposes `UI.Focus` operations for explicit exceptions and diagnostics.
- **Reliable ScrollArea focus:** Right-stick scrolling remains within nested/adjacent lists; the actual native focus and chevron transfer from an offscreen row to a scrollbar proxy. Press Left to return to the correct list.
- **Improved focus visuals:** Reduced transient chevron flicker; better collision avoidance for inside focus indicators.
- **ListView performance:** Native 2,400-row repeated-jump testing confirmed that prior progressive lag is no longer apparent after virtualization and cleanup optimizations.
- **Stability fixes:** Safer Repeater destruction during live reconciliation and correct intrinsic height for `UI.Text` when given unsupported `fitContentHeight`.
- **Editor support:** MiliUI IntelliSense **0.1.10** adds current Controller V2 APIs, return types, and focus/ScrollArea guidance.

## Upgrade and compatibility

**No global controller migration is required.** Existing UIs continue working under legacy navigation unless you explicitly opt a Screen into managed V2.

Use [Upgrading from beta.3 to beta.4](https://github.com/MyPingO/MiliUI/blob/main/docs/UpgradeBeta4.md) to check compatibility, opt into V2, and test nested scrolling and Page/modal focus.

If upgrading from beta.2 or beta.1, follow the intermediate migration guides in order. Update the runtime and IntelliSense together, and restart Test Play after changing the runtime.

The MiliUI Manager minimum remains **0.2.0**. Its installer creates a backup before replacing the runtime. The bundled starter save may contain an older runtime; check `UI.VERSION` after importing it and update via Manager.

## Native validation

Development testing confirmed the previously failing cases #104–#108 and the Controller V2 stress scenarios in Miliastra Test Play. The validated focus behavior includes nested ScrollAreas and Left return from scrollbar proxies. Automated Lua/controller tests also passed on the integrated development source.

**Release candidate validation is still required** before publication: verify the exact production bundle and IntelliSense package produced for beta.4 and repeat a Controller-start smoke test. No claim is made that every input device, localization, or overlapping layout has been exhaustively tested.

## Known limitations

- PC controller safe-area padding and controller focus initialization after a running Test Play switches input mode depend on the Miliastra native engine.
- Fullscreen UI Animation layering and inverted native masks remain native rendering limitations.
- Wrapped-text preferred heights are conservatively estimated, not pixel-exact across all languages.
- Managed navigation may require explicit `UI.Focus.Link` overrides for intentionally unconventional or overlapping controls.

See [Controller Navigation V2](https://github.com/MyPingO/MiliUI/blob/main/docs/ControllerNavigationV2.md), [Controller Support](https://github.com/MyPingO/MiliUI/blob/main/docs/ControllerSupport.md), and [Known Issues](https://github.com/MyPingO/MiliUI/blob/main/KNOWN_ISSUES.md).
