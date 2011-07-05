#/system/bin/sh
# ===========================================================================
#  Virtuous ROM Tools (rmk)
#
#  Fri Sep 10 20:53:30 PDT 2010
# ===========================================================================

BUSYBOX="/system/xbin/busybox"
GREP="$BUSYBOX grep"
MOUNT="$BUSYBOX mount"
UMOUNT="$BUSYBOX umount"
MV="$BUSYBOX mv"
CP="$BUSYBOX cp"
RM="$BUSYBOX rm"
RMDIR="$BUSYBOX rmdir"
TEST="$BUSYBOX test"
MKDIR="$BUSYBOX mkdir"
CHMOD="$BUSYBOX chmod"
CHOWN="$BUSYBOX chown"
TOUCH="$BUSYBOX touch"
FSIZE="$BUSYBOX stat -c %s "
BASENAME="$BUSYBOX basename"
CUT="$BUSYBOX cut"
ECHO="$BUSYBOX echo"
SED="$BUSYBOX sed"
LN="$BUSYBOX ln"
LS="$BUSYBOX ls --color=never -1 "
PM="/system/bin/pm"
GETPROP="/system/bin/getprop"

PACKAGESXML="/data/system/packages.xml"
INSTALLED="/data/synergy/synergy_installed"

SYSAPP_DIR="/system/app"
SYSLIB_DIR="/system/lib"
USERAPP_DIR="/data/app"
USERSYS_DIR="/data/system"

SYNERGY_DATA_DIR="/data/synergy"
SYNERGY_STATE_DIR="$SYNERGY_DATA_DIR/state"
SYNERGY_OLD_STATE_DIR="$SYNERGY_DATA_DIR/state"
SYNERGY_SYSTEM_DIR="/sdcard/SynergyROM"
PACKAGELIST="$SYNERGY_DATA_DIR/package_list.txt"

SYNERGY_USERAPP_DIR1="$SYNERGY_SYSTEM_DIR/app.user"
SYNERGY_USERAPP_DIR2="$SYNERGY_SYSTEM_DIR/app.rom"


rm_package_entry_by_apk () {
    APPNAME=$1

    PACKAGENAME=$( $GREP "$APPNAME" "$PACKAGESXML" | $CUT -f2 -d\" )
  
    if $TEST $( $GREP -c "$APPNAME" "$PACKAGESXML" ) -gt 0; then
        $SED -i "/<package.*name=.$PACKAGENAME. .*/,/<\/package>/d" $PACKAGESXML
    fi

    $CHOWN 1000.1000 $PACKAGESXML
    $CHMOD 664 $PACKAGESXML
}


rm_package_entry_by_object () {
    PACKAGENAME=$1
  
    if $TEST $( $GREP -c "$APPNAME" "$PACKAGESXML" ) -gt 0; then
        $SED -i "/<package.*name=.$PACKAGENAME. .*/,/<\/package>/d" $PACKAGESXML
    fi

    $CHOWN 1000.1000 $PACKAGESXML
    $CHMOD 664 $PACKAGESXML
}


remount_system () {
    MOUNTOPTS=$1

    mount -o remount,$MOUNTOPTS /dev/block/mtdblock4 /system

    if [ $? -gt 0 ] ; then
        return 0
    else
        return 1
    fi
}


create_state_dirs () {
    $MKDIR -p $USERAPP_DIR
    $MKDIR -p $USERSYS_DIR

    $CHOWN 1000.1000 /data
    $CHMOD 777 /data
    $CHOWN 1000.1000 $USERAPP_DIR
    $CHMOD 777 $USERAPP_DIR

    $MKDIR -p $SYNERGY_STATE_DIR
    $MKDIR -p $SYNERGY_STATE_DIR/enabled
    $MKDIR -p $SYNERGY_STATE_DIR/disabled
    $MKDIR -p $SYNERGY_STATE_DIR/userapp
}
