---
title: "Desktop environments"
linkTitle: "Desktop environments"
weight: 20
date: 2024-02-04
description: >
  MocaccinoOS supports several popular desktop environments.
---

This page explains how to install several desktop environments.

## KDE Plasma

This command installs the KDE Plasma desktop environment.

```bash
$ sudo luet install layers/plasma apps/discover
```
The layers/plasma package ships with the SDDM login manager.
If you prefer to use SDDM as your login manager run this command:

```bash
$ sudo systemctl enable sddm --force
```

## GNOME

This command installs the GNOME desktop environment.

```bash
$ sudo luet install layers/gnome apps/gnome-software
```
The layers/gnome package ships with the GDM login manager.
If you prefer to use GDM as your login manager run this command:

```bash
$ sudo systemctl enable gdm --force
```

## MATE

This command installs the MATE desktop environment.

```bash
$ sudo luet install layers/mate themes/mate 
```

## XFCE

This command installs the XFCE desktop environment.

```bash
$ sudo luet install layers/xfce 
```
## LXQT

This command installs the LXQT desktop environment.

```bash
$ sudo luet install layers/lxqt 
```

## Cinnamon

This command installs the Cinnamon desktop environment.

```bash
$ sudo luet install layers/cinnamon 
```

## Enlightenment

This command installs the Enlightenment desktop environment.

```bash
$ sudo luet install layers/enlightenment 
```

## Trinity

This command installs the Trinity desktop environment.

```bash
$ sudo luet install layers/trinity 
```
## Hyprland

Hyprland is available in the [community repository](/docs/desktop/luet/repositories/#community-repository). 

This command installs the Hyprland desktop environment.

```bash
$ sudo luet install layers/hyprland apps/kitty
```

## Niri + Noctalia shell

Niri is a scrollable-tiling Wayland compositor.

This command installs Niri:

```bash
$ sudo luet install layers/niri
```

The following applications are required and available in the [community repository](https://www.mocaccino.org/docs/desktop/luet/repositories/#community-repository):

```bash
$ sudo luet install apps/alacritty apps/fastfetch apps/noctalia
```

After installation, set up the Noctalia shell configuration:

First add the following to `~/.config/niri/config.kdl` to disable Waybar and start Noctalia on login:
 
```kdl
// spawn-at-startup "waybar"
spawn-at-startup "qs" "-c" "noctalia-shell"
```
Then install the Noctalia shell configuration to your user directory:

```bash
$ mkdir -p ~/.config/quickshell/noctalia-shell
$ curl -sL https://github.com/noctalia-dev/noctalia/releases/latest/download/noctalia-latest.tar.gz \
  | tar -xz --strip-components=1 -C ~/.config/quickshell/noctalia-shell
```

Log out and select **Niri** from your login manager's session menu.

### Notes
 
- `apps/alacritty` is required as the default terminal (`Super+T`)
- `apps/noctalia` provides the `qs` binary (Quickshell runtime)
- The curl command installs the Noctalia shell config to your home directory; it is not managed by Luet and must be run once per user
- `apps/fastfetch` is used by Noctalia for system info display


## Fluxbox

This command installs the Fluxbox desktop environment.

```bash
$ sudo luet install layers/fluxbox 
```

## COSMIC

This command installs the COSMIC desktop environment.

```bash
$ sudo luet install layers/cosmic
```

## Login managers

If you prefer to use Lightdm as your login manager run these commands:

```bash
$ sudo luet install apps/lightdm
```

```bash
$ sudo systemctl enable lightdm --force
```

If you prefer to use Slim as your login manager run these commands:

```bash
$ sudo luet install apps/slim
```
```bash
$ sudo systemctl enable slim --force
```
If you prefer to use Ly as your login manager run these commands:

```bash
$ sudo luet install apps/ly
```
```bash
$ sudo systemctl enable ly@tty2.service --force
```
Ly available in the [community repository](/docs/desktop/luet/repositories/#community-repository).