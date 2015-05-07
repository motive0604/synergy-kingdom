

# dc.conf #
DConfig needs work, for now to change rom setup just edit /system/etc/dc.conf .  Heres stuff to play with:

## a2sd ##
if you have sd card setup properly you can move stuff over to this space to free internal memory.

### move /data/app/ ###

  * setprop dc.a2sd.apps.active true;
    * true will try to move if partition exists, false disables it completely.

### dalvik-cache ###
every app/framework classes.dex gets extracted on install.  can take over 120MB of space. Move this around by changing one of the options to true (dont do both, itll be fixed when im not lazy)

  * setprop dc.a2sd.dalvikcachesd.active false;
    * bindmount dalvik-cache to sdcard EXT partition (must be a2sd formatted)

  * setprop dc.a2sd.dalvikcachepart.active true;
    * bindmount dalvik-cache to /cache partition (default, 150mb partition only used for OTA and market downloads, will fit fine unless you go crazy on apps)


## swapping ##
these options configure swapping

  * setprop dc.swap.active false;
    * true enable swapping on boot
    * false disable swapping on boot

  * setprop dc.swap.swpto swppart;
    * swppart =ext swap partition
    * swpfile =/data/sawp.swp

  * setprop dc.swap.swappiness 30;

## advanced ##

  * setprop persist.service.auto.renice 1;
    * 1 -enable renice to set mms/phone/launcher to be killed last,
    * 0 - disable