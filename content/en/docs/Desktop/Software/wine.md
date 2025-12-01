---
title: "Wine"
linkTitle: "Wine"
weight: 4
description: >-
     Installing and configuring Wine in MocaccinoOS
---

## What is Wine

Wine is a compatibility layer that allows you to run many Microsoft Windows applications on Linux (and other POSIX-compliant OSes) by translating Windows API calls into native Linux/POSIX calls — without fully emulating Windows. 

This means Windows programs (applications or games) can often run nearly as fast as native Linux software, and integrate fairly cleanly into your Linux desktop.

## Why use Wine on MocaccinoOS

You might need Windows-only applications or games that have no native Linux equivalent.

Wine avoids the overhead of full virtualization / emulation, so resource use stays low.

Gives flexibility: you don’t need to dual-boot or run a full Windows VM for many tasks.

## Key caveats & limitations

Wine does not guarantee perfect compatibility: some applications will run flawlessly, others only partially or not at all. This heavily depends on the program, required libraries, and how deep the program integrates with Windows. 

For 32-bit Windows applications on a 64-bit system, you often need multi-architecture support (i.e. 32-bit compatibility libraries / “multilib”). 

Some Windows features — e.g. drivers, low-level kernel integrations, copy-protected software — often don’t work under Wine, or may need additional workarounds.

## Installing Wine on MocaccinoOS

Because MocaccinoOS uses luet layers and tries to simplify package management, apps/wine-staging installs more then wine itself it bundles:

- Wine (Staging) with necessary 32-bit / multilib support.
- Optionally helper tools (Winetricks, Protontricks) — useful to install common Windows runtimes (fonts, DirectX / 3D libraries, .NET, etc.) depending on what you need.

Wine is available in the [community repository](/docs/desktop/luet/repositories/#community-repository). If you have enabled this repository you can install it by using this command:

```bash
$ sudo luet install apps/wine-staging
```

### Configure Wine

```bash
$ winecfg
```

this initializes your default Wine prefix (~/.wine), represents a fake “C:” drive, creates a registry, and lets you configure Wine (Windows version, audio, display settings, drive-letter mapping).

You might also note that for some games or more complex applications — especially those relying on 3D graphics or more advanced Windows runtime features — compatibility layers like [Lutris](/docs/desktop/gaming/#lutris) can help by managing Wine versions and dependencies for you.

## Running a program

```bash
$ wine /path/to/program.exe
```

### References
- [Wikipedia](https://en.wikipedia.org/wiki/Wine_(software))
- [wineHG](https://www.winehq.org)