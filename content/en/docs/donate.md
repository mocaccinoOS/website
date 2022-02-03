
---
title: "Donate"
linkTitle: "Support us"
weight: 200
menu:
  main:
    weight: 200
---


Become a donor today.

If you want to help us, but you cannot contribute to code, you can still buy us a coffee, or just donate a little bit of your hardware power.

As a small open source project, know that every dollar will have an immense impact on our ability to continue working towards our mission.

Your support means the world to us :)

You can donate by going to our [Patreon](https://www.patreon.com/mocaccinoos?fan_landing=true) page, or if you prefer cryptocurrencies, we accept donations to the following XMR wallet: `84AsfE73Cy7hAYKy7PN8N8D3fh39JzXyLjaiYpgXm3NrJHH7cTPxUJSgsdFiSL6mwE9MKpvrYJQoaTxRG6sJX6aBRpr45dc`.

<a href="https://www.patreon.com/bePatron?u=11620572" data-patreon-widget-type="become-patron-button">Become a Patron!</a><script async src="https://c6.patreon.com/becomePatronButton.bundle.js"></script>


## Donating computing power

If you want, you can also support our project by donating your idle computing power. We have a "donor" profile that you can
install/uninstall any time. It will kick-in automatically xmrig when it detects a idle cpu in a range of `15m`.

### Donate from Mocaccino Micro

Install the following packages:

```bash
$ luet install -y runit-srv/xmrig system-profile/donate cryptocurrency/xmrig
```

Enable the `donate` profile:

```bash
$ mos profile enable donate
```

done!

### Donate from Mocaccino Desktop

Install the following packages:

```bash
$ luet install -y systemd-service/xmrig system-profile/donate cryptocurrency/xmrig
```

Enable the `donate` profile:

```bash
$ mos profile enable donate
```

done!

### Stop the service

To stop the service, on Mocaccino Micro:

```bash
$ runit-stop xmrig
```

while on Desktop:

```bash
$ systemctl stop xmrig
```

### Disable

Just disable the `donate` profile:

```bash
$ mos profile disable donate
```

### Uninstall

Just remove the installed packages, most importantly `system-profile/donate` which starts xmrig when the CPU is idling:

```bash
$ luet uninstall -y system-profile/donate cryptocurrency/xmrig
```

Then remove the appropriate service, on Micro:

```bash
$ luet uninstall -y runit-srv/xmrig
```

while on Desktop:

```bash
$ luet uninstall -y systemd-service/xmrig
```
