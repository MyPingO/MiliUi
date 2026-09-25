# Known Issues

This file tracks issues that are important for public users to know about but are not yet resolved.

## Public beta

### Controller safe-area / inherent padding

Miliastra may apply native safe-area padding to Client UI when using a controller on PC. MiliUI currently respects the native layout rather than applying an unverified compensation.

This behavior appears to come from the host UI itself rather than MiliUI. More testing across controller users and display configurations is needed before MiliUI attempts automatic compensation.

### Inverted native masks

The current Miliastra host has a known issue with `reverseMaskArea = true`: inverted masking does not reliably detect opaque pixels.

Normal masking remains supported. MiliUI does not emulate an inverted mask in Lua because that would not match the native rendering/input behavior reliably.

### Wrapped text height is estimated

Miliastra does not expose a documented native preferred wrapped-text height. MiliUI's `TextWindow fitContentHeight` therefore uses a conservative estimate.

For text where clipping would be a correctness failure, use a native wrapping TextWindow inside flexible/explicit bounds or a scrolling layout. `fitContentHeightInsetX` can reserve additional wrapping space when a font/style wraps earlier than the estimate.

### Beta API stability

MiliUI's public APIs are intended for real projects, but breaking changes may still occur before 1.0 when public testing reveals a design problem.

Release notes will call out breaking changes.
