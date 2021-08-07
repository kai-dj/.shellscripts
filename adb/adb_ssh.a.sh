#!/usr/bin/env sh
# access termux via ssh over adb also forward httpd port 8080
# tldr; for https://glow.li/technology/2016/9/20/access-termux-via-usb/
adb forward tcp:8022 tcp:8022 &&
    adb forward tcp:8080 tcp:8080 &&
    ssh localhost -p 8022
