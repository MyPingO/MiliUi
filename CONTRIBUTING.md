# Contributing to MiliUI

MiliUI's framework development source is private. The public repository exists for releases, documentation, examples, feedback, and issue tracking.

## Good public contributions

Public pull requests may be considered for:

- documentation corrections;
- clearer setup instructions;
- reproducible example improvements;
- typo fixes;
- public example projects or snippets that fit the existing API.

Please discuss substantial documentation/example changes before spending significant time on them.

## Framework changes

Framework bugs and feature requests should be reported through Discord or GitHub Issues. The MiliUI maintainer will implement framework-source changes in the private development repository.

Do not submit copied, reconstructed, reverse-engineered, or independently repackaged MiliUI runtime code.

## Contribution license

By submitting a contribution, you agree to the contribution terms in the [MiliUI License](LICENSE), including permission for the MiliUI maintainer to modify and incorporate the submission into MiliUI and its documentation.

## Style for examples

Public examples should:

- use `local UI = require("MiliUI/init")`;
- use current public APIs only;
- keep the first example focused on one concept;
- include proper Host detach cleanup;
- avoid unexplained internal/private fields;
- avoid relying on undocumented implementation behavior.
