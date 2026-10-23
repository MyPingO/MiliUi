# MiliUI

MiliUI helps you build **menus, Buttons, text, and other game screens** in Miliastra Wonderland using Lua. You write what you want the interface to show, and MiliUI creates the controls and helps them work together. It also provides tools for scrolling, controller support, screen sizes, and more.

> **Public Beta: v0.9.0-beta.4**
>
> MiliUI is available for real Miliastra creator testing. This repository is the public home for releases, documentation, examples, and issue tracking. The framework's development source remains private.

## Start here

**Making your first MiliUI screen?** Follow these three steps in order:

1. **Set up MiliUI:** [Installation + Setup](docs/Installation.md) shows how to install it. If you are starting a new game, the ready-made starter save can skip most of the setup.
2. **Make your first menu:** [Quick Start](QUICK_START.md) walks through one small screen and explains the code as you add it.
3. **Try another example:** [Getting Started Examples](examples/getting-started/README.md) has small scripts you can copy and change.

You do not need to know Lua already. Words like *Host* and *Page* are explained in the [Documentation Index](docs/README.md).

**Already using MiliUI?** Read the [beta.4 upgrade guide](docs/UpgradeBeta4.md). For a specific Button, setting, or function, try [API at a glance](docs/APIAtAGlance.md), [Components](docs/Components.md), or the [complete API reference](docs/Reference/README.md).

**Using an older beta?** Follow the upgrade guides in order: [beta.2](docs/UpgradeBeta2.md), [beta.3](docs/UpgradeBeta3.md), then [beta.4](docs/UpgradeBeta4.md).

## Downloads

Public beta runtime downloads are published under **GitHub Releases**.

The recommended installation path is **MiliUI Manager**, which installs the production runtime into one selected Miliastra project and creates a backup before replacing an existing installation.

For a new project, the release also includes `MiliUI-Template-Save-File.gil`, a ready-to-use starter save with the one-time MiliUI setup and Quick Start example already configured. See [Installation + Setup](docs/Installation.md#starter-template) before entering Test Play.

For VS Code editor support, install [MiliUI IntelliSense from the Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=MyPing0.miliui-intellisense). The GitHub Release keeps a VSIX as a manual/offline fallback.

Advanced users can also download the production `MiliUI-init.lua` runtime directly.

## What is public here?

This repository contains:

- public documentation;
- beginner and reference examples;
- release notes and version history;
- public issue templates;
- downloadable release artifacts.

The readable MiliUI framework source is **not** distributed from this repository.

## Feedback and support

The Miliastra creator Discord is the primary place for questions, feedback, and discussion. Confirmed framework bugs can be tracked here as GitHub Issues.

Before reporting a bug, see [Support and Bug Reports](SUPPORT.md). Common project/licensing questions are covered in the [FAQ](docs/FAQ.md).

## License

MiliUI is not an open-source framework. Use of the MiliUI runtime is governed by the [MiliUI License](LICENSE).

In short: you may use official MiliUI releases in your Miliastra projects, but you may not redistribute, republish, fork, repackage, or present MiliUI itself as your own framework. See the license for the complete terms.

## Status

The current public beta is **v0.9.0-beta.4**. APIs are intended to be usable in real projects, but changes may still occur before 1.0 as creator feedback reveals problems. See [Known Issues](KNOWN_ISSUES.md) for current framework and Miliastra-platform limitations that may affect projects.
