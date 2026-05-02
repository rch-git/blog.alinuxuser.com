---
title: 'Set Up A Simple Website Using Tomcat & Namecheap'
date: 2018-04-05T22:08:00
draft: false
tags: ["guide"]
---

In this post, I will share the steps I used to create a very simple website using Tomcat webserver, and Namecheap DNS.

#### Web server configuration

1. Download the latest tomcat. The version in this case is 9.0.6. Download it {{< newtab href="https://tomcat.apache.org/download-90.cgi" text="<span class='link-color'>HERE</span>" >}}.

2. Create the following directory –
```
D:\MyWebsites
```

3. Paste the tomcat package directory inside the MyWebsites directory

4. Rename the package to the directory name of the website

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/01-websitewithtomcatnamecheap.png"
    align="center"
    caption="This directory will serve the website"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/01-websitewithtomcatnamecheap.png"
>}}

5. Download jdk {{< newtab href="http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html" text="<span class='link-color'>HERE</span>" >}}. This step is not necessary depending on how java is installed on the machine. I prefer deploy java in this manner.

6. Deploy jdk in the following directory –
```
D:\java\jdk64-1.8.0_161
```
{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/02-websitewithtomcatnamecheap.png"
    align="center"
    caption="Java directory"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/02-websitewithtomcatnamecheap.png"
>}}

7. Create setenv.bat file and place it in the \bin directory. Specify the java home in the file.
{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/03-websitewithtomcatnamecheap.png"
    align="center"
    caption="setenv.bat"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/03-websitewithtomcatnamecheap.png"
>}}


8. Create an index.html file and drop it in the following directory –
```
D:\MyWebsites\rc03.net\webapps\ROOT
```
{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/04-websitewithtomcatnamecheap.png"
    align="center"
    caption="index.html"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/04-websitewithtomcatnamecheap.png"
>}}

9. Run the startup.bat in the \bin directory
{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/05-websitewithtomcatnamecheap.png"
    align="center"
    caption="Running startup.bat will show the environment variables"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/05-websitewithtomcatnamecheap.png"
>}}

10. Access localhost:8080 in the browser
{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/06-websitewithtomcatnamecheap.png"
    align="center"
    caption="localhost"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/06-websitewithtomcatnamecheap.png"
>}}

#### Router Configuration

1. Gather the internal IP address of the machine that is running the tomcat server –
{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/07-websitewithtomcatnamecheap.png"
    align="center"
    caption="ipconfig"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/07-websitewithtomcatnamecheap.png"
>}}

2. Open the router configuration page and find the port forwarding settings. This can be typically accessed at `192.168.0.1`.

3. Add a new rule for forwarding http traffic to port 8080
{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/08-websitewithtomcatnamecheap.png"
    align="center"
    caption="Port forwarding"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/08-websitewithtomcatnamecheap.png"
>}}

4. Go to {{< newtab href="https://canyouseeme.org/" text="<span class='link-color'>CanYouSeeMe.org</span>" >}}.

5. Type in the port and click on the Check Port button
{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/09-websitewithtomcatnamecheap.png"
    align="center"
    caption="Port status"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/09-websitewithtomcatnamecheap.png"
>}}

#### Namecheap host record configuration

1. Go to {{< newtab href="https://whatismyip.com" text="<span class='link-color'>WhatIsMyIP.com</span>" >}} and take note of the external IP address (also known as the WAN IP).

2. Go to Advanced DNS configuration.

3. In the host records section, create the following:
```
Type: A record; Host: @; Value: <external-ip>; TTL: Automatic
Type: URL Redirect Record; Host: www; Value: http://<domain>:8080 Masked META (We use this record because www.domain-name.com will be redirected, and “work” in the browser)
```
{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/10-websitewithtomcatnamecheap.png"
    align="center"
    caption="Host records"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitewithtomcatnamecheap/10-websitewithtomcatnamecheap.png"
>}}

The record for the wildcard exists for creating virtual hosts in Tomcat, which I will cover in a later document.

#### Problems I encountered

I have a Netgear C6300BD, and the router is running Firmware Version V2.05.18.

It turns out that this particular router does not support loopback functionality, therefore when you have port forwarding setup, accessing `http://<external-ip>:8080` does not work from within the network.

The best to test if the setup is working is by accessing your website from outside the network, and the most convenient way to do this is through a mobile device with.

_This post is published on Apr 26, 2026 Sunday 08:31:03 AM CDT_
