#!/system/bin/sh

/system/xbin/busybox mount -orw,remount /system

`cat /data/rosiefiles` | xargs rm
	
/system/xbin/busybox mount -oro,remount /system

/system/bin/reboot
