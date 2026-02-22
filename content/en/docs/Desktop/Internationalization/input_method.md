---
title: Input Method (Fcitx)
weight: 10
---

MocaccinoOS supports complex text input (Chinese, Japanese, Korean, and more)
via the Fcitx input method framework.

The full runtime stack is provided through the `fcitx` layer.

## Install

```bash
luet install layers/fcitx
```

This installs:

- Fcitx core
- Configuration tool
- Chinese input engines and tables
- GTK and Qt integration modules
- libime and OpenCC support

## Enable in KDE Plasma

1. Open **System Settings → Input Devices → Virtual Keyboard**
2. Select **Fcitx**
3. Log out and log back in

On Plasma Wayland sessions, Fcitx is usually detected automatically after installation.

## Configure input methods

```bash
fcitx-configtool
```

Add the desired input method (for example: Pinyin, Table, Anthy, Hangul).

## Environment variables (non-Plasma or X11)

If needed, ensure these variables are set:

```bash
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```

## Notes

- Works in both X11 and Wayland sessions
- GTK and Qt applications supported
- OpenCC enables Simplified/Traditional Chinese conversion
- The layer contains runtime components only (consistent with MocaccinoOS design)