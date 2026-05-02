---
title: 'Make Excel 2010 Open In a New Instance'
date: 2014-10-10T05:37:00
draft: false
tags: ["guide"]
---This is a registry tweak to make MS Excel 2010 open documents in new instances when they are opened by double clicking on filename in Windows Explorer (or similar programs).

1. Backup registry

2. Make sure the backup can be restored

3. Changes to the registry

There are three values that need to be changed to make Excel documents in a new instance each time for XLSX extension.
- In the registry editor, Navigate to the following path -
    `HKEY_CLASSES_ROOT -> Excel.Sheet.12 -> shell -> Open -> command`
- Double click on the (Default) entry
- Now, paste the following at the very end of the value: "%1"
  Be sure to add space after `/dde`. The value should look something like this: `"<path>" /dde "%1"`
- Now, rename the "command" registry entry right below the (Default) entry to "command2"
  Check the screenshot below
- Rename the folder "ddeexec" to "ddeexec2"
  Check the screenshot below

{{<
    figure
    src="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/excel2010newinstance/10-10-2014-5-29-58AM.png"
    width="512"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://pub-547199c383d84d3aaec67970e5758c08.r2.dev/excel2010newinstance/10-10-2014-5-29-58AM.png"
>}}

This should allow excel to open files in new instances by default. also disabling DDE in the Excel options does not always work. This fix is for XLSX extension.

For `XLS` files, make similar changes to `Excel.Sheet.8`

For `XLSM` (with macros) files, make similar changes to `Excel.SheetMacroEnabled.12`

For `CSV` files, make similar changes to `Excel.CSV`

NOTE - In order to avoid registry tweaks, excel can be manually opened in a new instance each time, and then the spreadsheet can be opened in that instance. However, that option does not seem to work in Windows 8.1. I went ahead and made registry tweaks in Windows 8.1 and it works fine.

_This post is published on Apr 26, 2026 Sunday 09:53:24 AM CDT_
