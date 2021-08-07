#!/usr/bin/env sh
#open emacs workspace with 2 instances and placeholder for speedbar (via speedkill)

i3-msg "workspace emacs; append_layout ~/.config/i3/workspaces/emacs_speed.json" &&
(emacsclient -create-frame --alternate-editor="emacs"&) &
(sleep 1 && emacsclient -create-frame --alternate-editor="emacs"&) &
(sleep 2 && xdotool click 1&) &
#        i3-msg "move left,move left,move left,focus left,kill"
#        &&i3-msg "focus right")&
