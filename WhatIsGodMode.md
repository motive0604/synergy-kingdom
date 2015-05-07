#All about "Godmode"

# Introduction #

in a nutshell we are setting up a yaffs2+ext2 partition. The concept I based this mod on was was originally presented by Hansung Chun written up [here](http://events.linuxfoundation.org/slides/2011/abs/abs2011_chen.pdf)  This combines yaffs for wear leveling ontop of ext2 for performance.

Quadrant shows a overall increase of 700-1000 points, and a 10x IO increase!  There is no overclocking involved here at all.

# Geek details #


During upgrade we _attempt_ to keep your existing data.  I dd the /data part to an img file on the sdcard, format /data then copy the img file back and convert to ext2.  **This process will take some time on flash.**  also remember to have atleast 450MB free on your sdcard for tempspace going to the ext2 img.


After the rom is installed the old yaffs2 partitions are changed to mount on /cache0, /data0, /system0.  The ext2 img files on those partitions are mounted on /system, /data, /cache.  If you have issues booting, please also include with logcats the following details:

```
adb shell df
adb shell busybox mount
```

By default in /system/etc/dc.conf we have /data/dalvik-cache/ bind mounted to /cache/  because it is this partition is big and mostly unused space.  This will give you the best performance being cache is ext2, but you will be limited to about 70 user installed apps before dalvik fills up.  If you have a SD card properly formatted you can play with moving the dalvik around, but your scores and performance may vary.

Heres some examples of /system/etc/dc.conf:

Dalvik on /data/ (HTC Default)
```
setprop dc.a2sd.dalvikcachesd.active false;
setprop dc.a2sd.dalvikcachepart.active false;
```

Dalvik on /cache/ (Synergy Kingdom default)
```
setprop dc.a2sd.dalvikcachesd.active false;
setprop dc.a2sd.dalvikcachepart.active true;
```

Dalvik on /sdcard/ext partition ("regular" Apps2SD default)
```
setprop dc.a2sd.dalvikcachesd.active true;
setprop dc.a2sd.dalvikcachepart.active false;
```


# screenshots #

lets see yours!

**stock evo:**

![http://i.imgur.com/V0Bep.png](http://i.imgur.com/V0Bep.png)


**After system/data/cache are setup as yaffs2+ext2:**

![http://dl.dropbox.com/u/24995663/snap20110711_002437.png](http://dl.dropbox.com/u/24995663/snap20110711_002437.png)