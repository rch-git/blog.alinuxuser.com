---
title: 'VM on Windows 7 Freezing with VMware Player 12'
date: 2017-02-18T14:54:00
draft: false
tags: ["guide"]
---
I run a Windows 7 VM on a Windows 10 Host OS. I've been having issues with the VM freezing intermittently. The host OS does not have any issues. I have to shut down the VM through VMware controls, and restart it.

{{<
    figure
    src="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/win7vmfreeze/01-win7vmfreeze-2-18-2017-2-43-38PM.png"
    width="512"
    align="center"
    caption="VMware Player Version"
    target="_blank"
    rel="noopener"
    link="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/win7vmfreeze/01-win7vmfreeze-2-18-2017-2-43-38PM.png"
>}}

I looked at the VMware log to find this error -

```
2017-02-13T20:24:26.983-06:00| vmx| I125: GuestMsg: Channel 2, Cannot unpost because the previous post is already completed
2017-02-13T20:24:26.983-06:00| vmx| I125: GuestRpc: Reinitializing Channel 0(toolbox-dnd)
2017-02-13T20:24:26.983-06:00| vmx| I125: GuestMsg: Channel 0, Cannot unpost because the previous post is already completed
2017-02-13T20:24:30.429-06:00| vmx| I125: E1000: E1000 rx ring full, drain packets.
2017-02-13T20:24:36.432-06:00| vmx| I125: E1000: E1000 rx ring full, drain packets.
2017-02-13T20:24:42.735-06:00| vmx| I125: E1000: E1000 rx ring full, drain packets.
2017-02-13T20:24:48.710-06:00| vmx| I125: E1000: E1000 rx ring full, drain packets.
2017-02-13T20:25:00.711-06:00| vmx| I125: E1000: E1000 rx ring full, drain packets.
2017-02-13T20:25:14.736-06:00| vmx| I125: E1000: E1000 rx ring full, drain packets.
2017-02-13T20:25:30.789-06:00| vmx| I125: E1000: E1000 rx ring full, drain packets.
2017-02-13T20:25:48.203-06:00| vmx| I125: E1000: E1000 rx ring full, drain packets.
2017-02-13T20:25:51.683-06:00| vmx| I125: GuestRpcSendTimedOut: message to toolbox-dnd timed out.
```

I wasn't sure if this was strictly related at first, but I noticed this error was in the log every time the VM froze. I did some research online, and there was a post on the VMware forums (don't have the link at the moment), where someone suggested changing the send and receive buffers.

In device manager in the Windows VM, I accessed the properties for the network card. I changed the Transmit and Receive from 256 to 512. I did this a week ago, and so far, I have not had any issues.

{{<
    figure
    src="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/win7vmfreeze/02-win7vmfreeze-2-18-2017-2-42-05PM.png"
    align="center"
    caption="Transmit Buffers"
    target="_blank"
    rel="noopener"
    link="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/win7vmfreeze/02-win7vmfreeze-2-18-2017-2-42-05PM.png"
>}}

{{<
    figure
    src="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/win7vmfreeze/03-win7vmfreeze-2-18-2017-2-41-25PM.png"
    align="center"
    caption="Receive Buffers"
    target="_blank"
    rel="noopener"
    link="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/win7vmfreeze/03-win7vmfreeze-2-18-2017-2-41-25PM.png"
>}}

