---
title: Input Method (IBus)
weight: 20
---

MocaccinoOS provides the IBus input method framework as an alternative to Fcitx.

IBus is commonly used for Asian language input and integrates well with
GTK applications and GNOME-based environments.

## Install

```bash
luet install layers/ibus
```

This installs:

IBus framework, Hangul input, Pinyin input and Table-based input methods

## Enable in KDE Plasma

1. Open **System Settings → Input Devices → Virtual Keyboard**
2. Select **IBus**
3. Log out and log back in

## Configure input methods

Run:
```bash
ibus-setup
```

Add the desired input method (for example: Hangul, Pinyin, Table).

Environment variables (non-Plasma or X11)

If needed, ensure these variables are set:
```bash
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
```

## Notes

- Works in both X11 and Wayland sessions
- GTK applications have native integration
- Qt supported via ibus modules
- The layer contains runtime components only (consistent with MocaccinoOS design)