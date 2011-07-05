#!/system/bin/sh

/system/xbin/busybox mount -orw,remount /system

cd /
unzip /data/rosie.zip

/system/xbin/busybox mount -oro,remount /system

/system/bin/reboot
