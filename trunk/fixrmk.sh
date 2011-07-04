#!/sbin/sh
if [ -e /data/virtuous ]; then
	mv /data/virtuous /data/synergy
	mv /data/synergy/virtuous_installed /data/synergy/synergy_installed
fi
