---
title: 'Hamachi Logging Off After Disconnecting'
date: 2012-12-18T12:04:00
draft: false
---
I've been using Hamachi for a while, and everything was fine, until recently.

I remote into my home laptop when I am away. One fine evening when I was out of town, I was using my laptop at home remotely, and once I was done working, I put my computer to sleep. When I resumed working, I couldn't remote into my home laptop anymore. At the time I thought something must have happened to my home internet connection, and Hamachi couldn't log back in.

When I went back home, I discovered that the laptop was always online (I could tell because I was still connected Pidgin, and all my chat windows still showed me as online).

After some research I discovered that Hamachi would go offline every time the session is closed.

For example, I am using my home laptop through a remote desktop session, then I decide to close the remote desktop session, I can't remote back into the machine because Hamachi goes offline on all the networks.

Here is an excerpt from their blog post:

> So, in the hopes of converting more of you into paying customers, we’re making a small change to Hamachi: unless a computer is part of a paid network, you need to be logged in and running the Hamachi UI on your desktop in order to allow it to function. If no user is logged on to the computer then – even though the Hamachi service or daemon is active in the background – it will not go online in any networks that it may belong to. We believe this a fair change; if you’re using Hamachi casually (such as for gaming), then we’re glad to have you as a free user and this change does not affect you. If, on the other hand, you’re using Hamachi to access unattended computers, then this change does affect you and you will want to upgrade to the premium service in order to continue to benefit from it.

 Read the full post {{< newtab href="http://b.logme.in/2012/11/07/changes-to-hamachi-on-november-19th/" text="<span class='link-color'>HERE</span>" >}}.

I don't know if there are better alternatives to Hamachi. I did not like Team Viewer 7. I will keep looking.

All I need is a free VPN application that I can install on both machines, and be able to remote desktop using the VPN ip address.

_This post is published on Apr 26, 2026 Sunday 06:54:27 AM CDT_
