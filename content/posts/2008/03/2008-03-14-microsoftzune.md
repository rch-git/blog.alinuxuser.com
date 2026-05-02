---
title: 'Rectify problems with Microsoft Zune Theme'
date: 2008-03-14T15:34:00
draft: false
---
There's a rather glaring error in the installation of the Zune theme that causes such things as Windows Explorer's Places Bar (i.e., the left side of the window with common tasks, when the Explorer Bar is closed), as well as Control Panel's Places Bar and Category View (i.e., the left and right sides of the window), to have only white backgrounds, rather than correctly displaying the theme's dark gray, light gray, and orange colors.

These are among other anomalies found elsewhere. Unless the sub-directories are correctly placed, which the installer doesn't do, you will only get part of the theme. (As in the Aero theme in Vista, even though only one color scheme is defined, the Theme Management Service still needs its sub-directories, and its resources, in the right places).

To correct this, on your desktop, create a new folder called Shell, and, within this new Shell folder, create another new folder called `NormalColor`. Go to:

`C:\WINDOWS\Resources\Themes\Zune` and drag the new Shell folder into the Zune folder. Then Cut `shellstyle.dll` in the Zune folder, and Paste it into the NormalColor folder, so that you end up with:

> C:\WINDOWS\Resources\Themes\Zune\Shell\NormalColor\shellstyle.dll

and NOT

> C:\WINDOWS\Resources\Themes\Zune\shellstyle.dll

To re-apply the theme, you can double click on

> C:\WINDOWS\Resources\Themes\Zune\zune.msstyles.
