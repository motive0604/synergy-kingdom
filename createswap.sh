#!/sbin/sh
rm /data/swapfile
dd if=/dev/zero of=/data/swapfile bs=1k count=100000
chmod 666 /data/swapfile
mkswap /data/swapfile
