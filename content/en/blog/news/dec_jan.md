---
title: "January updates"
linkTitle: "Monthly Updates"
date: 2022-01-01
description: >
  End of year, December/January updates!
---

Happy new 2022! Another year has passed, and yet we are here, really close to release an alpha release. Meanwhile, we are sharing updates and new packages available in our repositories.

## Maui shell

Screenshot #1           |  Screenshot #2
:-------------------------:|:-------------------------:
![1](https://user-images.githubusercontent.com/2420543/147857306-749fbcd8-bdc6-4f56-822c-cb7406956a66.png) | ![2](https://user-images.githubusercontent.com/2420543/147857308-de75f19a-c3c7-41e6-bdad-8438a22b6a86.png)


As you [might have heard](https://news.itsfoss.com/maui-shell-unveiled/) Maui shell was recently announced, and we are happy to share with you that is officially available in our development repositories as experimental version and going to land into stable repositories very soon.

In order to install Maui shell, just run:

```
luet install layers/maui-shell
```

Currently, it might be required a reboot in order to log-in as a first time.

We are also working on a dedicated ISO flavor with LightDM and Maui shell, stay tuned.

## Fynedesk

Screenshot #1           |  Screenshot #2
:-------------------------:|:-------------------------:
![screenshot-20211231T212120](https://user-images.githubusercontent.com/2420543/147838264-d4838105-3e98-4002-9d5a-481cebfc76c7.png) | ![screenshot-20211231T211211](https://user-images.githubusercontent.com/2420543/147838276-fbfa47c8-5e49-4444-a9ab-605d7cb4cf56.png)
![screenshot-20211231T210957](https://user-images.githubusercontent.com/2420543/147838288-8d6e7e7a-b6cb-4564-b058-294cf2e1787b.png) | ![screenshot-20211231T210807](https://user-images.githubusercontent.com/2420543/147838298-0637691b-a777-4b16-bfc8-5354acc6b424.png)


If you don't know about [fynedesk](https://github.com/fyne-io/fynedesk), maybe you should. FyneDesk is an easy to use Linux/Unix desktop environment following material design. It is built using the [Fyne toolkit](https://github.com/fyne-io/fyne) and is designed to be easy to use as well as easy to develop. 

Fynedesk is available in our development repositories and going to land into stable repositories very soon.

In order to install Fynedesk, just run:

```
luet install layers/fynedesk
```

We are also working on a dedicated ISO flavor with LightDM and fynedesk, stay tuned.

## Updater

We have been developing an alpha version of the updater app of `mOS`. It is currently available in the development repositories, and you can download it already with:

```
luet install apps/mos-updater
```

you can run it in the terminal with `mos-updater` or via the application menu.

![screenshot-20211231T211721](https://user-images.githubusercontent.com/2420543/147838266-46be2423-0495-4741-a612-272db9ec0a03.png)

If upgrades are available, a button will be present which if pressed will start upgrades automatically in the background. The GUI is intentionally simple to just handle upgrades and display notification upgrades to the user.