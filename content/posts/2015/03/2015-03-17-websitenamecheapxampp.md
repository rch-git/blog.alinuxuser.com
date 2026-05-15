---
title: 'Setup a simple website with Namecheap domain & XAMPP'
date: 2015-03-17T09:11:00
draft: false
tags: ["guide"]
---
Here are the steps to setup a very simple website using xampp and a Namecheap domain.
1. Obtain your external IP address
    - Go to {{< newtab href="https://www.whatismyip.com/" text="<span class='link-color'>whatismyip</span>" >}} and get "Your IP" address

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/01-websitenamecheapxampp.jpg"
    align="center"
    caption="Take note of the external IP address"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/01-websitenamecheapxampp.jpg"
>}}


2. Configure URL forwarding
    - Go to the URL forwarding section in Namecheap domain configuration.
    - Now set the values for the IP Address/URL and Record type as follows -
```
A (Address) - Your IP
URL Frame - http://<your_ip>:8080/mysite
```

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/02-websitenamecheapxampp.jpg"
    align="center"
    width="640"
    caption="URL Forwarding section in Namecheap domain configuration"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/02-websitenamecheapxampp.jpg"
>}}

3. Obtain your internal IP address
    - Open the command prompt window and type `ipconfig` and hit enter

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/03-websitenamecheapxampp.jpg"
    align="center"
    width="640"
    caption="Identify your network adapter and take note of IPv4 Address"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/03-websitenamecheapxampp.jpg"
>}}

4. Configure port forwarding
    - Log into the router configuration by going to this address in the browser - `http://192.168.0.1/` (This might be router specific)
    - Go to the Port Forwarding section, and add an entry to forward HTTP traffic for port 8080

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/04-websitenamecheapxampp.jpg"
    width="640"
    align="center"
    caption="Router port forwarding configuration"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/04-websitenamecheapxampp.jpg"
>}}

5. Configure Apache to serve on port 8080
    - Open the Xampp control panel, and click on Configure and then on Apache (httpd.conf)

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/05-websitenamecheapxampp.jpg"
    width="640"
    align="center"
    caption="XAMPP Control Panel"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/05-websitenamecheapxampp.jpg"
>}}

6. This should open the config file in notepad. Change the line Listen 80 line to Listen 8080

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/06-websitenamecheapxampp.jpg"
    width="640"
    align="center"
    caption="Apache httpd.conf"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/06-websitenamecheapxampp.jpg"
>}}


{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/07-websitenamecheapxampp.jpg"
    width="640"
    align="center"
    caption="XAMPP Control Panel after listen port change"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/07-websitenamecheapxampp.jpg"
>}}

6. Create your website directory
    - Create a folder called mysites in the server directory. The path will be as follows -
    `D:\Program Files (x86)\xampp\htdocs\mysite`

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/08-websitenamecheapxampp.jpg"
    width="640"
    align="center"
    caption="mysites folder in htdocs"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/08-websitenamecheapxampp.jpg"
>}}

7. Access your website via following URL in the browser -
    `http://localhost:8080/mysite/`

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/09-websitenamecheapxampp.jpg"
    align="center"
    caption="Website access on the local server. This should display the index.html in the browser"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/09-websitenamecheapxampp.jpg"
>}}

Now access your Namecheap domain. For me, its `www.patchrowcester.com`. This should serve the index.html page in the server directory.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/10-websitenamecheapxampp.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/websitenamecheapxampp/10-websitenamecheapxampp.jpg"
>}}

_This post is published on Tuesday, May 12, 2026, 5:51 AM CDT_
