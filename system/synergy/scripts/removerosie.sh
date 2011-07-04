#!/system/bin/sh

/system/xbin/busybox mount -orw,remount /system

`cat /sdcard/SynergyROM/rosiefiles` | xargs rm
	
/system/xbin/busybox mount -oro,remount /system

/system/bin/reboot
