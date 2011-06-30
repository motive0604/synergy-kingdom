#!/sbin/sh
dd if=/dev/zero of=/data/swapfile bs=1024 count=102400
mkswap /data/swapfile
