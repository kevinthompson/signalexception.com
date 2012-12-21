---
title: Running a Dashing Dashboard on a Raspberry Pi
published: false
---

## Overview
- [Install Raspbian][raspbian]
- Configure your Raspberry Pi
- Create an autostart script

## Hardware
- [42" Vizio TV - Model E420VSE][tv]
- [Raspberry Pi Model B][rpi]
- [Edimax EW-7811Un][wifi]

## Raspberry Pi Configuration
[Config Reference][config]

``` bash
raspi-config
```

- Time Zone

### Display Settings
You should consult the [Raspberry Pi Config Reference][config] to determine the appropriate settings for your display, but we made the following changes to get our Raspberry Pi devices working properly with our [Vizio TV][tv]:

``` bash
sudo pico /boot/config.txt
```

```
disabled_overscan=0
framebuffer_width=1920
framebuffer_height=1080
hdmi_mode=16
hdmi_drive=2
```

#### hdmi_drive
1 = DVI Mode, 2 = HDMI Mode

### Network Settings
**Start Menu > Internet > wpa_gui**

### Disable Display Power Management
``` bash
pico /etc/lightdm/lightdm.conf
```

Under `[SeatDefaults]` add the line
```
xserver-command=X -s 0 dpms
```

## Boot Script

``` bash
mkdir -p ~/.config/lxsession/LXDE
pico ~/.config/lxsession/LXDE/autostart
```

```
@midori -e Fullscreen -a http://
```


## Optional Steps

While the above steps are all that's required to get your Raspberry Pi dashboard up and running, here are a few additional items that may help improve the performance or appearance of your dashboard.

### Overclocking
We experimented with a few different overclock settings, and although we didn't see a noticable change in performance of the dashboard itself, raising the overclock level did significantly improve boot time.

### Installing Additional Fonts
In order to expand 
``` bash
sudo apt-get install ttf-mscorefonts-installer
```

[tv]: http://store.vizio.com/e420vse.html
[rpi]: http://www.newark.com/jsp/search/productdetail.jsp?SKU=43W5302&CMP=KNC-GPLA&mckv=|pcrid|13950363021|plid|
[wifi]: http://www.amazon.com/Edimax-EW-7811Un-Wireless-Adapter-Wizard/dp/B005CLMJLU
[config]: http://elinux.org/RPiconfig
[raspbian]: http://www.raspberrypi.org/downloads