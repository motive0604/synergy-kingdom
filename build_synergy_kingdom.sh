#!/bin/bash
PATH=~/synergy-kingdom;
cd $PATH;

#cleanup 
/bin/umount $PATH/builtrom/system_img/;
/bin/umount $PATH/builtrom/system_img/;

/bin/rm -r $PATH/builtrom/;
/bin/rm $PATH/synergy-build.zip;
/bin/mkdir -p $PATH/builtrom/system_img/;
/bin/mkdir -p $PATH/builtrom/system/;


#system part is exactly 345mb, lets try first with 5mb free
/bin/dd if=/dev/zero of=$PATH/builtrom/system/system.img bs=1M count=340;
/sbin/mkfs.ext2 $PATH/builtrom/system/system.img -F -m 0;
/bin/mount -t auto -o loop $PATH/builtrom/system/system.img $PATH/builtrom/system_img/;
/usr/bin/rsync -av --exclude '.*' $PATH/system/ $PATH/builtrom/system_img/;
/bin/umount $PATH/builtrom/system_img/;
/bin/rm -r $PATH/builtrom/system_img/;


/usr/bin/rsync -av --exclude '.*' --exclude 'system' --exclude 'builtrom' --exclude 'build_synergy_rom.sh' $PATH/ $PATH/builtrom/;

/bin/chmod -R 777 $PATH/builtrom/;
cd $PATH/builtrom/;
/usr/bin/zip -J -r synergy-build.zip  *;
/bin/mv synergy-build.zip $PATH/;
/bin/rm -r $PATH/builtrom/;
/bin/chmod 777 $PATH/synergy-build.zip


echo ;
echo "Done! Zipped rom is now in $PATH/synergy-build.zip.";