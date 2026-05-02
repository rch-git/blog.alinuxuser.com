---
title: 'Fix Error When VT-x (Virtualization) is Enabled in VMWare Player '
date: 2023-01-30T14:52:00
draft: false
tags: ["guide"]
---
I was unable to enable virtualization on my Windows 10 VM on a Windows 10 host. I did have virtualization enabled in the BIOS, but that didn't seem to help. When I check the box to enable this feature, Virtualize Intel VT-x/EPT or AMD-V/RVI, I would get an error.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/vtxerrorvmwareplayer/01-vtxerrorvmwareplayer-2023-01-30-19_12_24.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/vtxerrorvmwareplayer/01-vtxerrorvmwareplayer-2023-01-30-19_12_24.jpg"
>}}

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/vtxerrorvmwareplayer/02-vtxerrorvmwareplayer-2023-01-30-19_13_08.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/vtxerrorvmwareplayer/02-vtxerrorvmwareplayer-2023-01-30-19_13_08.jpg"
>}}


I want this feature enabled to run Docker in my VM.

This is my system configuration:
```
Microsoft Windows 10 Pro
    - Version 10.0.19045 Build 19045
Intel(R) Core(TM) i7-6700K CPU @ 4.00GHz, 4008 Mhz, 4 Core(s), 8 Logical Processor(s)
American Megatrends Inc. 1.I0, 6/26/2018
Installed Physical Memory (RAM) 32.0 GB
Realtek High Definition Audio
Killer E2400 Gigabit Ethernet Controller
Samsung SSD 850 EVO 500GB
Samsung SSD 850 EVO 500GB
WDC WD10EZEX-08WN4A0
```

I know my computer is more than capable of running a VM with virtulization. I found several powershell commands out there, and running them did not help. I did some digging and found that certain windows features need to be disabled for virtulization to work in a VM.

I resolved this problem by doing this:

1. Open Turn Windows features on or off.
2. Turn off the following features:
    -- Hyper-V
    -- Virtual Machine Platform
    -- Windows Hypervisor Platform
    -- Windows Sandbox
    -- Windows Subsystem for Linux
    {{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/vtxerrorvmwareplayer/03-vtxerrorvmwareplayer-2023-01-30-07_50_57.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/vtxerrorvmwareplayer/03-vtxerrorvmwareplayer-2023-01-30-07_50_57.jpg"
    >}}
3. Save and restart the computer.
4. Open VMWare Player
5. Select the VM and edit the VM settings
6. Enable Virtualize Intel VT-x/EPT or AMD-V/RVI

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/vtxerrorvmwareplayer/04-vtxerrorvmwareplayer-2023-01-30-19_03_23.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/vtxerrorvmwareplayer/04-vtxerrorvmwareplayer-2023-01-30-19_03_23.jpg"
>}}

Once the virtual machine is up and running, install Docker. This will require installing WSL2 in the VM. If everything is done right, Docker should start successfully.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/vtxerrorvmwareplayer/05-vtxerrorvmwareplayer-2023-01-30-19_18_35.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/vtxerrorvmwareplayer/05-vtxerrorvmwareplayer-2023-01-30-19_18_35.jpg"
>}}
