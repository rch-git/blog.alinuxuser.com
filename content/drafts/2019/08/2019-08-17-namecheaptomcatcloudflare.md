---
title: 'Self Hosting Your Website (Namecheap, Tomcat, Cloudflare)'
date: 2019-08-17T10:45:00
draft: false
tags: ["guide"]
---
I am going to describe the process of setting up a website, all the way from purchasing a domain name, to making it available online via your domain name.

There are several ways to accomplish the end goal, and I am willing to bet there is room for improvement here too, so do not assume that this is gospel by any means. If you find that I made a mistake somewhere or if something could be improved upon, feel free to let me know, and I will correct it and gladly give you credit.

This post is only going to focus on router configuration, web server configuration, DNS* and TLS*. It is not going to cover anything related to web development.

With that said, let us proceed with the setup!

#### Prerequisites

1. Create a {{< newtab href="https://www.namecheap.com/" text="<span class='link-color'>Namecheap</span>" >}} account and purchase a domain name. For the purpose of this tutorial, I am going to use my own domain name - `rc03.net` - to get my website up and running.

2. Create a {{< newtab href="https://dash.cloudflare.com/sign-up" text="<span class='link-color'>Cloudflare</span>" >}} account.

3. Make a note of your external IP address from {{< newtab href="https://www.whatismyip.com/" text="<span class='link-color'>WhatIsMyIp.com</span>" >}}.

    Do not share this with the outside world. The reason why we are using Cloudflare DNS is because it protects your appserver from DDoS attacks, and your external IP is not revealed by inspecting the network traffic. They also issue a free certificate to setup TLS.

4. Download the latest {{< newtab href="https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/downloads-list.html" text="<span class='link-color'>Amazon Corretto 8 JDK</span>" >}}.

5. Download and install {{< newtab href="https://github.com/kaikramer/keystore-explorer/releases" text="<span class='link-color'>KeyStore Explorer</span>" >}}.

6. Download {{< newtab href="https://tomcat.apache.org/download-90.cgi" text="<span class='link-color'>Tomcat</span>" >}}.

#### Router Configuration

The first step to this process is router configuration. The only time to change it is if the internal IP of the appserver* changes.

Most ISPs do not allow serving over port 80 or 443. Therefore, we will use port 8080 for HTTP and 8443 for TLS (HTTPS). The configuration is going to be similar for most routers. The idea is very simple, whenever a request comes in through port 8080 or port 8443, we want to send it to the appserver.

1. Find out of the internal IP address of machine that will be running the web server.

Run, `ipconfig` in command prompt. This will give you a lot information, but you are specifically looking for the IPv4 Address of the network adapter that is connected to the router. It looks something like this -

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/01-namecheaptomcatcloudflare.jpg"
    width="640"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/01-namecheaptomcatcloudflare.jpg"
>}}

Make a note of this internal IP address.

2. Log into your router configuration webpage, and access the port forwarding section

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/02-namecheaptomcatcloudflare.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/02-namecheaptomcatcloudflare.jpg"
>}}

3. Add two custom services that will redirect any traffic over ports 8080 and 8443 to the appserver. The end result should look something like this.

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/03-namecheaptomcatcloudflare.jpg"
    caption="Port Forwarding Portmap table"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/03-namecheaptomcatcloudflare.jpg"
>}}

This concludes the router configuration. Once we have a web server up and running, and its configured to serve on the aforementioned ports, the website can be accessed via the external IP address. It will not aliased to a domain name yet; DNS configuration needs to be completed for that to work.

#### Tomcat configuration

In this section we will setup Tomcat to serve the website over HTTP. Configuring HTTPS will be covered later in the tutorial. What follows is one of many ways of configuring the directory structure. Should you choose to buy another domain name, and self host it on the same machine, this directory structure would be convenient.

