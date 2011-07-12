#!/sbin/sh
# Give us props if you use any of our stuff
# follow good open source etiquette
# thanks from Team Synergy
#
if [ -e /sdcard/SynergyROM/rosie ]; then
	/sbin/busybox unzip /cache/rosie.zip -d /;
	rm /cache/rosie.zip;
	rm /data/app/VR_CLOCK.apk;
	rm /data/app/VR_LP.apk;
	rm -r /data/data/com.fede.launcher/;
else
	rm /cache/rosie.zip;
fi;

