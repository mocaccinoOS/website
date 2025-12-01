---
title: "Vajo"
linkTitle: "Vajo"
weight: 3
description: >-
     Using Vajo. A GUI/TUI for Luet.
---

{{< alert color="primary" title="Note" >}}
Vajo is still under development but considered stable.
{{< /alert >}}

## Installing Vajo

If you prefer a tool to perform simple package management tasks, you can consider installing apps/vajo

```bash
$ sudo luet install apps/vajo
```
This will install vajo-gui ( a graphical GTK based version ) and vajo-tui ( a text-based ncurses version )

## Using Vajo

After opening the Vajo program the main window opens.

<img width="1132" height="759" alt="Vajo1" src="https://github.com/user-attachments/assets/3b4b42a4-62fd-4a1d-97f3-fb54e022e2c4" />

1. Enter a search string
2. Status bar
3. Last time repositories were synced
4. Check this for a deeper search
5. Click this button to start search

### Search results

<img width="1132" height="759" alt="Vajo_results" src="https://github.com/user-attachments/assets/b89cab32-39dc-4cd7-98e0-295d848b24b6" />

In this example we searched for "apps".

- If a package is installed we get the option to remove the package.
- If a package isn't installed we get the option to install the package.
- Some packages are protected. This means the user can't use Vajo to remove them. This is done to prevent users breaking their system by accident.
- Click on details to get more details about the package.

<img width="1002" height="627" alt="Vajo_details" src="https://github.com/user-attachments/assets/44b43c2b-6389-48ff-b6ea-da1173ff576d" />


### Additional functionality

<img width="1000" height="626" alt="Vajo2" src="https://github.com/user-attachments/assets/ddf3dea4-8444-4d22-b8c3-d3586e4eef67" />

1. Update repositories: This syncs the repositories by running "Luet repo update"
2. Full system upgrade: This first syncs the repositories and directly afterwards runs "Luet upgrade"
3. Check the system:    This will run "Luet oscheck" and repair itself if missing files are detected.
4. Clear Luet cache:    This will clear system cache. Only available if applicable.
5. Quit:                Closes the program.
6. Toggle output log:   Use this to show any processes running.
