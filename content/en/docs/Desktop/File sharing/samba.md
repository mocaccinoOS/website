---
title: "Samba"
linkTitle: "Samba configuration"
weight: 2
description: >-
     Configure Samba
---

# Configuring Samba (SMB) Shares

Samba allows MocaccinoOS to act as a file and print server for Windows, macOS, and Linux systems using the common Server Message Block (SMB) protocol. Since the core packages are already installed, we only need to focus on configuration and user setup.

## Step 1: Configure the Global Settings

MocaccinoOS provides a default configuration file. You **must** copy this file before making any changes to create the active configuration:

```
sudo cp /etc/samba/smb.conf.default /etc/samba/smb.conf
```

The main Samba configuration file is now located at `/etc/samba/smb.conf`. Ensure the `[global]` section contains basic networking information. If you only need simple sharing, the defaults are usually sufficient.

## Step 2: Define a Share

To create a new shared folder, add a section to the end of your `/etc/samba/smb.conf` file. Replace `/mnt/storage/shared_data` with the actual path to your data.

```
[Shared_Docs]
  comment = Collaborative Document Sharing
  path = /mnt/storage/shared_data
  browsable = yes
  guest ok = no
  read only = no
  create mask = 0775
  directory mask = 0775
  valid users = @staff, <username>
```

### Key Share Options:

- **`path`**: The absolute path to the directory being shared.

- **`browsable`**: Allows the share to be visible when browsing the network.

- **`guest ok`**: If `no`, authentication is required. If `yes`, anyone can access it (usually discouraged).

- **`valid users`**: Only specified users or groups (prefixed with `@`) can connect.

## Step 3: Add Samba Users

Samba maintains its own database of passwords, separate from the system's Linux passwords. Any user who needs to access the share must have an existing Linux account and be added to the Samba database.

```
# Replace <username> with the account name
sudo smbpasswd -a <username>
```

You will be prompted to set a new Samba password for that user.

## Step 4: Start and Enable the Samba Service

After configuration, you need to start the Samba service and enable it to persist across reboots.

```
# Enable the service to start automatically on boot
sudo systemctl enable smb

# Start the service immediately
sudo systemctl start smb
```