1. Create the following directory - `MyWebsites` on the root of C: or D: drive.

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/04-namecheaptomcatcloudflare.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/04-namecheaptomcatcloudflare.jpg"
>}}

2. Create a directory inside `MyWebsites` with your domain name. Ex - `D:\MyWebsites\rc03.net`

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/05-namecheaptomcatcloudflare.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/05-namecheaptomcatcloudflare.jpg"
>}}

3. Extract the contents of Tomcat into the domain directory. Ensure that the directory structure looks like this -

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/06-namecheaptomcatcloudflare.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/06-namecheaptomcatcloudflare.jpg"
>}}

Startup script should be in this location - `D:\MyWebsites\rc03.net\bin\startup.bat`

4. Extra Java to the following path - `D:\java\amazon-jdk1.8.0_222`.
Ensure that the bin directory is in the following location - `D:\java\amazon-jdk1.8.0_222\bin`

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/07-namecheaptomcatcloudflare.jpg"
    align="center"
    caption="This will serve as `JAVA_HOME` for Tomcat"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/07-namecheaptomcatcloudflare.jpg"
>}}

5. Navigate to `D:\MyWebsites\rc03.net\bin` and create a batch file - `setenv.bat`

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/08-namecheaptomcatcloudflare.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/08-namecheaptomcatcloudflare.jpg"
>}}

6. Open the batch file in a text editor and add the following contents to it -
```
set "JAVA_HOME=D:\java\amazon-jdk1.8.0_222"
exit /b 0
```
{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/09-namecheaptomcatcloudflare.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/09-namecheaptomcatcloudflare.jpg"
>}}

7. Navigate to the following directory - `D:\MyWebsites\rc03.net\webapps\ROOT`

8. Create an html file and name it `index.html`.

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/10-namecheaptomcatcloudflare.jpg"
    align="center"
    caption="`index.html` will be the homepage for the website"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/10-namecheaptomcatcloudflare.jpg"
>}}

9. Open index.html in a text editor and add the following code to it and save it -
```
<html>
    <h1>Hello world!</h1>
</html>
```
10. Navigate to `D:\MyWebsites\rc03.net\bin` and run `startup.bat`. This should launch a command window, that looks like this -

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/11-namecheaptomcatcloudflare.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/11-namecheaptomcatcloudflare.jpg"
>}}

11. Open a browser, and access this url - `http://localhost:8080`. It should look like this -

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/12-namecheaptomcatcloudflare.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/12-namecheaptomcatcloudflare.jpg"
>}}

At this point, your web server is serving over port 8080.

12. Now, it is important to test if the router configuration is working as expected. There are two ways to do this.

    12.1. Go to {{< newtab href="https://portchecker.co/canyouseeme" text="<span class='link-color'>Port Checker</span>" >}}.
    Your external IP address is already populated. Type in port 8080 in the text box and click on Check Port. This should be successful

    {{<
        figure
        src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/13-namecheaptomcatcloudflare.jpg"
        align="center"
        target="_blank"
        rel="noopener"
        link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/13-namecheaptomcatcloudflare.jpg"
    >}}

    This indicates that the router configuration is working and the HTTP port is open to the outside world.

    12.2. Optional: Install Opera browser and enable VPN. Now access the following URL - `http://[external-ip]:8080`

    {{<
        figure
        src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/14-namecheaptomcatcloudflare.jpg"
        align="center"
        target="_blank"
        rel="noopener"
        link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/14-namecheaptomcatcloudflare.jpg"
    >}}

    This indicates that the website is accessible over the internet.

Congratulations! The website is now Live! We will now move on to DNS.

#### Namecheap Configuration

We will not be using Namecheap's DNS. Instead, we will configure Custom DNS, and point to Cloudflare's DNS servers.

1. Log into the Namecheap account.

2. Click on the Manage button corresponding to the domain name.

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/15-namecheaptomcatcloudflare.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/15-namecheaptomcatcloudflare.jpg"
>}}

