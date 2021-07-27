#!/bin/sh
adb shell dumpsys battery | grep level | cut -d ":" -f2 | xargs
