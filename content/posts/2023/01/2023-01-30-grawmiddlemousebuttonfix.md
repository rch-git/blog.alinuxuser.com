---
title: 'How To Fix Middle Mouse Button To Give Orders - Ghost Recon Advanced Warfighter (Steam)'
date: 2023-01-30T06:51:00
draft: false
tags: ["games"]
---
This is a fix for the middle mouse button not working when giving orders in Ghost Recon Advanced Warfighter. I am using the Steam version for this, but I would imagine this fix will work on any PC version.

1. Navigate to the following location:
```
E:\SteamLibrary\steamapps\common\Ghost Recon Advanced Warfighter\Settings
```

2. Open the following file in a text editor:
```
ctrl_set_def.xml
```

3. Change the following line:
```
<button id="hud_select" binding="2" device="mouse" group="misc"/>
```

To this:
```
<button id="hud_select" binding="2" device="mouse" group="tactics"/>
```

4. Save the file and start the game.

Here is a video showing this process.

<p>
{{< youtube 0lEYOF0OrUI >}}
</p>

_This post is published on Apr 11, 2026 Saturday 05:15:56 PM CDT_
