# Frequently Asked Questions

## Is MiliUI open source?

No. MiliUI is publicly distributed for use in Miliastra projects, but the readable framework development source is private.

The public repository contains releases, documentation, examples, and issue tracking.

## Can I use MiliUI in my own Miliastra project?

Yes, subject to the [MiliUI License](../LICENSE). Official MiliUI releases may be used in Miliastra projects, including published and monetized projects.

## Can I fork MiliUI or publish my own modified MiliUI?

The MiliUI license does not grant permission to redistribute, republish, repackage, or publish modified/forked versions of MiliUI itself.

You remain free to write and modify your own game/UI code that uses MiliUI.

## Why keep the framework source private?

MiliUI is intended to remain one maintained framework with one official release/update path rather than fragment into incompatible forks. Public feedback and contributions can still influence the framework through Discord, Issues, documentation, and examples.

## Do I have to use MiliUI Manager?

No.

MiliUI Manager is the recommended installer/updater because it detects projects, creates backups, and verifies official runtime downloads.

Advanced users can manually install the production `init.lua` release artifact.

## What does MiliUI Manager change?

For a normal managed install it replaces only:

```text
external_lua_file/MiliUI/
```

with the official production runtime after backing up an existing MiliUI folder.

It does not intentionally modify unrelated project files.

## Does every runtime update require a new Manager?

No. The Manager checks the official release manifest and can download newer verified MiliUI runtimes.

A new Manager is only required when Manager behavior itself changes or a runtime release explicitly raises the minimum supported Manager version.

## Where should I ask questions?

General questions, setup help, feedback, and early feature ideas should go to the Miliastra creator Discord.

Confirmed bugs and concrete feature work can be tracked with GitHub Issues.

## Can I contribute?

Yes, but framework source development remains private.

Public contributions may include documentation corrections and public example improvements. Bug reports and feature proposals are also useful. See [CONTRIBUTING.md](../CONTRIBUTING.md).
