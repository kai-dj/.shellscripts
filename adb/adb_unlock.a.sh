#!/bin/sh
# unlocks screen of android device
adb shell input keyevent 82 &&
    adb shell input swipe 800 200 800 1000 &&
    adb shell input text $(cat ~/.pw/android|cut -d":" -f2)

#enter not needed for my device
# && adb shell input keyevent 66
