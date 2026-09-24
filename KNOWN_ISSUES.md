# Known Issues

This file tracks issues that are important for public users to know about but are not yet resolved.

## Public beta preparation

### Controller safe-area / inherent padding

Miliastra may apply native safe-area padding to Client UI when using a controller on PC. MiliUI currently respects the native layout rather than applying an unverified compensation.

Further testing across controller users and display configurations is planned before MiliUI attempts automatic compensation.

### Beta API stability

MiliUI is approaching its first public beta. Public APIs are intended to be usable in real projects, but breaking changes may still occur before 1.0 when testing reveals a design problem.

Release notes will call out breaking changes.
