---
title: 'Remove Ads in Yahoo Messenger'
date: 2007-06-17T10:43:00
draft: false
tags: ["guide"]
---
Yahoo! Messenger 7.5 and Yahoo! Messenger with Voice 8 is the install messaging client from Yahoo! which now able to exchange and send instant messages to Windows Live Messenger’s users. Like Windows Live Messenger, Yahoo! Messenger has all the best features, with lots of advertisements and animated ads. If you don’t like the ads and wants no ads on Yahoo! Messenger window, there are few ways that allow you to remove the advertisements.

Ads in Yahoo! Messenger can be removed by manually editing the registry.

1. Launch Registry Editor (Start -> Run -> Regedit).
2. Navigate to HKEY_CURRENT_USER\Software\yahoo\pager\YUrl
3. Replacing the following registry values with dummy asterisk (*):
```
Messenger Ad
Webcam Upload Ad
Webcam Viewer Ad
Webcam Viewer Ad Big
Webcam Viewer Ad Medium
Change Room Banner
Conf Adurl
Chat Adurl
```
After change, the registry keys and values will looks like this:

{{<
    figure
    src="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/yahoomessenger-remove-ads/yahoo-messenger-no-ads.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/yahoomessenger-remove-ads/yahoo-messenger-no-ads.jpg"
>}}

If the registry key doesn’t exist, simply create a new String Value registry key with the name by right clicking on the above registry branch and select New -> String Value.

4. Close Registry Editor and launch Windows Explorer.
5. Go to C:\Program Files\Yahoo!\Messenger\Cache\
6. Locate the file urls.xml
7. Clear the content of urls.xml
8. Save the empty urls.xml file (it should be an empty file).
9. Change the attributes of urls.xml to Read-Only by right click on the file and select properties, and click on Read-only.

That should make your Yahoo Messenger look like this:

{{<
    figure
    src="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/yahoomessenger-remove-ads/yahoo-messenger.JPG"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/yahoomessenger-remove-ads/yahoo-messenger.JPG"
>}}
