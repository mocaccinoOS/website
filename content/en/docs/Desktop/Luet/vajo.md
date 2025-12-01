---
title: "Vajo"
linkTitle: "Vajo"
weight: 2
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

## Using Vajo-gui

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
  
<img width="1032" height="559" alt="Vajo_details" src="https://github.com/user-attachments/assets/6fee80a1-af4e-468a-b5e4-543c903bc364" />


### Additional functionality

Click on the "File" menu to get additional options.

<img width="222" height="148" alt="Vajo2" src="https://github.com/user-attachments/assets/7b9384ba-9c84-4c3d-954d-06010b089cce" />

Update repositories: This syncs the repositories by running "Luet repo update"
Full system upgrade: This first syncs the repositories and directly afterwards runs "Luet upgrade"
Check the system:    This will run "Luet oscheck" and repair itself if missing files are detected.
Clear Luet cache:    This will clear system cache. Only available if applicable.
Quit:                Closes the program.

## Using Vajo-tui

The text-based version has excact the same functionality as the GUI version. Great advantage is that you can use this when connected to a MocaccinoOS system using a remote SSH (Secure Shell) session.

<img width="1390" height="850" alt="Vajo-tui" src="https://github.com/user-attachments/assets/f7165359-7451-47e4-857a-b8a92814b015" />

