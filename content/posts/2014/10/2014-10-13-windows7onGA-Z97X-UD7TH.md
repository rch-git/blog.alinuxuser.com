---
title: 'Installing Windows 7 on Gigabyte GA-Z97X-UD7 TH'
date: 2014-10-13T19:47:00
draft: false
tags: ["guide"]
---
Following is my computer configuration -

{{< newtab href="https://pcpartpicker.com/user/patchrowcester/saved/c4964D" text="PCPartPicker" >}}

```
Intel Core i7-4790K 4.0GHz Quad-Core
Cooler Master Hyper 212 EVO 82.9 CFM Sleeve Bearing
Gigabyte GA-Z97X-UD7 TH ATX LGA1150
G.Skill Trident X Series 16GB (2 x 8GB) DDR3-2400
Samsung 840 Pro Series 256GB 2.5" SSD
Western Digital Caviar Blue 1TB 3.5" 7200RPM
Corsair Graphite Series 230T Black ATX Mid Tower
Corsair 850W ATX12V / EPS12V
LG GH24NS90 DVD/CD Writer
Hannspree HZ281HPB 27.5"
Asus VG278HE 27.0"
Creative Labs Sound Blaster X-Fi Titanium HD
Razer DeathStalker
Razer DeathAdder 2013 Wired Optical
Creative Labs Creative Fatal1ty
Acer P243WAid 24" 1920 x 1200 Monitor
```

I attempted to install Windows 7 on this machine. I set the DVD drive as the boot device, and when Windows 7 finished loading files, the installer started, but I couldn't proceed forward because the keyboard and mouse aren't detected by Windows 7. I pluged the devices in different USB slots, but that did not help.

I did some further research, and I found a setting in the BIOS that needed to be enabled to install Windows 7 successfully.

Here is a link to the manual - {{< newtab href="https://download1.gigabyte.com/Files/Manual/mb_manual_ga-z97x-ud7-th_e.pdf" text="DOWNLOAD MANUAL" >}}

Here is the screenshot from the manual that shows the settings -

{{<
    figure
    src="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/windows7onGA-Z97X-UD7TH/bios_options.jpg"
    width="512"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/windows7onGA-Z97X-UD7TH/bios_options.jpg"
>}}


#### Steps

1. Go to the BIOS Features section

2. Enable Fast Boot -> Set it to Enable. This will now display USB Support options

3. Set the USB support to Full Initial

4. Save and Exit.

This should now allow Windows installation to detect keyboard and mouse during installation.

_This post is published on Apr 25, 2026 Saturday 12:11:35 PM CDT_
