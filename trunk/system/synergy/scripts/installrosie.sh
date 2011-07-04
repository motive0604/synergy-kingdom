#!/system/bin/sh

/system/xbin/busybox mount -orw,remount /system

cd /
unzip /sdcard/SynergyROM/rosie.zip

/system/xbin/busybox mount -oro,remount /system

/system/bin/reboot
