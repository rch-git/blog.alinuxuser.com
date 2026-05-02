---
title: 'Remote Desktop Connection Stuck In Please Wait State'
date: 2023-05-27T15:02:00
draft: false
tags: ["guide"]
---
I found this solution in the {{< newtab href="https://learn.microsoft.com/en-us/answers/questions/451406/rdp-to-windows-10-hangs-at-please-wait-screen" text="Q&A section" >}} of Microsoft Learn. Credit goes to the original author.

This process will involve creatating an .rdp file, and editing it in notepad and adding a flag which will prompt the user to enter their password.

- Get the ipaddress of the machine that is stuck in the Please Wait state.
```
ping [server] -4
-4 flag ensures that IPv4 address is used.
```

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/01-remotedesktopstuckinwait-2023-11-27-06_27_29.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/01-remotedesktopstuckinwait-2023-11-27-06_27_29.jpg"
>}}

- Open Remote Desktop Connection application.
-- Start -> Remote Desktop Connection or Start -> mstsc
- Enter the IP address of the machine noted in the above step.
- Click on the Show Options button.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/02-remotedesktopstuckinwait-2023-11-27-06_37_33.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/02-remotedesktopstuckinwait-2023-11-27-06_37_33.jpg"
>}}

- Click on Save As and save the configuration to a file.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/03-remotedesktopstuckinwait-2023-11-27-06_42_48.jpg"
    align="center"
    height="384"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/03-remotedesktopstuckinwait-2023-11-27-06_42_48.jpg"
>}}

- Navigate to the directory where the rdp configuration file is saved. Right click on the file, and open the configuration file with Notepad.
- Add the following to the bottom of the file and save it. This option will turn off the Network Level Authentication therefore the user will be prompted to enter the password up on connecting to the server.
```
enablecredsspsupport:i:0
```

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/04-remotedesktopstuckinwait-2023-11-27-08_25_15.jpg"
    width="256"
    height="384"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/04-remotedesktopstuckinwait-2023-11-27-08_25_15.jpg"
>}}

- Once the file is saved, double click on it, so launch Remote Desktop Connection and click on Connect. Click Yes on the next dialog box to connect despite certificate errors.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/05-remotedesktopstuckinwait-2023-11-27-08_59_34.jpg"
    width="384"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/05-remotedesktopstuckinwait-2023-11-27-08_59_34.jpg"
>}}

- This should show a Windows login page, and up on logging in, will get past the Please Wait screen.

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/06-remotedesktopstuckinwait-2023-11-27-08_38_21.jpg"
    width="512"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/06-remotedesktopstuckinwait-2023-11-27-08_38_21.jpg"
>}}

#### Reset Session

Another way to resolve this issue is resetting the session. It is important to note that doing this will log off the user, therefore any running processes will be terminated.

1. Open Powershell in Administrator mode on another computer
2. Run the following query -
    `"query user /server:[server_name]"`
3. Take note of the sessionname
4. Run the following query -
    `"reset session [session_name] /server:[server_name]"`

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/07-remotedesktopstuckinwait-2023-05-27-14_49_03.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/07-remotedesktopstuckinwait-2023-05-27-14_49_03.jpg"
>}}

This should reset the session and allow logging into the server via remote desktop.

In addition to this, I was having an issue when using Remote Desktop Connection Manager the session would get stuck in a Please Wait state. I was not having this issue when using native Windows RDP.

I found a potential solution on this following page - {{< newtab href="https://learn.microsoft.com/en-us/answers/questions/451406/rdp-to-windows-10-hangs-at-please-wait-screen" text="RDP to Windows 10 hangs at Please wait screen" >}}


`Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Connections`

At that level Enable the following setting

- Restrict Remote Desktop Services User to a Single Remote Desktop Services Session

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/08-remotedesktopstuckinwait-2023-11-23-10_23_26.jpg"
    align="center"
    width="512"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/08-remotedesktopstuckinwait-2023-11-23-10_23_26.jpg"
>}}

{{<
    figure
    src="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/09-remotedesktopstuckinwait-2023-11-23-10_23_50.jpg"
    align="center"
    width="512"
    target="_blank"
    rel="noopener"
    link="https://cdn.jsdelivr.net/gh/rch-git/staticcontent@master/images/remotedesktopstuckinwait/09-remotedesktopstuckinwait-2023-11-23-10_23_50.jpg"
>}}