3. In the Nameservers section, select Custom DNS. Add these two nameservers -
```
kai.ns.cloudflare.com
leia.ns.cloudflare.com
```

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/16-namecheaptomcatcloudflare.jpg"
    align="center"
    caption="Custom DNS configuration in Namecheap."
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/16-namecheaptomcatcloudflare.jpg"
>}}

This concludes Namecheap configuration. Let's proceed to Cloudflare configuration.

#### Cloudflare Configuration

1. Log into the Cloudflare account.

2. Click on Add Site button.

3. Enter the website name and click on Add site.

{{<
    figure
    src="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/17-namecheaptomcatcloudflare.jpg"
    align="center"
    target="_blank"
    rel="noopener"
    link="https://raw.githubusercontent.com/rch-git/staticcontent/refs/heads/master/images/namecheaptomcatcloudflare/17-namecheaptomcatcloudflare.jpg"
>}}

4. Select the free plan.

5. At this point, Cloudflare should be able to automatically detect DNS records.


6. If Cloudflare does not detect any DNS records, then add the following key records -


The A records should point to the external IP address.

NOTE - Ensure that Cloudflare HTTP proxy is enabled for the A records. If its not enabled, the external IP address of the app server will be public.

7. Save the DNS configuration.

8. Access the website URL using the DNS name and port number.

http://rc03.net:8080


This concludes DNS configuration. The website is serving over HTTP. I recommend setting up TLS so that the website can be accessed using HTTPS.

#### TLS Configuration

This is by far the most complicated and time consuming part of setting up a website. I tried to use Java keytool, but I have been unsuccessful. I will write another article on using the keytool when I figure it out. Until then, I am going to stick to using KeyStore Explorer.

Assuming that the router configuration is done exactly as described above, the web server will use 8443 port to serve over TLS. There are two parts to enabling TLS, generating a KeyStore that contains the identity keypair and public certificate, and configuring Tomcat to consume the KeyStore and serve over TLS.

##### Generating a KeyStore

1. Log into the Cloudflare account.

2. Click on Crypto tab.

3. Navigate down to Origin Certificates and click on Create Certificate.


4. In the next modal window, configure it as shown below -


5. Select PKCS #7 as the Key Format for Origin Certificate. Copy the text, paste it into a text editor and save it as - rc03-public-cert.p7b


Copy the text for the private key, paste it into a text editor and save it as rc03-private-key.pfx


6. Start KeyStore Explorer and select the option to create a new JKS KeyStore.

7. Click on Import Key Pair button, and select PKCS #8 format.


8. Browse to the private key and public cert and click Import.


9. Enter the alias.


10. Enter the password for the key pair and click OK.


This should successfully import the private key pair.


11. Click on the Set KeyStore password button and set the password.


12. Save the KeyStore.


##### Tomcat Configuration

1. Shut down the Tomcat web server if it is running.

2. Navigate to D:\MyWebsites\rc03.net\conf

3. Copy and paste the keystore file (rc03-keystore.jks) in this directory

4. Open server.xml in a text editor

5. Navigate to SSL/TLS section, and add the following configuration -



server.xml with TLS configuration.

6. Start the web server by running D:\MyWebsites\rc03.net\bin\startup.bat

7. Once the server is up and running, access the following URL - https://rc03.net:8443
This should be successful.


This concludes setting up TLS.

#### Conclusion

Once all the setup is done, the website can be as simple or complicated as needed. For a simple website, any low spec old desktop or laptop will do the job. I would imagine that self hosting is cheaper than paid hosting, but I did not do any cost analysis. The advantage of self hosting is that its a great learning experience, and it allows for greater control over hardware.

If you found this helpful, please leave a comment.

Legend
appserver - machine that is running the web server (tomcat).
DNS - Domain Name System. Its a way to map a name to a computer.
TLS - Transport Layer Security. Its commonly known as SSL (Secure Socket Layer)
