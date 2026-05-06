---
title: 'Cat School Gear Upgrade Diagrams - Part 2 - Enhanced Feline Trousers Bug'
date: 2017-12-10T23:12:00
draft: false
tags: ["guide", "witcher"]
#cover:
  #image: "https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/05-enhancedfelinetrousersbug.jpg"
  #relative: false # ← explicit for static folder images
---
This is a bug you could encounter if you are using the `Fast Travel From Anywhere` mod.

In order to find the Enhanced Feline Trousers, you will need to go underground through an iron grate on the floor in a house in Oxenfort, however but the grates are closed. This is because a cutscene that was supposed to trigger after the Get Junior main quest, was skipped because I used the fast travel option out of the compound in Novigrad.

As far as I can tell, there is no way to trigger it once it is skipped.

The only way to finish `Cat School Gear Upgrade Diagrams - Part 2` treasure hunt at this point is to use the game's debug console to add the Enhanced Feline Trousers diagram, and manually set the quest status to complete.

Here is how it is done.

NOTE - Ensure that you got all the other items before you attempt this.

1. Enable debug console

- Go to `E:\GOG Games\The Witcher 3 Wild Hunt GOTY\bin\config\base`
- Edit `general.ini` file
- Add the following line - `DBGConsoleOn=true`

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/01-enhancedfelinetrousersbug.png"
    width="640"
    align="center"
    caption="Enabling debug console in The Witcher 3 (PC)"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/01-enhancedfelinetrousersbug.png"
>}}

2. Start the game and load a save game

3. Hit the ` ~ ` key

4. Enter the following commands in order -

```
additem("Witcher Lynx Pants Upgrade schematic 1", 1)
addfact(th1003_fdb_pants_upgrade1_explored)
```

This will add the diagram, and set the status of `Cat School Gear Upgrade Diagrams - Part 2` to Completed.

<p>
{{< youtube g1_dsMG9Ndw >}}
</p>

Here are some more screenshots -

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/02-enhancedfelinetrousersbug.jpg"
    width="640"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/02-enhancedfelinetrousersbug.jpg"
>}}

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/03-enhancedfelinetrousersbug.jpg"
    width="640"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/03-enhancedfelinetrousersbug.jpg"
>}}

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/04-enhancedfelinetrousersbug.jpg"
    width="640"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/04-enhancedfelinetrousersbug.jpg"
>}}

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/05-enhancedfelinetrousersbug.jpg"
    width="640"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/05-enhancedfelinetrousersbug.jpg"
>}}

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/06-enhancedfelinetrousersbug.jpg"
    width="640"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/06-enhancedfelinetrousersbug.jpg"
>}}

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/07-enhancedfelinetrousersbug.jpg"
    width="640"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/enhancedfelinetrousersbug/07-enhancedfelinetrousersbug.jpg"
>}}
