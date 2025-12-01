---
title: "NFS"
linkTitle: "NFS configuration"
weight: 3
description: >-
     Configure NFS in MocaccinoOS
---

Configuring NFS (Network File System)

Network File System (NFS) is the standard protocol for sharing files between Linux and Unix-like systems. It is generally faster and more suited for high-performance or internal network sharing than SMB.

## Define Exported Directories

The list of directories that MocaccinoOS will share via NFS is controlled by the /etc/exports file. You may need to create this file if it doesn't exist.

The syntax is: /path/to/share <client>(<options>)

Here is an example, allowing the client at IP 192.168.1.100 read/write access:

```bash
# Share the /srv/nfs/data directory
/srv/nfs/data 192.168.1.100(rw,sync,no_subtree_check)

# Share the /home/public directory to the entire subnet (less secure)
/home/public 192.168.1.0/24(ro,sync,no_subtree_check)
```

Key NFS Options:

rw: Allows read and write access. Use ro for read-only.

sync: Forces all writes to disk before replying. (Safer, but slightly slower).

no_subtree_check: Disables the security check that verifies the exported path. Recommended for stability.

## Start and Enable the NFS Service

You must start and enable the NFS server service. In MocaccinoOS (using a standard init system):

```bash
# Enable the service to start automatically on boot
$ sudo systemctl enable nfs-server

# Start the service immediately
$ sudo systemctl start nfs-server
```

## Export the Shares

If you modify /etc/exports while the service is running, you must refresh the export list without restarting the entire server:

```bash
# Reloads the export file and prints all exports
$ sudo exportfs -arv
```

## Client Mounting (Example)

On a Linux client machine, the share can be mounted using the mount command. Replace mocaccino-server with your server's hostname or IP address:

```bash
$ sudo mount mocaccino-server:/srv/nfs/data /mnt/mocaccino_data
```