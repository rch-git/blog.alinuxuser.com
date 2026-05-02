---
title: 'Private Internet Access - Request Timed Out Issue '
date: 2023-03-19T13:46:00
draft: false
tags: ["guide"]
---
#### Short Story

I had to update the firmware on my {{< newtab href="https://www.amazon.com/dp/B00K4DS5KU?psc=1&ref=ppx_yo2ov_dt_b_product_details" text="TP-Link 8 Port Gigabit Switch" >}} to resolve the connectivity issues when using a VPN client. I installed {{< newtab href="https://www.tp-link.com/us/support/download/tl-sg108e/v6/#Firmware" text="Build 20220930 (Published Date: 2022-10-12)" >}} and that took care of the problem.

#### Long Story

My plan was to self host my blog using PIA VPN's static IP feature. My website is currently on Blogger, and I get the feeling that Blogger has been abandoned by Google, and won't be around for much longer. Also, this will be some much needed experience with some basic frontend web development, and I could create my own CI/CD process etc.

I did not want to host the website on my main server, so I decided to provision a Windows 11 VM (my Linux skills are subpar, and also I get to play with Windows 11, which I haven't a chance yet) and create my first prototype website. I did the necessary networking in VMWare Player 17; I created a bridged connection so that I could RDP into the VM if I needed to.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/piarequesttimedoutissue/01-piarequesttimedoutissue-2023-03-19-12_30_25.jpg"
    width="512"
    align="center"
    caption="VM Settings"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/piarequesttimedoutissue/01-piarequesttimedoutissue-2023-03-19-12_30_25.jpg"
>}}

Having installed the PIA VPN client, I noticed that my connection was extremely unstable. Running the following command would result in Request timed out.

```
ping cloudflare.com -t
```

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/piarequesttimedoutissue/02-piarequesttimedoutissue-2023-03-14-00_14_52.jpg"
    width="384"
    height="512"
    align="center"
    caption="Ping"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/piarequesttimedoutissue/02-piarequesttimedoutissue-2023-03-14-00_14_52.jpg"
>}}

At first I thought there was something wrong with the VPN service. I disabled the firewall, tried a combination of VPN related settings, and nothing seemed to help. I began searching for any reported outages etc., but there didn't seem to be any. NOTE: I have not yet purchased the static IP. I was only testing the viability of using a VPN to host a website and if I couldn't even get a stable connection, there is no point in self hosting.

After many hours of troubleshooting over a course of few weeks, I gave up on the idea until yesterday when I decided to give it another go. As a part of troubleshooting process, I installed PIA VPN (with default settings) on the main home server, and noticed the same issue. Whenever I am connected to VPN, I had a ton of packet loss. I realized that there was something else going on here, and its not just the VM or PIA service that was having issues.

I decided to connect to PIA VPN (with the settings shown) from my main gaming machine, and monitored ping to cloudflare.com at the same time from both the main server and gaming machine, and I noticed that the gaming machine had no packet loss whatsoever. This obviously rules out PIA VPN.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/piarequesttimedoutissue/03-piarequesttimedoutissue-2023-03-19-12_51_39.jpg"
    align="center"
    caption="Protocols - PIA Settings"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/piarequesttimedoutissue/03-piarequesttimedoutissue-2023-03-19-12_51_39.jpg"
>}}

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/piarequesttimedoutissue/04-piarequesttimedoutissue-2023-03-19-12_51_52.jpg"
    align="center"
    caption="Network - PIA Settings"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/piarequesttimedoutissue/04-piarequesttimedoutissue-2023-03-19-12_51_52.jpg"
>}}

At this point, it dawned on me that the gaming machine is connected directly to the cable modem, whereas the main server is connected via the TP-LINK switch. I started exploring the settings of the switch itself through the web interface and changing them did not help. As a last ditch effort, I decided to upgrade the firmware. The existing firmware was from 2021 version. Unfortunately, I did not take a note of the exact firmware version. I attempted to update to `TL-SG108E(UN)_V6_1.0.0 Build 20230218`. This was unsuccessful. I downloaded the next latest version, which was from 2022, `TL-SG108E(UN)_V6_1.0.0 Build 20220930`.

Updating to this version was successful...sort of. Once I kicked off the upgrade process, the switch rebooted, but the Easy Smart Configuration Utility would show that the update was still at 84%, however, this might just be the UI not updating, because closing an reopening the utility showed that the upgrade was successful.

Following the upgrade to `TL-SG108E(UN)_V6_1.0.0 Build 20220930`, I am no longer getting the packet loss. Hopefully, this will help someone out there looking to resolve connectivity issues, especially when using a VPN service.
