#!/usr/bin/env sh
# trigger net.dinglish.tasker.ssh intent (wich triggers tasker ssh enable script)
adb shell am broadcast --user 0 -a net.dinglish.tasker.ssh
