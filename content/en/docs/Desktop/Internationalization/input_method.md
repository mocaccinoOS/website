---
title: Input Methods (Fcitx & IBus)
weight: 80
---
# Input Methods (Fcitx & IBus)

MocaccinoOS supports complex text input for Chinese, Japanese, Korean, and other
languages via the unified `layers/input` layer, which bundles both the **Fcitx** and
**IBus** input method frameworks along with their engines and integration modules.

## Install

```bash
luet install layers/input
```

This single layer installs both frameworks and all their engines:

**Fcitx:**
- Fcitx5 core and configuration tool
- Chinese input engines and tables (`fcitx-chinese-addons`, `fcitx-table-extra`)
- Anthy engine for Japanese input
- GTK and Qt integration modules
- libime and OpenCC support (Simplified/Traditional Chinese conversion)

**IBus:**
- IBus framework
- Hangul input (`ibus-hangul`, `libhangul`)
- Pinyin input (`ibus-pinyin`)
- Anthy engine for Japanese input (`ibus-anthy`)
- Table-based input methods (`ibus-table`, `ibus-table-chinese`, `ibus-table-others`)

Both frameworks share the same underlying libraries (`xcb-imdkit`, `opencc`, `marisa`, `libime`).

---

## Choosing a Framework

Both Fcitx and IBus are installed by the same layer. You only need to activate one
at a time in your desktop settings.

| | Fcitx | IBus |
|---|---|---|
| Best for | KDE Plasma, Wayland | GNOME, GTK-heavy environments |
| Config tool | `fcitx-configtool` | `ibus-setup` |
| X11 & Wayland | ✓ | ✓ |
| GTK integration | ✓ | ✓ (native) |
| Qt integration | ✓ | ✓ (via modules) |

---

## Enabling in KDE Plasma

1. Open **System Settings → Input Devices → Virtual Keyboard**
2. Select **Fcitx** or **IBus**
3. Log out and log back in

On Plasma Wayland sessions, Fcitx is usually detected automatically after installation.

---

## Configuring Fcitx

Run the Fcitx configuration tool to add input methods (e.g. Pinyin, Anthy, Hangul, Table):

```bash
fcitx-configtool
```

### Environment variables (non-Plasma or X11)

If needed, ensure these variables are set in your session:

```bash
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```

---

## Configuring IBus

Run the IBus setup tool to add input methods (e.g. Hangul, Pinyin, Table):

```bash
ibus-setup
```

### Environment variables (non-Plasma or X11)

If needed, ensure these variables are set in your session:

```bash
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
```

---

## Notes

- Both frameworks work in X11 and Wayland sessions
- OpenCC enables Simplified/Traditional Chinese conversion (Fcitx)
- The layer contains runtime components only, consistent with MocaccinoOS design
- `layers/input` requires `layers/kde-common` as a dependency
