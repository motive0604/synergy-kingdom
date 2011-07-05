#!/sbin/sh

if [ -e /sdcard/SynergyROM/rosie ]; then
	busybox unzip /data/rosie.zip -d /
else
	rm /data/rosie.zip;
fi;
