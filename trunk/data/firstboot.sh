#!/system/bin/sh
#
#all our stuff will be named -1.apk, if anything else is in /data/app/ it must be conflicting
#
if [ -e /data/app/com.adobe.flashplayer-2.apk ]; then rm /data/app/com.adobe.flashplayer-2.apk; fi;
if [ -e /data/app/com.adobe.flashplayer-3.apk ]; then rm /data/app/com.adobe.flashplayer-3.apk; fi;
if [ -e /data/app/com.android.vending-2.apk ]; then rm /data/app/com.android.vending-2.apk; fi;
if [ -e /data/app/com.android.vending-3.apk ]; then rm /data/app/com.android.vending-3.apk; fi;
if [ -e /data/app/com.coremobility.app.vnotes-2.apk ]; then rm /data/app/com.coremobility.app.vnotes-2.apk; fi;
if [ -e /data/app/com.coremobility.app.vnotes-3.apk ]; then rm /data/app/com.coremobility.app.vnotes-3.apk; fi;
if [ -e /data/app/com.facebook.katana-2.apk ]; then rm /data/app/com.facebook.katana-2.apk; fi;
if [ -e /data/app/com.facebook.katana-3.apk ]; then rm /data/app/com.facebook.katana-3.apk; fi;
if [ -e /data/app/com.google.android.apps.maps-2.apk ]; then rm /data/app/com.google.android.apps.maps-2.apk; fi;
if [ -e /data/app/com.google.android.apps.maps-3.apk ]; then rm /data/app/com.google.android.apps.maps-3.apk; fi;
if [ -e /data/app/com.google.android.gm-2.apk ]; then rm /data/app/com.google.android.gm-2.apk; fi;
if [ -e /data/app/com.google.android.gm-3.apk ]; then rm /data/app/com.google.android.gm-3.apk; fi;
if [ -e /data/app/com.google.android.googlequicksearchbox-2.apk ]; then rm /data/app/com.google.android.googlequicksearchbox-2.apk; fi;
if [ -e /data/app/com.google.android.googlequicksearchbox-3.apk ]; then rm /data/app/com.google.android.googlequicksearchbox-3.apk; fi;
if [ -e /data/app/com.google.android.street-2.apk ]; then rm /data/app/com.google.android.street-2.apk; fi;
if [ -e /data/app/com.google.android.street-3.apk ]; then rm /data/app/com.google.android.street-3.apk; fi;
if [ -e /data/app/com.google.android.voicesearch-2.apk ]; then rm /data/app/com.google.android.voicesearch-2.apk; fi;
if [ -e /data/app/com.google.android.voicesearch-3.apk ]; then rm /data/app/com.google.android.voicesearch-3.apk; fi;
if [ -e /data/app/com.google.android.youtube-2.apk ]; then rm /data/app/com.google.android.youtube-2.apk; fi;
if [ -e /data/app/com.google.android.youtube-3.apk ]; then rm /data/app/com.google.android.youtube-3.apk; fi;
if [ -e /data/app/com.googlecode.android.wifi.tether-2.apk ]; then rm /data/app/com.googlecode.android.wifi.tether-2.apk; fi;
if [ -e /data/app/com.googlecode.android.wifi.tether-3.apk ]; then rm /data/app/com.googlecode.android.wifi.tether-3.apk; fi;
if [ -e /data/app/com.keramidas.TitaniumBackup-2.apk ]; then rm /data/app/com.keramidas.TitaniumBackup-2.apk; fi;
if [ -e /data/app/com.keramidas.TitaniumBackup-3.apk ]; then rm /data/app/com.keramidas.TitaniumBackup-3.apk; fi;
if [ -e /data/app/com.netflix.mediaclient-2.apk ]; then rm /data/app/com.netflix.mediaclient-2.apk; fi;
if [ -e /data/app/com.netflix.mediaclient-3.apk ]; then rm /data/app/com.netflix.mediaclient-3.apk; fi;

echo optimizing sqlite;
#!/system/bin/sh
#
# Optimize SQlite
for i in \
`find /data -iname "*.db"`; 
do \
	sqlite3 $i 'VACUUM;'; 
done;