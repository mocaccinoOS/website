---
title: "Preparing Boot Media"
linkTitle: "Preparing Boot Media"
weight: 2
description: >-
     How to write MocaccinoOS to a USB stick, DVD, or boot it directly from your hard drive
---

Once you have downloaded a MocaccinoOS ISO, you need to make it bootable. This page covers three methods: USB stick (recommended), DVD, and booting directly from an ISO file on your hard drive using GRUB.

## Option 1: USB Stick (Recommended)

This is the simplest and most reliable method for most users.

### Using Etcher (Beginner-friendly)

[balenaEtcher](https://etcher.balena.io) is a free, cross-platform tool that works on Linux, Windows, and macOS.

1. Download and install balenaEtcher.
2. Click **Flash from file** and select the MocaccinoOS ISO.
3. Click **Select target** and choose your USB stick.
4. Click **Flash** and wait for the process to complete.

### Using Ventoy (Multiboot)

[Ventoy](https://www.ventoy.net) lets you store multiple ISOs on a single USB stick and boot any of them from a menu.

1. Install Ventoy to your USB stick using the Ventoy installer.
2. Copy the MocaccinoOS ISO to the USB stick — no further steps needed.
3. Boot from the USB and select MocaccinoOS from the Ventoy menu.

### Using `dd` (Linux command line)

Replace `/dev/sdX` with your USB device (check with `lsblk` first — **do not** select your hard drive):

```bash
sudo dd if=MocaccinoOS-COSMIC-0.20260605.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

---

## Option 2: DVD

Burn the ISO to a blank DVD using your preferred tool:

- **Linux:** `growisofs -dvd-compat -Z /dev/dvd=MocaccinoOS.iso`
- **Windows:** Right-click the ISO and choose **Burn disc image**.
- **macOS:** Use Disk Utility → **Burn**.

---

## Option 3: Boot from ISO file on Hard Drive (Advanced)

If you already have a Linux system with GRUB installed, you can boot MocaccinoOS directly from an ISO file stored on your hard drive — no USB stick or DVD required. This is useful for testing or multiboot setups.

> **Note:** This method only works with MocaccinoOS ISOs. It cannot be used with ISOs from other distributions.

### Preparing the ISO file

Copy the MocaccinoOS ISO to a location on your hard drive, for example:

```bash
sudo mkdir -p /boot/iso
sudo cp MocaccinoOS-COSMIC-0.20260605.iso /boot/iso/
```

### Adding a GRUB menu entry

{{< alert color="primary" title="Note" >}}
This feature is only available on release images > 26.06
{{< /alert >}}

Add the following to `/etc/grub.d/40_custom`, adjusting the `isofile` path to match your ISO:

```grub
menuentry "MocaccinoOS Live (ISO Loopback)" {
    set isofile="/boot/iso/MocaccinoOS-COSMIC-0.20260605.iso"
    search --no-floppy --file --set=root $isofile
    loopback loop $isofile
    linux (loop)/boot/kernel.xz iso-scan/filename=$isofile rootdelay=5 quiet
    initrd (loop)/boot/rootfs.xz
}
```

**Parameter details:**

- **`isofile`**: The path to the ISO file, relative to the root of the partition it resides on.
- **`iso-scan/filename`**: Tells the MocaccinoOS initramfs which ISO file to find and mount.
- **`rootdelay=5`**: Recommended — gives the kernel time to initialize storage devices before scanning.

Then regenerate your GRUB configuration:

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Reboot and select **MocaccinoOS Live (ISO Loopback)** from the GRUB menu.

### Manual boot from the GRUB console

If you are at the GRUB command line, you can boot manually:

1. **Find and set root to the partition containing the ISO:**
   `grub> search --no-floppy --file --set=root /boot/iso/MocaccinoOS.iso`
2. **Loop-mount the ISO:**
   `grub> loopback loop /boot/iso/MocaccinoOS.iso`
3. **Load the kernel:**
   `grub> linux (loop)/boot/kernel.xz iso-scan/filename=/boot/iso/MocaccinoOS.iso rootdelay=5`
4. **Load the initramfs:**
   `grub> initrd (loop)/boot/rootfs.xz`
   > Note: `rootfs.xz` is the MocaccinoOS live initramfs, despite the name.
5. **Boot:**
   `grub> boot`

### Requirements

- The ISO must be a MocaccinoOS ISO. ISOs from other distributions will not work with this method.
- The ISO must be stored on a filesystem supported by the initramfs (ext2/4, FAT32, NTFS).
- An existing GRUB2 installation is required.
- The path to the ISO must be the absolute path from the root of the partition it resides on.
