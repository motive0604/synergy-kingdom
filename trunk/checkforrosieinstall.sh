#!/sbin/sh

if [ -e /sdcard/SynergyROM/rosie ]; then
	/sbin/unzip /data/rosie.zip -d /
else
rm /data/rosie.zip;
fi;
