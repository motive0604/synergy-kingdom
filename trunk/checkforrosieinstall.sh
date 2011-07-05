#!/sbin/sh
if [ -e /sdcard/SynergyROM/rosie ]; then
	busybox unzip /cache/rosie.zip -d /;
	rm /cache/rosie.zip;
else
	rm /cache/rosie.zip;
fi;
