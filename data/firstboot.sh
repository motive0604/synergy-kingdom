#!/system/bin/sh.old
#
# modded by treve
SYNERGYROM=1;
mkdir -p /data/dropbear;
chmod 700 /data/dropbear;
dropbearkey -t dss -f /data/dropbear/dropbear_dss_host_key;
dropbearkey -t rsa -f /data/dropbear/dropbear_rsa_host_key;