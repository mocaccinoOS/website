---
title: "Printing"
linkTitle: "Printing"
weight: 60
description: >-
  Set up and manage printers on MocaccinoOS using CUPS.
---

# Printing

Set up and manage printers on MocaccinoOS using CUPS.

CUPS (Common Unix Printing System) is pre-installed on MocaccinoOS, so you can start adding printers right away without any additional setup.

---

## Adding a Printer via the CUPS Web Interface

CUPS includes a built-in web interface for managing printers.

### Open the CUPS Web UI

Open your browser and navigate to:

```
http://localhost:631
```

### Add a New Printer

Go to **Administration** → **Add Printer**. You may be prompted to authenticate — use your system username and password (your account must have administrator privileges).

CUPS will scan for available devices. Select your printer from the list, or choose the appropriate connection type manually if it is not detected automatically.

### Configure the Printer

Fill in the printer details:

- **Name**: a short identifier with no spaces (e.g. `HP_OfficeJet`)
- **Description**: a human-friendly label (e.g. `HP OfficeJet Pro 9015`)
- **Location**: optional, useful in shared environments (e.g. `Office Room 2`)

Click **Continue**.

### Select a Driver

CUPS will suggest a driver based on the detected printer model. Accept the suggestion or browse the list to find the closest match. If your manufacturer provides a PPD file, you can upload it at this step for more accurate support.

Click **Add Printer** to confirm.

### Set Default Options

Configure default printing options such as paper size, print quality, and duplex (double-sided) printing, then click **Set Default Options**.

Your printer is now ready to use.

---

## Network & Shared Printers

MocaccinoOS supports printers connected directly to your network or shared by another computer.

### Network Printer (IPP / AirPrint)

Most modern network printers support **IPP** (Internet Printing Protocol). To add one:

1. Open the CUPS Web UI at `http://localhost:631`.
2. Go to **Administration** → **Add Printer**.
3. Select **Internet Printing Protocol (IPP)** as the connection type.
4. Enter the printer URI in the **Connection** field:

```
ipp://<printer-ip-address>/ipp/print
```

5. Complete the name, description, and driver selection as described above.

### Printer Shared by Another Linux Machine (CUPS-to-CUPS)

If a printer is shared by another machine running CUPS on your network, it may be discovered automatically. Check under **Discovered Network Printers** when adding a new printer.

If it does not appear, add it manually using:

```
ipp://<host-ip>:631/printers/<printer-name>
```

### Printer Shared by a Windows Machine (Samba / SMB)

To connect to a printer shared by a Windows PC:

1. Select **Windows Printer via SAMBA** as the connection type.
2. Enter the SMB URI:

```
smb://<host-ip>/<printer-name>
```

3. If the shared printer requires authentication, enter the Windows username and password when prompted.
4. Complete driver selection and configuration as usual.

---

## Managing Printers

You can manage all installed printers from `http://localhost:631` under the **Printers** tab. From there you can pause or resume a printer, set a default printer, view and cancel print jobs, modify printer options, or remove a printer.

---

## Printing on KDE Plasma

KDE Plasma integrates with CUPS through the **Print Manager** tool, available in System Settings.

Open **System Settings** → **Printers**. You may be prompted to authenticate with your administrator password.

Click **Add Printer**. Plasma will scan for available printers on your system and network. Select your printer from the list and click **Next**. Plasma will suggest a driver — accept it or browse the list to find a better match. Give the printer a name and description, then click **Finish**.

To manage existing printers, print jobs, or set a default printer, return to **System Settings** → **Printers** at any time.

---

## Printing on GNOME

GNOME handles printer setup directly from the **Settings** application.

Open the **Activities** overview and search for **Printers**, or go to **Settings** → **Printers**. Click **Unlock** in the top-right corner and authenticate with your administrator password.

Click the **+** button to add a printer. GNOME will display a list of detected printers — select yours and click **Add**. USB printers are often detected and added automatically as soon as they are connected.

To configure an existing printer, click the **settings (⚙)** button next to it. From there you can modify printer options, set it as the default, view active jobs, or remove it.
