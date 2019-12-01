#!/bin/sh
# access termux via ssh over adb also forward httpd port 8080
# tldr; for https://glow.li/technology/2016/9/20/access-termux-via-usb/
adb shell am broadcast --user 0 -a net.dinglish.tasker.ssh
