---
date: '2026-04-04T07:04:52'
draft: true
title: 'test post'
cover:
  image: "img/helloworld.jpg"
  alt: 'Hello World'
  caption: 'Hello World Cover Caption'
  relative: false # ← explicit for static folder images
tags: ["game review"]
---

<!-- http://localhost:1313/posts/2026/04/first/ -->
Hello World!

<!--This is being loaded from  /home/sysuser/git/thelocalhoster/static/img/helloworld.jpg -->
![Hello World](/img/helloworld.jpg)

<!-- resized image -->
{{< figure src="/img/helloworld.jpg" width="128" caption="hello world" >}}

<!-- this is an example from https://github.com/9EED/Markdown-guide -->
{{< figure src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" width="128" caption="github" >}}

From github repo with center align and a clickable image.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/helloworld.jpg"
    width="256"
    align="center"
    caption="from staticcontent repo"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/helloworld.jpg"
>}}

{{< details summary="See the details" >}}
This is a **bold** word.
{{< /details >}}



This is a code block

```
# this is code

System.out.println("Hello world!");

```
<!-- test new line -->
test
test2

<div class="italic-block">

<p>this is a test</p>
<p>this is a test</p>
<p>this is a test</p>
</div>



How to escape symbols

\+
Qk4pgVj5_yM
"double quotes inside double quotes \""

### making a table


| Date              | Market Reaction | Event Description   |
|-------------------|-----------------|---------------------|
| January 28, 2026  | 7,002.28 | Pre-war all time high |
| February 28, 2026 | The drop begins   | Oil is high, stocks are low |
| March 30, 2026    | 6,316.91 | Lowest close during the Iran war scare (down 9.8% from Jan 28 high; worst levels since late 2024). |
| April 8, 2026     | Rebound | U.S.-Iran ceasefire/truce signals emerge; major relief rally begins as investors price in de-escalation. |
| April 15, 2026    | 7,022.95 | New all-time high; S&P 500 surpasses previous record (Jan 28 high) and crosses back above 7,000. Full recovery of all Iran-war losses + new record set.|

#### strikethrough

`~~Battlefield 1 SP~~`
~~Battlefield 1 SP~~

#### youtube video

<p>
{{< youtube GdmQzi6I0oo >}}
</p>

#### Open link in a new tab
{{< newtab href="https://www.example.com" text="TEXT HERE" >}}

#### link to another page in the blog

{{< newtab href="/posts/2010/01/reviews/lotrbfme-review/" text="Lord of the Rings Battle For Middle Earth" >}}
{{< newtab href="/posts/2010/01/reviews/lotrbfme-review/" text="<span class='link-color'>review</span>" >}}
{{< newtab href="http://bf3stats.com/stats_pc/twobles/" text="<span class='link-color'>twobles</span>" >}}

append this `master/images/graw_review/03_graw_review_2023_02_25_22_59_39_269.jpg` to `@`

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/helloworld.jpg"
    width="256"
    align="center"
    caption="from staticcontent repo"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/helloworld.jpg"
>}}

_First published on GameSpot_

_This post is published on _
