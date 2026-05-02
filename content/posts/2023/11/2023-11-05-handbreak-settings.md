---
title: ' Handbreak Settings for ShadowPlay Recordings'
date: 2023-11-05T10:07:00
draft: false
tags: ["handbreak"]
---
I record a lot of gameplay footage using Nvidia ShadowPlay. I play most games on my ultrawide monitor at a resolution of 3440x1440. At times, the file sizes can balloon up to over 10GB with a target bit rate is 50Mbps.

In an effort to reduce the storage size, and not to have to upgrade my hard drive, I decided to explore Handbreak to compress and encode some of the videos I recorded. After doing some research, here are the settings I picked, which seem to find the right balance between compression and quality.

In the Summary tab, check the Web Optimized option.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/handbreaksettings/01-handbreaksettings-2023-11-05-08_34_42.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/handbreaksettings/01-handbreaksettings-2023-11-05-08_34_42.jpg"
>}}

In the Dimensions tab, set the target video resolution, which for me is 3440x1440.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/handbreaksettings/02-handbreaksettings-2023-11-05-08_34_58.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/handbreaksettings/02-handbreaksettings-2023-11-05-08_34_58.jpg"
>}}

For Audio, I went with mp3 codec and set the gain to +5

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/handbreaksettings/03-handbreaksettings-2023-11-05-08_41_01.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/handbreaksettings/03-handbreaksettings-2023-11-05-08_41_01.jpg"
>}}

The settings on the Video tab might require some tweaking based on the desired quality. In this specific example, I encoded an 8.92 GB video down to <>. The important things that affect the quality of the produced video are these -

- Video Encoder - H.265 10-bit (NVEnc)
- Framerate - Same as source
- Encoder Preset - Slowest
- Constant Quality - 28

Using the CPU to do the encoding is extremely slow compared to NVEnc encoder. The quality difference between CPU encoding and NVEnd encoding is not discernible to me, and it is also not very taxing on the system.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/handbreaksettings/04-handbreaksettings-2023-11-05-08_45_10.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/handbreaksettings/04-handbreaksettings-2023-11-05-08_45_10.jpg"
>}}

### Constant Quality vs Average Bit Rate

I debated between using Avg Bitrate and Constant Quality. Turns out that Handbreak recommends using Constant Quality over Average Bitrate.

<p>
{{< newtab href="https://handbrake.fr/docs/en/latest/technical/video-cq-vs-abr.html" text="Constant Quality vs Average Bit Rate" >}}
</p>

It appears that the recommended way of doing things is by using Constant Quality over Average Bit Rate. I did however notice that there are situations where Average Bit Rate is preferable to using CQ, such as when encoding a video file, and I am not particularly concerned about preserving quality as reducing the file size. I tend to look at the existing bit rate, and then perhaps target 30% of it.

The following video is a ShadowPlay recording which was encoded using the above settings.

<p>
{{< youtube 7weuuaKmcWw >}}
</p>

{{< newtab href="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/logs/handbreaksettings/Battle-of-the-Bulge-Full-Round-Battlefield-2042.txt" text="Here" >}} is the encoding log. The entire job took around 30 minutes.
