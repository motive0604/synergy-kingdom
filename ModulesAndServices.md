# Modules and services #
Details on how to use custom modules and services


# CIFS #
This module lets you access windows networking shares or linux samba on your phone.

First you need to setup a share.  In windows right click on a folder you want your phone to see and go to properties.  Click on the Sharing tab and go to Advanced Sharing.  In the share name it something without spaces for ease of use.  Now click on permissions.  Add the user "Everyone" and give it the permissions you want your phone to have (read/write/full control).

Now that your share is setup, go to start -> run -> cmd.  type in
```
ipconfig
```

and note your active connections IP address.  Now go to start -> run  and type in \\IPADDRESS, if your machines IP was 192.168.1.10 you would type in

```
\\192.168.1.10
```

you should see your share you just created show up. Try to open it up and make sure you can see the contents of the folder you shared without error.

now on your phone, connect to wifi, go to adb shell and run the following command, replacing //192.168.1.10/sharename with the IP and sharname you saw above,

```
mkdir /sdcard/smb/

busybox mount -t cifs -o guest,uid=1000,gid=1015,file_mode=0775,dir_mode=0775,iocharset=utf8,nodfs //192.168.1.10/sharename /sdcard/smb/
```

if you get an error you must mount with a username and password

```
busybox mount -t cifs -o user=username,password=whatver,uid=1000,gid=1015,file_mode=0775,dir_mode=0775,iocharset=utf8,nodfs //192.168.1.10/sharename /sdcard/smb/
```

now you can use a filebrowser and navigate to /sdcard/smb and you will see your windows network files.

If you want to make this setting permanent, edit /system/etc/fstab and put in

```
//192.168.1.10/data	/sdcard/smb	cifs	guest,uid=1000,gid=1015,file_mode=0775,dir_mode=0775,iocharset=utf8,nodfs	0	0
```

now you can run mount -a from any terminal and it will mount your samba share.

Tested playing a 350mb divx file over an adhoc wifi network using rockplayer and all worked fairly well :)

# openvpn #

OpenVPN will let you connect to your home network over 3G.  This can be used to access your CIFS shares when you are off of your home network wifi.

After you have [openvpn](http://openvpn.net/index.php/open-source/downloads.html) server setup (i tested with [pfsense](http://www.pfsense.org) + openvpn export package) dump you ovpn and key files on /sdcard/openvpn/

start openvpn settings app on phone, select your ovpn file and connect.  Now you should be able to hit your CIFS shares you created above :D

# dropbear #

dropbear is a SSH server.  This gives you all the benefits of adb shell over wifi or 3g. you also get fun stuff like tab completions, color, and other linux funness.

in dc.conf make sure the following is set to 1:
setprop dc.service.dropbear.enabled 1;

remount your system part rw
```
adb remount
```

adb shell into your phone and set a STRONG root password
```
adb shell
passwd
```

then do a adb reboot.  When the phone comes back up run the following in adb shell
```
ps aux | grep dropbear
```
you should see:

`  252 root       0:00 /system/xbin/dropbear -E`


first connect to wifi to verify drobear works, if your behind sprints proxy this may not work. get your phones ip address by doing

```
adb shell ifconfig
```

Your looking for eth0 most likely, it should be the ip 192.168.x.x if your behind 99% of default routers.

Now open up a SSH client such as [putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html). set the connection type to SSH on port 22 and connect to your phones ip address

login as root with the password you just set.  enjoy full bash with autocomplete, nano, vim, etc :)


# DYNDNS #

now that you have dropbear, lets get access to our SSH everywhere without remembering your phones IP address.  myphone.dyndns.org is much nicer (should work providing your not behind a restricted NAT, i tested over 3g fine)

1) go to [dyndns.org dyndns.org] and register for a dynamic hostname.

2) edit /system/etc/inadyn.conf your file should look like this, replacing exmamples out.  update period is in MS
```
--username SynergyExampleUser --password SynergyExamplePass --alias SynergyRomExample.dyndns.org --background --update_period 6000
```

3) now edit /system/etc/dc.conf, change
> setprop dc.service.inadyn.enabled 0; to setprop dc.service.inadyn.enabled 1;

4) reboot and enjoy your dynamic ip.  you can now SSH into your dyndns name from anywhere (make sure you set a strong password n00bs)


# LOSTPHONE #

Team synergy wrote a custom lostphone script and will be expanding on it to do different things.  for now it just grabs the last weather sync city/state/zip.  more will come soon :D

just ssh into your dynamic hostname and run
```
lostphone
```