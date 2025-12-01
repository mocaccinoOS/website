---
title: "Secure File Transfer (SFTP)"
linkTitle: "SFTP configuration"
weight: 4
description: >-
     Learn how to transfer files securely with SFTP using the built-in OpenSSH service in MocaccinoOS
---

**SFTP** (SSH File Transfer Protocol) enables secure, encrypted file transfers and remote file management using the same protocol as SSH.  
It is included **by default** in MocaccinoOS through the built-in **OpenSSH** service — no installation required.

SFTP is compatible with most file managers (such as Dolphin, Nautilus, or Thunar), command-line tools (`sftp`, `scp`), and third-party clients like [WinSCP](https://winscp.net) or FileZilla.

---

## Connecting to Your MocaccinoOS System

You can connect to your MocaccinoOS system from another machine using SFTP in several ways:

### Command Line
```bash
sftp username@hostname
```

### Graphical File Manager
In your file manager’s address bar:
```
sftp://username@hostname
```

### Windows Client
Use a graphical SFTP client like [WinSCP](https://winscp.net), or use PowerShell’s built-in support:
```powershell
sftp username@hostname
```

---

## Checking Service Status

To verify that the SSH (and SFTP) service is active:

```bash
systemctl status sshd
```

If it’s not running, enable it to start automatically at boot:

```bash
sudo systemctl enable --now sshd
```

---

## Security Recommendations

SFTP uses the same authentication and encryption as SSH.  
For stronger security, consider the following optional steps:

> 💡 **Tip:** These adjustments apply system-wide. Edit `/etc/ssh/sshd_config` carefully and restart the SSH service afterward.

### Use SSH Keys Instead of Passwords

1. Generate a key on your client system:
   ```bash
   ssh-keygen
   ssh-copy-id username@hostname
   ```

2. Disable password authentication in `/etc/ssh/sshd_config`:
   ```
   PasswordAuthentication no
   ```

3. Apply the change:
   ```bash
   sudo systemctl restart sshd
   ```

---

### Restrict SFTP-Only Accounts (Optional)

To create accounts limited to SFTP (no shell access), append this block to `/etc/ssh/sshd_config`:

```bash
Match Group sftpusers
     ChrootDirectory %h
     ForceCommand internal-sftp
     AllowTcpForwarding no
     X11Forwarding no
```

Then configure the user environment:

```bash
sudo groupadd sftpusers
sudo usermod -aG sftpusers username
sudo chmod 755 /home/username
```

> **Note:** Users confined via `ChrootDirectory` cannot access directories outside their home folder.

---

## Useful Tips

- Connect to a non-standard SSH port:
  ```bash
  sftp -P 2222 username@hostname
  ```

- Enable compression for faster transfers:
  ```bash
  sftp -C username@hostname
  ```

- Copy entire directories recursively:
  ```bash
  scp -r folder username@hostname:/path/to/destination
  ```

---

## Summary

SFTP offers a secure, encrypted, and easy-to-use way to transfer files to and from your MocaccinoOS system.  
Since **OpenSSH** is already installed and configured by default, SFTP works immediately — no additional setup or packages are required.

Use it for quick file transfers, remote editing, or as a secure alternative to traditional FTP or Samba.

---