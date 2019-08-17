#!/bin/sh
# toggle usb tethering on the device
#
ANDROID4VALUE=34
ANDROID5VALUE=30
ANDROID6VALUE=30
ANDROID7VALUE=33

STATE=$(adb shell getprop sys.isusbtetheringon)
if "$STATE"
then
    echo "turning usb tethering off"
    adb shell su -c service call connectivity "$ANDROID7VALUE" i32 0
else
    echo "turning usb tethering on"
    adb shell su -c service call connectivity "$ANDROID7VALUE" i32 1
fi

