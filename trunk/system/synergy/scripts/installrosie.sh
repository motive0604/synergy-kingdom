#!/system/bin/sh

/system/xbin/busybox mount -orw,remount /system

cd /
busybox unzip /sdcard/SynergyROM/rosie.zip -d /

/system/xbin/busybox mount -oro,remount /system

/system/bin/reboot
