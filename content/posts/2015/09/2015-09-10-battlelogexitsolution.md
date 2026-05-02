---
title: ' Battlelog Waiting For Game To Exit Solution'
date: 2015-09-10T19:57:00
draft: false
tags: ["guide", "battlefield"]
---
I am not sure if this is the only solution, but this has worked for me so far.

1. I am using Firefox to launch the game. I have my Use plugin-free game launching set to OFF

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/01-battlelogexitgamesolution.jpg"
    width="640"
    align="center"
    caption="Battlelog"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/01-battlelogexitgamesolution.jpg"
>}}

2. Battlefield 4 is set to use the 64 bit exe to launch the game

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/02-battlelogexitgamesolution.jpg"
    width="640"
    align="center"
    caption="Origin"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/02-battlelogexitgamesolution.jpg"
>}}

3. This is probably the most important step. I basically "deleted" the 32 bit web helper for Battlefield 4

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/03-battlelogexitgamesolution.jpg"
    width="640"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/03-battlelogexitgamesolution.jpg"
>}}

At this point I am able to play the game like I did before, and I haven't had any problems joining the game. Battlelog, EA Support were of no help so far.

#### Description of the problem

After the Summer 2015 patch was released for Battlefield 4 on 09/01/2015, Battlelog switched to plugin-free game launching - Battlefield 4 can be launched without the battlelog plugin. This is because Google Chrome discontinued support for NPAPI, and it is not possible to enable this starting with Chrome 45.

After this update, Battlelog has made joining games very painful, especially when there is a queue. This happens regardless of the browser I use.

Here is the behavior I am observing -

- More often than not, when I click on a server with a queue, and its time for me to join, I get this message:

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/04-battlelogexitgamesolution.jpg"
    width="640"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/04-battlelogexitgamesolution.jpg"
>}}

- At this point, BF4 consumes around 200MB, and then disappears:

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/05-battlelogexitgamesolution.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/05-battlelogexitgamesolution.jpg"
>}}

- Now, if I click on the join button again, depending on how the stars align, either I join the game, or the following three messages appear -

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/06-battlelogexitgamesolution.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/06-battlelogexitgamesolution.jpg"
>}}

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/07-battlelogexitgamesolution.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/07-battlelogexitgamesolution.jpg"
>}}

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/08-battlelogexitgamesolution.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/battlelogexitgamesolution/08-battlelogexitgamesolution.jpg"
>}}


All executable files are running as Admin (Webhelper & BF4)

Here are my system specifications -
```
- Windows 7 Professional 64-bit SP1
- Intel Core i7 4790K @ 4.00GHz 44 °C Haswell 22nm Technology
- 32.0GB Dual-Channel DDR3 @ 666MHz (9-9-9-24)
- Gigabyte Technology Co., Ltd. Z97X-UD7 TH-CF (SOCKET 0) 28 °C
- ROG PG278Q (2560x1440@144Hz)
  Acer K272HUL (2560x1440@59Hz)
  Acer K272HUL (2560x1440@59Hz)
- NVIDIA GeForce GTX 980 (EVGA) 42 °C
- 232GB Samsung SSD 840 EVO 250G SCSI Disk Device (SSD) 38 °C
  223GB TOSHIBA MKNSSDEC 240GB SCSI Disk Device (SSD) 34 °C
  931GB Western Digital WDC WD10EZEX-08M2NA0 SCSI Disk Device (SATA) 34 °C
  3725GB Western Digital WD Elements 107C USB Device (USB (SATA)) 34 °C
- HL-DT-ST DVDRAM GH24NS90 SCSI CdRom Device
- Creative X-Fi Audio Processor (WDM)
```
_This post is published on Apr 26, 2026 Sunday 05:20:59 PM CDT_
